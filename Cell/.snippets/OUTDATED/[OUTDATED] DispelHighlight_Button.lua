-- show dispel highlight with solid color over the entire unit button
local ALPHA = 0.6
local DISPEL_ORDER = {"Magic", "Curse", "Disease", "Poison", "Bleed"}

local F = Cell.funcs
local I = Cell.iFuncs

F.IterateAllUnitButtons(function(button)
    local dispels = button.indicators.dispels

    dispels.highlight:ClearAllPoints()
    dispels.highlight:SetAllPoints(button.widgets.healthBar)
    dispels.highlight:SetTexture(Cell.vars.whiteTexture)

    function dispels:SetDispels(dispelTypes)
        self.highlight:Hide()
        local iconsShown = 0
        local found

        for _, dispelType in ipairs(DISPEL_ORDER) do
            local showHighlight = dispelTypes[dispelType]
            if type(showHighlight) == "boolean" then
                if not found and showHighlight then
                    found = true
                    local r, g, b = I.GetDebuffTypeColor(dispelType)
                    self.highlight:SetVertexColor(r, g, b, ALPHA)
                    self.highlight:Show()
                end
                if self.showIcons then
                    iconsShown = iconsShown + 1
                    self[iconsShown]:SetDispel(dispelType)
                end
            end
        end

        self:UpdateSize(iconsShown)
        for i = iconsShown + 1, 5 do
            self[i]:Hide()
        end
    end
end)
