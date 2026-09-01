local _, Cell = ...
local F = Cell.funcs
local B = Cell.bFuncs
local P = Cell.pixelPerfectFuncs

local partyFrame = CreateFrame("Frame", "CellPartyFrame", Cell.frames.mainFrame, "SecureFrameTemplate")
Cell.frames.partyFrame = partyFrame
partyFrame:SetAllPoints(Cell.frames.mainFrame)

local header = CreateFrame("Frame", "CellPartyFrameHeader", partyFrame, "SecureGroupHeaderTemplate")
header:SetAttribute("template", "CellUnitButtonTemplate")

function header:UpdateButtonUnit(bName, unit)
    if not unit then return end

    _G[bName].unit = unit -- OmniCD

    local petUnit
    if unit == "player" then
        petUnit = "pet"
    else
        petUnit = string.gsub(unit, "party", "partypet")
    end
    Cell.unitButtons.party.units[unit] = _G[bName]
    Cell.unitButtons.party.units[petUnit] = _G[bName].petButton
end

-- 3.3.5 SecureGroupHeaderTemplate has no _initialAttribute-* child update mechanism.
-- Synchronize the final unit attributes after the header has applied sorting instead.
-- header:SetAttribute("initialConfigFunction", [[
--     RegisterUnitWatch(self)

--     local header = self:GetParent()
--     self:SetWidth(header:GetAttribute("buttonWidth") or 66)
--     self:SetHeight(header:GetAttribute("buttonHeight") or 46)
-- ]])

header:SetAttribute("point", "TOP")
header:SetAttribute("xOffset", 0)
header:SetAttribute("yOffset", -1)
header:SetAttribute("maxColumns", 1)
header:SetAttribute("unitsPerColumn", 5)
header:SetAttribute("showPlayer", true)
header:SetAttribute("showParty", true)

--! to make needButtons == 5 cheat configureChildren in SecureGroupHeaders.lua
header:SetAttribute("startingIndex", -4)

local function SyncHeaderChildren()
    local children = {header:GetChildren()}
    table.sort(children, function(a, b)
        return (a:GetName() or "") < (b:GetName() or "")
    end)

    for i, child in ipairs(children) do
        header[i] = child
    end
    return #children
end

local function SyncPartyUnits()
    wipe(Cell.unitButtons.party.units)
    for _, child in ipairs({header:GetChildren()}) do
        local unit = child:GetAttribute("unit")
        if unit then
            local petUnit = unit == "player" and "pet" or string.gsub(unit, "party", "partypet")
            if not InCombatLockdown() then
                child.petButton:SetAttribute("unit", petUnit)
                if header:GetAttribute("showPartyPets") and not header:GetAttribute("partyDetached") then
                    RegisterUnitWatch(child.petButton)
                end
            end
            header:UpdateButtonUnit(child:GetName(), unit)
        end
    end
end

local function RefreshLateUnitButtons()
    Cell.Fire("UpdateAppearance")
    Cell.Fire("UpdateRequests", "spellRequest_icon")
    Cell.Fire("UpdateRequests", "dispelRequest_text")
    B.ForceInitButtons()
end

local function InitPetButtons()
    if SyncHeaderChildren() == 0 then return end

    local initialized

    for i, playerButton in ipairs(header) do
        local petButton = playerButton.petButton
        if not petButton then
            initialized = true
            -- playerButton.type = "main" -- layout setup

            petButton = CreateFrame("Button", playerButton:GetName().."Pet", playerButton, "CellUnitButtonTemplate")
            -- petButton.type = "pet" -- layout setup
            --! button for pet/vehicle only, toggleForVehicle MUST be false
            petButton:SetAttribute("toggleForVehicle", false)

            playerButton.petButton = petButton
            SecureHandlerSetFrameRef(playerButton, "petButton", petButton)
        end

        -- for IterateAllUnitButtons
        Cell.unitButtons.party["player"..i] = playerButton
        Cell.unitButtons.party["pet"..i] = petButton

        -- OmniCD
        _G["CellPartyFrameMember"..i] = playerButton
    end

    if initialized then
        F.C_Timer.After(0.5, RefreshLateUnitButtons)
    end
    return initialized
