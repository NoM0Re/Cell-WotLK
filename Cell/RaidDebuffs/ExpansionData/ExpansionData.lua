---------------------------------------------------------------------
-- File: Cell\RaidDebuffs\ExpansionData\ExpansionData.lua
-- Author: enderneko (enderneko-dev@outlook.com)
-- Created : 2022-08-26 04:40:40 +08:00
-- Modified: 2025-12-26 12:08 +08:00
---------------------------------------------------------------------

local _, Cell = ...
local F = Cell.funcs

Cell_ExpansionData = {
    ["locale"] = "enUS",
    ["instanceLocale"] = "enUS",
    ["localizedInstanceNames"] = {},
    ["expansions"] = {},
    ["data"] = {},
}

-------------------------------------------------
-- functions
-------------------------------------------------
Cell.RegisterCallback("AddonLoaded", "UpdateExpansionData", function()
    local index = 3

    for i = 1, #Cell_ExpansionData["expansions"] - index do
        -- print("remove", Cell_ExpansionData.expansions[1])
        -- remove data
        Cell_ExpansionData["data"][Cell_ExpansionData.expansions[1]] = nil
        -- remove expansions
        tremove(Cell_ExpansionData["expansions"], 1)
    end
end)

function F.GetExpansionList()
    local locale = GetLocale()
    -- enGB uses the same expansion data as enUS.
    if locale == "enGB" then
        locale = "enUS"
    end
    if Cell_ExpansionData["locale"] ~= locale and Cell_ExpansionData["instanceLocale"] ~= locale then
        F.Print("Missing localized expansion data for "..GetLocale()..", Raid Debuffs may not work properly, please report to author.")
    end
    return Cell_ExpansionData["expansions"]
end

function F.GetExpansionData()
    return Cell_ExpansionData["data"]
end

function F.GetLocalizedInstanceNames()
    return Cell_ExpansionData["localizedInstanceNames"]
end

-------------------------------------------------
-- expansions
-------------------------------------------------
Cell_ExpansionData.expansions = {
    "Wrath of the Lich King",
    "Burning Crusade",
    "Classic",
}

