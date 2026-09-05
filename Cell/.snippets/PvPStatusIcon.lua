-------------------------------------------------
-- 2024-06-27 13:59:55 GMT+8
-- pvp status icon
-- pvp状态图标
-------------------------------------------------
-- relative to unit button
local point, relativePoint, x, y = "CENTER", "BOTTOMRIGHT", -2, 3
local size = 11

-------------------------------------------------
-- function codes
-------------------------------------------------
local F = Cell.funcs

local function UpdatePvPStatusIcon(b)
    local unit = b.states.unit
    if unit and UnitIsPVP(unit) then
        b.widgets.pvpStatusIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-FFA")
        b.widgets.pvpStatusIcon:Show()
    else
        b.widgets.pvpStatusIcon:Hide()
    end
end

F.IterateAllUnitButtons(function(b)
    local pvpStatusIcon = b.widgets.indicatorFrame:CreateTexture(b:GetName().."PvPStatusIcon", "ARTWORK", nil, -7)
    b.widgets.pvpStatusIcon = pvpStatusIcon
    pvpStatusIcon:SetPoint(point, b.widgets.indicatorFrame, relativePoint, x, y)
    pvpStatusIcon:SetSize(size, size)
    pvpStatusIcon:Hide()

    b:HookScript("OnShow", UpdatePvPStatusIcon)
    b:HookScript("OnAttributeChanged", function(self, name)
        if name == "unit" then UpdatePvPStatusIcon(self) end
    end)
    if b:IsShown() then UpdatePvPStatusIcon(b) end
end)

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("UNIT_FACTION")
eventFrame:SetScript("OnEvent", function(_, _, unit)
    F.HandleUnitButton("unit", unit, UpdatePvPStatusIcon)
end)
