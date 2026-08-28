---@class Cell
local Cell = select(2, ...)
local L = Cell.L
---@class CellFuncs
local F = Cell.funcs
---@type CellIndicatorFuncs
local I = Cell.iFuncs

Cell.vars.playerFaction = UnitFactionGroup("player")

-------------------------------------------------
-- game version
-------------------------------------------------
Cell.isAsian = LOCALE_zhCN or LOCALE_zhTW or LOCALE_koKR

Cell.isWrath = true
Cell.flavor = "wrath"

-------------------------------------------------
-- class
-------------------------------------------------
local localizedClass = {}
FillLocalizedClassList(localizedClass)

local sortedClasses = {
    "WARRIOR",
    "PALADIN",
    "HUNTER",
    "ROGUE",
    "PRIEST",
    "DEATHKNIGHT",
    "SHAMAN",
    "MAGE",
    "WARLOCK",
    "DRUID",
}
local classFileToID = {
    WARRIOR     = 1,
    PALADIN     = 2,
    HUNTER      = 3,
    ROGUE       = 4,
    PRIEST      = 5,
    DEATHKNIGHT = 6,
    SHAMAN      = 7,
    MAGE        = 8,
    WARLOCK     = 9,
    DRUID       = 11,
}
local classIDToFile = {}
for file, id in pairs(classFileToID) do
    classIDToFile[id] = file
end

function F.GetClassID(classFile)
    return classFileToID[classFile]
end

function F.GetLocalizedClassName(classFileOrID)
    if type(classFileOrID) == "string" then
        return localizedClass[classFileOrID] or classFileOrID

    elseif type(classFileOrID) == "number" then
        local classFile = classIDToFile[classFileOrID]
        return classFile and localizedClass[classFile] or ""
    end
    return ""
end

function F.IterateClasses()
    local i = 0
    return function()
        i = i + 1
        local classFile = sortedClasses[i]
        if classFile then
            return classFile, classFileToID[classFile], i
        end
    end
end

function F.GetSortedClasses()
    return F.Copy(sortedClasses)
end

-------------------------------------------------
-- Classic
-------------------------------------------------
function F.GetActiveTalentInfo()
    local which = GetActiveTalentGroup() == 1 and L["Primary Talents"] or L["Secondary Talents"]

    local maxPoints = 0
    local specName, specIcon

    for i = 1, GetNumTalentTabs() do
        local _, name, _, icon, pointsSpent = GetTalentTabInfo(i)
        if pointsSpent > maxPoints then
            maxPoints = pointsSpent
            specIcon = icon
            specName = name
        end
    end

    return which, specIcon or [[Interface/Icons/INV_Misc_QuestionMark]], specName or L["No Spec"]
end

-------------------------------------------------
-- color
-------------------------------------------------
function F.ConvertRGB(r, g, b, desaturation)
    if not desaturation then desaturation = 1 end
    r = r / 255 * desaturation
    g = g / 255 * desaturation
    b = b / 255 * desaturation
    return r, g, b
end

function F.ConvertRGB_256(r, g, b)
    return floor(r * 255), floor(g * 255), floor(b * 255)
end

function F.ConvertRGBToHEX(r, g, b)
    local result = ""

    for key, value in pairs({r, g, b}) do
        local hex = ""

        while(value > 0)do
            local index = math.fmod(value, 16) + 1
            value = math.floor(value / 16)
            hex = string.sub("0123456789ABCDEF", index, index) .. hex
        end

        if(string.len(hex) == 0)then
            hex = "00"

        elseif(string.len(hex) == 1)then
            hex = "0" .. hex
        end

        result = result .. hex
    end

    return result
end

function F.ConvertHEXToRGB(hex)
    hex = hex:gsub("#","")
    return tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))
end

-- https://wowpedia.fandom.com/wiki/ColorGradient
-- function F.ColorGradient(perc, r1,g1,b1, r2,g2,b2, r3,g3,b3)
--     perc = perc or 1
--     if perc >= 1 then
--         return r3, g3, b3
--     elseif perc <= 0 then
--         return r1, g1, b1
--     end

--     local segment, relperc = math.modf(perc * 2)
--     local rr1, rg1, rb1, rr2, rg2, rb2 = select((segment * 3) + 1, r1,g1,b1, r2,g2,b2, r3,g3,b3)

--     return rr1 + (rr2 - rr1) * relperc, rg1 + (rg2 - rg1) * relperc, rb1 + (rb2 - rb1) * relperc
-- end

function F.ColorGradient(perc, c1, c2, c3, lowBound, highBound)
    local r1, g1, b1 = c1[1], c1[2], c1[3]
    local r2, g2, b2 = c2[1], c2[2], c2[3]
    local r3, g3, b3 = c3[1], c3[2], c3[3]

    lowBound = lowBound or 0
    highBound = highBound or 1
    perc = perc or 1

    if perc >= highBound then
        return r3, g3, b3
    elseif perc <= lowBound then
        return r1, g1, b1
    end

    perc = (perc - lowBound) / (highBound - lowBound)

    local segment, relperc = math.modf(perc * 2)
    local rr1, rg1, rb1, rr2, rg2, rb2 = select((segment * 3) + 1, r1,g1,b1, r2,g2,b2, r3,g3,b3)

    return rr1 + (rr2 - rr1) * relperc, rg1 + (rg2 - rg1) * relperc, rb1 + (rb2 - rb1) * relperc
end

function F.ColorThreshold(perc, c1, c2, c3, lowBound, highBound, useThresholdColor)
    if useThresholdColor then
        return F.ColorGradient(perc, c1, c2, c3, lowBound, highBound)
    end

    lowBound = lowBound or 0
    highBound = highBound or 1
    perc = perc or 1

    if perc >= highBound then
        return c3[1], c3[2], c3[3]
    elseif perc >= lowBound then
        return c2[1], c2[2], c2[3]
    else
        return c1[1], c1[2], c1[3]
    end
end

--! From ColorPickerAdvanced by Feyawen-Llane
--[[ Convert RGB to HSV ---------------------------------------------------
    Inputs:
        r = Red [0, 1]
        g = Green [0, 1]
        b = Blue [0, 1]
    Outputs:
        H = Hue [0, 360]
        S = Saturation [0, 1]
        B = Brightness [0, 1]
]]--
function F.ConvertRGBToHSB(r, g, b)
    local colorMax = max(max(r, g), b)
    local colorMin = min(min(r, g), b)
    local delta = colorMax - colorMin
    local H, S, B

    -- WoW's LUA doesn't handle floating point numbers very well (Somehow 1.000000 != 1.000000   WTF?)
    -- So we do this weird conversion of, Number to String back to Number, to make the IF..THEN work correctly!
    colorMax = tonumber(format("%f", colorMax))
    r = tonumber(format("%f", r))
    g = tonumber(format("%f", g))
    b = tonumber(format("%f", b))

    if (delta > 0) then
        if (colorMax == r) then
            H = 60 * (((g - b) / delta) % 6)
        elseif (colorMax == g) then
            H = 60 * (((b - r) / delta) + 2)
        elseif (colorMax == b) then
            H = 60 * (((r - g) / delta) + 4)
        end

        if (colorMax > 0) then
            S = delta / colorMax
        else
            S = 0
        end

        B = colorMax
    else
        H = 0
        S = 0
        B = colorMax
    end

    if (H < 0) then
        H = H + 360
    end

    return H, S, B
end

--[[ Convert HSB to RGB ---------------------------------------------------
    Inputs:
        h = Hue [0, 360]
        s = Saturation [0, 1]
        b = Brightness [0, 1]
    Outputs:
        R = Red [0,1]
        G = Green [0,1]
        B = Blue [0,1]
]]--
function F.ConvertHSBToRGB(h, s, b)
    local chroma = b * s
    local prime = (h / 60) % 6
    local X = chroma * (1 - abs((prime % 2) - 1))
    local M = b - chroma
    local R, G, B

    if (0 <= prime) and (prime < 1) then
        R = chroma
        G = X
        B = 0
    elseif (1 <= prime) and (prime < 2) then
        R = X
        G = chroma
        B = 0
    elseif (2 <= prime) and (prime < 3) then
        R = 0
        G = chroma
        B = X
    elseif (3 <= prime) and (prime < 4) then
        R = 0
        G = X
        B = chroma
    elseif (4 <= prime) and (prime < 5) then
        R = X
        G = 0
        B = chroma
    elseif (5 <= prime) and (prime < 6) then
        R = chroma
        G = 0
        B = X
    else
        R = 0
        G = 0
        B = 0
    end

    R = R + M
    G = G + M
    B =  B + M

    return R, G, B
end

function F.InvertColor(r, g, b)
    return 1 - r, 1 - g, 1 - b
end

-------------------------------------------------
-- number
-------------------------------------------------
function F.Round(num, numDecimalPlaces)
    if numDecimalPlaces and numDecimalPlaces >= 0 then
        local mult = 10 ^ numDecimalPlaces
        num = num * mult
        if num >= 0 then
            return floor(num + 0.5) / mult
        else
            return ceil(num - 0.5) / mult
        end
    end

    if num >= 0 then
        return floor(num + 0.5)
    else
        return ceil(num - 0.5)
    end
end

local symbol_1K, symbol_10K, symbol_1B
if LOCALE_zhCN then
    symbol_1K, symbol_10K, symbol_1B = "千", "万", "亿"
elseif LOCALE_zhTW then
    symbol_1K, symbol_10K, symbol_1B = "千", "萬", "億"
elseif LOCALE_koKR then
    symbol_1K, symbol_10K, symbol_1B = "천", "만", "억"
