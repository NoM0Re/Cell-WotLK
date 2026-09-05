-------------------------------------------------
-- 2024-09-08 16:38:53 GMT+8
-- raise frame level of OmniCD icons
-- 提升 OmniCD 图标的层级
-------------------------------------------------
local hooked
local function HookOmniCD()
    local E = OmniCD and OmniCD[1]
    local P = E and E.Party
    if hooked or not (P and type(P.UpdatePosition) == "function") then return end

    hooked = true
    hooksecurefunc(P, "UpdatePosition", function(self)
        if not (self.groupInfo and E.db and E.db.position) or E.db.position.detached then return end

        for guid, info in pairs(self.groupInfo) do
            if info.bar and type(self.FindRelativeFrame) == "function" then
                local relFrame = self:FindRelativeFrame(guid)
                if relFrame then
                    info.bar:SetFrameLevel(relFrame:GetFrameLevel()+300)
                end
            end
        end
    end)
end

if IsAddOnLoaded("OmniCD") then
    HookOmniCD()
else
    local f = CreateFrame("Frame")
    f:RegisterEvent("ADDON_LOADED")
    f:SetScript("OnEvent", function(self, _, addon)
        if addon == "OmniCD" then
            self:UnregisterAllEvents()
            HookOmniCD()
        end
    end)
end
