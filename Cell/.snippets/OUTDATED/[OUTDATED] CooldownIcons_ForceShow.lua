-------------------------------------------------
-- force show icon cooldown animation
-------------------------------------------------
local F = Cell.funcs
local I = Cell.iFuncs

local function ShowCooldownAnimation(frame, start, duration, debuffType, texture)
    if not (frame.cooldown and duration and duration > 0) then return end

    F.ShowCooldown(frame.cooldown, start, duration, nil, texture, debuffType)
    frame.cooldown:Show()
end

local function HookIcon(icon)
    if not (icon and icon.cooldown and icon.SetCooldown) or icon.forceCooldownHooked then return end

    icon.forceCooldownHooked = true
    hooksecurefunc(icon, "SetCooldown", ShowCooldownAnimation)
end

local function HookIndicator(indicator)
    HookIcon(indicator)
    if indicator and indicator.maxNum then
        for i = 1, indicator.maxNum do
            HookIcon(indicator[i])
        end
    end
end

F.IterateAllUnitButtons(function(button)
    for name, indicator in pairs(button.indicators) do
        if name ~= "raidDebuffs" and indicator[1] then
            for _, icon in ipairs(indicator) do
                HookIcon(icon)
            end
        elseif name ~= "targetedSpells" then
            HookIcon(indicator)
        end
    end
end)

hooksecurefunc(I, "CreateIndicator", function(parent, indicatorTable)
    if parent ~= CellIndicatorsPreviewButton and indicatorTable["auraType"] == "buff" then
        local indicatorType = indicatorTable["type"]
        if indicatorType == "icon" or indicatorType == "icons" then
            HookIndicator(parent.indicators[indicatorTable["indicatorName"]])
        end
    end
end)