end

local abs = math.abs

if Cell.isAsian then
    function F.FormatNumber(n)
        if abs(n) >= 100000000 then
            return F.Round(n / 100000000, 2) .. symbol_1B
        elseif abs(n) >= 10000 then
            return F.Round(n / 10000, 1) .. symbol_10K
        else
            return n
        end
    end
else
    function F.FormatNumber(n)
        if abs(n) >= 1000000000 then
            return F.Round(n / 1000000000, 2) .. "B"
        elseif abs(n) >= 1000000 then
            return F.Round(n / 1000000, 2) .. "M"
        elseif abs(n) >= 1000 then
            return F.Round(n / 1000, 1) .. "K"
        else
            return n
        end
    end
end

-------------------------------------------------
-- string
-------------------------------------------------
function F.UpperFirst(str, lowerOthers)
    if lowerOthers then
        str = strlower(str)
    end
    return (str:gsub("^%l", string.upper))
end

function F.SplitToNumber(sep, str)
    if not str then return end

    local ret = {strsplit(sep, str)}
    for i, v in ipairs(ret) do
        ret[i] = tonumber(v) or ret[i] -- keep non number
    end
    return unpack(ret)
end

local function Chsize(char)
    if not char then
        return 0
    elseif char > 240 then
        return 4
    elseif char > 225 then
        return 3
    elseif char > 192 then
        return 2
    else
        return 1
    end
end

function F.Utf8sub(str, startChar, numChars)
    if not str then return "" end
    local startIndex = 1
    while startChar > 1 do
        local char = string.byte(str, startIndex)
        startIndex = startIndex + Chsize(char)
        startChar = startChar - 1
    end

    local currentIndex = startIndex

    while numChars > 0 and currentIndex <= #str do
        local char = string.byte(str, currentIndex)
        currentIndex = currentIndex + Chsize(char)
        numChars = numChars -1
    end
    return str:sub(startIndex, currentIndex - 1)
end

function F.IsFontStringTruncated(fs)
    if fs.IsTruncated then
        return fs:IsTruncated()
    end

    return fs:GetStringWidth() > (fs:GetWidth() + 0.5)
end

function F.FitWidth(fs, text, alignment)
    fs:SetText(text)

    if F.IsFontStringTruncated(fs) then
        for i = 1, string.utf8len(text) do
            if strlower(alignment) == "right" then
                fs:SetText("..."..string.utf8sub(text, i))
            else
                fs:SetText(string.utf8sub(text, i).."...")
            end

            if not F.IsFontStringTruncated(fs) then
                break
            end
        end
    end
end

-------------------------------------------------
-- table
-------------------------------------------------
function F.Getn(t)
    local count = 0
    for _ in next, t do
        count = count + 1
    end
    return count
end

function F.GetIndex(t, e)
    for i, v in pairs(t) do
        if e == v then
            return i
        end
    end
    return nil
end

function F.GetKeys(t)
    local keys = {}
    for k in pairs(t) do
        tinsert(keys, k)
    end
    return keys
end

function F.Copy(t)
    local newTbl = {}
    for k, v in pairs(t) do
        if type(v) == "table" then
            newTbl[k] = F.Copy(v)
        else
            newTbl[k] = v
        end
    end
    return newTbl
end

function F.TContains(t, v)
    for _, value in pairs(t) do
        if value == v then return true end
    end
    return false
end

function F.TInsert(t, v)
    local i, done = 1
    repeat
        if not t[i] then
            t[i] = v
            done = true
        end
        i = i + 1
    until done
end

function F.TInsertIfNotExists(t, ...)
    local n = select("#", ...)
    if n == 0 then return end

    if n == 1 then
        local v = ...
        if not F.TContains(t, v) then
            tinsert(t, v)
        end
    else
        local values = F.ConvertTable(t, true)
        for i = 1, n do
            local v = select(i, ...)
            if not values[v] then
                tinsert(t, v)
            end
        end
        values = nil
    end

end

function F.TRemove(t, v)
    for i = #t, 1, -1 do
        if t[i] == v then
            table.remove(t, i)
        end
    end
end

function F.TMergeOverwrite(...)
    local n = select("#", ...)
    if n == 0 then return {} end

    local temp = F.Copy(...)
    for i = 2, n do
        local t = select(i, ...)
        for k, v in pairs(t) do
            temp[k] = v
        end
    end
    return temp
end

function F.RemoveElementsExceptKeys(tbl, ...)
    local keys = {}

    for i = 1, select("#", ...) do
        local k = select(i, ...)
        keys[k] = true
    end

    for k in pairs(tbl) do
        if not keys[k] then
            tbl[k] = nil
        end
    end
end

function F.RemoveElementsByKeys(tbl, ...)
    for i = 1, select("#", ...) do
        local k = select(i, ...)
        tbl[k] = nil
    end
end

function F.Sort(t, k1, order1, k2, order2, k3, order3)
    table.sort(t, function(a, b)
        if a[k1] ~= b[k1] then
            if order1 == "ascending" then
                return a[k1] < b[k1]
            else -- "descending"
                return a[k1] > b[k1]
            end
        elseif k2 and order2 and a[k2] ~= b[k2] then
            if order2 == "ascending" then
                return a[k2] < b[k2]
            else -- "descending"
                return a[k2] > b[k2]
            end
        elseif k3 and order3 and a[k3] ~= b[k3] then
            if order3 == "ascending" then
                return a[k3] < b[k3]
            else -- "descending"
                return a[k3] > b[k3]
            end
        end
    end)
end

function F.StringToTable(s, sep, convertToNum)
    local t = {}
    for i, v in pairs({strsplit(sep, s)}) do
        v = strtrim(v)
        if v ~= "" then
            if convertToNum then
                v = tonumber(v)
                if v then tinsert(t, v) end
            else
                tinsert(t, v)
            end
        end
    end
    return t
end

function F.TableToString(t, sep)
    return table.concat(t, sep)
end

function F.ConvertTable(t, value)
    local temp = {}
    for k, v in ipairs(t) do
        temp[v] = value or k
    end
    return temp
end

function F.ConvertSpellTable(t, convertIdToName)
    if not convertIdToName then
        return F.ConvertTable(t)
    end

    local temp = {}
    for k, v in ipairs(t) do
        local name = F.GetSpellInfo(v)
        if name then
            temp[name] = k
        end
    end
    return temp
end

function F.ConvertSpellTable_WithColor(t, convertIdToName)
    local temp = {}
    for k, st in ipairs(t) do
        local index

        if convertIdToName then
            index = F.GetSpellInfo(st[1])
        else
            index = st[1]
        end

        if index then
            temp[index] = {k, st[2]}
        end
    end
    return temp
end

function F.ConvertSpellTable_WithClass(t)
    local temp = {}
    for class, ct in pairs(t) do
        for _, id in ipairs(ct) do
            local name = F.GetSpellInfo(id)
            if name then
                temp[id] = true
            end
        end
    end
    return temp
end

function F.ConvertSpellDurationTable(t, convertIdToName)
    local temp = {}
    for _, v in ipairs(t) do
        local id, duration = strsplit(":", v)
        local name = F.GetSpellInfo(id)
        if name then
            if convertIdToName then
                temp[name] = tonumber(duration)
            else
                temp[tonumber(id)] = tonumber(duration)
            end
        end
    end
    return temp
end

function F.ConvertSpellDurationTable_WithClass(t)
    local temp = {}
    for class, ct in pairs(t) do
        for k, v in ipairs(ct) do
            local id, duration = strsplit(":", v)
            local name, icon = F.GetSpellInfo(id)
            if name then
                temp[tonumber(id)] = {tonumber(duration), icon}
            end
        end
    end
    return temp
end

function F.CheckTableRemoved(previous, after)
    local aa = {}
    local ret = {}

    for k,v in pairs(previous) do aa[v] = true end
    for k,v in pairs(after) do aa[v] = nil end

    for k,v in pairs(previous) do
        if aa[v] then
            tinsert(ret, v)
        end
    end
    return ret
end

function F.FilterInvalidSpells(t)
    if not t then return end
    for i = #t, 1, -1 do
        local spellId
        if type(t[i]) == "number" then
            spellId = t[i]
        else -- table
            spellId = t[i][1]
        end
        if not F.GetSpellInfo(spellId) then
            tremove(t, i)
        end
    end
end

-------------------------------------------------
-- general
-------------------------------------------------
function F.GetNormalizedRealmName(realm)
    if realm then
        return (string.gsub(realm, "[%s%-%.]", ""))
    elseif GetNormalizedRealmName then
        return GetNormalizedRealmName()
    else
        return (string.gsub(GetRealmName(), "[%s%-%.]", ""))
    end
end

local LibGroupTalents = LibStub("LibGroupTalents-1.0", true) or {
    GetUnitRole = function() return "" end,
    RegisterCallback = function() end,
}
local GroupTalentRoles = {
    tank = "TANK",
    healer = "HEALER",
    melee = "DAMAGER",
    caster = "DAMAGER",
}
local UnitGroupRolesAssigned = UnitGroupRolesAssigned

function F.UnitGroupRolesAssigned(unit, talentRole)
    if not unit then
        return "NONE"
    end

    local tank, healer, damage = UnitGroupRolesAssigned(unit)
    if tank then
        return "TANK"
    elseif healer then
        return "HEALER"
    elseif damage then
        return "DAMAGER"
    end

    talentRole = talentRole or LibGroupTalents:GetUnitRole(unit) or ""
    return GroupTalentRoles[talentRole] or "NONE"