end

local headerInitFrame = CreateFrame("Frame")
local headerInitialized

local function InitializeHeader()
    if headerInitialized then return end

    if InCombatLockdown() then
        headerInitFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
        return
    end

    headerInitialized = true
    headerInitFrame:UnregisterEvent("PLAYER_REGEN_ENABLED")
    header:Show()
    header:SetAttribute("startingIndex", 1)
    InitPetButtons()
    SyncPartyUnits()
    Cell.Fire("UpdateClickCastings")

    if Cell.vars.groupType then
        F.UpdateLayout(Cell.vars.groupType)
    end
end

headerInitFrame:RegisterEvent("PLAYER_LOGIN")
headerInitFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        self:UnregisterEvent("PLAYER_LOGIN")
    end
    InitializeHeader()
end)

local function SetHeaderAttribute(name, value)
    if header:GetAttribute(name) ~= value then
        header:SetAttribute(name, value)
    end
end

local function GetRoleSortedNameList(layout)
    local rolePriority = {}
    for i, role in ipairs(layout["main"]["roleOrder"]) do
        rolePriority[role] = i
    end

    local members = {}
    for i = 0, 4 do
        local unit = i == 0 and "player" or "party"..i
        if UnitExists(unit) and not (i == 0 and layout["main"]["hideSelf"]) then
            local name = UnitName(unit)
            if name then
                tinsert(members, {
                    name = name,
                    priority = rolePriority[F.UnitGroupRolesAssigned(unit)] or 4,
                })
            end
        end
    end

    table.sort(members, function(a, b)
        if a.priority ~= b.priority then
            return a.priority < b.priority
        end
        return a.name < b.name
    end)

    local names = {}
    for _, member in ipairs(members) do
        tinsert(names, member.name)
    end
    return table.concat(names, ",")
end

local function UpdateRoleSort(layout)
    SetHeaderAttribute("groupBy", nil)
    SetHeaderAttribute("groupingOrder", "")

    if layout["main"]["sortByRole"] then
        SetHeaderAttribute("sortMethod", "INDEX")
        SetHeaderAttribute("groupFilter", nil)
        SetHeaderAttribute("nameList", GetRoleSortedNameList(layout))
    else
        SetHeaderAttribute("nameList", nil)
        SetHeaderAttribute("groupFilter", nil)
        SetHeaderAttribute("sortMethod", "INDEX")
    end
end

