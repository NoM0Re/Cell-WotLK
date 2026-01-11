local _, Cell = ...
local L = Cell.L
local F = Cell.funcs

local UnitIsFeignDeath = UnitIsFeignDeath
local GetSpellLink = GetSpellLink

----------------------------------------------------
-- vars
----------------------------------------------------
local init, instanceType, inInstance, enabled
local deathLogs = {
    -- time, type, name, ability, school, amount, overkill, resisted, blocked, absorbed, critical, sourceName
}
local limit, count
local blacklist = {
    [124255] = true
}

local overkillFormat, resistedFormat, blockedFormat, absorbedFormat, criticalText
if Cell.isAsian then
    overkillFormat = string.sub(_G.TEXT_MODE_A_STRING_RESULT_OVERKILLING, 4, string.len(_G.TEXT_MODE_A_STRING_RESULT_OVERKILLING)-3)
    resistedFormat = string.sub(_G.TEXT_MODE_A_STRING_RESULT_RESIST, 4, string.len(_G.TEXT_MODE_A_STRING_RESULT_RESIST)-3)
    blockedFormat = string.sub(_G.TEXT_MODE_A_STRING_RESULT_BLOCK, 4, string.len(_G.TEXT_MODE_A_STRING_RESULT_BLOCK)-3)
    absorbedFormat = string.sub(_G.TEXT_MODE_A_STRING_RESULT_ABSORB, 4, string.len(_G.TEXT_MODE_A_STRING_RESULT_ABSORB)-3)
    criticalText = string.sub(_G.TEXT_MODE_A_STRING_RESULT_CRITICAL, 4, string.len(_G.TEXT_MODE_A_STRING_RESULT_CRITICAL)-3)
else
    overkillFormat = strlower(string.gsub(_G.TEXT_MODE_A_STRING_RESULT_OVERKILLING, "[()]", ""))
    resistedFormat = strlower(string.gsub(_G.TEXT_MODE_A_STRING_RESULT_RESIST, "[()]", ""))
    blockedFormat = strlower(string.gsub(_G.TEXT_MODE_A_STRING_RESULT_BLOCK, "[()]", ""))
    absorbedFormat = strlower(string.gsub(_G.TEXT_MODE_A_STRING_RESULT_ABSORB, "[()]", ""))
    criticalText = strlower(string.gsub(_G.TEXT_MODE_A_STRING_RESULT_CRITICAL, "[()]", ""))
end

-- WotLK's combat text formats use %d, but F.FormatNumber returns a string.
overkillFormat = string.gsub(overkillFormat, "%%d", "%%s")
resistedFormat = string.gsub(resistedFormat, "%%d", "%%s")
blockedFormat = string.gsub(blockedFormat, "%%d", "%%s")
absorbedFormat = string.gsub(absorbedFormat, "%%d", "%%s")

----------------------------------------------------
-- functions
----------------------------------------------------
local function UpdateDeathLog(guid, ...)
    if not deathLogs[guid] then
        deathLogs[guid] = {}
    end

    deathLogs[guid]["time"], deathLogs[guid]["type"], deathLogs[guid]["name"], deathLogs[guid]["ability"],
    deathLogs[guid]["school"], deathLogs[guid]["amount"], deathLogs[guid]["overkill"], deathLogs[guid]["resisted"],
    deathLogs[guid]["blocked"], deathLogs[guid]["absorbed"], deathLogs[guid]["critical"], deathLogs[guid]["sourceName"] = ...

    deathLogs[guid]["reported"] = false
end

local function Send(msg)
    -- F.Print(strupper(ACTION_UNIT_DIED)..": "..msg)
    if Cell.hasHighestPriority then
        SendChatMessage(strupper(ACTION_UNIT_DIED)..": "..msg, F.IsInRaid() and "RAID" or "PARTY")
    end
end

