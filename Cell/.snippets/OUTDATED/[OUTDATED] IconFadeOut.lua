-------------------------------------------------
-- fade custom buff icons out over their duration
-------------------------------------------------
local END_ALPHA = 0.2

local F = Cell.funcs
local I = Cell.iFuncs
local activeIcons = {}
local driver = CreateFrame("Frame")
local elapsed = 0

driver:SetScript("OnUpdate", function(_, tick)
    elapsed = elapsed + tick
    if elapsed < 0.05 then return end
    elapsed = 0

    local now = GetTime()
    for icon in pairs(activeIcons) do
        if not icon:IsShown() or not icon.fadeStart or not icon.fadeDuration then
            activeIcons[icon] = nil
        else
            local remaining = icon.fadeDuration - (now - icon.fadeStart)
            if remaining <= 0 then
                icon:SetAlpha(END_ALPHA)
                activeIcons[icon] = nil
            else
                local progress = remaining / icon.fadeDuration
                icon:SetAlpha(progress * (1 - END_ALPHA) + END_ALPHA)
            end
        end
    end
end)

local function StartFade(icon, start, duration, debuffType)
    if duration and duration > 0 and not debuffType then
        icon.fadeStart = start
        icon.fadeDuration = duration
        activeIcons[icon] = true
    else
        icon.fadeStart = nil
        icon.fadeDuration = nil
        activeIcons[icon] = nil
        icon:SetAlpha(1)
    end
end

local function HookIcon(icon)
    if not (icon and icon.SetCooldown) or icon.fadeOutHooked then return end

    icon.fadeOutHooked = true
    hooksecurefunc(icon, "SetCooldown", StartFade)
    icon:HookScript("OnHide", function(frame)
        frame.fadeStart = nil
        frame.fadeDuration = nil
        activeIcons[frame] = nil
        frame:SetAlpha(1)
    end)
end

local function HookIndicator(indicator, indicatorType)
    if indicatorType == "icon" then
        HookIcon(indicator)
    elseif indicatorType == "icons" and indicator then
        for i = 1, indicator.maxNum do
            HookIcon(indicator[i])
        end
    end
end

F.IterateAllUnitButtons(function(button)
    for indicatorName, indicatorTable in pairs(Cell.snippetVars.customIndicators.buff) do
        HookIndicator(button.indicators[indicatorName], indicatorTable.type)
    end
end)

hooksecurefunc(I, "CreateIndicator", function(parent, indicatorTable)
    if parent ~= CellIndicatorsPreviewButton and indicatorTable["auraType"] == "buff" then
        HookIndicator(parent.indicators[indicatorTable["indicatorName"]], indicatorTable["type"])
    end
end)
