--------------------------------------------------------------------
-- 2024-05-18 02:09:07 GMT+8
-- remove dispel type border color (only Debuffs indicator)
--------------------------------------------------------------------
local function RemoveBorderColor(frame)
    frame:SetBackdropColor(0, 0, 0, 1)
end

Cell.funcs.IterateAllUnitButtons(function(button)
    local debuffs = button.indicators.debuffs
    for i = 1, debuffs.maxNum or 10 do
        if debuffs[i] and not debuffs[i].removeDispelBorderHooked then
            debuffs[i].removeDispelBorderHooked = true
            hooksecurefunc(debuffs[i], "SetCooldown", RemoveBorderColor)
        end
    end
end)