local function PartyFrame_UpdateLayout(layout, which)
    local initializedPetButtons

    -- PLAYER_LOGIN initializes the secure header and then requests a full layout update.
    -- Roster events may request the party layout earlier, while the header has no children.
    if Cell.vars.groupType == "party" and not headerInitialized then return end

    -- visibility
    if Cell.vars.groupType ~= "party" or Cell.vars.isHidden then
        UnregisterStateDriver(partyFrame, "visibility")
        partyFrame:Hide()
        return
    else
        RegisterStateDriver(partyFrame, "visibility", "[@raid1,exists] hide;[@party1,exists] show;[group:party] show;hide")
        SyncHeaderChildren()
        initializedPetButtons = InitPetButtons()
    end

    -- update
    layout = CellDB["layouts"][layout]

    -- anchor
    if not which or which == "main-arrangement" or which == "pet-arrangement" then
        local orientation = layout["main"]["orientation"]
        local anchor = layout["main"]["anchor"]
        local spacingX = layout["main"]["spacingX"]
        local spacingY = layout["main"]["spacingY"]
        local petSpacingX = layout["pet"]["sameArrangementAsMain"] and spacingX or layout["pet"]["spacingX"]
        local petSpacingY = layout["pet"]["sameArrangementAsMain"] and spacingY or layout["pet"]["spacingY"]

        local point, playerAnchorPoint, petAnchorPoint, playerSpacing, petSpacing, headerPoint
        if orientation == "vertical" then
            if anchor == "BOTTOMLEFT" then
                point, playerAnchorPoint, petAnchorPoint = "BOTTOMLEFT", "TOPLEFT", "BOTTOMRIGHT"
                headerPoint = "BOTTOM"
                playerSpacing = spacingY
                petSpacing = petSpacingX
            elseif anchor == "BOTTOMRIGHT" then
                point, playerAnchorPoint, petAnchorPoint = "BOTTOMRIGHT", "TOPRIGHT", "BOTTOMLEFT"
                headerPoint = "BOTTOM"
                playerSpacing = spacingY
                petSpacing = -petSpacingX
            elseif anchor == "TOPLEFT" then
                point, playerAnchorPoint, petAnchorPoint = "TOPLEFT", "BOTTOMLEFT", "TOPRIGHT"
                headerPoint = "TOP"
                playerSpacing = -spacingY
                petSpacing = petSpacingX
            elseif anchor == "TOPRIGHT" then
                point, playerAnchorPoint, petAnchorPoint = "TOPRIGHT", "BOTTOMRIGHT", "TOPLEFT"
                headerPoint = "TOP"
                playerSpacing = -spacingY
                petSpacing = -petSpacingX
            end

            header:SetAttribute("xOffset", 0)
            header:SetAttribute("yOffset", P.Scale(playerSpacing))
        else
            -- anchor
            if anchor == "BOTTOMLEFT" then
                point, playerAnchorPoint, petAnchorPoint = "BOTTOMLEFT", "BOTTOMRIGHT", "TOPLEFT"
                headerPoint = "LEFT"
                playerSpacing = spacingX
                petSpacing = petSpacingY
            elseif anchor == "BOTTOMRIGHT" then
                point, playerAnchorPoint, petAnchorPoint = "BOTTOMRIGHT", "BOTTOMLEFT", "TOPRIGHT"
                headerPoint = "RIGHT"
                playerSpacing = -spacingX
                petSpacing = petSpacingY
            elseif anchor == "TOPLEFT" then
                point, playerAnchorPoint, petAnchorPoint = "TOPLEFT", "TOPRIGHT", "BOTTOMLEFT"
                headerPoint = "LEFT"
                playerSpacing = spacingX
                petSpacing = -petSpacingY
            elseif anchor == "TOPRIGHT" then
                point, playerAnchorPoint, petAnchorPoint = "TOPRIGHT", "TOPLEFT", "BOTTOMRIGHT"
                headerPoint = "RIGHT"
                playerSpacing = -spacingX
                petSpacing = -petSpacingY
            end

            header:SetAttribute("xOffset", P.Scale(playerSpacing))
            header:SetAttribute("yOffset", 0)
        end

        header:ClearAllPoints()
        header:SetPoint(point)
        header:SetAttribute("point", headerPoint)

        --! force update unitbutton's point
        for j = 1, 5 do
            if not header[j] then break end
            header[j]:ClearAllPoints()
            -- update petButton's point
            header[j].petButton:ClearAllPoints()
            if orientation == "vertical" then
                header[j].petButton:SetPoint(point, header[j], petAnchorPoint, P.Scale(petSpacing), 0)
            else
                header[j].petButton:SetPoint(point, header[j], petAnchorPoint, 0, P.Scale(petSpacing))
            end
        end
        header:SetAttribute("unitsPerColumn", 5)
    end

    if not which or strfind(which, "size$") or strfind(which, "power$") or which == "barOrientation" or which == "powerFilter" then
        for i, playerButton in ipairs(header) do
            local petButton = playerButton.petButton

            if not which or strfind(which, "size$") then
                local width, height = unpack(layout["main"]["size"])
                P.Size(playerButton, width, height)
                header:SetAttribute("buttonWidth", P.Scale(width))
                header:SetAttribute("buttonHeight", P.Scale(height))
                if layout["pet"]["sameSizeAsMain"] then
                    P.Size(petButton, width, height)
                else
                    P.Size(petButton, layout["pet"]["size"][1], layout["pet"]["size"][2])
                end
            end

            -- NOTE: SetOrientation BEFORE SetPowerSize
            if not which or which == "barOrientation" then
                B.SetOrientation(playerButton, layout["barOrientation"][1], layout["barOrientation"][2])
                B.SetOrientation(petButton, layout["barOrientation"][1], layout["barOrientation"][2])
            end

            if not which or strfind(which, "power$") or which == "barOrientation" or which == "powerFilter" then
                B.SetPowerSize(playerButton, layout["main"]["powerSize"])
                if layout["pet"]["sameSizeAsMain"] then
                    B.SetPowerSize(petButton, layout["main"]["powerSize"])
                else
                    B.SetPowerSize(petButton, layout["pet"]["powerSize"])
                end
            end
        end
    end

    if not which or which == "pet" then
        header:SetAttribute("showPartyPets", layout["pet"]["partyEnabled"])
        header:SetAttribute("partyDetached", layout["pet"]["partyDetached"])
        if layout["pet"]["partyEnabled"] and not layout["pet"]["partyDetached"] then
            for i, playerButton in ipairs(header) do
                RegisterUnitWatch(playerButton.petButton)
            end
        else
            for i, playerButton in ipairs(header) do
                UnregisterUnitWatch(playerButton.petButton)
                playerButton.petButton:Hide()
            end
        end
    end

    if not which or which == "sort" or which == "hideSelf" then
        UpdateRoleSort(layout)
    end

    if not which or which == "hideSelf" then
        header:SetAttribute("showPlayer", not layout["main"]["hideSelf"])
    end

    SyncPartyUnits()
    if initializedPetButtons then
        Cell.Fire("UpdateClickCastings")
    end
