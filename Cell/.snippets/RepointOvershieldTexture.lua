local F = Cell.funcs
local P = Cell.pixelPerfectFuncs
local B = Cell.bFuncs

local function RepointOvershield(button, orientation)
    local healthBar = button.widgets.healthBar:GetStatusBarTexture()
    local shieldBarR = button.widgets.shieldBarR

    if orientation == "horizontal" then
        P.ClearPoints(shieldBarR)
        P.Point(shieldBarR, "TOPLEFT", healthBar)
        P.Point(shieldBarR, "BOTTOMLEFT", healthBar)
    else
        P.ClearPoints(shieldBarR)
        P.Point(shieldBarR, "BOTTOMLEFT", healthBar)
        P.Point(shieldBarR, "BOTTOMRIGHT", healthBar)
    end
end

hooksecurefunc(B, "SetOrientation", RepointOvershield)

local orientation = Cell.vars.currentLayoutTable["barOrientation"][1]
F.IterateAllUnitButtons(function(button)
    RepointOvershield(button, orientation)
end)
