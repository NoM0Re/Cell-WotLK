local _, Cell = ...
local F = Cell.funcs
local B = Cell.bFuncs
local P = Cell.pixelPerfectFuncs

local partyFrame = CreateFrame("Frame", "CellPartyFrame", Cell.frames.mainFrame, "SecureFrameTemplate")
Cell.frames.partyFrame = partyFrame
partyFrame:SetAllPoints(Cell.frames.mainFrame)

local header = CreateFrame("Frame", "CellPartyFrameHeader", partyFrame, "SecureGroupHeaderTemplate")
-- F.SetHeaderRoleSort handles name resolution without scanning the header on every name event.
header:UnregisterEvent("UNIT_NAME_UPDATE")
header:SetAttribute("template", "CellPartyUnitButtonTemplate")

function header:UpdateButtonUnit(bName, unit)
    local playerButton = _G[bName]
    local petButton = playerButton.petButton

    if playerButton.partyUnit then
        if Cell.unitButtons.party.units[playerButton.partyUnit] == playerButton then
            Cell.unitButtons.party.units[playerButton.partyUnit] = nil
        end
        if Cell.unitButtons.party.units[petButton.partyUnit] == petButton then
            Cell.unitButtons.party.units[petButton.partyUnit] = nil
        end
    end

    playerButton.partyUnit = unit
    playerButton.unit = unit -- OmniCD

    local petUnit = B.UpdateEffectiveUnit(petButton)
    petButton.partyUnit = petUnit

    if unit then
        Cell.unitButtons.party.units[unit] = playerButton
        Cell.unitButtons.party.units[petUnit] = petButton
    end
end

-- Required by Wrath's SetupUnitButtonConfiguration to apply initial-* attributes
-- recursively to the pet button defined by CellPartyUnitButtonTemplate.
header.initialConfigFunction = function() end

header:SetAttribute("point", "TOP")
header:SetAttribute("xOffset", 0)
header:SetAttribute("yOffset", -1)
header:SetAttribute("maxColumns", 1)
header:SetAttribute("unitsPerColumn", 5)
header:SetAttribute("showPlayer", true)
header:SetAttribute("showParty", true)

--! to make needButtons == 5 cheat configureChildren in SecureGroupHeaders.lua
header:SetAttribute("startingIndex", -4)
header:Show()
header:SetAttribute("startingIndex", 1)

-- init pet buttons
for i = 1, 5 do
    local playerButton = header:GetAttribute("child"..i)
    header[i] = playerButton
    -- playerButton.type = "main" -- layout setup

    local petButton = _G[playerButton:GetName().."Pet"]
    -- petButton.type = "pet" -- layout setup

    playerButton.petButton = petButton
    playerButton:HookScript("OnAttributeChanged", function(self, name, value)
        if name == "unit" then
            header:UpdateButtonUnit(self:GetName(), value)
        end
    end)
    header:UpdateButtonUnit(playerButton:GetName(), playerButton:GetAttribute("unit"))

    -- for IterateAllUnitButtons
    Cell.unitButtons.party["player"..i] = playerButton
    Cell.unitButtons.party["pet"..i] = petButton

    -- OmniCD
    _G["CellPartyFrameMember"..i] = playerButton
end

partyFrame:Hide()

local configuredPartyLayout
local partyVisibilityRegistered

local function GetAssignedPartyLayout()
    local layouts = CellCharacterDB["layoutAutoSwitch"]
    local talent = Cell.vars.activeTalentGroup or GetActiveTalentGroup()
    if layouts and layouts[talent] then
        return layouts[talent]["party"]
    end
end

local function UpdatePartyVisibility()
    if GetAssignedPartyLayout() == "hide" then
        if partyVisibilityRegistered then
            UnregisterStateDriver(partyFrame, "visibility")
            partyVisibilityRegistered = nil
        end
        partyFrame:Hide()
    elseif not partyVisibilityRegistered then
        RegisterStateDriver(partyFrame, "visibility", "[@raid1,exists][nogroup] hide;show")
        partyVisibilityRegistered = true
    end
end

local function PartyFrame_UpdateLayout(layout, which)
    if layout ~= GetAssignedPartyLayout() then return end
    if layout == "hide" then
        configuredPartyLayout = nil
        UpdatePartyVisibility()
        return
    end
    UpdatePartyVisibility()
    if not which and configuredPartyLayout == layout then return end
    if configuredPartyLayout ~= layout then
        which = nil
    end

    -- update
    local layoutName = layout
    layout = CellDB["layouts"][layout]

    -- Configure the secure header while hidden, then let showing it perform one refresh.
    local configureHeader = not which or which == "main-arrangement" or which == "pet-arrangement"
        or strfind(which, "size$") or which == "pet" or which == "sort" or which == "hideSelf"
    local headerWasShown = configureHeader and header:IsShown()
    if headerWasShown then
        header:Hide()
    end

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

    if not which or which == "hideSelf" then
        header:SetAttribute("showPlayer", not layout["main"]["hideSelf"])
    end

    if not which or which == "sort" or which == "hideSelf" then
        F.SetHeaderRoleSort(header, layout["main"]["sortByRole"] and layout["main"]["roleOrder"] or nil)
    end

    if headerWasShown then
        header:Show()
    end

    configuredPartyLayout = layoutName
end
Cell.RegisterCallback("UpdateLayout", "PartyFrame_UpdateLayout", PartyFrame_UpdateLayout)

local function ConfigureAssignedPartyLayout()
    if InCombatLockdown() then return end

    local layout = GetAssignedPartyLayout()
    if layout and layout ~= "hide" then
        PartyFrame_UpdateLayout(layout)
    end
    UpdatePartyVisibility()
end
Cell.RegisterCallback("AddonLoaded", "PartyFrame_AddonLoaded", ConfigureAssignedPartyLayout)
Cell.RegisterCallback("ActiveTalentGroupChanged", "PartyFrame_ActiveTalentGroupChanged", ConfigureAssignedPartyLayout)

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
