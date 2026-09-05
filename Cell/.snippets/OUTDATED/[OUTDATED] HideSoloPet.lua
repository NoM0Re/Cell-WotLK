-- 2024-05-18 02:10:52 GMT+8
local function HidePet()
    local petButton = Cell.unitButtons.solo.pet
    UnregisterStateDriver(petButton, "visibility")
    petButton:Hide()
end

if InCombatLockdown() then
    local frame = CreateFrame("Frame")
    frame:RegisterEvent("PLAYER_REGEN_ENABLED")
    frame:SetScript("OnEvent", function(self)
        self:UnregisterEvent("PLAYER_REGEN_ENABLED")
        HidePet()
    end)
else
    HidePet()
end