-------------------------------------------------
-- instances & bosses
-------------------------------------------------
Cell_ExpansionData.data = {
    ["Wrath of the Lich King"] = {
        {
            ["id"] = 753,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-VaultofArchavon", -- artid 1396596
            ["name"] = "Vault of Archavon",
            ["bosses"] = {
                {
                    ["id"] = 1597,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Archavon the Stone Watcher", -- artid 1385715
                    ["name"] = "Archavon the Stone Watcher",
                }, -- [1]
                {
                    ["id"] = 1598,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Emalon the Storm Watcher", -- artid 1385727
                    ["name"] = "Emalon the Storm Watcher",
                }, -- [2]
                {
                    ["id"] = 1599,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Koralon the Flame Watcher", -- artid 1385748
                    ["name"] = "Koralon the Flame Watcher",
                }, -- [3]
                {
                    ["id"] = 1600,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Taravon the Ice Watcher", -- artid 1385767
                    ["name"] = "Toravon the Ice Watcher",
                }, -- [4]
            },
        }, -- [1]
        {
            ["id"] = 754,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Naxxramas", -- artid 1396587
            ["name"] = "Naxxramas",
            ["bosses"] = {
                {
                    ["id"] = 1601,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-AnubRekhan", -- artid 1378964
                    ["name"] = "Anub'Rekhan",
                }, -- [1]
                {
                    ["id"] = 1602,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grand Widow Faerlina", -- artid 1378980
                    ["name"] = "Grand Widow Faerlina",
                }, -- [2]
                {
                    ["id"] = 1603,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maexxna", -- artid 1378994
                    ["name"] = "Maexxna",
                }, -- [3]
                {
                    ["id"] = 1604,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Noth the Plaguebringer", -- artid 1379004
                    ["name"] = "Noth the Plaguebringer",
                }, -- [4]
                {
                    ["id"] = 1605,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Heigan the Unclean", -- artid 1378984
                    ["name"] = "Heigan the Unclean",
                }, -- [5]
                {
                    ["id"] = 1606,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Loatheb", -- artid 1378991
                    ["name"] = "Loatheb",
                }, -- [6]
                {
                    ["id"] = 1607,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Instructor Razuvious", -- artid 1378988
                    ["name"] = "Instructor Razuvious",
                }, -- [7]
                {
                    ["id"] = 1608,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gothik the Harvester", -- artid 1378979
                    ["name"] = "Gothik the Harvester",
                }, -- [8]
                {
                    ["id"] = 1609,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Four Horseman", -- artid 1385732
                    ["name"] = "The Four Horsemen",
                }, -- [9]
                {
                    ["id"] = 1610,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Patchwerk", -- artid 1379005
                    ["name"] = "Patchwerk",
                }, -- [10]
                {
                    ["id"] = 1611,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grobbulus", -- artid 1378981
                    ["name"] = "Grobbulus",
                }, -- [11]
                {
                    ["id"] = 1612,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gluth", -- artid 1378977
                    ["name"] = "Gluth",
                }, -- [12]
                {
                    ["id"] = 1613,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thaddius", -- artid 1379019
                    ["name"] = "Thaddius",
                }, -- [13]
                {
                    ["id"] = 1614,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sapphiron", -- artid 1379010
                    ["name"] = "Sapphiron",
                }, -- [14]
                {
                    ["id"] = 1615,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-KelThuzad", -- artid 1378989
                    ["name"] = "Kel'Thuzad",
                }, -- [15]
            },
        }, -- [2]
        {
            ["id"] = 755,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-ObsidianSanctum", -- artid 1396588
            ["name"] = "The Obsidian Sanctum",
            ["bosses"] = {
                {
                    ["id"] = 1616,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sartharion", -- artid 1385765
                    ["name"] = "Sartharion",
                }, -- [1]
            },
        }, -- [3]
        {
            ["id"] = 756,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-EyeofEternity", -- artid 1396581
            ["name"] = "The Eye of Eternity",
            ["bosses"] = {
                {
                    ["id"] = 1617,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Malygos", -- artid 1385753
                    ["name"] = "Malygos",
                }, -- [1]
            },
        }, -- [4]
        {
            ["id"] = 759,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Ulduar", -- artid 1396595
            ["name"] = "Ulduar",
            ["bosses"] = {
                {
                    ["id"] = 1637,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Flame Leviathan", -- artid 1385731
                    ["name"] = "Flame Leviathan",
                }, -- [1]
                {
                    ["id"] = 1638,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ignis the Furnace Master", -- artid 1385742
                    ["name"] = "Ignis the Furnace Master",
                }, -- [2]
                {
                    ["id"] = 1639,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Razorscale", -- artid 1385763
                    ["name"] = "Razorscale",
                }, -- [3]
                {
                    ["id"] = 1640,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-XT 002 Deconstructor", -- artid 1385773
                    ["name"] = "XT-002 Deconstructor",
                }, -- [4]
                {
                    ["id"] = 1641,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Assembly Of Iron", -- artid 1390439
                    ["name"] = "The Assembly of Iron",
                }, -- [5]
                {
                    ["id"] = 1642,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kologarn", -- artid 1385747
                    ["name"] = "Kologarn",
                }, -- [6]
                {
                    ["id"] = 1643,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Auriaya", -- artid 1385717
                    ["name"] = "Auriaya",
                }, -- [7]
                {
                    ["id"] = 1644,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hodir", -- artid 1385740
                    ["name"] = "Hodir",
                }, -- [8]
                {
                    ["id"] = 1645,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thorim", -- artid 1385770
                    ["name"] = "Thorim",
                }, -- [9]
                {
                    ["id"] = 1646,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Freya", -- artid 1385733
                    ["name"] = "Freya",
                }, -- [10]
                {
                    ["id"] = 1647,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mimiron", -- artid 1385754
                    ["name"] = "Mimiron",
                }, -- [11]
                {
                    ["id"] = 1648,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-General Vezax", -- artid 1385735
                    ["name"] = "General Vezax",
                }, -- [12]
                {
                    ["id"] = 1649,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Yogg Saron", -- artid 1385774
                    ["name"] = "Yogg-Saron",
                }, -- [13]
                {
                    ["id"] = 1650,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Algalon the Observer", -- artid 1385713
                    ["name"] = "Algalon the Observer",
                }, -- [14]
            },
        }, -- [5]
        {
            ["id"] = 757,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TrialoftheCrusader", -- artid 1396594
            ["name"] = "Trial of the Crusader",
            ["bosses"] = {
                {
                    ["id"] = 1618,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Northrend Beasts", -- artid 1390440
                    ["name"] = "The Northrend Beasts",
                }, -- [1]
                {
                    ["id"] = 1619,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Jaraxxus", -- artid 1385752
                    ["name"] = "Lord Jaraxxus",
                }, -- [2]
                {
                    ["id"] = 1620,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-PVP Event Vs Horde", -- artid 1390442
                    ["name"] = "Champions of the Alliance",
                }, -- [3]
                {
                    ["id"] = 1622,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Twin Valkyr", -- artid 1390443
                    ["name"] = "Twin Val'kyr",
                }, -- [4]
                {
                    ["id"] = 1623,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Anubarak", -- artid 607542
                    ["name"] = "Anub'arak",
                }, -- [5]
            },
        }, -- [6]
        {
            ["id"] = 760,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Onyxia", -- artid 1396589
            ["name"] = "Onyxia's Lair",
            ["bosses"] = {
                {
                    ["id"] = 1651,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Onyxia", -- artid 1379025
                    ["name"] = "Onyxia",
                }, -- [1]
            },
        }, -- [7]
        {
            ["id"] = 758,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-IcecrownCitadel", -- artid 1396583
            ["name"] = "Icecrown Citadel",
            ["bosses"] = {
                {
                    ["id"] = 1624,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Marrowgar", -- artid 1378992
                    ["name"] = "Lord Marrowgar",
                }, -- [1]
                {
                    ["id"] = 1625,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lady Deathwhisper", -- artid 1378990
                    ["name"] = "Lady Deathwhisper",
                }, -- [2]
                {
                    ["id"] = 1627,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gunship Alliance", -- artid 1385736
                    ["name"] = "Icecrown Gunship Battle",
                }, -- [3]
                {
                    ["id"] = 1628,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Deathbringer Saurfang", -- artid 1378970
                    ["name"] = "Deathbringer Saurfang",
                }, -- [4]
                {
                    ["id"] = 1629,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Festergut", -- artid 1378972
                    ["name"] = "Festergut",
                }, -- [5]
                {
                    ["id"] = 1630,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rotface", -- artid 1379009
                    ["name"] = "Rotface",
                }, -- [6]
                {
                    ["id"] = 1631,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Professor Putricide", -- artid 1379007
                    ["name"] = "Professor Putricide",
                }, -- [7]
                {
                    ["id"] = 1632,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Blood Prince Council", -- artid 1385721
                    ["name"] = "Blood Prince Council",
                }, -- [8]
                {
                    ["id"] = 1633,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Blood Queen Lanathel", -- artid 1378967
                    ["name"] = "Blood-Queen Lana'thel",
                }, -- [9]
                {
                    ["id"] = 1634,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Valithria Dreamwalker", -- artid 1379023
                    ["name"] = "Valithria Dreamwalker",
                }, -- [10]
                {
                    ["id"] = 1635,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sindragosa", -- artid 1379014
                    ["name"] = "Sindragosa",
                }, -- [11]
                {
                    ["id"] = 1636,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lich King", -- artid 607688
                    ["name"] = "The Lich King",
                }, -- [12]
            },
        }, -- [8]
        {
            ["id"] = 761,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-RubySanctum", -- artid 1396590
            ["name"] = "The Ruby Sanctum",
            ["bosses"] = {
                {
                    ["id"] = 1652,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Halion", -- artid 1385738
                    ["name"] = "Halion",
                }, -- [1]
            },
        }, -- [9]
        {
            ["id"] = 271,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-AhnkahetTheOldKingdom", -- artid 608192
            ["name"] = "Ahn'kahet: The Old Kingdom",
            ["bosses"] = {
                {
                    ["id"] = 580,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Elder Nadox", -- artid 607593
                    ["name"] = "Elder Nadox",
                }, -- [1]
                {
                    ["id"] = 581,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Prince Taldaram", -- artid 607744
                    ["name"] = "Prince Taldaram",
                }, -- [2]
                {
                    ["id"] = 582,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Jedoga Shadowseeker", -- artid 607667
                    ["name"] = "Jedoga Shadowseeker",
                }, -- [3]
                {
                    ["id"] = 584,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Herald Volazj", -- artid 607639
                    ["name"] = "Herald Volazj",
                }, -- [4]
            },
        }, -- [10]
        {
            ["id"] = 272,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-AzjolNerub", -- artid 608194
            ["name"] = "Azjol-Nerub",
            ["bosses"] = {
                {
                    ["id"] = 585,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Krikthir the Gatewatcher", -- artid 607678
                    ["name"] = "Krik'thir the Gatewatcher",
                }, -- [1]
                {
                    ["id"] = 586,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hadronox", -- artid 607633
                    ["name"] = "Hadronox",
                }, -- [2]
                {
                    ["id"] = 587,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Anubarak", -- artid 607542
                    ["name"] = "Anub'arak",
                }, -- [3]
            },
        }, -- [11]
        {
            ["id"] = 273,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-DrakTharonKeep", -- artid 608201
            ["name"] = "Drak'Tharon Keep",
            ["bosses"] = {
                {
                    ["id"] = 588,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Trollgore", -- artid 607798
                    ["name"] = "Trollgore",
                }, -- [1]
                {
                    ["id"] = 589,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Novos the Summoner", -- artid 607727
                    ["name"] = "Novos the Summoner",
                }, -- [2]
                {
                    ["id"] = 590,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-King Dred", -- artid 607672
                    ["name"] = "King Dred",
                }, -- [3]
                {
                    ["id"] = 591,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Prophet Tharonja", -- artid 607790
                    ["name"] = "The Prophet Tharon'ja",
                }, -- [4]
            },
        }, -- [12]
        {
            ["id"] = 274,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Gundrak", -- artid 608203
            ["name"] = "Gundrak",
            ["bosses"] = {
                {
                    ["id"] = 592,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sladran", -- artid 607776
                    ["name"] = "Slad'ran",
                }, -- [1]
                {
                    ["id"] = 593,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Drakkari Colossus", -- artid 607589
                    ["name"] = "Drakkari Colossus",
                }, -- [2]
                {
                    ["id"] = 594,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Moorabi", -- artid 607716
                    ["name"] = "Moorabi",
                }, -- [3]
                {
                    ["id"] = 596,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Galdarah", -- artid 607605
                    ["name"] = "Gal'darah",
                }, -- [4]
            },
        }, -- [13]
        {
            ["id"] = 275,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HallsofLightning", -- artid 608204
            ["name"] = "Halls of Lightning",
            ["bosses"] = {
                {
                    ["id"] = 597,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-General Bjarngrim", -- artid 607611
                    ["name"] = "General Bjarngrim",
                }, -- [1]
                {
                    ["id"] = 598,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Volkhan", -- artid 607809
                    ["name"] = "Volkhan",
                }, -- [2]
                {
                    ["id"] = 599,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ionar", -- artid 607663
                    ["name"] = "Ionar",
                }, -- [3]
                {
                    ["id"] = 600,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Loken", -- artid 607690
                    ["name"] = "Loken",
                }, -- [4]
            },
        }, -- [14]
        {
            ["id"] = 276,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HallsofReflection", -- artid 608205
            ["name"] = "Halls of Reflection",
            ["bosses"] = {
                {
                    ["id"] = 601,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Falric", -- artid 607601
                    ["name"] = "Falric",
                }, -- [1]
                {
                    ["id"] = 602,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Marwyn", -- artid 607710
                    ["name"] = "Marwyn",
                }, -- [2]
                {
                    ["id"] = 603,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lich King", -- artid 607688
                    ["name"] = "Escape from Arthas",
                }, -- [3]
            },
        }, -- [15]
        {
            ["id"] = 277,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HallsofStone", -- artid 608206
            ["name"] = "Halls of Stone",
            ["bosses"] = {
                {
                    ["id"] = 604,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Krystallus", -- artid 607679
                    ["name"] = "Krystallus",
                }, -- [1]
                {
                    ["id"] = 605,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maiden of Grief", -- artid 607706
                    ["name"] = "Maiden of Grief",
                }, -- [2]
                {
                    ["id"] = 606,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Tribunal of the Ages", -- artid 607797
                    ["name"] = "Tribunal of Ages",
                }, -- [3]
                {
                    ["id"] = 607,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sjonnir the Ironshaper", -- artid 607772
                    ["name"] = "Sjonnir the Ironshaper",
                }, -- [4]
            },
        }, -- [16]
        {
            ["id"] = 278,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-PitofSaron", -- artid 608210
            ["name"] = "Pit of Saron",
            ["bosses"] = {
                {
                    ["id"] = 608,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Forgemaster Garfrost", -- artid 607603
                    ["name"] = "Forgemaster Garfrost",
                }, -- [1]
                {
                    ["id"] = 609,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Krick", -- artid 607677
                    ["name"] = "Ick & Krick",
                }, -- [2]
                {
                    ["id"] = 610,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Scourgelord Tyrannus", -- artid 607765
                    ["name"] = "Scourgelord Tyrannus",
                }, -- [3]
            },
        }, -- [17]
        {
            ["id"] = 279,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheCullingOfStratholme", -- artid 608219
            ["name"] = "The Culling of Stratholme",
            ["bosses"] = {
                {
                    ["id"] = 611,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Meathook", -- artid 607711
                    ["name"] = "Meathook",
                }, -- [1]
                {
                    ["id"] = 612,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Salramm the Fleshcrafter", -- artid 607763
                    ["name"] = "Salramm the Fleshcrafter",
                }, -- [2]
                {
                    ["id"] = 613,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Chrono Lord Epoch", -- artid 607567
                    ["name"] = "Chrono-Lord Epoch",
                }, -- [3]
                {
                    ["id"] = 614,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-MalGanis", -- artid 607708
                    ["name"] = "Mal'Ganis",
                }, -- [4]
            },
        }, -- [18]
        {
            ["id"] = 280,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheForgeofSouls", -- artid 608220
            ["name"] = "The Forge of Souls",
            ["bosses"] = {
                {
                    ["id"] = 615,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Bronjahm", -- artid 607559
                    ["name"] = "Bronjahm",
                }, -- [1]
                {
                    ["id"] = 616,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Devourer of Souls", -- artid 607585
                    ["name"] = "Devourer of Souls",
                }, -- [2]
            },
        }, -- [19]
        {
            ["id"] = 281,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheNexus", -- artid 608221
            ["name"] = "The Nexus",
            ["bosses"] = {
                {
                    ["id"] = 618,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grand Magus Telestra", -- artid 607623
                    ["name"] = "Grand Magus Telestra",
                }, -- [1]
                {
                    ["id"] = 619,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Anomalus", -- artid 607540
                    ["name"] = "Anomalus",
                }, -- [2]
                {
                    ["id"] = 620,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ormorok the Tree Shaper", -- artid 607735
                    ["name"] = "Ormorok the Tree-Shaper",
                }, -- [3]
                {
                    ["id"] = 621,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Keristrasza", -- artid 607671
                    ["name"] = "Keristrasza",
                }, -- [4]
            },
        }, -- [20]
        {
            ["id"] = 282,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheOculus", -- artid 608222
            ["name"] = "The Oculus",
            ["bosses"] = {
                {
                    ["id"] = 622,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Drakos the Interrogator", -- artid 607590
                    ["name"] = "Drakos the Interrogator",
                }, -- [1]
                {
                    ["id"] = 623,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Varos Cloudstrider", -- artid 607802
                    ["name"] = "Varos Cloudstrider",
                }, -- [2]
                {
                    ["id"] = 624,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mage Lord Urom", -- artid 607702
                    ["name"] = "Mage-Lord Urom",
                }, -- [3]
                {
                    ["id"] = 625,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ley Guardian Eregos", -- artid 607687
                    ["name"] = "Ley-Guardian Eregos",
                }, -- [4]
            },
        }, -- [21]
        {
            ["id"] = 283,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-VioletHold", -- artid 608228
            ["name"] = "The Violet Hold",
            ["bosses"] = {
                {
                    ["id"] = 626,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Erekem", -- artid 607597
                    ["name"] = "Erekem",
                }, -- [1]
                {
                    ["id"] = 627,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Moragg", -- artid 607717
                    ["name"] = "Moragg",
                }, -- [2]
                {
                    ["id"] = 628,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ichoron", -- artid 607654
                    ["name"] = "Ichoron",
                }, -- [3]
                {
                    ["id"] = 629,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Xevozz", -- artid 607821
                    ["name"] = "Xevozz",
                }, -- [4]
                {
                    ["id"] = 630,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lavanthor", -- artid 607685
                    ["name"] = "Lavanthor",
                }, -- [5]
                {
                    ["id"] = 631,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Zuramat the Obliterator", -- artid 607825
                    ["name"] = "Zuramat the Obliterator",
                }, -- [6]
                {
                    ["id"] = 632,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Cyanigosa", -- artid 607573
                    ["name"] = "Cyanigosa",
                }, -- [7]
            },
        }, -- [22]
        {
            ["id"] = 284,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TrialOfTheChampion", -- artid 608224
            ["name"] = "Trial of the Champion",
            ["bosses"] = {
                {
                    ["id"] = 834,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grand Champions-Alliance", -- artid 607621
                    ["name"] = "Grand Champions",
                }, -- [1]
                {
                    ["id"] = 635,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Eadric the Pure", -- artid 607591
                    ["name"] = "Eadric the Pure",
                }, -- [2]
                {
                    ["id"] = 636,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Argent Confessor Paletress", -- artid 607547
                    ["name"] = "Argent Confessor Paletress",
                }, -- [3]
                {
                    ["id"] = 637,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Black Knight", -- artid 607787
                    ["name"] = "The Black Knight",
                }, -- [4]
            },
        }, -- [23]
        {
            ["id"] = 285,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-UtgardeKeep", -- artid 608226
            ["name"] = "Utgarde Keep",
            ["bosses"] = {
                {
                    ["id"] = 638,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Prince Keleseth", -- artid 607743
                    ["name"] = "Prince Keleseth",
                }, -- [1]
                {
                    ["id"] = 639,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Skarvald the Constructor", -- artid 607774
                    ["name"] = "Skarvald & Dalronn",
                }, -- [2]
                {
                    ["id"] = 640,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ingvar the Plunderer", -- artid 607659
                    ["name"] = "Ingvar the Plunderer",
                }, -- [3]
            },
        }, -- [24]
        {
            ["id"] = 286,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-UtgardePinnacle", -- artid 608227
            ["name"] = "Utgarde Pinnacle",
            ["bosses"] = {
                {
                    ["id"] = 641,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Svala Sorrowgrave", -- artid 607778
                    ["name"] = "Svala Sorrowgrave",
                }, -- [1]
                {
                    ["id"] = 642,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gortok Palehoof", -- artid 607620
                    ["name"] = "Gortok Palehoof",
                }, -- [2]
                {
                    ["id"] = 643,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Skadi the Ruthless", -- artid 607773
                    ["name"] = "Skadi the Ruthless",
                }, -- [3]
                {
                    ["id"] = 644,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-King Ymiron", -- artid 607674
                    ["name"] = "King Ymiron",
                }, -- [4]
            },
        }, -- [25]
    },
    ["Burning Crusade"] = {
        {
            ["id"] = 745,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Karazhan", -- artid 1396584
            ["name"] = "Karazhan",
            ["bosses"] = {
                {
                    ["id"] = 1552,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Servant Quarters", -- artid 1385766
                    ["name"] = "Servant's Quarters",
                }, -- [1]
                {
                    ["id"] = 1553,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Attumen the Huntsman", -- artid 1378965
                    ["name"] = "Attumen the Huntsman",
                }, -- [2]
                {
                    ["id"] = 1554,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Moroes", -- artid 1378999
                    ["name"] = "Moroes",
                }, -- [3]
                {
                    ["id"] = 1555,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maiden of Virtue", -- artid 1378997
                    ["name"] = "Maiden of Virtue",
                }, -- [4]
                {
                    ["id"] = 1556,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Opera", -- artid 1385758
                    ["name"] = "Opera Hall",
                }, -- [5]
                {
                    ["id"] = 1557,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Curator", -- artid 1379020
                    ["name"] = "The Curator",
                }, -- [6]
                {
                    ["id"] = 1559,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shade of Aran", -- artid 1379012
                    ["name"] = "Shade of Aran",
                }, -- [7]
                {
                    ["id"] = 1560,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Terestian Illhoof", -- artid 1379017
                    ["name"] = "Terestian Illhoof",
                }, -- [8]
                {
                    ["id"] = 1561,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Netherspite", -- artid 1379002
                    ["name"] = "Netherspite",
                }, -- [9]
                {
                    ["id"] = 1764,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Chess Alliance", -- artid 1385724
                    ["name"] = "Chess Event",
                }, -- [10]
                {
                    ["id"] = 1563,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Prince Malchezaar", -- artid 1379006
                    ["name"] = "Prince Malchezaar",
                }, -- [11]
            },
        }, -- [1]
        {
            ["id"] = 746,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-GruulsLair", -- artid 1396582
            ["name"] = "Gruul's Lair",
            ["bosses"] = {
                {
                    ["id"] = 1564,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High King Maulgar", -- artid 1378985
                    ["name"] = "High King Maulgar",
                }, -- [1]
                {
                    ["id"] = 1565,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gruul the Dragonkiller", -- artid 1378982
                    ["name"] = "Gruul the Dragonkiller",
                }, -- [2]
            },
        }, -- [2]
        {
            ["id"] = 747,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-MagtheridonsLair", -- artid 1396585
            ["name"] = "Magtheridon's Lair",
            ["bosses"] = {
                {
                    ["id"] = 1566,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Magtheridon", -- artid 1378996
                    ["name"] = "Magtheridon",
                }, -- [1]
            },
        }, -- [3]
        {
            ["id"] = 748,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CoilfangReservoir", -- artid 608199
            ["name"] = "Serpentshrine Cavern",
            ["bosses"] = {
                {
                    ["id"] = 1567,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hydross the Unstable", -- artid 1385741
                    ["name"] = "Hydross the Unstable",
                }, -- [1]
                {
                    ["id"] = 1568,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Lurker Below", -- artid 1385768
                    ["name"] = "The Lurker Below",
                }, -- [2]
                {
                    ["id"] = 1569,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Leotheras the Blind", -- artid 1385751
                    ["name"] = "Leotheras the Blind",
                }, -- [3]
                {
                    ["id"] = 1570,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Fathom Lord Karathress", -- artid 1385729
                    ["name"] = "Fathom-Lord Karathress",
                }, -- [4]
                {
                    ["id"] = 1571,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Morogrim Tidewalker", -- artid 1385756
                    ["name"] = "Morogrim Tidewalker",
                }, -- [5]
                {
                    ["id"] = 1572,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lady Vashj", -- artid 1385750
                    ["name"] = "Lady Vashj",
                }, -- [6]
            },
        }, -- [4]
        {
            ["id"] = 749,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TempestKeep", -- artid 608218
            ["name"] = "Tempest Keep",
            ["bosses"] = {
                {
                    ["id"] = 1573,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Alar", -- artid 1385712
                    ["name"] = "Al'ar",
                }, -- [1]
                {
                    ["id"] = 1574,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Void Reaver", -- artid 1385772
                    ["name"] = "Void Reaver",
                }, -- [2]
                {
                    ["id"] = 1575,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Astromancer Solarian", -- artid 1385739
                    ["name"] = "High Astromancer Solarian",
                }, -- [3]
                {
                    ["id"] = 1576,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-KaelThas Sunstrider", -- artid 607669
                    ["name"] = "Kael'thas Sunstrider",
                }, -- [4]
            },
        }, -- [5]
        {
            ["id"] = 750,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CavernsOfTime", -- artid 608198
            ["name"] = "Hyjal Summit",
            ["bosses"] = {
                {
                    ["id"] = 1577,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rage Winterchill", -- artid 1385762
                    ["name"] = "Rage Winterchill",
                }, -- [1]
                {
                    ["id"] = 1578,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Anetheron", -- artid 1385714
                    ["name"] = "Anetheron",
                }, -- [2]
                {
                    ["id"] = 1579,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kazrogal", -- artid 1385745
                    ["name"] = "Kaz'rogal",
                }, -- [3]
                {
                    ["id"] = 1580,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Azgalor", -- artid 1385719
                    ["name"] = "Azgalor",
                }, -- [4]
                {
                    ["id"] = 1581,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Archimonde", -- artid 1385716
                    ["name"] = "Archimonde",
                }, -- [5]
            },
        }, -- [6]
        {
            ["id"] = 751,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-BlackTemple", -- artid 1396579
            ["name"] = "Black Temple",
            ["bosses"] = {
                {
                    ["id"] = 1582,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Warlord Najentus", -- artid 1378986
                    ["name"] = "High Warlord Naj'entus",
                }, -- [1]
                {
                    ["id"] = 1583,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Supremus", -- artid 1379016
                    ["name"] = "Supremus",
                }, -- [2]
                {
                    ["id"] = 1584,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shade of Akama", -- artid 1379011
                    ["name"] = "Shade of Akama",
                }, -- [3]
                {
                    ["id"] = 1585,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Teron Gorefiend", -- artid 1379018
                    ["name"] = "Teron Gorefiend",
                }, -- [4]
                {
                    ["id"] = 1586,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gurtogg Bloodboil", -- artid 1378983
                    ["name"] = "Gurtogg Bloodboil",
                }, -- [5]
                {
                    ["id"] = 1587,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Reliquary of Souls", -- artid 1385764
                    ["name"] = "Reliquary of Souls",
                }, -- [6]
                {
                    ["id"] = 1588,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mother Shahraz", -- artid 1379000
                    ["name"] = "Mother Shahraz",
                }, -- [7]
                {
                    ["id"] = 1589,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Illidari Council", -- artid 1385743
                    ["name"] = "The Illidari Council",
                }, -- [8]
                {
                    ["id"] = 1590,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Illidan Stormrage", -- artid 1378987
                    ["name"] = "Illidan Stormrage",
                }, -- [9]
            },
        }, -- [7]
        {
            ["id"] = 752,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-SunwellPlateau", -- artid 1396592
            ["name"] = "Sunwell Plateau",
            ["bosses"] = {
                {
                    ["id"] = 1591,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kalecgos", -- artid 1385744
                    ["name"] = "Kalecgos",
                }, -- [1]
                {
                    ["id"] = 1592,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Brutallus", -- artid 1385722
                    ["name"] = "Brutallus",
                }, -- [2]
                {
                    ["id"] = 1593,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Felmyst", -- artid 1385730
                    ["name"] = "Felmyst",
                }, -- [3]
                {
                    ["id"] = 1594,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Eredar Twins", -- artid 1390438
                    ["name"] = "The Eredar Twins",
                }, -- [4]
                {
                    ["id"] = 1595,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Muru", -- artid 1385757
                    ["name"] = "M'uru",
                }, -- [5]
                {
                    ["id"] = 1596,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kiljaeden", -- artid 1385746
                    ["name"] = "Kil'jaeden",
                }, -- [6]
            },
        }, -- [8]
        {
            ["id"] = 247,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Auchindoun", -- artid 608193
            ["name"] = "Auchenai Crypts",
            ["bosses"] = {
                {
                    ["id"] = 523,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shirrak the Dead Watcher", -- artid 607771
                    ["name"] = "Shirrak the Dead Watcher",
                }, -- [1]
                {
                    ["id"] = 524,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Exarch Maladaar", -- artid 607600
                    ["name"] = "Exarch Maladaar",
                }, -- [2]
            },
        }, -- [9]
        {
            ["id"] = 248,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HellfireCitadel", -- artid 608207
            ["name"] = "Hellfire Ramparts",
            ["bosses"] = {
                {
                    ["id"] = 527,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Watchkeeper Gargolmar", -- artid 607817
                    ["name"] = "Watchkeeper Gargolmar",
                }, -- [1]
                {
                    ["id"] = 528,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Omor the Unscarred", -- artid 607734
                    ["name"] = "Omor the Unscarred",
                }, -- [2]
                {
                    ["id"] = 529,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Vazruden", -- artid 607803
                    ["name"] = "Vazruden the Herald",
                }, -- [3]
            },
        }, -- [10]
        {
            ["id"] = 249,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-MagistersTerrace", -- artid 608208
            ["name"] = "Magisters' Terrace",
            ["bosses"] = {
                {
                    ["id"] = 530,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Selin Fireheart", -- artid 607767
                    ["name"] = "Selin Fireheart",
                }, -- [1]
                {
                    ["id"] = 531,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Vexallus", -- artid 607806
                    ["name"] = "Vexallus",
                }, -- [2]
                {
                    ["id"] = 532,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Priestess Delrissa", -- artid 607742
                    ["name"] = "Priestess Delrissa",
                }, -- [3]
                {
                    ["id"] = 533,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-KaelThas Sunstrider", -- artid 607669
                    ["name"] = "Kael'thas Sunstrider",
                }, -- [4]
            },
        }, -- [11]
        {
            ["id"] = 250,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Auchindoun", -- artid 608193
            ["name"] = "Mana-Tombs",
            ["bosses"] = {
                {
                    ["id"] = 534,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Pandemonius", -- artid 607738
                    ["name"] = "Pandemonius",
                }, -- [1]
                {
                    ["id"] = 535,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Tavarok", -- artid 607782
                    ["name"] = "Tavarok",
                }, -- [2]
                {
                    ["id"] = 537,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Nexus Prince Shaffar", -- artid 607726
                    ["name"] = "Nexus-Prince Shaffar",
                }, -- [3]
            },
        }, -- [12]
        {
            ["id"] = 251,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CavernsOfTime", -- artid 608198
            ["name"] = "Old Hillsbrad Foothills",
            ["bosses"] = {
                {
                    ["id"] = 538,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lieutenant Drake", -- artid 607689
                    ["name"] = "Lieutenant Drake",
                }, -- [1]
                {
                    ["id"] = 539,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Captain Skarloc", -- artid 607561
                    ["name"] = "Captain Skarloc",
                }, -- [2]
                {
                    ["id"] = 540,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Epoch Hunter", -- artid 607596
                    ["name"] = "Epoch Hunter",
                }, -- [3]
            },
        }, -- [13]
        {
            ["id"] = 252,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Auchindoun", -- artid 608193
            ["name"] = "Sethekk Halls",
            ["bosses"] = {
                {
                    ["id"] = 541,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Darkweaver Syth", -- artid 607583
                    ["name"] = "Darkweaver Syth",
                }, -- [1]
                {
                    ["id"] = 543,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Talon King Ikiss", -- artid 607780
                    ["name"] = "Talon King Ikiss",
                }, -- [2]
            },
        }, -- [14]
        {
            ["id"] = 253,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Auchindoun", -- artid 608193
            ["name"] = "Shadow Labyrinth",
            ["bosses"] = {
                {
                    ["id"] = 544,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ambassador Hellmaw", -- artid 607536
                    ["name"] = "Ambassador Hellmaw",
                }, -- [1]
                {
                    ["id"] = 545,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Blackheart the Inciter", -- artid 607555
                    ["name"] = "Blackheart the Inciter",
                }, -- [2]
                {
                    ["id"] = 546,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grandmaster Vorpil", -- artid 607625
                    ["name"] = "Grandmaster Vorpil",
                }, -- [3]
                {
                    ["id"] = 547,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Murmur", -- artid 607720
                    ["name"] = "Murmur",
                }, -- [4]
            },
        }, -- [15]
        {
            ["id"] = 254,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TempestKeep", -- artid 608218
            ["name"] = "The Arcatraz",
            ["bosses"] = {
                {
                    ["id"] = 548,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Zereketh the Unbound", -- artid 607823
                    ["name"] = "Zereketh the Unbound",
                }, -- [1]
                {
                    ["id"] = 549,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Dalliah the Doomsayer", -- artid 607574
                    ["name"] = "Dalliah the Doomsayer",
                }, -- [2]
                {
                    ["id"] = 550,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Wrath Scryer Soccothrates", -- artid 607820
                    ["name"] = "Wrath-Scryer Soccothrates",
                }, -- [3]
                {
                    ["id"] = 551,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Harbinger Skyriss", -- artid 607635
                    ["name"] = "Harbinger Skyriss",
                }, -- [4]
            },
        }, -- [16]
        {
            ["id"] = 255,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CavernsOfTime", -- artid 608198
            ["name"] = "The Black Morass",
            ["bosses"] = {
                {
                    ["id"] = 552,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Chrono Lord Deja", -- artid 607566
                    ["name"] = "Chrono Lord Deja",
                }, -- [1]
                {
                    ["id"] = 553,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Temporus", -- artid 607784
                    ["name"] = "Temporus",
                }, -- [2]
                {
                    ["id"] = 554,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Aeonus", -- artid 607529
                    ["name"] = "Aeonus",
                }, -- [3]
            },
        }, -- [17]
        {
            ["id"] = 256,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HellfireCitadel", -- artid 608207
            ["name"] = "The Blood Furnace",
            ["bosses"] = {
                {
                    ["id"] = 555,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Maker", -- artid 607789
                    ["name"] = "The Maker",
                }, -- [1]
                {
                    ["id"] = 556,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Broggok", -- artid 607558
                    ["name"] = "Broggok",
                }, -- [2]
                {
                    ["id"] = 557,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kelidan the Breaker", -- artid 607670
                    ["name"] = "Keli'dan the Breaker",
                }, -- [3]
            },
        }, -- [18]
        {
            ["id"] = 257,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TempestKeep", -- artid 608218
            ["name"] = "The Botanica",
            ["bosses"] = {
                {
                    ["id"] = 558,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Commander Sarannis", -- artid 607570
                    ["name"] = "Commander Sarannis",
                }, -- [1]
                {
                    ["id"] = 559,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Botanist Freywinn", -- artid 607641
                    ["name"] = "High Botanist Freywinn",
                }, -- [2]
                {
                    ["id"] = 560,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thorngrin the Tender", -- artid 607794
                    ["name"] = "Thorngrin the Tender",
                }, -- [3]
                {
                    ["id"] = 561,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Laj", -- artid 607683
                    ["name"] = "Laj",
                }, -- [4]
                {
                    ["id"] = 562,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warp Splinter", -- artid 607816
                    ["name"] = "Warp Splinter",
                }, -- [5]
            },
        }, -- [19]
        {
            ["id"] = 258,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TempestKeep", -- artid 608218
            ["name"] = "The Mechanar",
            ["bosses"] = {
                {
                    ["id"] = 563,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mechano Lord Capacitus", -- artid 607712
                    ["name"] = "Mechano-Lord Capacitus",
                }, -- [1]
                {
                    ["id"] = 564,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Nethermancer Sepethrea", -- artid 607725
                    ["name"] = "Nethermancer Sepethrea",
                }, -- [2]
                {
                    ["id"] = 565,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Pathaleon the Calculator", -- artid 607739
                    ["name"] = "Pathaleon the Calculator",
                }, -- [3]
            },
        }, -- [20]
        {
            ["id"] = 259,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HellfireCitadel", -- artid 608207
            ["name"] = "The Shattered Halls",
            ["bosses"] = {
                {
                    ["id"] = 566,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grand Warlock Nethekurse", -- artid 607624
                    ["name"] = "Grand Warlock Nethekurse",
                }, -- [1]
                {
                    ["id"] = 568,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warbringer Omrogg", -- artid 607811
                    ["name"] = "Warbringer O'mrogg",
                }, -- [2]
                {
                    ["id"] = 569,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warchief Kargath Bladefist", -- artid 607812
                    ["name"] = "Warchief Kargath Bladefist",
                }, -- [3]
            },
        }, -- [21]
        {
            ["id"] = 260,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CoilfangReservoir", -- artid 608199
            ["name"] = "The Slave Pens",
            ["bosses"] = {
                {
                    ["id"] = 570,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mennu the Betrayer", -- artid 607715
                    ["name"] = "Mennu the Betrayer",
                }, -- [1]
                {
                    ["id"] = 571,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rokmar the Crackler", -- artid 607759
                    ["name"] = "Rokmar the Crackler",
                }, -- [2]
                {
                    ["id"] = 572,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Quagmirran", -- artid 607750
                    ["name"] = "Quagmirran",
                }, -- [3]
            },
        }, -- [22]
        {
            ["id"] = 261,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CoilfangReservoir", -- artid 608199
            ["name"] = "The Steamvault",
            ["bosses"] = {
                {
                    ["id"] = 573,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hydromancer Thespia", -- artid 607651
                    ["name"] = "Hydromancer Thespia",
                }, -- [1]
                {
                    ["id"] = 574,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mekgineer Steamrigger", -- artid 607713
                    ["name"] = "Mekgineer Steamrigger",
                }, -- [2]
                {
                    ["id"] = 575,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warlord Kalithresh", -- artid 607815
                    ["name"] = "Warlord Kalithresh",
                }, -- [3]
            },
        }, -- [23]
        {
            ["id"] = 262,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CoilfangReservoir", -- artid 608199
            ["name"] = "The Underbog",
            ["bosses"] = {
                {
                    ["id"] = 576,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hungarfen", -- artid 607649
                    ["name"] = "Hungarfen",
                }, -- [1]
                {
                    ["id"] = 577,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ghazan", -- artid 607614
                    ["name"] = "Ghaz'an",
                }, -- [2]
                {
                    ["id"] = 578,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Swamplord Muselek", -- artid 607779
                    ["name"] = "Swamplord Musel'ek",
                }, -- [3]
                {
                    ["id"] = 579,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Black Stalker", -- artid 607788
                    ["name"] = "The Black Stalker",
                }, -- [4]
            },
        }, -- [24]
    },
    ["Classic"] = {
        {
            ["id"] = 741,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-MoltenCore", -- artid 1396586
            ["name"] = "Molten Core",
            ["bosses"] = {
                {
                    ["id"] = 1519,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lucifron", -- artid 1378993
                    ["name"] = "Lucifron",
                }, -- [1]
                {
                    ["id"] = 1520,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Magmadar", -- artid 1378995
                    ["name"] = "Magmadar",
                }, -- [2]
                {
                    ["id"] = 1521,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gehennas", -- artid 1378976
                    ["name"] = "Gehennas",
                }, -- [3]
                {
                    ["id"] = 1522,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Garr", -- artid 1378975
                    ["name"] = "Garr",
                }, -- [4]
                {
                    ["id"] = 1523,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shazzrah", -- artid 1379013
                    ["name"] = "Shazzrah",
                }, -- [5]
                {
                    ["id"] = 1524,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Baron Geddon", -- artid 1378966
                    ["name"] = "Baron Geddon",
                }, -- [6]
                {
                    ["id"] = 1525,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sulfuron Harbinger", -- artid 1379015
                    ["name"] = "Sulfuron Harbinger",
                }, -- [7]
                {
                    ["id"] = 1526,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Golemagg the Incinerator", -- artid 1378978
                    ["name"] = "Golemagg the Incinerator",
                }, -- [8]
                {
                    ["id"] = 1527,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Majordomo Executus", -- artid 1378998
                    ["name"] = "Majordomo Executus",
                }, -- [9]
                {
                    ["id"] = 1528,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ragnaros", -- artid 522261
                    ["name"] = "Ragnaros",
                }, -- [10]
            },
        }, -- [1]
        {
            ["id"] = 742,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-BlackwingLair", -- artid 1396580
            ["name"] = "Blackwing Lair",
            ["bosses"] = {
                {
                    ["id"] = 1529,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Razorgore the Untamed", -- artid 1379008
                    ["name"] = "Razorgore the Untamed",
                }, -- [1]
                {
                    ["id"] = 1530,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Vaelastrasz the Corrupt", -- artid 1379022
                    ["name"] = "Vaelastrasz the Corrupt",
                }, -- [2]
                {
                    ["id"] = 1531,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Broodlord Lashlayer", -- artid 1378968
                    ["name"] = "Broodlord Lashlayer",
                }, -- [3]
                {
                    ["id"] = 1532,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Firemaw", -- artid 1378973
                    ["name"] = "Firemaw",
                }, -- [4]
                {
                    ["id"] = 1533,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ebonroc", -- artid 1378971
                    ["name"] = "Ebonroc",
                }, -- [5]
                {
                    ["id"] = 1534,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Flamegor", -- artid 1378974
                    ["name"] = "Flamegor",
                }, -- [6]
                {
                    ["id"] = 1535,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Chromaggus", -- artid 1378969
                    ["name"] = "Chromaggus",
                }, -- [7]
                {
                    ["id"] = 1536,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Nefarian", -- artid 1379001
                    ["name"] = "Nefarian",
                }, -- [8]
            },
        }, -- [2]
        {
            ["id"] = 743,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-RuinsofAhnQiraj", -- artid 1396591
            ["name"] = "Ruins of Ahn'Qiraj",
            ["bosses"] = {
                {
                    ["id"] = 1537,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kurinnaxx", -- artid 1385749
                    ["name"] = "Kurinnaxx",
                }, -- [1]
                {
                    ["id"] = 1538,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-General Rajaxx", -- artid 1385734
                    ["name"] = "General Rajaxx",
                }, -- [2]
                {
                    ["id"] = 1539,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Moam", -- artid 1385755
                    ["name"] = "Moam",
                }, -- [3]
                {
                    ["id"] = 1540,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Buru the Gorger", -- artid 1385723
                    ["name"] = "Buru the Gorger",
                }, -- [4]
                {
                    ["id"] = 1541,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ayamiss the Hunter", -- artid 1385718
                    ["name"] = "Ayamiss the Hunter",
                }, -- [5]
                {
                    ["id"] = 1542,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ossirian the Unscarred", -- artid 1385759
                    ["name"] = "Ossirian the Unscarred",
                }, -- [6]
            },
        }, -- [3]
        {
            ["id"] = 744,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TempleofAhnQiraj", -- artid 1396593
            ["name"] = "Ahn'Qiraj",
            ["bosses"] = {
                {
                    ["id"] = 1543,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Prophet Skeram", -- artid 1385769
                    ["name"] = "The Prophet Skeram",
                }, -- [1]
                {
                    ["id"] = 1547,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Silithid Royalty", -- artid 1390436
                    ["name"] = "Silithid Royalty",
                }, -- [2]
                {
                    ["id"] = 1544,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Battleguard Sartura", -- artid 1385720
                    ["name"] = "Battleguard Sartura",
                }, -- [3]
                {
                    ["id"] = 1545,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Fankriss the Unyielding", -- artid 1385728
                    ["name"] = "Fankriss the Unyielding",
                }, -- [4]
                {
                    ["id"] = 1548,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Viscidus", -- artid 1385771
                    ["name"] = "Viscidus",
                }, -- [5]
                {
                    ["id"] = 1546,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Princess Huhuran", -- artid 1385761
                    ["name"] = "Princess Huhuran",
                }, -- [6]
                {
                    ["id"] = 1549,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Twin Emperors", -- artid 1390437
                    ["name"] = "The Twin Emperors",
                }, -- [7]
                {
                    ["id"] = 1550,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ouro", -- artid 1385760
                    ["name"] = "Ouro",
                }, -- [8]
                {
                    ["id"] = 1551,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-CThun", -- artid 1385726
                    ["name"] = "C'Thun",
                }, -- [9]
            },
        }, -- [4]
        {
            ["id"] = 745,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Naxxramas", -- artid 1396587
            ["name"] = "Naxxramas",
            ["bosses"] = {
                {
                    ["id"] = 1552,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-AnubRekhan", -- artid 1378964
                    ["name"] = "Anub'Rekhan",
                }, -- [1]
                {
                    ["id"] = 1553,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grand Widow Faerlina", -- artid 1378980
                    ["name"] = "Grand Widow Faerlina",
                }, -- [2]
                {
                    ["id"] = 1554,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maexxna", -- artid 1378994
                    ["name"] = "Maexxna",
                }, -- [3]
                {
                    ["id"] = 1555,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Noth the Plaguebringer", -- artid 1379004
                    ["name"] = "Noth the Plaguebringer",
                }, -- [4]
                {
                    ["id"] = 1556,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Heigan the Unclean", -- artid 1378984
                    ["name"] = "Heigan the Unclean",
                }, -- [5]
                {
                    ["id"] = 1557,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Loatheb", -- artid 1378991
                    ["name"] = "Loatheb",
                }, -- [6]
                {
                    ["id"] = 1558,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Instructor Razuvious", -- artid 1378988
                    ["name"] = "Instructor Razuvious",
                }, -- [7]
                {
                    ["id"] = 1559,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gothik the Harvester", -- artid 1378979
                    ["name"] = "Gothik the Harvester",
                }, -- [8]
                {
                    ["id"] = 1560,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Four Horseman", -- artid 1385732
                    ["name"] = "The Four Horsemen",
                }, -- [9]
                {
                    ["id"] = 1561,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Patchwerk", -- artid 1379005
                    ["name"] = "Patchwerk",
                }, -- [10]
                {
                    ["id"] = 1562,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grobbulus", -- artid 1378981
                    ["name"] = "Grobbulus",
                }, -- [11]
                {
                    ["id"] = 1563,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gluth", -- artid 1378977
                    ["name"] = "Gluth",
                }, -- [12]
                {
                    ["id"] = 1564,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thaddius", -- artid 1379019
                    ["name"] = "Thaddius",
                }, -- [13]
                {
                    ["id"] = 1565,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sapphiron", -- artid 1379010
                    ["name"] = "Sapphiron",
                }, -- [14]
                {
                    ["id"] = 1566,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-KelThuzad", -- artid 1378989
                    ["name"] = "Kel'Thuzad",
                }, -- [15]
            },
        }, -- [5]
        {
            ["id"] = 227,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-BlackfathomDeeps", -- artid 608195
            ["name"] = "Blackfathom Deeps",
            ["bosses"] = {
                {
                    ["id"] = 368,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ghamoo-Ra", -- artid 1064179
                    ["name"] = "Ghamoo-Ra",
                }, -- [1]
                {
                    ["id"] = 436,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Domina", -- artid 1064180
                    ["name"] = "Domina",
                }, -- [2]
                {
                    ["id"] = 426,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Commander Ulthok", -- artid 522214
                    ["name"] = "Subjugator Kor'ul",
                }, -- [3]
                {
                    ["id"] = 1145,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thruk", -- artid 1064181
                    ["name"] = "Thruk",
                }, -- [4]
                {
                    ["id"] = 447,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Guardian of the Deep", -- artid 1064182
                    ["name"] = "Guardian of the Deep",
                }, -- [5]
                {
                    ["id"] = 1144,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Executioner Gore", -- artid 1064183
                    ["name"] = "Executioner Gore",
                }, -- [6]
                {
                    ["id"] = 437,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Twilight Lord Bathiel", -- artid 1064184
                    ["name"] = "Twilight Lord Bathiel",
                }, -- [7]
                {
                    ["id"] = 444,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Akumai", -- artid 607532
                    ["name"] = "Aku'mai",
                }, -- [8]
            },
        }, -- [6]
        {
            ["id"] = 228,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-BlackrockDepths", -- artid 608196
            ["name"] = "Blackrock Depths",
            ["bosses"] = {
                {
                    ["id"] = 369,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Interrogator Gerstahn", -- artid 607644
                    ["name"] = "High Interrogator Gerstahn",
                }, -- [1]
                {
                    ["id"] = 370,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Roccor", -- artid 607697
                    ["name"] = "Lord Roccor",
                }, -- [2]
                {
                    ["id"] = 371,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Houndmaster Grebmar", -- artid 607647
                    ["name"] = "Houndmaster Grebmar",
                }, -- [3]
                {
                    ["id"] = 372,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Justice Grimstone", -- artid 608314
                    ["name"] = "Ring of Law",
                }, -- [4]
                {
                    ["id"] = 373,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Pyromancer Loregrain", -- artid 607749
                    ["name"] = "Pyromancer Loregrain",
                }, -- [5]
                {
                    ["id"] = 374,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Incendius", -- artid 607694
                    ["name"] = "Lord Incendius",
                }, -- [6]
                {
                    ["id"] = 375,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warder Stilgiss", -- artid 607814
                    ["name"] = "Warder Stilgiss",
                }, -- [7]
                {
                    ["id"] = 376,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Fineous Darkvire", -- artid 607602
                    ["name"] = "Fineous Darkvire",
                }, -- [8]
                {
                    ["id"] = 377,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-BaelGar", -- artid 607549
                    ["name"] = "Bael'Gar",
                }, -- [9]
                {
                    ["id"] = 378,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-General Angerforge", -- artid 607610
                    ["name"] = "General Angerforge",
                }, -- [10]
                {
                    ["id"] = 379,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Golem Lord Argelmach", -- artid 607618
                    ["name"] = "Golem Lord Argelmach",
                }, -- [11]
                {
                    ["id"] = 380,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hurley Blackbreath", -- artid 607650
                    ["name"] = "Hurley Blackbreath",
                }, -- [12]
                {
                    ["id"] = 381,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Phalanx", -- artid 607740
                    ["name"] = "Phalanx",
                }, -- [13]
                {
                    ["id"] = 383,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Plugger Spazzring", -- artid 607741
                    ["name"] = "Plugger Spazzring",
                }, -- [14]
                {
                    ["id"] = 384,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ambassador Flamelash", -- artid 607535
                    ["name"] = "Ambassador Flamelash",
                }, -- [15]
                {
                    ["id"] = 385,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-DoomRel", -- artid 607587
                    ["name"] = "The Seven",
                }, -- [16]
                {
                    ["id"] = 386,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Magmus", -- artid 607705
                    ["name"] = "Magmus",
                }, -- [17]
                {
                    ["id"] = 387,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Emperor Thaurissan", -- artid 607595
                    ["name"] = "Emperor Dagran Thaurissan",
                }, -- [18]
            },
        }, -- [7]
        {
            ["id"] = 63,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Deadmines", -- artid 522352
            ["name"] = "The Deadmines",
            ["bosses"] = {
                {
                    ["id"] = 89,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Glubtok", -- artid 522228
                    ["name"] = "Glubtok",
                }, -- [1]
                {
                    ["id"] = 90,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Helix Gearbreaker", -- artid 522234
                    ["name"] = "Helix Gearbreaker",
                }, -- [2]
                {
                    ["id"] = 91,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Foe Reaper 5000", -- artid 522225
                    ["name"] = "Foe Reaper 5000",
                }, -- [3]
                {
                    ["id"] = 92,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Admiral Ripsnarl", -- artid 522189
                    ["name"] = "Admiral Ripsnarl",
                }, -- [4]
                {
                    ["id"] = 93,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Captain Cookie", -- artid 522210
                    ["name"] = "\"Captain\" Cookie",
                }, -- [5]
                {
                    ["id"] = 95,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Vanessa VanCleef", -- artid 522278
                    ["name"] = "Vanessa VanCleef",
                }, -- [6]
            },
        }, -- [8]
        {
            ["id"] = 230,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-DireMaul", -- artid 608200
            ["name"] = "Dire Maul",
            ["bosses"] = {
                {
                    ["id"] = 402,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Zevrim Thornhoof", -- artid 607824
                    ["name"] = "Zevrim Thornhoof",
                }, -- [1]
                {
                    ["id"] = 403,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hydrospawn", -- artid 607653
                    ["name"] = "Hydrospawn",
                }, -- [2]
                {
                    ["id"] = 404,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lethtendris", -- artid 607686
                    ["name"] = "Lethtendris",
                }, -- [3]
                {
                    ["id"] = 405,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Alzzin the Wildshaper", -- artid 607533
                    ["name"] = "Alzzin the Wildshaper",
                }, -- [4]
                {
                    ["id"] = 406,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Tendris Warpwood", -- artid 607785
                    ["name"] = "Tendris Warpwood",
                }, -- [5]
                {
                    ["id"] = 407,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Illyanna Ravenoak", -- artid 607656
                    ["name"] = "Illyanna Ravenoak",
                }, -- [6]
                {
                    ["id"] = 408,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Magister Kalendris", -- artid 607703
                    ["name"] = "Magister Kalendris",
                }, -- [7]
                {
                    ["id"] = 409,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Immolthar", -- artid 607657
                    ["name"] = "Immol'thar",
                }, -- [8]
                {
                    ["id"] = 410,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Prince Tortheldrin", -- artid 607745
                    ["name"] = "Prince Tortheldrin",
                }, -- [9]
                {
                    ["id"] = 411,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Guard Moldar", -- artid 607630
                    ["name"] = "Guard Mol'dar",
                }, -- [10]
                {
                    ["id"] = 412,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Stomper Kreeg", -- artid 607777
                    ["name"] = "Stomper Kreeg",
                }, -- [11]
                {
                    ["id"] = 413,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Guard Fengus", -- artid 607629
                    ["name"] = "Guard Fengus",
                }, -- [12]
                {
                    ["id"] = 414,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Guard Slipkik", -- artid 607631
                    ["name"] = "Guard Slip'kik",
                }, -- [13]
                {
                    ["id"] = 415,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Captain Kromcrush", -- artid 607560
                    ["name"] = "Captain Kromcrush",
                }, -- [14]
                {
                    ["id"] = 416,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-ChoRush the Observer", -- artid 607565
                    ["name"] = "Cho'Rush the Observer",
                }, -- [15]
                {
                    ["id"] = 417,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-King Gordok", -- artid 607673
                    ["name"] = "King Gordok",
                }, -- [16]
            },
        }, -- [9]
        {
            ["id"] = 231,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Gnomeregan", -- artid 608202
            ["name"] = "Gnomeregan",
            ["bosses"] = {
                {
                    ["id"] = 419,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grubbis", -- artid 607628
                    ["name"] = "Grubbis",
                }, -- [1]
                {
                    ["id"] = 420,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Viscous Fallout", -- artid 607808
                    ["name"] = "Viscous Fallout",
                }, -- [2]
                {
                    ["id"] = 421,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Electrocutioner 6000", -- artid 607594
                    ["name"] = "Electrocutioner 6000",
                }, -- [3]
                {
                    ["id"] = 418,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Crowd Pummeler 9-60", -- artid 607572
                    ["name"] = "Crowd Pummeler 9-60",
                }, -- [4]
                {
                    ["id"] = 422,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mekgineer Thermaplugg", -- artid 607714
                    ["name"] = "Mekgineer Thermaplugg",
                }, -- [5]
            },
        }, -- [10]
        {
            ["id"] = 229,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-BlackrockSpire", -- artid 608197
            ["name"] = "Lower Blackrock Spire",
            ["bosses"] = {
                {
                    ["id"] = 388,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Highlord Omokk", -- artid 607645
                    ["name"] = "Highlord Omokk",
                }, -- [1]
                {
                    ["id"] = 389,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shadow Hunter Voshgajin", -- artid 607769
                    ["name"] = "Shadow Hunter Vosh'gajin",
                }, -- [2]
                {
                    ["id"] = 390,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-War Master Voone", -- artid 607810
                    ["name"] = "War Master Voone",
                }, -- [3]
                {
                    ["id"] = 391,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mother Smolderweb", -- artid 607719
                    ["name"] = "Mother Smolderweb",
                }, -- [4]
                {
                    ["id"] = 392,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Urok Doomhowl", -- artid 607801
                    ["name"] = "Urok Doomhowl",
                }, -- [5]
                {
                    ["id"] = 393,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Quartermaster Zigris", -- artid 607751
                    ["name"] = "Quartermaster Zigris",
                }, -- [6]
                {
                    ["id"] = 394,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Halycon", -- artid 607634
                    ["name"] = "Halycon",
                }, -- [7]
                {
                    ["id"] = 395,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gizrul the Slavener", -- artid 607615
                    ["name"] = "Gizrul the Slavener",
                }, -- [8]
                {
                    ["id"] = 396,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Overlord Wyrmthalak", -- artid 607737
                    ["name"] = "Overlord Wyrmthalak",
                }, -- [9]
            },
        }, -- [11]
        {
            ["id"] = 232,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Maraudon", -- artid 608209
            ["name"] = "Maraudon",
            ["bosses"] = {
                {
                    ["id"] = 423,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Noxxion", -- artid 607728
                    ["name"] = "Noxxion",
                }, -- [1]
                {
                    ["id"] = 424,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Razorlash", -- artid 607756
                    ["name"] = "Razorlash",
                }, -- [2]
                {
                    ["id"] = 425,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Tinkerer Gizlock", -- artid 607796
                    ["name"] = "Tinkerer Gizlock",
                }, -- [3]
                {
                    ["id"] = 427,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Vyletongue", -- artid 607699
                    ["name"] = "Lord Vyletongue",
                }, -- [4]
                {
                    ["id"] = 428,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Celebras the Cursed", -- artid 607562
                    ["name"] = "Celebras the Cursed",
                }, -- [5]
                {
                    ["id"] = 429,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Landslide", -- artid 607684
                    ["name"] = "Landslide",
                }, -- [6]
                {
                    ["id"] = 430,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rotgrip", -- artid 607761
                    ["name"] = "Rotgrip",
                }, -- [7]
                {
                    ["id"] = 431,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Princess Theradras", -- artid 607747
                    ["name"] = "Princess Theradras",
                }, -- [8]
            },
        }, -- [12]
        {
            ["id"] = 226,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-RagefireChasm", -- artid 608211
            ["name"] = "Ragefire Chasm",
            ["bosses"] = {
                {
                    ["id"] = 694,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Adarogg", -- artid 608309
                    ["name"] = "Adarogg",
                }, -- [1]
                {
                    ["id"] = 695,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Dark Shaman Koranthal", -- artid 608310
                    ["name"] = "Dark Shaman Koranthal",
                }, -- [2]
                {
                    ["id"] = 696,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Magmaw", -- artid 522251
                    ["name"] = "Slagmaw",
                }, -- [3]
                {
                    ["id"] = 697,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lava Guard Gordoth", -- artid 608315
                    ["name"] = "Lava Guard Gordoth",
                }, -- [4]
            },
        }, -- [13]
        {
            ["id"] = 233,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-RazorfenDowns", -- artid 608212
            ["name"] = "Razorfen Downs",
            ["bosses"] = {
                {
                    ["id"] = 1142,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hadronox", -- artid 607633
                    ["name"] = "Aarux",
                }, -- [1]
                {
                    ["id"] = 433,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mordresh Fire Eye", -- artid 607718
                    ["name"] = "Mordresh Fire Eye",
                }, -- [2]
                {
                    ["id"] = 1143,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mushlump", -- artid 1064178
                    ["name"] = "Mushlump",
                }, -- [3]
                {
                    ["id"] = 1146,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Death Speaker Jargba", -- artid 607584
                    ["name"] = "Death Speaker Blackthorn",
                }, -- [4]
                {
                    ["id"] = 1141,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Amnennar the Coldbringer", -- artid 607537
                    ["name"] = "Amnennar the Coldbringer",
                }, -- [5]
            },
        }, -- [14]
        {
            ["id"] = 234,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-RazorfenKraul", -- artid 608213
            ["name"] = "Razorfen Kraul",
            ["bosses"] = {
                {
                    ["id"] = 896,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Aggem Thorncurse", -- artid 607531
                    ["name"] = "Hunter Bonetusk",
                }, -- [1]
                {
                    ["id"] = 895,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Roogug", -- artid 607760
                    ["name"] = "Roogug",
                }, -- [2]
                {
                    ["id"] = 899,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Overlord Ramtusk", -- artid 607736
                    ["name"] = "Warlord Ramtusk",
                }, -- [3]
                {
                    ["id"] = 900,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Groyat", -- artid 1064175
                    ["name"] = "Groyat, the Blind Hunter",
                }, -- [4]
                {
                    ["id"] = 901,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Charlga Razorflank", -- artid 607563
                    ["name"] = "Charlga Razorflank",
                }, -- [5]
            },
        }, -- [15]
        {
            ["id"] = 311,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-ScarletHalls", -- artid 643262
            ["name"] = "Scarlet Halls",
            ["bosses"] = {
                {
                    ["id"] = 660,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Houndmaster Braun", -- artid 630833
                    ["name"] = "Houndmaster Braun",
                }, -- [1]
                {
                    ["id"] = 654,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Armsmaster Harlan", -- artid 630816
                    ["name"] = "Armsmaster Harlan",
                }, -- [2]
                {
                    ["id"] = 656,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Flameweaver Koegler", -- artid 630825
                    ["name"] = "Flameweaver Koegler",
                }, -- [3]
            },
        }, -- [16]
        {
            ["id"] = 316,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-ScarletMonastery", -- artid 608214
            ["name"] = "Scarlet Monastery",
            ["bosses"] = {
                {
                    ["id"] = 688,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thalnos the Soulrender", -- artid 630853
                    ["name"] = "Thalnos the Soulrender",
                }, -- [1]
                {
                    ["id"] = 671,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Brother Korloff", -- artid 630818
                    ["name"] = "Brother Korloff",
                }, -- [2]
                {
                    ["id"] = 674,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Inquisitor Whitemane", -- artid 607643
                    ["name"] = "High Inquisitor Whitemane",
                }, -- [3]
            },
        }, -- [17]
        {
            ["id"] = 246,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Scholomance", -- artid 608215
            ["name"] = "Scholomance",
            ["bosses"] = {
                {
                    ["id"] = 659,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Instructor Chillheart", -- artid 630835
                    ["name"] = "Instructor Chillheart",
                }, -- [1]
                {
                    ["id"] = 663,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Jandice Barov", -- artid 607666
                    ["name"] = "Jandice Barov",
                }, -- [2]
                {
                    ["id"] = 665,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rattlegore", -- artid 607755
                    ["name"] = "Rattlegore",
                }, -- [3]
                {
                    ["id"] = 666,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lillian Voss", -- artid 630838
                    ["name"] = "Lilian Voss",
                }, -- [4]
                {
                    ["id"] = 684,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Darkmaster Gandling", -- artid 607582
                    ["name"] = "Darkmaster Gandling",
                }, -- [5]
            },
        }, -- [18]
        {
            ["id"] = 64,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-ShadowFangKeep", -- artid 522358
            ["name"] = "Shadowfang Keep",
            ["bosses"] = {
                {
                    ["id"] = 96,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Baron Ashbury", -- artid 522205
                    ["name"] = "Baron Ashbury",
                }, -- [1]
                {
                    ["id"] = 97,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Baron Silverlaine", -- artid 522206
                    ["name"] = "Baron Silverlaine",
                }, -- [2]
                {
                    ["id"] = 98,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Commander Springvale", -- artid 522213
                    ["name"] = "Commander Springvale",
                }, -- [3]
                {
                    ["id"] = 99,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Walden", -- artid 522249
                    ["name"] = "Lord Walden",
                }, -- [4]
                {
                    ["id"] = 100,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Godfrey", -- artid 522247
                    ["name"] = "Lord Godfrey",
                }, -- [5]
            },
        }, -- [19]
        {
            ["id"] = 236,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Stratholme", -- artid 608216
            ["name"] = "Stratholme",
            ["bosses"] = {
                {
                    ["id"] = 443,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hearthsinger Forresten", -- artid 607637
                    ["name"] = "Hearthsinger Forresten",
                }, -- [1]
                {
                    ["id"] = 445,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Timmy the Cruel", -- artid 607795
                    ["name"] = "Timmy the Cruel",
                }, -- [2]
                {
                    ["id"] = 749,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Commander Malor", -- artid 607569
                    ["name"] = "Commander Malor",
                }, -- [3]
                {
                    ["id"] = 446,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Willey Hopebreaker", -- artid 607818
                    ["name"] = "Willey Hopebreaker",
                }, -- [4]
                {
                    ["id"] = 448,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Instructor Galford", -- artid 607660
                    ["name"] = "Instructor Galford",
                }, -- [5]
                {
                    ["id"] = 449,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Balnazzar", -- artid 607551
                    ["name"] = "Balnazzar",
                }, -- [6]
                {
                    ["id"] = 450,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Unforgiven", -- artid 607792
                    ["name"] = "The Unforgiven",
                }, -- [7]
                {
                    ["id"] = 451,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Baroness Anastari", -- artid 607553
                    ["name"] = "Baroness Anastari",
                }, -- [8]
                {
                    ["id"] = 452,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Nerubenkan", -- artid 607724
                    ["name"] = "Nerub'enkan",
                }, -- [9]
                {
                    ["id"] = 453,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maleki the Pallid", -- artid 607707
                    ["name"] = "Maleki the Pallid",
                }, -- [10]
                {
                    ["id"] = 454,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Ravenian", -- artid 607791
                    ["name"] = "Magistrate Barthilas",
                }, -- [11]
                {
                    ["id"] = 455,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ramstein the Gorger", -- artid 607752
                    ["name"] = "Ramstein the Gorger",
                }, -- [12]
                {
                    ["id"] = 456,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Aurius Rivendare", -- artid 607692
                    ["name"] = "Lord Aurius Rivendare",
                }, -- [13]
            },
        }, -- [20]
        {
            ["id"] = 238,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheStockade", -- artid 608223
            ["name"] = "Stormwind Stockade",
            ["bosses"] = {
                {
                    ["id"] = 464,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hogger-New", -- artid 4776138
                    ["name"] = "Hogger",
                }, -- [1]
                {
                    ["id"] = 465,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Overheat", -- artid 607695
                    ["name"] = "Lord Overheat",
                }, -- [2]
                {
                    ["id"] = 466,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Randolph Moloch", -- artid 607753
                    ["name"] = "Randolph Moloch",
                }, -- [3]
            },
        }, -- [21]
        {
            ["id"] = 237,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-SunkenTemple", -- artid 608217
            ["name"] = "Sunken Temple",
            ["bosses"] = {
                {
                    ["id"] = 457,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Avatar of Hakkar", -- artid 607548
                    ["name"] = "Avatar of Hakkar",
                }, -- [1]
                {
                    ["id"] = 458,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Jammalan the Prophet", -- artid 607665
                    ["name"] = "Jammal'an the Prophet",
                }, -- [2]
                {
                    ["id"] = 459,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Dreamscythe", -- artid 608311
                    ["name"] = "Wardens of the Dream",
                }, -- [3]
                {
                    ["id"] = 463,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shade of Eranikus", -- artid 607768
                    ["name"] = "Shade of Eranikus",
                }, -- [4]
            },
        }, -- [22]
        {
            ["id"] = 239,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Uldaman", -- artid 608225
            ["name"] = "Uldaman",
            ["bosses"] = {
                {
                    ["id"] = 467,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Revelosh", -- artid 607757
                    ["name"] = "Revelosh",
                }, -- [1]
                {
                    ["id"] = 468,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Baelog", -- artid 607550
                    ["name"] = "The Lost Dwarves",
                }, -- [2]
                {
                    ["id"] = 469,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ironaya", -- artid 607664
                    ["name"] = "Ironaya",
                }, -- [3]
                {
                    ["id"] = 748,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Obsidian Sentinel", -- artid 607729
                    ["name"] = "Obsidian Sentinel",
                }, -- [4]
                {
                    ["id"] = 470,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ancient Stone Keeper", -- artid 607538
                    ["name"] = "Ancient Stone Keeper",
                }, -- [5]
                {
                    ["id"] = 471,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Galgann Firehammer", -- artid 607606
                    ["name"] = "Galgann Firehammer",
                }, -- [6]
                {
                    ["id"] = 472,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grimlok", -- artid 607626
                    ["name"] = "Grimlok",
                }, -- [7]
                {
                    ["id"] = 473,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Archaedas", -- artid 607546
                    ["name"] = "Archaedas",
                }, -- [8]
            },
        }, -- [23]
        {
            ["id"] = 240,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-WailingCaverns", -- artid 608229
            ["name"] = "Wailing Caverns",
            ["bosses"] = {
                {
                    ["id"] = 474,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lady Anacondra", -- artid 607680
                    ["name"] = "Lady Anacondra",
                }, -- [1]
                {
                    ["id"] = 476,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Pythas", -- artid 607696
                    ["name"] = "Lord Pythas",
                }, -- [2]
                {
                    ["id"] = 475,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Cobrahn", -- artid 607693
                    ["name"] = "Lord Cobrahn",
                }, -- [3]
                {
                    ["id"] = 477,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kresh", -- artid 607676
                    ["name"] = "Kresh",
                }, -- [4]
                {
                    ["id"] = 478,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Skum", -- artid 607775
                    ["name"] = "Skum",
                }, -- [5]
                {
                    ["id"] = 479,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Serpentis", -- artid 607698
                    ["name"] = "Lord Serpentis",
                }, -- [6]
                {
                    ["id"] = 480,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Verdan the Everliving", -- artid 607805
                    ["name"] = "Verdan the Everliving",
                }, -- [7]
                {
                    ["id"] = 481,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mutanus the Devourer", -- artid 607721
                    ["name"] = "Mutanus the Devourer",
                }, -- [8]
            },
        }, -- [24]
        {
            ["id"] = 241,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-ZulFarrak", -- artid 608230
            ["name"] = "Zul'Farrak",
            ["bosses"] = {
                {
                    ["id"] = 483,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ghazan", -- artid 607614
                    ["name"] = "Gahz'rilla",
                }, -- [1]
                {
                    ["id"] = 484,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Antusul", -- artid 607541
                    ["name"] = "Antu'sul",
                }, -- [2]
                {
                    ["id"] = 485,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Theka the Martyr", -- artid 607793
                    ["name"] = "Theka the Martyr",
                }, -- [3]
                {
                    ["id"] = 486,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Witch Doctor Zumrah", -- artid 607819
                    ["name"] = "Witch Doctor Zum'rah",
                }, -- [4]
                {
                    ["id"] = 487,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Nekrum Gutchewer", -- artid 607723
                    ["name"] = "Nekrum & Sezz'ziz",
                }, -- [5]
                {
                    ["id"] = 489,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Chief Ukorz Sandscalp", -- artid 607564
                    ["name"] = "Chief Ukorz Sandscalp",
                }, -- [6]
            },
        }, -- [25]
    },
}
