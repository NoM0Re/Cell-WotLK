Cell.funcs.IterateAllUnitButtons(function(b)
    local nameText = b.indicators.nameText
    if not nameText.highlight then
        nameText.highlight = nameText:CreateTexture(nil, "BACKGROUND")
        nameText.highlight:SetTexture(1, 0, 0, 0.5)
        nameText.highlight:SetAllPoints(nameText)
    end

    local function UpdateHighlight(unit)
        if type(unit) == "string" and UnitIsUnit(unit, "player") then
            nameText.highlight:Show()
        else
            nameText.highlight:Hide()
        end
    end

    b:HookScript("OnAttributeChanged", function(_, name, value)
        if name == "unit" then UpdateHighlight(value) end
    end)
    UpdateHighlight(b:GetAttribute("unit"))
end)
