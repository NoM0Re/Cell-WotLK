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

do
    local localizedInstanceNames = {
        enUS = {
            ["Coilfang: Serpentshrine Cavern"] = "Serpentshrine Cavern",
            ["The Battle for Mount Hyjal"] = "Hyjal Summit",
            ["The Sunwell"] = "Sunwell Plateau",
            ["Auchindoun: Auchenai Crypts"] = "Auchenai Crypts",
            ["Hellfire Citadel: Ramparts"] = "Hellfire Ramparts",
            ["Magister's Terrace"] = "Magisters' Terrace",
            ["Auchindoun: Mana-Tombs"] = "Mana-Tombs",
            ["The Escape From Durnholde"] = "Old Hillsbrad Foothills",
            ["Auchindoun: Sethekk Halls"] = "Sethekk Halls",
            ["Auchindoun: Shadow Labyrinth"] = "Shadow Labyrinth",
            ["Tempest Keep: The Arcatraz"] = "The Arcatraz",
            ["Opening of the Dark Portal"] = "The Black Morass",
            ["Hellfire Citadel: The Blood Furnace"] = "The Blood Furnace",
            ["Tempest Keep: The Botanica"] = "The Botanica",
            ["Tempest Keep: The Mechanar"] = "The Mechanar",
            ["Hellfire Citadel: The Shattered Halls"] = "The Shattered Halls",
            ["Coilfang: The Slave Pens"] = "The Slave Pens",
            ["Coilfang: The Steamvault"] = "The Steamvault",
            ["Coilfang: The Underbog"] = "The Underbog",
            ["Ahn'Qiraj Temple"] = "Ahn'Qiraj",
            ["Deadmines"] = "The Deadmines",
            ["Blackrock Spire"] = "Lower Blackrock Spire",
            ["The Stockade"] = "Stormwind Stockade",
        },
        enGB = {
            ["Coilfang: Serpentshrine Cavern"] = "Serpentshrine Cavern",
            ["The Battle for Mount Hyjal"] = "Hyjal Summit",
            ["The Sunwell"] = "Sunwell Plateau",
            ["Auchindoun: Auchenai Crypts"] = "Auchenai Crypts",
            ["Hellfire Citadel: Ramparts"] = "Hellfire Ramparts",
            ["Magister's Terrace"] = "Magisters' Terrace",
            ["Auchindoun: Mana-Tombs"] = "Mana-Tombs",
            ["The Escape From Durnholde"] = "Old Hillsbrad Foothills",
            ["Auchindoun: Sethekk Halls"] = "Sethekk Halls",
            ["Auchindoun: Shadow Labyrinth"] = "Shadow Labyrinth",
            ["Tempest Keep: The Arcatraz"] = "The Arcatraz",
            ["Opening of the Dark Portal"] = "The Black Morass",
            ["Hellfire Citadel: The Blood Furnace"] = "The Blood Furnace",
            ["Tempest Keep: The Botanica"] = "The Botanica",
            ["Tempest Keep: The Mechanar"] = "The Mechanar",
            ["Hellfire Citadel: The Shattered Halls"] = "The Shattered Halls",
            ["Coilfang: The Slave Pens"] = "The Slave Pens",
            ["Coilfang: The Steamvault"] = "The Steamvault",
            ["Coilfang: The Underbog"] = "The Underbog",
            ["Ahn'Qiraj Temple"] = "Ahn'Qiraj",
            ["Deadmines"] = "The Deadmines",
            ["Blackrock Spire"] = "Lower Blackrock Spire",
            ["The Stockade"] = "Stormwind Stockade",
        },
        deDE = {
            ["Echsenkessel: Höhle des Schlangenschreins"] = "Höhle des Schlangenschreins",
            ["Die Schlacht um den Berg Hyjal"] = "Hyjalgipfel",
            ["Der Sonnenbrunnen"] = "Sonnenbrunnenplateau",
            ["Auchindoun: Auchenaikrypta"] = "Auchenaikrypta",
            ["Höllenfeuerzitadelle: Bollwerk"] = "Höllenfeuerbollwerk",
            ["Auchindoun: Managruft"] = "Managruft",
            ["Die Flucht von Durnholde"] = "Vorgebirge des Alten Hügellands",
            ["Auchindoun: Sethekkhallen"] = "Sethekkhallen",
            ["Auchindoun: Schattenlabyrinth"] = "Schattenlabyrinth",
            ["Festung der Stürme: Die Arkatraz"] = "Die Arkatraz",
            ["Öffnung des Dunklen Portals"] = "Der Schwarze Morast",
            ["Höllenfeuerzitadelle: Blutkessel"] = "Der Blutkessel",
            ["Festung der Stürme: Die Botanika"] = "Die Botanika",
            ["Festung der Stürme: Die Mechanar"] = "Die Mechanar",
            ["Höllenfeuerzitadelle: Zerschmetterte Hallen"] = "Die Zerschmetterten Hallen",
            ["Echsenkessel: Sklavenunterkünfte"] = "Die Sklavenunterkünfte",
            ["Echsenkessel: Dampfkammer"] = "Die Dampfkammer",
            ["Echsenkessel: Tiefensumpf"] = "Der Tiefensumpf",
            ["Tempel von Ahn'Qiraj"] = "Ahn'Qiraj",
            ["Todesminen"] = "Die Todesminen",
            ["Scharlachrotes Kloster"] = "Das Scharlachrote Kloster",
            ["Feste von Drak'Tharon"] = "Feste Drak'Tharon",
            ["Violette Festung"] = "Die Violette Festung",
            ["Schwarzfelsspitze"] = "Untere Schwarzfelsspitze",
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
            ["Reserva Colmillo Torcido: Caverna Santuario Serpiente"] = "Serpentshrine Cavern",
            ["Batalla del Monte Hyjal"] = "Hyjal Summit",
            ["La Fuente del Sol"] = "Sunwell Plateau",
            ["Auchindoun: Criptas Auchenai"] = "Auchenai Crypts",
            ["Ciudadela del Fuego Infernal: Murallas"] = "Hellfire Ramparts",
            ["Auchindoun: Tumbas de Maná"] = "Mana-Tombs",
            ["La Fuga de Durnholde"] = "Old Hillsbrad Foothills",
            ["Auchindoun: Salas Sethekk"] = "Sethekk Halls",
            ["Auchindoun: Laberinto de las Sombras"] = "Shadow Labyrinth",
            ["El Castillo de la Tempestad: El Arcatraz"] = "The Arcatraz",
            ["Apertura de El Portal Oscuro"] = "The Black Morass",
            ["Ciudadela del Fuego Infernal: Horno de Sangre"] = "The Blood Furnace",
            ["El Castillo de la Tempestad: El Invernáculo"] = "The Botanica",
            ["El Castillo de la Tempestad: El Mechanar"] = "The Mechanar",
            ["Ciudadela del Fuego Infernal: Salas Arrasadas"] = "The Shattered Halls",
            ["Colmillo Torcido: Recinto de los Esclavos"] = "The Slave Pens",
            ["Colmillo Torcido: Cámara de Vapor"] = "The Steamvault",
            ["Colmillo Torcido: La Sotiénaga"] = "The Underbog",
            ["Guarida de Alanegra"] = "Blackwing Lair",
            ["Templo de Ahn'Qiraj"] = "Ahn'Qiraj",
            ["Minas de la Muerte"] = "The Deadmines",
            ["Cámara de Archavon"] = "Vault of Archavon",
            ["Bastión Violeta"] = "The Violet Hold",
            ["Cumbre de Roca Negra"] = "Lower Blackrock Spire",
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
            ["Cumbre de Roca Negra"] = "Lower Blackrock Spire",
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
            ["Le repaire de Gruul"] = "Repaire de Gruul",
            ["Repaire de Magtheridon"] = "Le repaire de Magtheridon",
            ["Glissecroc : caverne du sanctuaire du Serpent"] = "Caverne du sanctuaire du Serpent",
            ["La bataille du mont Hyjal"] = "Sommet d'Hyjal",
            ["Le Puits de soleil"] = "Plateau du Puits de soleil",
            ["Auchindoun : Cryptes Auchenaï"] = "Cryptes Auchenaï",
            ["Citadelle des Flammes infernales : les Remparts"] = "Remparts des Flammes infernales",
            ["Terrasse des magistères"] = "Terrasse des Magistères",
            ["Auchindoun : Tombes-mana"] = "Tombes-mana",
            ["L'évasion de Fort-de-Durn"] = "Contreforts de Hautebrande d'antan",
            ["Auchindoun : Salles des Sethekk"] = "Les salles des Sethekk",
            ["Auchindoun : Labyrinthe des ombres"] = "Labyrinthe des Ombres",
            ["Donjon de la Tempête : l'Arcatraz"] = "L'Arcatraz",
            ["Ouverture de la Porte des ténèbres"] = "Le Noir marécage",
            ["Citadelle des Flammes infernales : la Fournaise du sang"] = "La Fournaise du sang",
            ["Donjon de la Tempête : la Botanica"] = "La Botanica",
            ["Donjon de la Tempête : le Méchanar"] = "Le Méchanar",
            ["Citadelle des Flammes infernales : les Salles brisées"] = "Les salles Brisées",
            ["Glissecroc : les Enclos aux esclaves"] = "Les enclos aux esclaves",
            ["Glissecroc : le Caveau de la vapeur"] = "Le caveau de la Vapeur",
            ["Glissecroc : la Basse-tourbière"] = "La Basse-tourbière",
            ["Temple d'Ahn'Qiraj"] = "Ahn'Qiraj",
            ["Mortemines"] = "Les Mortemines",
            ["Ahn'kahet : l'Ancien royaume"] = "Ahn'kahet : l'Ancien royaume",
            ["Azjol -Nérub"] = "Azjol-Nérub",
            ["Pic Rochenoire"] = "Bas du pic Rochenoire",
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
            ["검은바위 첨탑"] = "검은바위 첨탑 하층",
            ["옛 힐스브래드 구릉지"] = "옛 언덕마루 구릉지",
            ["검은심연의 나락"] = "검은심연 나락",
            ["줄구룹"] = "Zul'Gurub",
        },
        ruRU = {
            ["Кривой Клык: Змеиное святилище"] = "Змеиное святилище",
            ["Битва за гору Хиджал"] = "Вершина Хиджала",
            ["Солнечный Колодец"] = "Плато Солнечного Колодца",
            ["Аукиндон: Аукенайские гробницы"] = "Аукенайские гробницы",
            ["Цитадель Адского Пламени: Бастионы"] = "Бастионы Адского Пламени",
            ["Аукиндон: Гробницы Маны"] = "Гробницы маны",
            ["Побег из Дарнхольда"] = "Старые предгорья Хилсбрада",
            ["Аукиндон: Сетеккские залы"] = "Сетеккские залы",
            ["Аукиндон: Темный лабиринт"] = "Темный лабиринт",
            ["Крепость Бурь: Аркатрац"] = "Аркатрац",
            ["Открытие Темного портала"] = "Черные топи",
            ["Цитадель Адского Пламени: Кузня Крови"] = "Кузня Крови",
            ["Крепость Бурь: Ботаника"] = "Ботаника",
            ["Крепость Бурь – Механар"] = "Механар",
            ["Цитадель Адского Пламени: Разрушенные залы"] = "Разрушенные залы",
            ["Кривой Клык: Узилище"] = "Узилище",
            ["Кривой Клык: Паровое подземелье"] = "Паровое подземелье",
            ["Кривой Клык: Нижетопь"] = "Нижетопь",
            ["Храм Ан'Киража"] = "Ан'Кираж",
            ["Око вечности"] = "Око Вечности",
            ["Пик Черной горы"] = "Нижняя часть пика Черной горы",
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
            ["盘牙湖泊：毒蛇神殿"] = "毒蛇神殿",
            ["海加尔山之战"] = "海加尔峰",
            ["太阳之井"] = "太阳之井高地",
            ["奥金顿：奥金尼地穴"] = "奥金尼地穴",
            ["地狱火堡垒：城墙"] = "地狱火城墙",
            ["奥金顿：法力墓穴"] = "法力陵墓",
            ["逃离敦霍尔德"] = "旧希尔斯布莱德丘陵",
            ["奥金顿：塞泰克大厅"] = "塞泰克大厅",
            ["奥金顿：暗影迷宫"] = "暗影迷宫",
            ["风暴要塞：禁魔监狱"] = "禁魔监狱",
            ["开启黑暗之门"] = "黑色沼泽",
            ["地狱火堡垒：鲜血熔炉"] = "鲜血熔炉",
            ["风暴要塞：生态船"] = "生态船",
            ["风暴要塞：能源舰"] = "能源舰",
            ["地狱火堡垒：破碎大厅"] = "破碎大厅",
            ["盘牙湖泊：奴隶围栏"] = "奴隶围栏",
            ["盘牙湖泊：蒸汽地窟"] = "蒸汽地窟",
            ["盘牙湖泊：幽暗沼泽"] = "幽暗沼泽",
            ["安其拉神殿"] = "安其拉",
            ["萨隆深渊"] = "萨隆矿坑",
            ["黑石塔"] = "黑石塔下层",
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

do
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
end

do
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
end

do
    local zulAmanNames = {
        default = {
            instance = "Zul'Aman",
            bosses = {
                "Akil'zon",
                "Nalorakk",
                "Jan'alai",
                "Halazzi",
                "Hex Lord Malacrass",
                "Zul'jin",
            },
        },
        deDE = {
            instance = "Zul'Aman",
            bosses = {
                "Akil'zon",
                "Nalorakk",
                "Jan'alai",
                "Halazzi",
                "Hexlord Malacrass",
                "Zul'jin",
            },
        },
        frFR = {
            instance = "Zul'Aman",
            bosses = {
                "Akil'zon",
                "Nalorakk",
                "Jan'alai",
                "Halazzi",
                "Seigneur des maléfices Malacrass",
                "Zul'jin",
            },
        },
        koKR = {
            instance = "줄아만",
            bosses = {
                "아킬존",
                "날로라크",
                "잔알라이",
                "할라지",
                "사술 군주 말라크라스",
                "Zul'jin",
            },
        },
        ruRU = {
            instance = "Зул'Аман",
            bosses = {
                "Акил'зон",
                "Налоракк",
                "Джан'алай",
                "Халаззи",
                "Повелитель проклятий Малакрасс",
                "Zul'jin",
            },
        },
        zhCN = {
            instance = "祖阿曼",
            bosses = {
                "埃基尔松",
                "纳洛拉克",
                "加亚莱",
                "哈尔拉兹",
                "妖术领主玛拉卡斯",
                "Zul'jin",
            },
        },
        zhTW = {
            instance = "祖阿曼",
            bosses = {
                "阿奇爾森",
                "納羅拉克",
                "賈納雷",
                "哈拉齊",
                "妖術領主瑪拉克雷斯",
                "Zul'jin",
            },
        },
    }

    local function AddTBCZulAman()
        local tbc = Cell_ExpansionData.expansions[expansions["Burning Crusade"]]
        local tbcData = tbc and Cell_ExpansionData.data[tbc]
        if not tbcData then return end

        for _, instance in ipairs(tbcData) do
            if instance.id == 77 then return end
        end

        local names = zulAmanNames[GetLocale()] or zulAmanNames.default
        local bosses = {}
        -- Keep upstream Cell IDs; the Wrath final encounter is Zul'jin.
        for i, bossId in ipairs({186, 187, 188, 189, 190, 191}) do
            tinsert(bosses, {
                id = bossId,
                name = names.bosses[i],
            })
        end

        tinsert(tbcData, {
            id = 77,
            name = names.instance,
            bosses = bosses,
        })
    end

    AddTBCZulAman()
end
