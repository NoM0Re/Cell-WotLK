-- show a solid dispel highlight over the current-health portion
local USE_SOLID_COLOR_TEXTURE = false
local DISPEL_ORDER = {"Magic", "Curse", "Disease", "Poison", "Bleed"}

local debuffTypeColor = {
    [""] = {0.8, 0, 0},
    ["Curse"] = {0.6, 0, 1},
    ["Disease"] = {0.6, 0.4, 0},
    ["Magic"] = {0.2, 0.6, 1},
    ["Poison"] = {0, 0.6, 0},
    ["Bleed"] = {0.8, 0, 0},
    ["none"] = {0.8, 0, 0},
}

local F = Cell.funcs

F.IterateAllUnitButtons(function(button)
    local dispels = button.indicators.dispels

    dispels.highlight:ClearAllPoints()
    dispels.highlight:SetAllPoints(button.widgets.healthBar:GetStatusBarTexture())
    dispels.highlight:SetTexture(USE_SOLID_COLOR_TEXTURE and Cell.vars.whiteTexture or Cell.vars.texture)

    function dispels:SetDispels(dispelTypes)
        self.highlight:Hide()
        local iconsShown = 0
        local found

        for _, dispelType in ipairs(DISPEL_ORDER) do
            local showHighlight = dispelTypes[dispelType]
            if type(showHighlight) == "boolean" then
                if not found and showHighlight then
                    found = true
                    local color = debuffTypeColor[dispelType] or debuffTypeColor["none"]
                    self.highlight:SetVertexColor(color[1], color[2], color[3], 1)
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