local function Report(guid)
    if not deathLogs[guid] or deathLogs[guid]["reported"] then return end
    deathLogs[guid]["reported"] = true

    if instanceType == "raid" and F.IsEncounterInProgress() then
        count = count + 1
        if count > limit then
            return
        end
    end

    if not deathLogs[guid]["type"] or time()-deathLogs[guid]["time"]>=1 then -- unkown
        -- Send(deathLogs[guid]["name"].." > "..strlower(_G.UNKNOWN))
        Send(deathLogs[guid]["name"])

    elseif deathLogs[guid]["type"] == "INSTAKILL" then
        Send(deathLogs[guid]["name"].." > "..L["instakill"])

    elseif deathLogs[guid]["type"] == "ENVIRONMENTAL" then
        Send(deathLogs[guid]["name"].." > "..F.FormatNumber(deathLogs[guid]["amount"]).." ("..deathLogs[guid]["ability"]..")")

    else -- SPELL & RANGE & SWING
        -- local damageDetails = {}
        local damageDetails = ""

        if deathLogs[guid]["overkill"] > 0 then
            -- tinsert(damageDetails, string.format(overkillFormat, F.FormatNumber(deathLogs[guid]["overkill"])))
            damageDetails = " ("..string.format(overkillFormat, F.FormatNumber(deathLogs[guid]["overkill"]))..") "
        end
        -- if deathLogs[guid]["critical"] == 1 then
        --     tinsert(damageDetails, criticalText)
        -- end
        -- if deathLogs[guid]["resisted"] then
        --     tinsert(damageDetails, string.format(resistedFormat, F.FormatNumber(deathLogs[guid]["resisted"])))
        -- end
        -- if deathLogs[guid]["blocked"] then
        --     tinsert(damageDetails, string.format(blockedFormat, F.FormatNumber(deathLogs[guid]["blocked"])))
        -- end
        -- if deathLogs[guid]["absorbed"] then
        --     tinsert(damageDetails, string.format(absorbedFormat, F.FormatNumber(deathLogs[guid]["absorbed"])))
        -- end

        -- damageDetails = table.concat(damageDetails, ", ")

        local sourceName = (deathLogs[guid]["sourceName"] and deathLogs[guid]["name"]~=deathLogs[guid]["sourceName"]) and (" ["..deathLogs[guid]["sourceName"].."]") or ""
        local ability

        if deathLogs[guid]["type"] == "SPELL" then -- including RANGE
            -- tinsert(damageDetails, strlower(CombatLog_String_SchoolString(deathLogs[guid]["school"])))
            ability = deathLogs[guid]["ability"]
        else -- SWING
            ability = strlower(_G.MELEE)
        end

        -- damageDetails = table.concat(damageDetails, ", ")
        -- if damageDetails ~= "" then damageDetails = " ("..damageDetails..") " end
        Send(deathLogs[guid]["name"].." > "..ability.." "..F.FormatNumber(deathLogs[guid]["amount"])..damageDetails..sourceName)
    end

    -- wipe(deathLogs[guid])
end

----------------------------------------------------
-- event
----------------------------------------------------
local frame = CreateFrame("Frame")
-- frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

function frame:ENCOUNTER_START()
    count = 0
end

function frame:ENCOUNTER_END()
    frame:GROUP_ROSTER_UPDATE()
end

local function RegisterEncounterCallbacks()
    Cell.RegisterCallback("EncounterStart", "DeathReport_EncounterStart", frame.ENCOUNTER_START)
    Cell.RegisterCallback("EncounterEnd", "DeathReport_EncounterEnd", frame.ENCOUNTER_END)
end

local function UnregisterEncounterCallbacks()
    Cell.UnregisterCallback("EncounterStart", "DeathReport_EncounterStart")
    Cell.UnregisterCallback("EncounterEnd", "DeathReport_EncounterEnd")
end

function frame:PLAYER_ENTERING_WORLD()
    local isIn, iType = IsInInstance()
    instanceType = iType

    if instanceType == "pvp" or instanceType == "arena" then
        UnregisterEncounterCallbacks()
        frame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
        frame:UnregisterEvent("RAID_ROSTER_UPDATE")
        frame:UnregisterEvent("PARTY_MEMBERS_CHANGED")
        return
    else
        frame:RegisterEvent("RAID_ROSTER_UPDATE")
        frame:RegisterEvent("PARTY_MEMBERS_CHANGED")
    end

    if not init then frame:GROUP_ROSTER_UPDATE() end
    if isIn then
        inInstance = true
        if instanceType == "raid" then
            RegisterEncounterCallbacks()
            count = 0
        else
            UnregisterEncounterCallbacks()
        end
    elseif inInstance then -- left instance
        inInstance = false
        wipe(deathLogs)
        UnregisterEncounterCallbacks()
    end
    -- texplore(deathLogs)
end