end
Cell.RegisterCallback("UpdateLayout", "PartyFrame_UpdateLayout", PartyFrame_UpdateLayout)

local roleSortUpdatePending
local roleSortFrame = CreateFrame("Frame")
roleSortFrame:RegisterEvent("PARTY_MEMBERS_CHANGED")

local function RefreshRoleSort()
    local layout = Cell.vars.currentLayoutTable
    if Cell.vars.groupType ~= "party" or Cell.vars.isHidden
    or not layout or not layout["main"]["sortByRole"]
    then
        return
    end

    if InCombatLockdown() then
        roleSortFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
        return
    end

    if roleSortUpdatePending then return end

    roleSortUpdatePending = true
    F.C_Timer.After(0, function()
        roleSortUpdatePending = nil
        local currentLayout = Cell.vars.currentLayoutTable
        if InCombatLockdown() then
            roleSortFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
        elseif Cell.vars.groupType == "party" and not Cell.vars.isHidden
        and currentLayout and currentLayout["main"]["sortByRole"]
        then
            PartyFrame_UpdateLayout(Cell.vars.currentLayout, "sort")
        end
    end)
end

roleSortFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_REGEN_ENABLED" then
        self:UnregisterEvent("PLAYER_REGEN_ENABLED")
    end
    RefreshRoleSort()
end)
Cell.RegisterCallback("GroupRoleChanged", "PartyFrame_GroupRoleChanged", RefreshRoleSort)

-- local function PartyFrame_UpdateVisibility(which)
--     if not which or which == "party" then
--         header:SetAttribute("showParty", CellDB["general"]["showParty"])
--         if CellDB["general"]["showParty"] then
--             --! [group] won't fire during combat
--             -- RegisterAttributeDriver(partyFrame, "state-visibility", "[group:raid] hide; [group:party] show; hide")
--             -- NOTE: [group:party] show: fix for premade, only player in party, but party1 not exists
--             RegisterAttributeDriver(partyFrame, "state-visibility", "[@raid1,exists] hide;[@party1,exists] show;[group:party] show;hide")
--         else
--             UnregisterAttributeDriver(partyFrame, "state-visibility")
--             partyFrame:Hide()
--         end
--     end
-- end
-- Cell.RegisterCallback("UpdateVisibility", "PartyFrame_UpdateVisibility", PartyFrame_UpdateVisibility)

-- local f = CreateFrame("Frame", nil, CellParent, "SecureFrameTemplate")
-- RegisterAttributeDriver(f, "state-group", "[@raid1,exists] raid;[@party1,exists] party; solo")
-- SecureHandlerWrapScript(f, "OnAttributeChanged", f, [[
--     print(name, value)
--     if name ~= "state-group" then return end
-- ]])

-- RegisterStateDriver(f, "groupstate", "[group:raid] raid; [group:party] party; solo")
-- f:SetAttribute("_onstate-groupstate", [[
--     print(stateid, newstate)
-- ]])
