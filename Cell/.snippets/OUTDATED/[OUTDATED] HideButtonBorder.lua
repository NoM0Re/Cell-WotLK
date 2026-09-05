-- hide button border, a negative highlight size is recommended
-- 隐藏按钮边框，建议将高亮尺寸设定为负值

local function HideBorder(button)
    button:SetBackdrop(nil)
end

hooksecurefunc(Cell.bFuncs, "UpdatePixelPerfect", HideBorder)
Cell.funcs.IterateAllUnitButtons(HideBorder)
