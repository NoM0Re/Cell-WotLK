-------------------------------------------------
-- 2025-04-11 17:11:18 GMT+8
-- remove custom indicator icon borders
-------------------------------------------------
local F = Cell.funcs
local I = Cell.iFuncs

local function HookIcon(icon)
    if not (icon and icon.icon and icon.SetCooldown) or icon.removeBorderHooked then return end

    icon.removeBorderHooked = true
    local function RemoveBorder()
        icon:SetBackdropColor(0, 0, 0, 0)
    end
    hooksecurefunc(icon, "SetCooldown", RemoveBorder)
    RemoveBorder()
end

local function HookIndicator(indicator)
    HookIcon(indicator)
    if indicator and indicator.maxNum then
        for i = 1, indicator.maxNum do
            HookIcon(indicator[i])
        end
    end
end

local CreateAuraBarIcon = I.CreateAura_BarIcon
I.CreateAura_BarIcon = function(name, parent)
    local icon = CreateAuraBarIcon(name, parent)
    HookIcon(icon)
    return icon
end

F.IterateAllUnitButtons(function(button)
    for name, indicator in pairs(button.indicators) do
        if string.find(name, "^indicator") then
            HookIndicator(indicator)
        end
    end
end)