end

local GroupRoleEventFrame = CreateFrame("Frame")
GroupRoleEventFrame:RegisterEvent("LFG_ROLE_UPDATE")
GroupRoleEventFrame:RegisterEvent("PLAYER_ROLES_ASSIGNED")
GroupRoleEventFrame:SetScript("OnEvent", function()
    for unit in F.IterateGroupMembers() do
        if UnitExists(unit) then
            Cell.Fire("GroupRoleChanged", unit, UnitGUID(unit), F.UnitGroupRolesAssigned(unit))
        end
    end
end)

local GroupTalentsCallback = {}
function GroupTalentsCallback:RoleChanged(_, guid, unit, role)
    if unit then
        Cell.Fire("GroupRoleChanged", unit, guid, F.UnitGroupRolesAssigned(unit, role))
    end
end

LibGroupTalents.RegisterCallback(GroupTalentsCallback, "LibGroupTalents_RoleChange", "RoleChanged")

local LibResComm = LibStub("LibResComm-1.0", true)
local incomingResurrectionCallbacks = {}

local function FireIncomingResurrectionChanged(name, event, resser, endTime, success)
    for _, callback in pairs(incomingResurrectionCallbacks) do
        callback(name, event, resser, endTime, success)
    end
end

function F.RegisterIncomingResurrectionCallback(callbackName, callback)
    incomingResurrectionCallbacks[callbackName] = callback
end

function F.UnregisterIncomingResurrectionCallback(callbackName)
    incomingResurrectionCallbacks[callbackName] = nil
end

local IncomingResComm = {}
function IncomingResComm:ResCommUpdate(event, resser, endTimeOrTarget, targetOrSuccess)
    local name, endTime, success
    if event == "ResComm_ResStart" then
        name = targetOrSuccess
        endTime = endTimeOrTarget
    else
        name = endTimeOrTarget
        success = targetOrSuccess
    end

    if name then
        FireIncomingResurrectionChanged(name, event, resser, endTime, success)
    end
end

if LibResComm then
    LibResComm.RegisterCallback(IncomingResComm, "ResComm_ResStart", "ResCommUpdate")
    LibResComm.RegisterCallback(IncomingResComm, "ResComm_ResEnd", "ResCommUpdate")
end

function F.UnitHasIncomingResurrection(unit)
    local name = unit and UnitName(unit)
    return name and LibResComm and LibResComm:IsUnitBeingRessed(name)
end

function F.UnitFullName(unit)
    if not unit or not UnitIsPlayer(unit) then return end

    local name = GetUnitName(unit, true)

    --? name might be nil in some cases?
    if name and not string.find(name, "-") then
        local server = F.GetNormalizedRealmName()
        --? server might be nil in some cases?
        if server then
            name = name.."-"..server
        end
    end

    return name
end

function F.ToShortName(fullName)
    if not fullName then return "" end
    local shortName = strsplit("-", fullName)
    return shortName
end

function F.FormatTime(s)
    if s >= 3600 then
        return "%dh", ceil(s / 3600)
    elseif s >= 60 then
        return "%dm", ceil(s / 60)
    end
    return "%ds", floor(s)
end

-- function F.SecondsToTime(seconds)
--     local m = seconds / 60
--     local s = seconds % 60
--     return format("%d:%02d", m, s)
-- end

local SEC = _G.SPELL_DURATION_SEC
local MIN = _G.SPELL_DURATION_MIN

local PATTERN_SEC
local PATTERN_MIN
if strfind(SEC, "1f") then
    PATTERN_SEC = "%.0"
elseif strfind(SEC, "2f") then
    PATTERN_SEC = "%.00"
end
if strfind(MIN, "1f") then
    PATTERN_MIN = "%.0"
elseif strfind(MIN, "2f") then
    PATTERN_MIN = "%.00"
end

function F.SecondsToTime(seconds)
    if seconds > 60 then
        return gsub(format(MIN, seconds / 60), PATTERN_MIN, "")
    else
        return gsub(format(SEC, seconds), PATTERN_SEC, "")
    end
end

-------------------------------------------------
-- unit buttons
-------------------------------------------------
local combinedHeader = "CellRaidFrameHeader0"
local separatedHeaders = {"CellRaidFrameHeader1", "CellRaidFrameHeader2", "CellRaidFrameHeader3", "CellRaidFrameHeader4", "CellRaidFrameHeader5", "CellRaidFrameHeader6", "CellRaidFrameHeader7", "CellRaidFrameHeader8"}

-- REVIEW:
-- Cell.clickCastFrames = {}
-- Cell.clickCastFrameQueue = {}

-- function F.RegisterFrame(frame)
--     Cell.clickCastFrames[frame] = true
--     Cell.clickCastFrameQueue[frame] = true  -- put into queue
--     Cell.Fire("UpdateQueuedClickCastings")
-- end

-- function F.UnregisterFrame(frame)
--     Cell.clickCastFrames[frame] = nil       -- ignore
--     Cell.clickCastFrameQueue[frame] = false -- mark for only cleanup
--     Cell.Fire("UpdateQueuedClickCastings")
-- end

function F.IterateAllUnitButtons(func, updateCurrentGroupOnly, updateQuickAssists, skipShared)
    -- solo
    if not updateCurrentGroupOnly or (updateCurrentGroupOnly and Cell.vars.groupType == "solo") then
        for _, b in pairs(Cell.unitButtons.solo) do
            func(b)
        end
    end

    -- party
    if not updateCurrentGroupOnly or (updateCurrentGroupOnly and Cell.vars.groupType == "party") then
        for index, b in pairs(Cell.unitButtons.party) do
            if index ~= "units" then
                func(b)
            end
        end
    end

    -- raid
    if not updateCurrentGroupOnly or (updateCurrentGroupOnly and Cell.vars.groupType == "raid") then
        if not updateCurrentGroupOnly or Cell.vars.currentLayoutTable.main.combineGroups then
            for _, b in ipairs(Cell.unitButtons.raid[combinedHeader]) do
                func(b)
            end
        end

        if not updateCurrentGroupOnly or not Cell.vars.currentLayoutTable.main.combineGroups then
            for _, header in ipairs(separatedHeaders) do
                for _, b in ipairs(Cell.unitButtons.raid[header]) do
                    func(b)
                end
            end
        end

    end

    -- group pet
    if not updateCurrentGroupOnly or (updateCurrentGroupOnly and Cell.vars.groupType == "raid") or (updateCurrentGroupOnly and Cell.vars.groupType == "party") then
        for index, b in pairs(Cell.unitButtons.pet) do
            if index ~= "units" then
                func(b)
            end
        end
    end

    if not skipShared then
        -- npc
        for _, b in ipairs(Cell.unitButtons.npc) do
            func(b)
        end

        -- spotlight
        for _, b in pairs(Cell.unitButtons.spotlight) do
            func(b)
        end
    end
end

function F.IterateSharedUnitButtons(func)
    -- npc
    for _, b in ipairs(Cell.unitButtons.npc) do
        func(b)
    end

    -- spotlight
    for _, b in pairs(Cell.unitButtons.spotlight) do
        func(b)
    end
end

function F.GetUnitButtonByUnit(unit, getSpotlights, getQuickAssist)
    if not unit then return end

    local normal, spotlights, quickAssist

    if Cell.vars.groupType == "raid" then
        normal = Cell.unitButtons.raid.units[unit] or Cell.unitButtons.npc.units[unit] or Cell.unitButtons.pet.units[unit]
    elseif Cell.vars.groupType == "party" then
        normal = Cell.unitButtons.party.units[unit] or Cell.unitButtons.npc.units[unit]
    else -- solo
        normal = Cell.unitButtons.solo[unit] or Cell.unitButtons.npc.units[unit]
    end

    if getSpotlights then
        spotlights = {}
        for _, b in pairs(Cell.unitButtons.spotlight) do
            if b.unit and UnitIsUnit(b.unit, unit) then
                tinsert(spotlights, b)
            end
        end
    end

    if getQuickAssist then
        quickAssist = Cell.unitButtons.quickAssist.units[unit]
    end

    return normal, spotlights, quickAssist
end

function F.GetUnitButtonByGUID(guid, getSpotlights, getQuickAssist)
    return F.GetUnitButtonByUnit(Cell.vars.guids[guid], getSpotlights, getQuickAssist)
end

function F.GetUnitButtonByName(name, getSpotlights, getQuickAssist)
    return F.GetUnitButtonByUnit(Cell.vars.names[name], getSpotlights, getQuickAssist)
end

function F.HandleUnitButton(type, unit, func, ...)
    if not unit then return end

    if type == "guid" then
        unit = Cell.vars.guids[unit]
    elseif type == "name" then
        unit = Cell.vars.names[unit]
    end

    if not unit then return end

    local handled, normal

    if Cell.vars.groupType == "raid" then
        normal = Cell.unitButtons.raid.units[unit] or Cell.unitButtons.npc.units[unit] or Cell.unitButtons.pet.units[unit]
    elseif Cell.vars.groupType == "party" then
        normal = Cell.unitButtons.party.units[unit] or Cell.unitButtons.npc.units[unit]
    else -- solo
        normal = Cell.unitButtons.solo[unit] or Cell.unitButtons.npc.units[unit]
    end

    if normal then
        func(normal, ...)
        handled = true
    end

    for _, b in pairs(Cell.unitButtons.spotlight) do
        if b.states.unit and UnitIsUnit(b.states.unit, unit) then
            func(b, ...)
            handled = true
        end
    end

    return handled
end

