-------------------------------------------------
-- force duration text on custom bar indicators
-------------------------------------------------
-- nil keeps the configured duration-text setting
local ANCHOR = nil -- "CENTER", "TOP", "TOPLEFT", ...
local X = nil
local Y = nil
local COLOR = nil -- {r, g, b, a}

local F = Cell.funcs
local I = Cell.iFuncs

local function ApplyDurationStyle(bar)
    local point, relativeTo, relativePoint, x, y = bar.duration:GetPoint()
    if point then
        bar.duration:ClearAllPoints()
        bar.duration:SetPoint(ANCHOR or point, relativeTo or bar, ANCHOR or relativePoint or point, X or x or 0, Y or y or 0)
    end

    if COLOR then
        bar.duration:SetTextColor(COLOR[1], COLOR[2], COLOR[3], COLOR[4] or 1)
    end
end

local function ConfigureBar(bar)
    if not (bar and bar.indicatorType == "bar" and bar.duration and bar.SetFont) or bar.durationSnippetHooked then return end

    bar.durationSnippetHooked = true
    local SetFont = bar.SetFont
    local ShowDuration = bar.ShowDuration
    function bar:SetFont(font1, font2)
        SetFont(self, font1, font2)
        ApplyDurationStyle(self)
    end
    function bar:ShowDuration()
        ShowDuration(self, true)
    end

    bar:ShowDuration()
    ApplyDurationStyle(bar)
end

local CreateAuraBar = I.CreateAura_Bar
I.CreateAura_Bar = function(name, parent)
    local bar = CreateAuraBar(name, parent)
    ConfigureBar(bar)
    return bar
end

F.IterateAllUnitButtons(function(button)
    for _, indicator in pairs(button.indicators) do
        ConfigureBar(indicator)
        if indicator.maxNum then
            for i = 1, indicator.maxNum do
                ConfigureBar(indicator[i])
            end
        end
    end
end)