local timer
function frame:GROUP_ROSTER_UPDATE()
    if F.IsInGroup() then
        if not F.IsEncounterInProgress() then
            if timer then timer:Cancel() end
            timer = F.C_Timer.NewTimer(7, function()
                F.CheckPriority()
            end)
        end
    else
        frame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    end
    init = true
end
frame.RAID_ROSTER_UPDATE = frame.GROUP_ROSTER_UPDATE
frame.PARTY_MEMBERS_CHANGED = frame.GROUP_ROSTER_UPDATE

function frame:COMBAT_LOG_EVENT_UNFILTERED(...)
    local timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, arg9, arg10, arg11 = ...
    local amount, overkill, school, resisted, blocked, absorbed, critical -- glancing, crushing

    -- arg9, arg10, arg11,
    -- UNIT_DIED: recapID, unconsciousOnDeath
    -- ENVIRONMENTAL: environmentalType
    -- SPELL/RANGE: spellId, spellName, spellSchool

    if F.IsPlayer(destGUID) and F.IsFriend(destFlags) then
        if event == "SPELL_INSTAKILL" then
            UpdateDeathLog(destGUID, timestamp, "INSTAKILL", destName)
        end

        if event == "ENVIRONMENTAL_DAMAGE" then
            amount, overkill, school, resisted, blocked, absorbed, critical = select(10, ...)
            amount = amount == 0 and absorbed or amount
            -- _G.ENVIRONMENTAL_DAMAGE.." "..
            UpdateDeathLog(destGUID, timestamp, "ENVIRONMENTAL", destName, strlower(_G["ACTION_ENVIRONMENTAL_DAMAGE_" .. strupper(arg9)]), nil, amount)
        end

        if event == "SWING_DAMAGE" then
            amount, overkill, school, resisted, blocked, absorbed, critical = select(9, ...)
            UpdateDeathLog(destGUID, timestamp, "SWING", destName, nil, school, amount, overkill or -1, resisted, blocked, absorbed, critical, sourceName)
        end

        if event == "SPELL_DAMAGE" or event == "SPELL_PERIODIC_DAMAGE" or event == "RANGE_DAMAGE" then
            if not blacklist[arg9] then
                amount, overkill, school, resisted, blocked, absorbed, critical = select(12, ...)
                local spellLink = GetSpellLink(arg9)
                UpdateDeathLog(destGUID, timestamp, "SPELL", destName, spellLink, school, amount, overkill or -1, resisted, blocked, absorbed, critical, sourceName)
            end
        end

        if event == "SPELL_AURA_APPLIED" then
            -- print(arg9, arg10, arg11)
            if arg9 == 27827 or arg9 == 358164 then -- 救赎之魂 or 灵魂疲惫
                F.C_Timer.After(0.25, function()
                    Report(destGUID)
                end)
            end
        end

        if event == "UNIT_DIED" and not UnitIsFeignDeath(destName) then
            F.C_Timer.After(0.5, function()
                if not deathLogs[destGUID] then deathLogs[destGUID] = {["name"]=destName} end
                Report(destGUID)
            end)
        end
    end
end

frame:SetScript("OnEvent", function(self, event, ...)
    self[event](self, ...)
end)

----------------------------------------------------
-- priority
----------------------------------------------------
local function UpdatePriority(hasHighestPriority)
    if hasHighestPriority and CellDB["tools"]["deathReport"][1] then
        frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    else
        frame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    end
end
Cell.RegisterCallback("UpdatePriority", "DeathReport_UpdatePriority", UpdatePriority)

----------------------------------------------------
-- UpdateTools
----------------------------------------------------
local function UpdateTools(which)
    if not which or which == "deathReport" then
        if CellDB["tools"]["deathReport"][1] then
            frame:RegisterEvent("PLAYER_ENTERING_WORLD")
            frame:RegisterEvent("RAID_ROSTER_UPDATE")
            frame:RegisterEvent("PARTY_MEMBERS_CHANGED")

            limit = CellDB["tools"]["deathReport"][2]
            count = 0
            if not enabled and which == "deathReport" then -- already in world, manually enabled
                frame:PLAYER_ENTERING_WORLD()
            end
            enabled = true
        else
            frame:UnregisterAllEvents()
            UnregisterEncounterCallbacks()
            wipe(deathLogs)
            enabled = false
        end
    end
end
Cell.RegisterCallback("UpdateTools", "DeathReport_UpdateTools", UpdateTools)