function F.UpdateTextWidth(fs, text, width, relativeTo)
    if not text or not width then return end

    if width == "unlimited" then
        fs:SetText(text)
    elseif width[1] == "percentage" then
        local percent = width[2] or 0.75
        local width = relativeTo:GetWidth() - 2
        for i = string.utf8len(text), 0, -1 do
            fs:SetText(string.utf8sub(text, 1, i))
            if fs:GetWidth() / width <= percent then
                break
            end
        end
    elseif width[1] == "length" then
        if string.len(text) == string.utf8len(text) then -- en
            fs:SetText(string.utf8sub(text, 1, width[2]))
        else -- non-en
            fs:SetText(string.utf8sub(text, 1, width[3]))
        end
    end
end

function F.GetMarkEscapeSequence(index)
    index = index - 1
    local left, right, top, bottom
    local coordIncrement = 64 / 256
    left = mod(index , 4) * coordIncrement
    right = left + coordIncrement
    top = floor(index / 4) * coordIncrement
    bottom = top + coordIncrement
    return string.format("|TInterface\\TargetingFrame\\UI-RaidTargetingIcons:0:0:0:0:64:64:%d:%d:%d:%d|t", left*64, right*64, top*64, bottom*64)
end

-- local scriptObjects = {}
-- local frame = CreateFrame("Frame")
-- frame:RegisterEvent("PLAYER_REGEN_DISABLED")
-- frame:RegisterEvent("PLAYER_REGEN_ENABLED")
-- frame:SetScript("OnEvent", function(self, event)
--     if event == "PLAYER_REGEN_ENABLED" then
--         for _, obj in pairs(scriptObjects) do
--             obj:Show()
--         end
--     else
--         for _, obj in pairs(scriptObjects) do
--             obj:Hide()
--         end
--     end
-- end)
-- function F.SetHideInCombat(obj)
--     tinsert(scriptObjects, obj)
-- end

-------------------------------------------------
-- global functions
-------------------------------------------------
local UnitGUID = UnitGUID
local GetRaidRosterInfo = GetRaidRosterInfo
local UnitIsPlayer = UnitIsPlayer
local UnitIsUnit = UnitIsUnit
local UnitInParty = UnitInParty
local UnitInRaid = UnitInRaid
local UnitPlayerOrPetInParty = UnitPlayerOrPetInParty
local UnitPlayerOrPetInRaid = UnitPlayerOrPetInRaid
local UnitPlayerControlled = UnitPlayerControlled
local UnitClass = UnitClass
local UnitClassBase = F.UnitClassBase
local UnitName = UnitName
local UnitIsPartyLeader = UnitIsPartyLeader
local UnitIsRaidOfficer = UnitIsRaidOfficer

-------------------------------------------------
-- frame colors
-------------------------------------------------
local RAID_CLASS_COLORS = RAID_CLASS_COLORS
local CUSTOM_CLASS_COLORS = CUSTOM_CLASS_COLORS
function F.GetClassColor(class)
    if not class or class == "" then
        return 1, 1, 1
    end
    local c = (CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class])
        or RAID_CLASS_COLORS[class]
    if c then
        return c.r, c.g, c.b
    end
    return 1, 1, 1
end

function F.GetClassColorStr(class)
    if not class or class == "" then
        return "|cffffffff"
    end
    local c = (CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class])
        or RAID_CLASS_COLORS[class]
    if c and c.colorStr then
        return "|c" .. c.colorStr
    elseif c then
        return format("|cff%02x%02x%02x", c.r * 255, c.g * 255, c.b * 255)
    end
    return "|cffffffff"
end

function F.GetUnitClassColor(unit, class, guid)
    class = class or select(2, UnitClass(unit))
    guid = guid or UnitGUID(unit)

    if UnitIsPlayer(unit) then -- player
        return F.GetClassColor(class)
    elseif F.IsPet(guid, unit) then -- pet
        return 0.5, 0.5, 1
    else -- npc / vehicle
        return 0, 1, 0.2
    end
end

function F.GetPowerColor(unit)
    local r, g, b, t
    -- https://wow.gamepedia.com/API_UnitPowerType
    local powerType, powerToken, altR, altG, altB = UnitPowerType(unit)
    t = powerType

    local info = PowerBarColor[powerToken]
    if powerType == 0 then -- MANA
        info = {r=0, g=0.5, b=1} -- default mana color is too dark!
    end

    if info then
        --The PowerBarColor takes priority
        r, g, b = info.r, info.g, info.b
    else
        if not altR then
            -- Couldn't find a power token entry. Default to indexing by power type or just mana if we don't have that either.
            info = PowerBarColor[powerType] or PowerBarColor["MANA"]
            r, g, b = info.r, info.g, info.b
        else
            r, g, b = altR, altG, altB
        end
    end
    return r, g, b, t
end

function F.GetPowerBarColor(unit, class)
    local r, g, b, lossR, lossG, lossB, t
    r, g, b, t = F.GetPowerColor(unit)

    if not Cell.loaded then
        return r, g, b, r*0.2, g*0.2, b*0.2, t
    end

    if CellDB["appearance"]["powerColor"][1] == "power_color_dark" then
        lossR, lossG, lossB = r, g, b
        r, g, b = r*0.2, g*0.2, b*0.2
    elseif CellDB["appearance"]["powerColor"][1] == "class_color" then
        r, g, b = F.GetClassColor(class)
        lossR, lossG, lossB = r*0.2, g*0.2, b*0.2
    elseif CellDB["appearance"]["powerColor"][1] == "custom" then
        r, g, b = unpack(CellDB["appearance"]["powerColor"][2])
        lossR, lossG, lossB = r*0.2, g*0.2, b*0.2
    else
        lossR, lossG, lossB = r*0.2, g*0.2, b*0.2
    end
    return r, g, b, lossR, lossG, lossB, t
end

function F.GetHealthBarColor(percent, isDeadOrGhost, r, g, b)
    if not Cell.loaded then
        return r, g, b, r*0.2, g*0.2, b*0.2
    end

    local barR, barG, barB, lossR, lossG, lossB
    percent = percent or 1

    -- bar
    if percent == 1 and Cell.vars.useFullColor then
        barR = CellDB["appearance"]["fullColor"][2][1]
        barG = CellDB["appearance"]["fullColor"][2][2]
        barB = CellDB["appearance"]["fullColor"][2][3]
    else
        if CellDB["appearance"]["barColor"][1] == "class_color" then
            barR, barG, barB = r, g, b
        elseif CellDB["appearance"]["barColor"][1] == "class_color_dark" then
            barR, barG, barB = r*0.2, g*0.2, b*0.2
        elseif CellDB["appearance"]["barColor"][1] == "threshold1" then
            local c = CellDB["appearance"]["colorThresholds"]
            barR, barG, barB = F.ColorThreshold(percent, c[1], c[2], c[3], c[4], c[5], c[6])
        elseif CellDB["appearance"]["barColor"][1] == "threshold2" then
            local c = CellDB["appearance"]["colorThresholds"]
            if percent >= c[5] then
                barR, barG, barB = r, g, b -- full: class color
            else
                barR, barG, barB = F.ColorThreshold(percent, c[1], c[2], {r, g, b}, c[4], c[5], c[6])
            end
        elseif CellDB["appearance"]["barColor"][1] == "threshold3" then
            local c = CellDB["appearance"]["colorThresholds"]
            if percent >= c[5] then
                barR, barG, barB = r*0.2, g*0.2, b*0.2 -- full: class color
            else
                barR, barG, barB = F.ColorThreshold(percent, c[1], c[2], {r*0.2, g*0.2, b*0.2}, c[4], c[5], c[6])
            end
        else
            barR = CellDB["appearance"]["barColor"][2][1]
            barG = CellDB["appearance"]["barColor"][2][2]
            barB = CellDB["appearance"]["barColor"][2][3]
        end
    end

    -- loss
    if isDeadOrGhost and Cell.vars.useDeathColor then
        lossR = CellDB["appearance"]["deathColor"][2][1]
        lossG = CellDB["appearance"]["deathColor"][2][2]
        lossB = CellDB["appearance"]["deathColor"][2][3]
    else
        if CellDB["appearance"]["lossColor"][1] == "class_color" then
            lossR, lossG, lossB = r, g, b
        elseif CellDB["appearance"]["lossColor"][1] == "class_color_dark" then
            lossR, lossG, lossB = r*0.2, g*0.2, b*0.2
        elseif CellDB["appearance"]["lossColor"][1] == "threshold1" then
            local c = CellDB["appearance"]["colorThresholdsLoss"]
            lossR, lossG, lossB = F.ColorThreshold(percent, c[1], c[2], c[3], c[4], c[5], c[6])
        elseif CellDB["appearance"]["lossColor"][1] == "threshold2" then
            local c = CellDB["appearance"]["colorThresholdsLoss"]
            if isDeadOrGhost or percent <= c[4] then
                lossR, lossG, lossB = r, g, b  -- dead: class color
            else
                lossR, lossG, lossB = F.ColorThreshold(percent, {r, g, b}, c[2], c[3], c[4], c[5], c[6])
            end
        elseif CellDB["appearance"]["lossColor"][1] == "threshold3" then
            local c = CellDB["appearance"]["colorThresholdsLoss"]
            if isDeadOrGhost or percent <= c[4] then
                lossR, lossG, lossB = r*0.2, g*0.2, b*0.2  -- dead: class color
            else
                lossR, lossG, lossB = F.ColorThreshold(percent, {r*0.2, g*0.2, b*0.2}, c[2], c[3], c[4], c[5], c[6])
            end
        else
            lossR = CellDB["appearance"]["lossColor"][2][1]
            lossG = CellDB["appearance"]["lossColor"][2][2]
            lossB = CellDB["appearance"]["lossColor"][2][3]
        end
    end

    return barR, barG, barB, lossR, lossG, lossB
