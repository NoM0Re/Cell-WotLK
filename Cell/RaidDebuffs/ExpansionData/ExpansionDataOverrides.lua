---------------------------------------------------------------------
-- File: ExpansionDataOverrides.lua
-- Author: enderneko (enderneko-dev@outlook.com)
-- Created : 2025-03-31 16:35 +08:00
-- Modified: 2025-12-26 12:19 +08:00
---------------------------------------------------------------------

local _, Cell = ...
local F = Cell.funcs

local expansions = {
    ["Wrath of the Lich King"] = 1,
    ["Burning Crusade"] = 2,
    ["Classic"] = 3,
}

-------------------------------------------------
-- overrides
-------------------------------------------------
Cell_ExpansionDataOverrides = {
    -- [instanceId] = {
    --     from = "expansion",
    --     to = "expansion",
    --     bosses = {
    --         "boss1", ...
    --     }
    -- }
}

-------------------------------------------------
-- do
-------------------------------------------------
for instanceId, data in pairs(Cell_ExpansionDataOverrides) do
    local from = Cell_ExpansionData.expansions[expansions[data.from]]
    local to = Cell_ExpansionData.expansions[expansions[data.to]]
    local bosses = data.bosses

    if Cell_ExpansionData["data"][from] then
        for i = 1, #Cell_ExpansionData["data"][from] do
            if Cell_ExpansionData["data"][from][i]["id"] == instanceId then
                local t = F.Copy(Cell_ExpansionData["data"][from][i])

                -- remove old
                tremove(Cell_ExpansionData["data"][from], i)

                -- replace bosses
                wipe(t.bosses)
                if bosses then
                    for j, name in ipairs(bosses) do
                        tinsert(t.bosses, {
                            id = j,
                            name = name,
                        })
                    end
                end

                -- insert
                tinsert(Cell_ExpansionData["data"][to], t)
                break
            end
        end
    end
end

local zulGurubNames = {
    zhCN = {
        instance = "祖尔格拉布",
        bosses = {
            "高阶祭司温诺希斯",
            "高阶祭司耶克里克",
            "高阶祭司玛尔里",
            "血领主曼多基尔",
            "疯狂之缘",
            "高阶祭司塞卡尔",
            "加兹兰卡",
            "高阶祭司娅尔罗",
            "妖术师金度",
            "哈卡",
        },
    },
    zhTW = {
        instance = "祖爾格拉布",
        bosses = {
            "高階祭司溫諾希斯",
            "高階祭司耶克里克",
            "高階祭司瑪爾里",
            "血領主曼多基爾",
            "瘋狂之緣",
            "高階祭司塞卡爾",
            "加茲蘭卡",
            "高階祭司婭爾羅",
            "妖術師金度",
            "哈卡",
        },
    },
    default = {
        instance = "Zul'Gurub",
        bosses = {
            "High Priest Venoxis",
            "High Priestess Jeklik",
            "High Priestess Mar'li",
            "Bloodlord Mandokir",
            "Edge of Madness",
            "High Priest Thekal",
            "Gahz'ranka",
            "High Priestess Arlokk",
            "Jin'do the Hexxer",
            "Hakkar",
        },
    },
}

local function AddClassicZulGurub()
    local classic = Cell_ExpansionData.expansions[expansions["Classic"]]
    local classicData = classic and Cell_ExpansionData["data"][classic]
    if not classicData then return end

    for _, instance in ipairs(classicData) do
        if instance["id"] == 309 then return end
    end

    local names = zulGurubNames[GetLocale()] or zulGurubNames.default
    local bosses = {}
    local bossIds = {784, 785, 786, 787, 788, 789, 790, 791, 792, 793}
    for i, bossId in ipairs(bossIds) do
        tinsert(bosses, {
            ["id"] = bossId,
            ["name"] = names.bosses[i],
        })
    end

    tinsert(classicData, {
        ["id"] = 309,
        ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-ZulGurub",
        ["name"] = names.instance,
        ["bosses"] = bosses,
    })
end

AddClassicZulGurub()
