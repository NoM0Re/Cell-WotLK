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

-- 3.3.5a client names from LibBabble-Zone-3.0 that differ from the localized expansion data.
local localizedInstanceNames = {
    enUS = {
        ["The Stockade"] = "Stormwind Stockade",
    },
    enGB = {
        ["The Stockade"] = "Stormwind Stockade",
    },
    deDE = {
        ["Eiskronenzitadelle"] = "Die Eiskronenzitadelle",
        ["Die Hallen der Blitze"] = "Hallen der Blitze",
        ["Die Hallen des Steins"] = "Hallen des Steins",
        ["Die Schmiede der Seelen"] = "Die Seelenschmiede",
        ["Der schwarze Morast"] = "Der Schwarze Morast",
        ["Die zerschmetterten Hallen"] = "Die Zerschmetterten Hallen",
        ["Geschmolzener Kern"] = "Der Geschmolzene Kern",
        ["Die Höhlen des Wehklagens"] = "Höhlen des Wehklagens",
        ["Das Verlies"] = "Verlies von Sturmwind",
    },
    esES = {
        ["Cima Hyjal"] = "Hyjal Summit",
        ["El Templo Oscuro"] = "Black Temple",
        ["Meseta de la Fuente del Sol"] = "Sunwell Plateau",
        ["Bancal Del Magister"] = "Magisters' Terrace",
        ["El Alcatraz"] = "The Arcatraz",
        ["Cumbre inferior de Roca Negra"] = "Lower Blackrock Spire",
        ["Sima ígnea"] = "Ragefire Chasm",
        ["El Templo Sumergido"] = "Sunken Temple",
        ["Las Mazmorras"] = "Stormwind Stockade",
    },
    esMX = {
        ["Camáras de Reflexión"] = "Halls of Reflection",
        ["Pueba del Campeon"] = "Trial of the Champion",
        ["Cima Hyjal"] = "Hyjal Summit",
        ["El Templo Oscuro"] = "Black Temple",
        ["Meseta de la Fuente del Sol"] = "Sunwell Plateau",
        ["Bancal Del Magister"] = "Magisters' Terrace",
        ["El Alcatraz"] = "The Arcatraz",
        ["Cumbre inferior de Roca Negra"] = "Lower Blackrock Spire",
        ["Sima ígnea"] = "Ragefire Chasm",
        ["El Templo Sumergido"] = "Sunken Temple",
        ["Las Mazmorras"] = "Stormwind Stockade",
    },
    frFR = {
        ["Les salles des Reflets"] = "Salles des Reflets",
        ["La Forge des âmes"] = "La Forge des Âmes",
        ["Donjon de la Tempête"] = "Donjon de la tempête",
        ["Temple noir"] = "Le Temple noir",
        ["Labyrinthe des ombres"] = "Labyrinthe des Ombres",
        ["Le Noir Marécage"] = "Le Noir marécage",
        ["Les Salles brisées"] = "Les salles Brisées",
        ["Le Caveau de la vapeur"] = "Le caveau de la Vapeur",
        ["Hache-tripes"] = "Hache-Tripes",
        ["Pic de Rochenoire inférieur"] = "Bas du pic Rochenoire",
        ["Monastère écarlate"] = "Monastère Écarlate",
        ["Cavernes des lamentations"] = "Cavernes des Lamentations",
        ["La Prison"] = "Prison de Hurlevent",
    },
    koKR = {
        ["옛 힐스브래드 구릉지"] = "옛 언덕마루 구릉지",
        ["검은심연의 나락"] = "검은심연 나락",
        ["줄구룹"] = "Zul'Gurub",
    },
    ruRU = {
        ["Склеп Аркавона"] = "Хранилище Аркавона",
        ["Гробницы Маны"] = "Гробницы маны",
        ["Огненные Недра"] = "Огненные недра",
        ["Забытый Город"] = "Забытый город",
        ["Нижний ярус Черной горы"] = "Нижняя часть пика Черной горы",
        ["Огненная пропасть"] = "Огненная Пропасть",
        ["Зул'Гуруб"] = "Zul'Gurub",
        ["Тюрьма"] = "Тюрьма Штормграда",
    },
    zhCN = {
        ["安卡雷：古代王国"] = "安卡赫特：古代王国",
        ["下层黑石塔"] = "黑石塔下层",
        ["监狱"] = "暴风城监狱",
    },
    zhTW = {
        ["安卡罕特:古王國"] = "安卡罕特：古王國",
        ["海加爾山"] = "海加爾山巔",
        ["黑暗深淵"] = "黑澗深淵",
        ["黑石塔"] = "黑石塔下層",
        ["監獄"] = "暴風城監獄",
    },
}

local localizedNames = localizedInstanceNames[GetLocale()]
if localizedNames then
    for localizedName, instanceName in pairs(localizedNames) do
        Cell_ExpansionData.localizedInstanceNames[localizedName] = instanceName
    end
end

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

local function FindInstance(expansionName, instanceId)
    local expansion = Cell_ExpansionData.expansions[expansions[expansionName]]
    local expansionData = expansion and Cell_ExpansionData.data[expansion]
    if not expansionData then return end

    for _, instance in ipairs(expansionData) do
        if instance.id == instanceId then
            return instance
        end
    end
end

local function PrepareClassicNaxxramas()
    local classicNaxxramas = FindInstance("Classic", 745)
    if not classicNaxxramas then return end

    -- Classic Naxxramas reuses Karazhan's generated IDs. Keep imports and saved data separate.
    classicNaxxramas.id = 900745
    classicNaxxramas.name = classicNaxxramas.name.." (40)"
    for _, boss in ipairs(classicNaxxramas.bosses) do
        boss.id = 900000 + boss.id
    end
end

PrepareClassicNaxxramas()

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