end

-------------------------------------------------
-- units
-------------------------------------------------
function F.GetNumSubgroupMembers(group)
    local n = 0
    for i = 1, F.GetNumGroupMembers() do
        local name, _, subgroup = GetRaidRosterInfo(i)
        if subgroup == group then
            n = n + 1
        end
    end
    return n
end

function F.GetUnitsInSubGroup(group)
    local units = {}
    for i = 1, F.GetNumGroupMembers() do
        -- name, rank, subgroup, level, class, fileName, zone, online, isDead, role, isML, combatRole = GetRaidRosterInfo(raidIndex)
        local _, _, subgroup = GetRaidRosterInfo(i)
        if subgroup == group then
            tinsert(units, "raid"..i)
        end
    end
    return units
end

function F.GetRaidInfoByName(fullName)
    for i = 1, F.GetNumGroupMembers() do
        -- rank: Returns 2 if the raid member is the leader of the raid, 1 if the raid member is promoted to assistant, and 0 otherwise.
        local name, rank, subgroup = GetRaidRosterInfo(i)
        if name == fullName then
            return i, subgroup, rank
        end
    end
end

function F.GetRaidInfoBySubgroupIndex(group, index)
    local currentIndex = 0
    for i = 1, F.GetNumGroupMembers() do
        local name, rank, subgroup = GetRaidRosterInfo(i)
        if subgroup == group then
            currentIndex = currentIndex + 1
            if currentIndex == index then
                return i, name, rank -- found
            end
        elseif subgroup > group and currentIndex ~= 0 then
            return -- nil if not found
        end
    end
end

function F.GetPetUnit(playerUnit)
    if Cell.vars.groupType == "party" then
        if playerUnit == "player" then
            return "pet"
        else
            return "partypet"..select(3, strfind(playerUnit, "^party(%d+)$"))
        end
    elseif Cell.vars.groupType == "raid" then
        return "raidpet"..select(3, strfind(playerUnit, "^raid(%d+)$"))
    else
        return "pet"
    end
end

function F.GetPlayerUnit(petUnit)
    if petUnit == "pet" then
        return "player"
    else
        return petUnit:gsub("pet", "")
    end
end

function F.IterateGroupMembers()
    local groupType = F.IsInRaid() and "raid" or "party"
    local numGroupMembers = F.GetNumGroupMembers()
    local i

    if groupType == "party" then
        i = 0
        numGroupMembers = numGroupMembers - 1
    else
        i = 1
    end

    return function()
        local ret
        if i == 0 then
            ret = "player"
        elseif i <= numGroupMembers and i > 0 then
            ret = groupType .. i
        end
        i = i + 1
        return ret
    end
end

function F.IterateGroupPets()
    local groupType = F.IsInRaid() and "raid" or "party"
    local numGroupMembers = F.GetNumGroupMembers()
    local i = groupType == "party" and 0 or 1

    if groupType == "party" then
        numGroupMembers = numGroupMembers - 1
    end

    return function()
        local ret
        if i == 0 and groupType == "party" then
            ret = "pet"
        elseif i <= numGroupMembers and i > 0 then
            ret = groupType .. "pet" .. i
        end
        i = i + 1
        return ret
    end
end

function F.GetGroupType()
    if F.IsInRaid() then
        return "raid"
    elseif F.IsInGroup() then
        return "party"
    else
        return "solo"
    end
end

function F.UnitInGroup(unit, ignorePets)
    if ignorePets then
        return UnitIsUnit(unit, "player") or UnitInParty(unit) or UnitInRaid(unit)
    else
        return UnitIsUnit(unit, "player") or UnitIsUnit(unit, "pet") or UnitPlayerOrPetInParty(unit) or UnitPlayerOrPetInRaid(unit)
    end
end

function F.UnitIsOtherPlayersPet(unit)
    if not unit
        or UnitIsPlayer(unit)
        or UnitIsUnit(unit, "pet")
    then
        return
    end
    return UnitPlayerControlled(unit) == 1
end

-- UnitTokenFromGUID
function F.GetTargetUnitID(target)
    if UnitIsUnit(target, "player") then
        return "player"
    elseif UnitIsUnit(target, "pet") then
        return "pet"
    end

    if not F.UnitInGroup(target) then return end

    if UnitIsPlayer(target) then
        for unit in F.IterateGroupMembers() do
            if UnitIsUnit(target, unit) then
                return unit
            end
        end
    else
        for unit in F.IterateGroupPets() do
            if UnitIsUnit(target, unit) then
                return unit
            end
        end
    end
end

function F.GetTargetPetID(target)
    if UnitIsUnit(target, "player") then
        return "pet"
    end

    if not F.UnitInGroup(target) then return end

    if UnitIsPlayer(target) then
        for unit in F.IterateGroupMembers() do
            if UnitIsUnit(target, unit) then
                return F.GetPetUnit(unit)
            end
        end
    end
end

-- https://wowpedia.fandom.com/wiki/UnitFlag
local OBJECT_AFFILIATION_MINE = 0x00000001
local OBJECT_AFFILIATION_PARTY = 0x00000002
local OBJECT_AFFILIATION_RAID = 0x00000004

function F.IsFriend(unitFlags)
    if not unitFlags then return false end
    return (bit.band(unitFlags, OBJECT_AFFILIATION_MINE) ~= 0) or (bit.band(unitFlags, OBJECT_AFFILIATION_RAID) ~= 0) or (bit.band(unitFlags, OBJECT_AFFILIATION_PARTY) ~= 0)
end

local guidTypes = {
    [0x000] = "player",
    [0x003] = "npc",
    [0x004] = "pet",
    [0x005] = "vehicle",
}

local function GetGUIDUnitType(guid)
    local typeField = tonumber(strsub(guid, 3, 5), 16)
    return typeField and guidTypes[bit.band(typeField, 0x00F)]
end

function F.IsPlayer(guid)
    if guid then
        return GetGUIDUnitType(guid) == "player"
    end
end

function F.IsPet(guid, unit)
    if unit then
        return strfind(unit, "pet%d*$")
    end
    if guid then
        return GetGUIDUnitType(guid) == "pet"
    end
end

function F.IsNPC(guid)
    if guid then
        return GetGUIDUnitType(guid) == "npc"
    end
end

function F.IsVehicle(guid)
    if guid then
        return GetGUIDUnitType(guid) == "vehicle"
    end
end

function F.GetTargetUnitInfo()
    if UnitIsUnit("target", "player") then
        return "player", UnitName("player"), UnitClassBase("player")
    elseif UnitIsUnit("target", "pet") then
        return "pet", UnitName("pet")
    end
    if not F.UnitInGroup("target") then return end

    if F.IsInRaid() then
        for i = 1, F.GetNumGroupMembers() do
            if UnitIsUnit("target", "raid"..i) then
                return "raid"..i, UnitName("raid"..i), UnitClassBase("raid"..i)
            end
            if UnitIsUnit("target", "raidpet"..i) then
                return "raidpet"..i, UnitName("raidpet"..i)
            end
        end
    elseif F.IsInGroup() then
        for i = 1, F.GetNumGroupMembers()-1 do
            if UnitIsUnit("target", "party"..i) then
                return "party"..i, UnitName("party"..i), UnitClassBase("party"..i)
            end
            if UnitIsUnit("target", "partypet"..i) then
                return "partypet"..i, UnitName("partypet"..i)
            end
        end
    end
end

function F.HasPermission(isPartyMarkPermission)
    if isPartyMarkPermission and F.IsInGroup() and not F.IsInRaid() then return true end
    return UnitIsPartyLeader("player") or (F.IsInRaid() and UnitIsRaidOfficer("player"))
end

-------------------------------------------------
-- LibSharedMedia
-------------------------------------------------
Cell.vars.texture = "Interface\\AddOns\\Cell\\Media\\statusbar.tga"
Cell.vars.emptyTexture = "Interface\\AddOns\\Cell\\Media\\empty.tga"
Cell.vars.whiteTexture = "Interface\\AddOns\\Cell\\Media\\white.tga"

local LSM = LibStub("LibSharedMedia-3.0", true)
LSM:Register("statusbar", "Cell ".._G.DEFAULT, Cell.vars.texture)
LSM:Register("font", "Visitor", [[Interface\Addons\Cell\Media\Fonts\visitor.ttf]], 255)

function F.GetBarTexture()
    --! update Cell.vars.texture for further use in UnitButton_OnLoad
    if not CellDB or not CellDB["appearance"] then
        Cell.vars.texture = "Interface\\AddOns\\Cell\\Media\\statusbar.tga"
        return Cell.vars.texture
    end

    if LSM:IsValid("statusbar", CellDB["appearance"]["texture"]) then
        Cell.vars.texture = LSM:Fetch("statusbar", CellDB["appearance"]["texture"])
    else
        Cell.vars.texture = "Interface\\AddOns\\Cell\\Media\\statusbar.tga"
    end
    return Cell.vars.texture
end

function F.GetBarTextureByName(name)
    if LSM:IsValid("statusbar", name) then
        return LSM:Fetch("statusbar", name)
    end
    return "Interface\\AddOns\\Cell\\Media\\statusbar.tga"
end

