-- show the raid subgroup before the unit name
local F = Cell.funcs

F.IterateAllUnitButtons(function(button)
    local nameText = button.indicators.nameText
    hooksecurefunc(nameText, "UpdateName", function()
        local name = nameText.name:GetText()
        if name and button.states.unit and F.IsInRaid() then
            local raidIndex = UnitInRaid(button.states.unit)
            if raidIndex then
                local subgroup = select(3, GetRaidRosterInfo(raidIndex + 1))
                if subgroup then
                    nameText.name:SetText("|cffffffff"..subgroup.."-|r"..name)
                    nameText:SetSize(nameText.name:GetWidth(), nameText.name:GetHeight())
                end
            end
        end
    end)

    if button.states.name then
        nameText:UpdateName()
    end
end)
