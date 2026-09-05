-- CompactUnitFrame_OpenMenu
local unitMenu = CreateFrame("Frame", "CellSnippetUnitMenu", UIParent)
unitMenu.displayMode = "MENU"
unitMenu.initialize = function(self)
    local unit = self.unit
    if not unit or not UnitExists(unit) then return end

    local which, name, id
    if UnitIsUnit(unit, "player") then
        which = "SELF"
    elseif UnitIsUnit(unit, "vehicle") then
        which = "VEHICLE"
    elseif UnitIsUnit(unit, "pet") then
        which = "PET"
    elseif UnitIsPlayer(unit) then
        id = UnitInRaid(unit)
        if id then
            which = "RAID_PLAYER"
            name = GetRaidRosterInfo(id + 1)
        elseif UnitInParty(unit) then
            which = "PARTY"
        else
            which = "PLAYER"
        end
    else
        which = "TARGET"
        name = RAID_TARGET_ICON
    end

    UnitPopup_ShowMenu(self, which, unit, name, id)
end

function CellUnitFrame_OpenMenu()
    local button = Cell.funcs.GetUnitButtonByGUID(UnitGUID("mouseover") or "")
    local unit = button and button.states.unit
    if not unit then return end

    HideDropDownMenu(1)
    unitMenu.unit = unit
    ToggleDropDownMenu(1, nil, unitMenu, "cursor", 0, 0)
end