function F.GetFont(font)
    if font and LSM:IsValid("font", font) then
        return LSM:Fetch("font", font)
    elseif type(font) == "string" and strfind(strlower(font), ".ttf$") then
        return font
    else
        if CellDB["appearance"]["useGameFont"] then
            return GameFontNormal:GetFont()
        else
            return "Interface\\AddOns\\Cell\\Media\\Fonts\\Accidental_Presidency.ttf"
        end
    end
end

local defaultFontName = "Cell ".._G.DEFAULT
local defaultFont
function F.GetFontItems()
    if CellDB["appearance"]["useGameFont"] then
        defaultFont = GameFontNormal:GetFont()
    else
        defaultFont = "Interface\\AddOns\\Cell\\Media\\Fonts\\Accidental_Presidency.ttf"
    end

    local items = {}
    local fonts, fontNames

    -- if LSM then
        fonts, fontNames = F.Copy(LSM:HashTable("font")), F.Copy(LSM:List("font"))
        -- insert default font
        tinsert(fontNames, 1, defaultFontName)
        fonts[defaultFontName] = defaultFont

        for _, name in pairs(fontNames) do
            tinsert(items, {
                ["text"] = name,
                ["font"] = fonts[name],
                -- ["onClick"] = function()
                --     CellDB["appearance"]["font"] = name
                --     Cell.Fire("UpdateAppearance", "font")
                -- end,
            })
        end
    -- else
    --     fontNames = {defaultFontName}
    --     fonts = {[defaultFontName] = defaultFont}

    --     tinsert(items, {
    --         ["text"] = defaultFontName,
    --         ["font"] = defaultFont,
    --         -- ["onClick"] = function()
    --         --     CellDB["appearance"]["font"] = defaultFontName
    --         --     Cell.Fire("UpdateAppearance", "font")
    --         -- end,
    --     })
    -- end
    return items, fonts, defaultFontName, defaultFont
end

-------------------------------------------------
-- texture
-------------------------------------------------
function F.GetTexCoord(width, height)
    -- ULx,ULy, LLx,LLy, URx,URy, LRx,LRy
    local texCoord = {0.12, 0.12, 0.12, 0.88, 0.88, 0.12, 0.88, 0.88}
    local aspectRatio = width / height

    local xRatio = aspectRatio < 1 and aspectRatio or 1
    local yRatio = aspectRatio > 1 and 1 / aspectRatio or 1

    for i, coord in ipairs(texCoord) do
        local aspectRatio = (i % 2 == 1) and xRatio or yRatio
        texCoord[i] = (coord - 0.5) * aspectRatio + 0.5
    end

    return texCoord
end

-- function F.RotateTexture(tex, degrees)
--     local angle = math.rad(degrees)
--     local cos, sin = math.cos(angle), math.sin(angle)
--     tex:SetTexCoord((sin - cos), -(cos + sin), -cos, -sin, sin, -cos, 0, 0)
-- end

-- https://wowpedia.fandom.com/wiki/Applying_affine_transformations_using_SetTexCoord
local s2 = sqrt(2)
local function CalculateCorner(degrees, left, right, top, bottom)
    local r = math.rad(degrees)
    local x = 0.5 + math.cos(r) / s2
    local y = 0.5 + math.sin(r) / s2
    return left + x * (right - left), top + y * (bottom - top)
end
function F.RotateTexture(texture, degrees, left, right, top, bottom)
    left, right, top, bottom = left or 0, right or 1, top or 0, bottom or 1

    local LRx, LRy = CalculateCorner(degrees + 45, left, right, top, bottom)
    local LLx, LLy = CalculateCorner(degrees + 135, left, right, top, bottom)
    local ULx, ULy = CalculateCorner(degrees + 225, left, right, top, bottom)
    local URx, URy = CalculateCorner(degrees - 45, left, right, top, bottom)

    texture:SetTexCoord(ULx, ULy, LLx, LLy, URx, URy, LRx, LRy)
end

-- wow atlases
local wowAtlases = {
    "playerpartyblip",
    "Artifacts-PerkRing-WhiteGlow",
    "AftLevelup-WhiteIconGlow",
    "LootBanner-IconGlow",
    "AftLevelup-WhiteStarBurst",
    "ChallengeMode-WhiteSpikeyGlow",
    "UI-QuestPoiCampaign-OuterGlow",
    "vignettekill",
    "PetJournal-FavoritesIcon",
    "dungeonskull",
    "questnormal",
    "questturnin",
    "bags-icon-addslots",
    "communities-chat-icon-plus",
    "communities-chat-icon-minus",
}

local wowAtlasTextures = {
    ["playerpartyblip"] = {"Interface\\AddOns\\Cell\\Media\\Icons\\ObjectIconsAtlas.BLP", 0.475586, 0.506836, 0.805664, 0.836914},
    ["Artifacts-PerkRing-WhiteGlow"] = {"Interface\\AddOns\\Cell\\Media\\Icons\\Artifacts.BLP", 0.948242, 0.99707, 0.000976562, 0.0498047},
    ["AftLevelup-WhiteIconGlow"] = {"Interface\\AddOns\\Cell\\Media\\Icons\\Artifacts.BLP", 0.123047, 0.217773, 0.671875, 0.766602},
    ["LootBanner-IconGlow"] = {"Interface\\AddOns\\Cell\\Media\\Icons\\BossBanner.BLP", 0.865234, 0.943359, 0.447266, 0.525391},
    ["AftLevelup-WhiteStarBurst"] = {"Interface\\AddOns\\Cell\\Media\\Icons\\Artifacts.BLP", 0.800781, 0.930664, 0.869141, 0.999023},
    ["ChallengeMode-WhiteSpikeyGlow"] = {"Interface\\AddOns\\Cell\\Media\\Icons\\ChallengeModeHud.BLP", 0.204102, 0.385742, 0.00195312, 0.410156},
    ["UI-QuestPoiCampaign-OuterGlow"] = {"Interface\\AddOns\\Cell\\Media\\Icons\\QuestCampaignMapIcons2X.BLP", 0.00195312, 0.251953, 0.00390625, 0.503906},
    ["vignettekill"] = {"Interface\\AddOns\\Cell\\Media\\Icons\\ObjectIconsAtlas.BLP", 0.262695, 0.325195, 0.192383, 0.254883},
    ["PetJournal-FavoritesIcon"] = {"Interface\\AddOns\\Cell\\Media\\Icons\\FavoritesIcon.BLP", 0.03125, 0.8125, 0.03125, 0.8125},
    ["dungeonskull"] = {"Interface\\AddOns\\Cell\\Media\\Icons\\ObjectIconsAtlas.BLP", 0.907227, 0.938477, 0.407227, 0.438477},
    ["questnormal"] = {"Interface\\AddOns\\Cell\\Media\\Icons\\ObjectIconsAtlas.BLP", 0.842773, 0.905273, 0.12793, 0.19043},
    ["questturnin"] = {"Interface\\AddOns\\Cell\\Media\\Icons\\ObjectIconsAtlas.BLP", 0.541992, 0.573242, 0.838867, 0.870117},
    ["bags-icon-addslots"] = {"Interface\\AddOns\\Cell\\Media\\Icons\\Bags.BLP", 0.533203, 0.615234, 0.00390625, 0.167969},
    ["communities-chat-icon-plus"] = {"Interface\\AddOns\\Cell\\Media\\Icons\\CommunitiesAddChat.BLP", 0.850586, 0.975586, 0.000976562, 0.12793},
    ["communities-chat-icon-minus"] = {"Interface\\AddOns\\Cell\\Media\\Icons\\CommunitiesAddChat.BLP", 0.850586, 0.975586, 0.129883, 0.206055},
    ["horde_icon_and_flag-dynamicIcon"] = {"Interface\\AddOns\\Cell\\Media\\Icons\\WorldStateUITextures.BLP", 0.716797, 0.779297, 0.00390625, 0.128906},
    ["alliance_icon_and_flag-dynamicIcon"] = {"Interface\\AddOns\\Cell\\Media\\Icons\\WorldStateUITextures.BLP", 0.00195312, 0.0644531, 0.777344, 0.902344},
}

local elvUIVersion = GetAddOnMetadata("ElvUI", "version")
local elvUIMajorVersion = tonumber(string.match(elvUIVersion or "", "%d+")) or 0
local legacyElvUIRoleTextures
if elvUIMajorVersion > 0 and elvUIMajorVersion < 7 then
    legacyElvUIRoleTextures = {
        ["Interface\\AddOns\\ElvUI\\Core\\Media\\Textures\\Tank.tga"] = "Interface\\AddOns\\ElvUI\\Media\\Textures\\Tank.tga",
        ["Interface\\AddOns\\ElvUI\\Core\\Media\\Textures\\Healer.tga"] = "Interface\\AddOns\\ElvUI\\Media\\Textures\\Healer.tga",
        ["Interface\\AddOns\\ElvUI\\Core\\Media\\Textures\\DPS.tga"] = "Interface\\AddOns\\ElvUI\\Media\\Textures\\DPS.tga",
    }
end

function F.GetTextureInfo(texture)
    if legacyElvUIRoleTextures then
        texture = legacyElvUIRoleTextures[texture] or texture
    end

    local info = wowAtlasTextures[texture]
    if info then
        return unpack(info)
    end

    local class = type(texture) == "string" and strmatch(texture, "^classicon%-(.+)$")
    local coords = class and CLASS_ICON_TCOORDS and CLASS_ICON_TCOORDS[strupper(class)]
    if coords then
        return "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes", unpack(coords)
    end

    return texture, 0, 1, 0, 1
end

