-------------------------------------------------
-- remove custom indicator bar borders
-------------------------------------------------
local F = Cell.funcs
local I = Cell.iFuncs

local function RemoveBorder(bar)
    if not (bar and bar.indicatorType == "bar") then return end

    bar:SetBackdrop({bgFile = Cell.vars.whiteTexture})
    bar:SetBackdropColor(0.07, 0.07, 0.07, 0.7)

    if not bar.removeBorderPixelHooked then
        bar.removeBorderPixelHooked = true
        local UpdatePixelPerfect = bar.UpdatePixelPerfect
        function bar:UpdatePixelPerfect()
            UpdatePixelPerfect(self)
            RemoveBorder(self)
        end
    end
end

local CreateAuraBar = I.CreateAura_Bar
I.CreateAura_Bar = function(name, parent)
    local bar = CreateAuraBar(name, parent)
    RemoveBorder(bar)
    return bar
end

F.IterateAllUnitButtons(function(button)
    for _, indicator in pairs(button.indicators) do
        RemoveBorder(indicator)
        if indicator.maxNum then
            for i = 1, indicator.maxNum do
                RemoveBorder(indicator[i])
            end
        end
    end
end)
