-------------------------------------------------
-- 2023-07-15 08:30:57 GMT+8
-- PARTY ONLY
-- sort units by SPEC_PRIORITY ↓↓↓
-- slash command (not in combat): /csort
-- re-sort after roster or layout changes
-- reload to restore

-- 仅小队
-- 将单位按专精优先级排序 ↓↓↓
-- 斜杠命令（非战斗中）：/csort, /px
-- 队伍或布局变化后重新执行排序
-- 重载界面以恢复
-------------------------------------------------

local SPEC_PRIORITY = {
    -- role:class:dominant talent tree (1-3)
    -- Tank
    "TANK:DEATHKNIGHT:1", -- Blood
    "TANK:DEATHKNIGHT:2", -- Frost
    "TANK:DEATHKNIGHT:3", -- Unholy
    "TANK:DRUID:2",       -- Feral
    "TANK:PALADIN:2",     -- Protection
    "TANK:WARRIOR:3",     -- Protection

    -- Healer
    "HEALER:DRUID:3",     -- Restoration
    "HEALER:PALADIN:1",   -- Holy
    "HEALER:PRIEST:1",    -- Discipline
    "HEALER:PRIEST:2",    -- Holy
    "HEALER:SHAMAN:3",    -- Restoration

    -- Melee
    "MELEE:DEATHKNIGHT:2", -- Frost
    "MELEE:DEATHKNIGHT:3", -- Unholy
    "MELEE:DEATHKNIGHT:1", -- Blood
    "MELEE:DRUID:2",       -- Feral
    "MELEE:PALADIN:3",     -- Retribution
    "MELEE:ROGUE:1",       -- Assassination
    "MELEE:ROGUE:2",       -- Combat
    "MELEE:ROGUE:3",       -- Subtlety
    "MELEE:SHAMAN:2",      -- Enhancement
    "MELEE:WARRIOR:1",     -- Arms
    "MELEE:WARRIOR:2",     -- Fury

    -- Ranged
    "MELEE:HUNTER:1",      -- Beast Mastery
    "MELEE:HUNTER:2",      -- Marksmanship
    "MELEE:HUNTER:3",      -- Survival
    "CASTER:DRUID:1",      -- Balance
    "CASTER:MAGE:1",       -- Arcane
    "CASTER:MAGE:2",       -- Fire
    "CASTER:MAGE:3",       -- Frost
    "CASTER:PRIEST:3",     -- Shadow
    "CASTER:SHAMAN:1",     -- Elemental
    "CASTER:WARLOCK:1",    -- Affliction
    "CASTER:WARLOCK:2",    -- Demonology
    "CASTER:WARLOCK:3",    -- Destruction
}

-------------------------------------------------
local LGT = LibStub:GetLibrary("LibGroupTalents-1.0")

local function GetPriority(unit)
    local _, class = UnitClass(unit)
    local specName, tree1, tree2, tree3 = LGT:GetUnitTalentSpec(unit)
    local role = LGT:GetUnitRole(unit)
    if not (class and specName and role and tree1 and tree2 and tree3) then return 999 end

    local spec = 1
    if tree2 > tree1 and tree2 > tree3 then
        spec = 2
    elseif tree3 > tree1 and tree3 > tree2 then
        spec = 3
    end

    local specKey = strupper(role)..":"..class..":"..spec

    for i, s in ipairs(SPEC_PRIORITY) do
        if specKey == s then
            return i
        end
    end

    return 999 -- initials
end

local F = Cell.funcs

local nameList = {}
local nameToPriority = {}

SLASH_CELLSORT1 = "/csort"
SLASH_CELLSORT2 = "/px"
function SlashCmdList.CELLSORT()
    if InCombatLockdown() or F.IsInRaid() then return end

    wipe(nameList)
    wipe(nameToPriority)

    for unit in F.IterateGroupMembers() do
        local name = UnitName(unit)
        if not UnitExists(unit) or not UnitGUID(unit) or not name or name == UNKNOWNOBJECT then return end
        tinsert(nameList, name)

        nameToPriority[name] = GetPriority(unit)
    end

    sort(nameList, function(a, b)
        if nameToPriority[a] ~= nameToPriority[b] then
            return nameToPriority[a] < nameToPriority[b]
        else
            return a < b
        end
    end)

    local wasShown = CellPartyFrameHeader:IsShown()
    if wasShown then CellPartyFrameHeader:Hide() end
    CellPartyFrameHeader:SetAttribute("groupFilter", nil)
    CellPartyFrameHeader:SetAttribute("groupingOrder", "")
    CellPartyFrameHeader:SetAttribute("groupBy", nil)
    CellPartyFrameHeader:SetAttribute("nameList", F.TableToString(nameList, ","))
    CellPartyFrameHeader:SetAttribute("sortMethod", "INDEX")
    if wasShown then CellPartyFrameHeader:Show() end
    F.Print("re-sorted.")
end