function F.SetTexture(texture, textureName, degrees)
    local path, left, right, top, bottom = F.GetTextureInfo(textureName)
    texture:SetTexture(path)
    F.RotateTexture(texture, degrees or 0, left, right, top, bottom)
end

-- wow textures
local wowTextures = {

}

-- shapes
local shapes = {
    "circle_blurred",
    "circle_filled",
    "circle_thin",
    "circle",
    "heart_filled",
    "heart",
    "rhombus",
    "rhombus_filled",
    "square_filled",
    "square",
    "star_filled",
    "star",
    "starburst_filled",
    "starburst",
    "triangle_filled",
    "triangle",
}

-- weakauras
local powaTextures = {
    9, 10, 12, 13, 14, 15, 21, 22, 25, 27, 29,
    37, 38, 39, 40, 41, 42, 43, 44,
    49, 51, 52, 53, 58, 78, 118, 84,
    96, 97, 98, 99, 100, 114, 115, 116, 132, 138, 143
}

function F.GetTextures()
    local builtIns = #wowAtlases + #wowTextures + #shapes

    local t = {}

    -- wow atlases
    for _, wa in pairs(wowAtlases) do
        tinsert(t, wa)
    end

    -- wow textures
    for _, wt in pairs(wowTextures) do
        tinsert(t, wt)
    end

    -- built-ins
    for _, s in pairs(shapes) do
        tinsert(t, "Interface\\AddOns\\Cell\\Media\\Shapes\\"..s..".tga")
    end

    -- add weakauras textures
    if WeakAuras then
        builtIns = builtIns + #powaTextures
        for _, powa in pairs(powaTextures) do
            tinsert(t, "Interface\\AddOns\\WeakAuras\\PowerAurasMedia\\Auras\\Aura"..powa..".tga")
        end
    end

    -- customs
    for _, path in pairs(CellDB["customTextures"]) do
        tinsert(t, path)
    end

    return builtIns, t
end

function F.GetDefaultRoleIcon(role)
    if not role or role == "NONE" then return "" end
    return "Interface\\AddOns\\Cell\\Media\\Roles\\Default_" .. role
end

function F.GetDefaultRoleIconEscapeSequence(role, size)
    if not role or role == "NONE" then return "" end
    return "|TInterface\\AddOns\\Cell\\Media\\Roles\\Default_" .. role .. ":" .. (size or 0) .. "|t"
end

-------------------------------------------------
-- instance
-------------------------------------------------
function F.GetInstanceName()
    if IsInInstance() then
        local name = GetInstanceInfo()
        if not name then name = GetRealZoneText() end
        return name
    end
    return GetZoneText() or GetRealZoneText() or ""
end

-------------------------------------------------
-- spell
-------------------------------------------------
-- https://wow.gamepedia.com/UIOBJECT_GameTooltip
-- local function EnumerateTooltipLines_helper(...)
--     for i = 1, select("#", ...) do
--        local region = select(i, ...)
--        if region and region:GetObjectType() == "FontString" then
--           local text = region:GetText() -- string or nil
--           print(region:GetName(), text)
--        end
--     end
-- end

-- https://wowpedia.fandom.com/wiki/Patch_10.0.2/API_changes
--local lines = {}
--function F.GetSpellTooltipInfo(spellId)
--    wipe(lines)
--
--    local name, icon = F.GetSpellInfo(spellId)
--    if not name then return end
--
--   local data = C_TooltipInfo.GetSpellByID(spellId)
--   for i, line in ipairs(data.lines) do
--       TooltipUtil.SurfaceArgs(line)
--       -- line.leftText
--       -- line.rightText
--   end
--
--   return name, icon, table.concat(lines, "\n")
--end

do
    local MATCH_PATTERN, FORMAT_PATTERN = "Rank (%d+)", "Rank %d"

    if LOCALE_deDE or LOCALE_frFR then
        MATCH_PATTERN, FORMAT_PATTERN = "Rang (%d+)", "Rang %d"
    elseif LOCALE_esES or LOCALE_esMX then
        MATCH_PATTERN, FORMAT_PATTERN = "Rango (%d+)", "Rango %d"
    elseif LOCALE_koKR then
        MATCH_PATTERN, FORMAT_PATTERN = "(%d+) 레벨", "%d 레벨"
    elseif LOCALE_ptBR then
        MATCH_PATTERN, FORMAT_PATTERN = "Grau (%d+)", "Grau %d"
    elseif LOCALE_ruRU then
        MATCH_PATTERN, FORMAT_PATTERN = "Уровень (%d+)", "Уровень %d"
    elseif LOCALE_zhCN then
        MATCH_PATTERN, FORMAT_PATTERN = "等级 (%d+)", "等级 %d"
    elseif LOCALE_zhTW then
        MATCH_PATTERN, FORMAT_PATTERN = "等級 (%d+)", "等級 %d"
    end

    FORMAT_PATTERN = "(" .. FORMAT_PATTERN .. ")"

    local MaxSpellRankCache = {}

    local wipe = table.wipe or wipe
    local function BuildMaxSpellRankCache()
        wipe(MaxSpellRankCache)

        local totalSpells = 0
        for tab = 1, GetNumSpellTabs() do
            local _, _, _, numSpells = GetSpellTabInfo(tab)
            totalSpells = totalSpells + numSpells
        end

        for i = 1, totalSpells do
            local name, subText = GetSpellName(i, BOOKTYPE_SPELL)
            if name and subText then
                local rank = tonumber(subText:match(MATCH_PATTERN))
                if rank then
                    local cached = MaxSpellRankCache[name]
                    if not cached or rank > cached then
                        MaxSpellRankCache[name] = rank
                    end
                end
            end
        end
    end

    local f = CreateFrame("Frame")
    f:RegisterEvent("PLAYER_LOGIN")
    f:RegisterEvent("SPELLS_CHANGED")
    f:SetScript("OnEvent", function()
        BuildMaxSpellRankCache()
    end)

    local GetSpellInfo = GetSpellInfo

    function F.GetSpellInfo(spellId)
        if not spellId then return end
        local rank
        spellId, rank = strsplit(":", spellId)
        local name, _, icon = GetSpellInfo(spellId)
        return name, icon, tonumber(rank)
    end

    function F.GetRankSuffix(rank)
        return FORMAT_PATTERN:format(rank)
    end

    function F.GetMaxSpellRank(spellId)
        if not next(MaxSpellRankCache) then
            BuildMaxSpellRankCache()
        end

        local spellName = GetSpellInfo(spellId)
        return spellName and MaxSpellRankCache[spellName]
    end
end

function F.GetSpellCooldown(spellId)
    local start, duration = GetSpellCooldown(spellId)
    return start, duration
end

function F.IsSpellReady(spellId)
    local start, duration = F.GetSpellCooldown(spellId)
    if start == 0 or duration == 0 then
        return true
    else
        local _, gcd = F.GetSpellCooldown(61304) --! check gcd
        if duration == gcd then -- spell ready
            return true
        else
            local cdLeft = start + duration - GetTime()
            return false, cdLeft
        end
    end
end

-------------------------------------------------
-- macro
-------------------------------------------------
local mc = CreateFrame("Frame")
mc:RegisterEvent("UPDATE_MACROS")

local macroIndices = {}
mc:SetScript("OnEvent", function()
    wipe(macroIndices)

    local global, perChar = GetNumMacros()
    for i = 1, global do
        tinsert(macroIndices, i)
    end
    for i = 1, perChar do
        tinsert(macroIndices, 120 + i)
    end
end)

function F.GetMacroIndices()
    return macroIndices
end

-------------------------------------------------
-- auras
-------------------------------------------------
-- Retail: name, icon, count, debuffType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, castByPlayer, nameplateShowAll, timeMod = UnitAura
-- BP: name, rank, icon, count, dispelType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID = UnitAura
function F.FindAuraById(unit, auraType, spellId)
    for i = 1, 40 do
        local name, rank, icon, count, debuffType, duration,
            expirationTime, unitCaster, isStealable,
            shouldConsolidate, spellID =
            UnitAura(unit, i, auraType)

        if not name then
            return
        end
        if spellId == spellID then
            return name, rank, icon, count, debuffType, duration,
                expirationTime, unitCaster, isStealable,
                shouldConsolidate, spellID
        end
    end
end

function F.FindDebuffByIds(unit, spellIds)
    local debuffs = {}
    for i = 1, 40 do
        local name, rank, icon, count, debuffType, duration,
            expirationTime, unitCaster, isStealable,
            shouldConsolidate, spellId =
            UnitAura(unit, i, "HARMFUL")
        if not name then
            break
        end

        if spellIds[spellId] then
            debuffs[spellId] = I.CheckDebuffType(debuffType, spellId)
        end
    end
    return debuffs
end

function F.FindAuraByDebuffTypes(unit, types)
    local debuffs = {}
    for i = 1, 40 do
        local name, rank, icon, count, debuffType, duration,
            expirationTime, unitCaster, isStealable,
            shouldConsolidate, spellId =
            UnitAura(unit, i, "HARMFUL")
        if not name then
            break
        end

        if types == "all" or types[debuffType] then
            debuffs[spellId] = I.CheckDebuffType(debuffType, spellId)
        end
    end
    return debuffs
end

-------------------------------------------------
-- OmniCD
-------------------------------------------------
function F.UpdateOmniCDPosition(frame)
    if OmniCD and OmniCD[1].db and OmniCD[1].db.position.uf == frame then
        F.C_Timer.After(0.5, function()
            OmniCD[1].Party:UpdatePosition()
        end)
    end
end

-------------------------------------------------
-- LibGetFrame
-------------------------------------------------
local frame_priorities = {}
local inited_priorities = {}
local modified_priorities = {}
local spotlightPriorityEnabled
local quickAssistPriorityEnabled

function F.UpdateFramePriority()
    wipe(frame_priorities)
    wipe(modified_priorities)
    spotlightPriorityEnabled = nil
    quickAssistPriorityEnabled = nil

    for i, t  in pairs(CellDB["general"]["framePriority"]) do
        if t[2] then
            if t[1] == "Main" then
                tinsert(frame_priorities, i, "^CellNormalUnitFrame$")
            elseif t[1] == "Spotlight" then
                tinsert(frame_priorities, i, "^CellSpotlightUnitFrame$")
                spotlightPriorityEnabled = true
            else
                tinsert(frame_priorities, i, "^CellQuickAssistUnitFrame$")
                quickAssistPriorityEnabled = true
            end
        else
            tinsert(frame_priorities, i, "^CellPlaceholder$")
        end
    end

    F.Debug(frame_priorities)
end

function Cell.GetUnitFramesForLGF(unit, frames, priorities)
    frames = frames or {}

    local normal, spotlights, quickAssist = F.GetUnitButtonByUnit(unit, spotlightPriorityEnabled, quickAssistPriorityEnabled)

    if normal then
        frames[normal.widgets.highLevelFrame] = "CellNormalUnitFrame"
    end

    if spotlights then
        -- for _, spotlight in pairs(spotlights) do
        --     if not strfind(spotlight.unit, "target$") and spotlight.widgets and spotlight.widgets.highLevelFrame then
        --         frames[spotlight.widgets.highLevelFrame] = "CellSpotlightUnitFrame"
        --         break
        --     end
        -- end
        --! just use the first (can be "XXtarget", whatever)
        if spotlights[1] then
            frames[spotlights[1].widgets.highLevelFrame] = "CellSpotlightUnitFrame"
        end
    end

    if quickAssist then
        frames[quickAssist] = "CellQuickAssistUnitFrame"
    end

    if not inited_priorities[priorities] then
        inited_priorities[priorities] = true
        for i = 1, 3 do
            tinsert(priorities, i, "^CellPlaceholder$")
        end
    end

    if not modified_priorities[priorities] then
        modified_priorities[priorities] = true
        for i, p in ipairs(frame_priorities) do
            priorities[i] = p
        end
    end

    return frames
end

-------------------------------------------------
-- range check
-------------------------------------------------
local UnitIsVisible = UnitIsVisible
local UnitInRange = UnitInRange
local UnitCanAssist = UnitCanAssist
local UnitCanAttack = UnitCanAttack
local UnitCanCooperate = UnitCanCooperate
local IsSpellInRange = IsSpellInRange
local IsItemInRange = IsItemInRange
local CheckInteractDistance = CheckInteractDistance
local UnitIsDead = UnitIsDead
local UnitIsConnected = UnitIsConnected
local IsSpellKnown =  IsSpellKnown
local InCombatLockdown = InCombatLockdown

local playerClass = UnitClassBase("player")

local friendSpells = {
    -- ["DEATHKNIGHT"] = 47541,
    ["DRUID"] = 5185 , -- Healing Touch / Regrowth
    -- ["HUNTER"] = 136,
    ["MAGE"] = 1459, -- Arcane Intellect / Arcane Brilliance
    ["PALADIN"] = 635, -- Flash of Light / Holy Light
    ["PRIEST"] = 2050, -- Lesser Heal / Flash Heal
    -- ["ROGUE"] = Cell.isWrath and 57934,
    ["SHAMAN"] = 331, -- Healing Surge / Healing Wave
    ["WARLOCK"] = 5697, -- Unending Breath
    -- ["WARRIOR"] = 3411, -- Intervene
}

local deadSpells = {

}

local petSpells = {
    ["HUNTER"] = 136,
}

local harmSpells = {
    ["DEATHKNIGHT"] = 47541, -- Death Coil
    ["DRUID"] = 5176, -- Wrath
    ["HUNTER"] = 75, -- Auto Shot
    ["MAGE"] = 133, -- Fireball
    ["PALADIN"] = 20271, -- Judgment
    ["PRIEST"] = 585, -- Shadow Word: Pain / Smite
    ["ROGUE"] = 1752, -- Sinister Strike
    ["SHAMAN"] = 403, -- Lightning Bolt
    ["WARLOCK"] = 689, -- Drain Life
    ["WARRIOR"] = 355, -- Taunt
}

-- local friendItems = {
--     ["DEATHKNIGHT"] = 34471,
--     ["DEMONHUNTER"] = 34471,
--     ["DRUID"] = 34471,
--     ["EVOKER"] = 1180, -- 30y
--     ["HUNTER"] = 34471,
--     ["MAGE"] = 34471,
--     ["MONK"] = 34471,
--     ["PALADIN"] = 34471,
--     ["PRIEST"] = 34471,
--     ["ROGUE"] = 34471,
--     ["SHAMAN"] = 34471,
--     ["WARLOCK"] = 34471,
--     ["WARRIOR"] = 34471,
-- }

local harmItems = {
    ["DEATHKNIGHT"] = 28767, -- 40y
    ["DRUID"] = 28767, -- 40y
    ["HUNTER"] = 28767, -- 40y
    ["MAGE"] = 28767, -- 40y
    ["PALADIN"] = 835, -- 30y
    ["PRIEST"] = 28767, -- 40y
    ["ROGUE"] = 28767, -- 40y
    ["SHAMAN"] = 28767, -- 40y
    ["WARLOCK"] = 28767, -- 40y
    ["WARRIOR"] = 28767, -- 40y
}

local UnitInSpellRange = function(spellName, unit)
    return IsSpellInRange(spellName, unit) == 1
end

local rc = CreateFrame("Frame")
rc:RegisterEvent("SPELLS_CHANGED")

local spell_friend, spell_pet, spell_harm, spell_dead
CELL_RANGE_CHECK_FRIENDLY = {}
CELL_RANGE_CHECK_HOSTILE = {}
CELL_RANGE_CHECK_DEAD = {}
CELL_RANGE_CHECK_PET = {}

local function LoadSpellName(spellID)
    return spellID and IsSpellKnown(spellID) and GetSpellInfo(spellID)
end

local function SPELLS_CHANGED()
    local friend_id = CELL_RANGE_CHECK_FRIENDLY[playerClass] or friendSpells[playerClass]
    local harm_id   = CELL_RANGE_CHECK_HOSTILE[playerClass]  or harmSpells[playerClass]
    local dead_id   = CELL_RANGE_CHECK_DEAD[playerClass]     or deadSpells[playerClass]
    local pet_id    = CELL_RANGE_CHECK_PET[playerClass]      or petSpells[playerClass]

    spell_friend = LoadSpellName(friend_id)
    spell_harm   = LoadSpellName(harm_id)
    spell_dead   = LoadSpellName(dead_id)
    spell_pet    = LoadSpellName(pet_id)
end

local timer
local function DELAYED_SPELLS_CHANGED()
    if timer then timer:Cancel() end
    timer = F.C_Timer.NewTimer(1, SPELLS_CHANGED)
end

rc:SetScript("OnEvent", DELAYED_SPELLS_CHANGED)

function F.IsInRange(unit, check)
    if not UnitIsVisible(unit) then
        return false
    end

    if UnitIsUnit("player", unit) then
        return true

    elseif not check and F.UnitInGroup(unit) then
        -- NOTE: UnitInRange only works with group players/pets
        --! but not available for PLAYER PET when SOLO
        local inRange = UnitInRange(unit)
        if inRange ~= nil then
            return inRange
        end
        return F.IsInRange(unit, true)

    else
        if UnitCanAssist("player", unit) then -- or UnitCanCooperate("player", unit)
            if not UnitIsConnected(unit) then
                return false
            end

            if UnitIsDead(unit) then
                if spell_dead then
                    return UnitInSpellRange(spell_dead, unit)
                end
            elseif spell_friend then
                return UnitInSpellRange(spell_friend, unit)
            end

            local inRange = UnitInRange(unit)
            if inRange ~= nil then
                return inRange
            end

            if UnitIsUnit(unit, "pet") and spell_pet then
                -- no spell_friend, use spell_pet
                return UnitInSpellRange(spell_pet, unit)
            end

        elseif UnitCanAttack("player", unit) then
            if UnitIsDead(unit) then
                return CheckInteractDistance(unit, 4) -- 28 yards
            elseif spell_harm then
                return UnitInSpellRange(spell_harm, unit)
            end
            return IsItemInRange(harmItems[playerClass], unit)
        end

        if not InCombatLockdown() then
            return CheckInteractDistance(unit, 4) -- 28 yards
        end

        return true
    end
end

RAID_CLASS_COLORS.HUNTER.colorStr = "ffabd473"
RAID_CLASS_COLORS.WARLOCK.colorStr = "ff8788ee"
RAID_CLASS_COLORS.PRIEST.colorStr = "ffffffff"
RAID_CLASS_COLORS.PALADIN.colorStr = "fff58cba"
RAID_CLASS_COLORS.MAGE.colorStr = "ff3fc7eb"
RAID_CLASS_COLORS.ROGUE.colorStr = "fffff569"
RAID_CLASS_COLORS.DRUID.colorStr = "ffff7d0a"
RAID_CLASS_COLORS.SHAMAN.colorStr = "ff0070de"
RAID_CLASS_COLORS.WARRIOR.colorStr = "ffc79c6e"
RAID_CLASS_COLORS.DEATHKNIGHT.colorStr = "ffc41f3b"
