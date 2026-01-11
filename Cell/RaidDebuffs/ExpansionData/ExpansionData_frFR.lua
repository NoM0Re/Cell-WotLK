---------------------------------------------------------------------
-- File: Cell\RaidDebuffs\ExpansionData\ExpansionData_frFR.lua
-- Author: enderneko (enderneko-dev@outlook.com)
-- Created : 2023-09-03 19:52:19 +08:00
-- Modified: 2024-06-01 19:56 +08:00
---------------------------------------------------------------------

if not LOCALE_frFR then return end

Cell_ExpansionData.locale = "frFR"

Cell_ExpansionData.expansions = {
    "Wrath of the Lich King",
    "Burning Crusade",
    "Donjons classiques",
}

Cell_ExpansionData.data = {
    ["Wrath of the Lich King"] = {
        {
            ["id"] = 753,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-VaultofArchavon", -- artid 1396596
            ["name"] = "Caveau d'Archavon",
            ["bosses"] = {
                {
                    ["id"] = 1597,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Archavon the Stone Watcher", -- artid 1385715
                    ["name"] = "Archavon le Gardien des pierres",
                }, -- [1]
                {
                    ["id"] = 1598,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Emalon the Storm Watcher", -- artid 1385727
                    ["name"] = "Emalon le Guetteur d'orage",
                }, -- [2]
                {
                    ["id"] = 1599,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Koralon the Flame Watcher", -- artid 1385748
                    ["name"] = "Koralon le Veilleur des flammes",
                }, -- [3]
                {
                    ["id"] = 1600,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Taravon the Ice Watcher", -- artid 1385767
                    ["name"] = "Toravon la Sentinelle de glace",
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
                    ["name"] = "Grande veuve Faerlina",
                }, -- [2]
                {
                    ["id"] = 1603,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maexxna", -- artid 1378994
                    ["name"] = "Maexxna",
                }, -- [3]
                {
                    ["id"] = 1604,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Noth the Plaguebringer", -- artid 1379004
                    ["name"] = "Noth le Porte-Peste",
                }, -- [4]
                {
                    ["id"] = 1605,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Heigan the Unclean", -- artid 1378984
                    ["name"] = "Heigan l'Impur",
                }, -- [5]
                {
                    ["id"] = 1606,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Loatheb", -- artid 1378991
                    ["name"] = "Horreb",
                }, -- [6]
                {
                    ["id"] = 1607,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Instructor Razuvious", -- artid 1378988
                    ["name"] = "Instructeur Razuvious",
                }, -- [7]
                {
                    ["id"] = 1608,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gothik the Harvester", -- artid 1378979
                    ["name"] = "Gothik le Moissonneur",
                }, -- [8]
                {
                    ["id"] = 1609,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Four Horseman", -- artid 1385732
                    ["name"] = "Les quatre cavaliers",
                }, -- [9]
                {
                    ["id"] = 1610,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Patchwerk", -- artid 1379005
                    ["name"] = "Le Recousu",
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
                    ["name"] = "Saphiron",
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
            ["name"] = "Le sanctum Obsidien",
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
            ["name"] = "L'Œil de l'éternité",
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
                    ["name"] = "Léviathan des flammes",
                }, -- [1]
                {
                    ["id"] = 1638,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ignis the Furnace Master", -- artid 1385742
                    ["name"] = "Ignis le maître de la Fournaise",
                }, -- [2]
                {
                    ["id"] = 1639,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Razorscale", -- artid 1385763
                    ["name"] = "Tranchécaille",
                }, -- [3]
                {
                    ["id"] = 1640,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-XT 002 Deconstructor", -- artid 1385773
                    ["name"] = "Déconstructeur XT-002",
                }, -- [4]
                {
                    ["id"] = 1641,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Assembly Of Iron", -- artid 1390439
                    ["name"] = "L'assemblée du Fer",
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
                    ["name"] = "Général Vezax",
                }, -- [12]
                {
                    ["id"] = 1649,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Yogg Saron", -- artid 1385774
                    ["name"] = "Yogg-Saron",
                }, -- [13]
                {
                    ["id"] = 1650,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Algalon the Observer", -- artid 1385713
                    ["name"] = "Algalon l'Observateur",
                }, -- [14]
            },
        }, -- [5]
        {
            ["id"] = 757,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TrialoftheCrusader", -- artid 1396594
            ["name"] = "L'épreuve du croisé",
            ["bosses"] = {
                {
                    ["id"] = 1618,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Northrend Beasts", -- artid 1390440
                    ["name"] = "Les bêtes du Norfendre",
                }, -- [1]
                {
                    ["id"] = 1619,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Jaraxxus", -- artid 1385752
                    ["name"] = "Seigneur Jaraxxus",
                }, -- [2]
                {
                    ["id"] = 1620,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-PVP Event Vs Horde", -- artid 1390442
                    ["name"] = "Champions de l'Alliance",
                }, -- [3]
                {
                    ["id"] = 1622,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Twin Valkyr", -- artid 1390443
                    ["name"] = "Jumelles val'kyrs",
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
            ["name"] = "Repaire d'Onyxia",
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
            ["name"] = "Citadelle de la Couronne de glace",
            ["bosses"] = {
                {
                    ["id"] = 1624,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Marrowgar", -- artid 1378992
                    ["name"] = "Seigneur Gargamoelle",
                }, -- [1]
                {
                    ["id"] = 1625,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lady Deathwhisper", -- artid 1378990
                    ["name"] = "Dame Murmemort",
                }, -- [2]
                {
                    ["id"] = 1627,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gunship Alliance", -- artid 1385736
                    ["name"] = "Bataille des canonnières de la Couronne de glace",
                }, -- [3]
                {
                    ["id"] = 1628,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Deathbringer Saurfang", -- artid 1378970
                    ["name"] = "Porte-mort Saurcroc",
                }, -- [4]
                {
                    ["id"] = 1629,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Festergut", -- artid 1378972
                    ["name"] = "Pulentraille",
                }, -- [5]
                {
                    ["id"] = 1630,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rotface", -- artid 1379009
                    ["name"] = "Trognepus",
                }, -- [6]
                {
                    ["id"] = 1631,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Professor Putricide", -- artid 1379007
                    ["name"] = "Professeur Putricide",
                }, -- [7]
                {
                    ["id"] = 1632,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Blood Prince Council", -- artid 1385721
                    ["name"] = "Conseil des princes de sang",
                }, -- [8]
                {
                    ["id"] = 1633,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Blood Queen Lanathel", -- artid 1378967
                    ["name"] = "Reine de sang Lana'thel",
                }, -- [9]
                {
                    ["id"] = 1634,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Valithria Dreamwalker", -- artid 1379023
                    ["name"] = "Valithria Marcherêve",
                }, -- [10]
                {
                    ["id"] = 1635,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sindragosa", -- artid 1379014
                    ["name"] = "Sindragosa",
                }, -- [11]
                {
                    ["id"] = 1636,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lich King", -- artid 607688
                    ["name"] = "Le roi-liche",
                }, -- [12]
            },
        }, -- [8]
        {
            ["id"] = 761,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-RubySanctum", -- artid 1396590
            ["name"] = "Le sanctum Rubis",
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
            ["name"] = "Ahn'kahet : l'Ancien royaume",
            ["bosses"] = {
                {
                    ["id"] = 580,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Elder Nadox", -- artid 607593
                    ["name"] = "Ancien Nadox",
                }, -- [1]
                {
                    ["id"] = 581,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Prince Taldaram", -- artid 607744
                    ["name"] = "Prince Taldaram",
                }, -- [2]
                {
                    ["id"] = 582,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Jedoga Shadowseeker", -- artid 607667
                    ["name"] = "Jedoga Cherchelombre",
                }, -- [3]
                {
                    ["id"] = 584,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Herald Volazj", -- artid 607639
                    ["name"] = "Héraut Volazj",
                }, -- [4]
            },
        }, -- [10]
        {
            ["id"] = 272,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-AzjolNerub", -- artid 608194
            ["name"] = "Azjol-Nérub",
            ["bosses"] = {
                {
                    ["id"] = 585,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Krikthir the Gatewatcher", -- artid 607678
                    ["name"] = "Krik'thir le Gardien de porte",
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
            ["id"] = 286,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-UtgardePinnacle", -- artid 608227
            ["name"] = "Cime d'Utgarde",
            ["bosses"] = {
                {
                    ["id"] = 641,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Svala Sorrowgrave", -- artid 607778
                    ["name"] = "Svala Tristetombe",
                }, -- [1]
                {
                    ["id"] = 642,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gortok Palehoof", -- artid 607620
                    ["name"] = "Gortok Pâle-Sabot",
                }, -- [2]
                {
                    ["id"] = 643,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Skadi the Ruthless", -- artid 607773
                    ["name"] = "Skadi le Brutal",
                }, -- [3]
                {
                    ["id"] = 644,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-King Ymiron", -- artid 607674
                    ["name"] = "Roi Ymiron",
                }, -- [4]
            },
        }, -- [12]
        {
            ["id"] = 273,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-DrakTharonKeep", -- artid 608201
            ["name"] = "Donjon de Drak'Tharon",
            ["bosses"] = {
                {
                    ["id"] = 588,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Trollgore", -- artid 607798
                    ["name"] = "Trollétripe",
                }, -- [1]
                {
                    ["id"] = 589,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Novos the Summoner", -- artid 607727
                    ["name"] = "Novos l'Invocateur",
                }, -- [2]
                {
                    ["id"] = 590,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-King Dred", -- artid 607672
                    ["name"] = "Roi Dred",
                }, -- [3]
                {
                    ["id"] = 591,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Prophet Tharonja", -- artid 607790
                    ["name"] = "Le prophète Tharon'ja",
                }, -- [4]
            },
        }, -- [13]
        {
            ["id"] = 285,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-UtgardeKeep", -- artid 608226
            ["name"] = "Donjon d'Utgarde",
            ["bosses"] = {
                {
                    ["id"] = 638,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Prince Keleseth", -- artid 607743
                    ["name"] = "Prince Keleseth",
                }, -- [1]
                {
                    ["id"] = 639,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Skarvald the Constructor", -- artid 607774
                    ["name"] = "Skarvald et Dalronn",
                }, -- [2]
                {
                    ["id"] = 640,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ingvar the Plunderer", -- artid 607659
                    ["name"] = "Ingvar le Pilleur",
                }, -- [3]
            },
        }, -- [14]
        {
            ["id"] = 278,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-PitofSaron", -- artid 608210
            ["name"] = "Fosse de Saron",
            ["bosses"] = {
                {
                    ["id"] = 608,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Forgemaster Garfrost", -- artid 607603
                    ["name"] = "Maître-forge Gargivre",
                }, -- [1]
                {
                    ["id"] = 609,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Krick", -- artid 607677
                    ["name"] = "Ick et Krick",
                }, -- [2]
                {
                    ["id"] = 610,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Scourgelord Tyrannus", -- artid 607765
                    ["name"] = "Seigneur du Fléau Tyrannus",
                }, -- [3]
            },
        }, -- [15]
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
                    ["name"] = "Colosse drakkari",
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
        }, -- [16]
        {
            ["id"] = 280,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheForgeofSouls", -- artid 608220
            ["name"] = "La Forge des Âmes",
            ["bosses"] = {
                {
                    ["id"] = 615,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Bronjahm", -- artid 607559
                    ["name"] = "Bronjahm",
                }, -- [1]
                {
                    ["id"] = 616,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Devourer of Souls", -- artid 607585
                    ["name"] = "Dévoreur d'âmes",
                }, -- [2]
            },
        }, -- [17]
        {
            ["id"] = 283,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-VioletHold", -- artid 608228
            ["name"] = "Le fort Pourpre",
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
                    ["name"] = "Zuramat l'Oblitérateur",
                }, -- [6]
                {
                    ["id"] = 632,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Cyanigosa", -- artid 607573
                    ["name"] = "Cyanigosa",
                }, -- [7]
            },
        }, -- [18]
        {
            ["id"] = 281,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheNexus", -- artid 608221
            ["name"] = "Le Nexus",
            ["bosses"] = {
                {
                    ["id"] = 618,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grand Magus Telestra", -- artid 607623
                    ["name"] = "Grand magus Telestra",
                }, -- [1]
                {
                    ["id"] = 619,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Anomalus", -- artid 607540
                    ["name"] = "Anomalus",
                }, -- [2]
                {
                    ["id"] = 620,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ormorok the Tree Shaper", -- artid 607735
                    ["name"] = "Ormorok le Sculpte-arbre",
                }, -- [3]
                {
                    ["id"] = 621,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Keristrasza", -- artid 607671
                    ["name"] = "Keristrasza",
                }, -- [4]
            },
        }, -- [19]
        {
            ["id"] = 275,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HallsofLightning", -- artid 608204
            ["name"] = "Les salles de Foudre",
            ["bosses"] = {
                {
                    ["id"] = 597,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-General Bjarngrim", -- artid 607611
                    ["name"] = "Général Bjarngrim",
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
        }, -- [20]
        {
            ["id"] = 277,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HallsofStone", -- artid 608206
            ["name"] = "Les salles de Pierre",
            ["bosses"] = {
                {
                    ["id"] = 604,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Krystallus", -- artid 607679
                    ["name"] = "Krystallus",
                }, -- [1]
                {
                    ["id"] = 605,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maiden of Grief", -- artid 607706
                    ["name"] = "Damoiselle de peine",
                }, -- [2]
                {
                    ["id"] = 606,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Tribunal of the Ages", -- artid 607797
                    ["name"] = "Tribunal des Âges",
                }, -- [3]
                {
                    ["id"] = 607,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sjonnir the Ironshaper", -- artid 607772
                    ["name"] = "Sjonnir le Sculptefer",
                }, -- [4]
            },
        }, -- [21]
        {
            ["id"] = 282,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheOculus", -- artid 608222
            ["name"] = "L'Oculus",
            ["bosses"] = {
                {
                    ["id"] = 622,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Drakos the Interrogator", -- artid 607590
                    ["name"] = "Drakos l'Interrogateur",
                }, -- [1]
                {
                    ["id"] = 623,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Varos Cloudstrider", -- artid 607802
                    ["name"] = "Varos Arpentenuée",
                }, -- [2]
                {
                    ["id"] = 624,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mage Lord Urom", -- artid 607702
                    ["name"] = "Seigneur-mage Urom",
                }, -- [3]
                {
                    ["id"] = 625,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ley Guardian Eregos", -- artid 607687
                    ["name"] = "Gardien-tellurique Eregos",
                }, -- [4]
            },
        }, -- [22]
        {
            ["id"] = 284,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TrialOfTheChampion", -- artid 608224
            ["name"] = "L'épreuve du champion",
            ["bosses"] = {
                {
                    ["id"] = 834,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grand Champions-Alliance", -- artid 607621
                    ["name"] = "Grands champions",
                }, -- [1]
                {
                    ["id"] = 635,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Eadric the Pure", -- artid 607591
                    ["name"] = "Eadric le Pur",
                }, -- [2]
                {
                    ["id"] = 636,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Argent Confessor Paletress", -- artid 607547
                    ["name"] = "Confesseur d'argent Paletress",
                }, -- [3]
                {
                    ["id"] = 637,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Black Knight", -- artid 607787
                    ["name"] = "Le Chevalier noir",
                }, -- [4]
            },
        }, -- [23]
        {
            ["id"] = 279,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheCullingOfStratholme", -- artid 608219
            ["name"] = "L'Épuration de Stratholme",
            ["bosses"] = {
                {
                    ["id"] = 611,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Meathook", -- artid 607711
                    ["name"] = "Grancrochet",
                }, -- [1]
                {
                    ["id"] = 612,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Salramm the Fleshcrafter", -- artid 607763
                    ["name"] = "Salramm le Façonneur de chair",
                }, -- [2]
                {
                    ["id"] = 613,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Chrono Lord Epoch", -- artid 607567
                    ["name"] = "Chronoseigneur Epoque",
                }, -- [3]
                {
                    ["id"] = 614,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-MalGanis", -- artid 607708
                    ["name"] = "Mal'Ganis",
                }, -- [4]
            },
        }, -- [24]
        {
            ["id"] = 276,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HallsofReflection", -- artid 608205
            ["name"] = "Salles des Reflets",
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
                    ["name"] = "Échapper à Arthas",
                }, -- [3]
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
                    ["name"] = "Quartiers des serviteurs",
                }, -- [1]
                {
                    ["id"] = 1553,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Attumen the Huntsman", -- artid 1378965
                    ["name"] = "Attumen le Veneur",
                }, -- [2]
                {
                    ["id"] = 1554,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Moroes", -- artid 1378999
                    ["name"] = "Moroes",
                }, -- [3]
                {
                    ["id"] = 1555,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maiden of Virtue", -- artid 1378997
                    ["name"] = "Damoiselle de vertu",
                }, -- [4]
                {
                    ["id"] = 1556,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Opera", -- artid 1385758
                    ["name"] = "L'Opéra",
                }, -- [5]
                {
                    ["id"] = 1557,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Curator", -- artid 1379020
                    ["name"] = "Le Conservateur",
                }, -- [6]
                {
                    ["id"] = 1559,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shade of Aran", -- artid 1379012
                    ["name"] = "Ombre d'Aran",
                }, -- [7]
                {
                    ["id"] = 1560,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Terestian Illhoof", -- artid 1379017
                    ["name"] = "Terestian Malsabot",
                }, -- [8]
                {
                    ["id"] = 1561,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Netherspite", -- artid 1379002
                    ["name"] = "Dédain-du-Néant",
                }, -- [9]
                {
                    ["id"] = 1764,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Chess Alliance", -- artid 1385724
                    ["name"] = "Évènement de l'échiquier",
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
            ["name"] = "Repaire de Gruul",
            ["bosses"] = {
                {
                    ["id"] = 1564,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High King Maulgar", -- artid 1378985
                    ["name"] = "Haut Roi Maulgar",
                }, -- [1]
                {
                    ["id"] = 1565,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gruul the Dragonkiller", -- artid 1378982
                    ["name"] = "Gruul le Tue-Dragon",
                }, -- [2]
            },
        }, -- [2]
        {
            ["id"] = 747,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-MagtheridonsLair", -- artid 1396585
            ["name"] = "Le repaire de Magtheridon",
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
            ["name"] = "Caverne du sanctuaire du Serpent",
            ["bosses"] = {
                {
                    ["id"] = 1567,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hydross the Unstable", -- artid 1385741
                    ["name"] = "Hydross l'Instable",
                }, -- [1]
                {
                    ["id"] = 1568,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Lurker Below", -- artid 1385768
                    ["name"] = "Le Rôdeur d'En bas",
                }, -- [2]
                {
                    ["id"] = 1569,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Leotheras the Blind", -- artid 1385751
                    ["name"] = "Leotheras l'Aveugle",
                }, -- [3]
                {
                    ["id"] = 1570,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Fathom Lord Karathress", -- artid 1385729
                    ["name"] = "Seigneur des fonds Karathress",
                }, -- [4]
                {
                    ["id"] = 1571,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Morogrim Tidewalker", -- artid 1385756
                    ["name"] = "Morogrim Marcheur-des-flots",
                }, -- [5]
                {
                    ["id"] = 1572,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lady Vashj", -- artid 1385750
                    ["name"] = "Dame Vashj",
                }, -- [6]
            },
        }, -- [4]
        {
            ["id"] = 749,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TempestKeep", -- artid 608218
            ["name"] = "Donjon de la tempête",
            ["bosses"] = {
                {
                    ["id"] = 1573,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Alar", -- artid 1385712
                    ["name"] = "Al'ar",
                }, -- [1]
                {
                    ["id"] = 1574,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Void Reaver", -- artid 1385772
                    ["name"] = "Saccageur du Vide",
                }, -- [2]
                {
                    ["id"] = 1575,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Astromancer Solarian", -- artid 1385739
                    ["name"] = "Grande astromancienne Solarian",
                }, -- [3]
                {
                    ["id"] = 1576,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-KaelThas Sunstrider", -- artid 607669
                    ["name"] = "Kael'thas Haut-Soleil",
                }, -- [4]
            },
        }, -- [5]
        {
            ["id"] = 750,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CavernsOfTime", -- artid 608198
            ["name"] = "Sommet d'Hyjal",
            ["bosses"] = {
                {
                    ["id"] = 1577,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rage Winterchill", -- artid 1385762
                    ["name"] = "Rage Froidhiver",
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
            ["name"] = "Le Temple noir",
            ["bosses"] = {
                {
                    ["id"] = 1582,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Warlord Najentus", -- artid 1378986
                    ["name"] = "Grand seigneur de guerre Naj'entus",
                }, -- [1]
                {
                    ["id"] = 1583,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Supremus", -- artid 1379016
                    ["name"] = "Supremus",
                }, -- [2]
                {
                    ["id"] = 1584,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shade of Akama", -- artid 1379011
                    ["name"] = "Ombre d'Akama",
                }, -- [3]
                {
                    ["id"] = 1585,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Teron Gorefiend", -- artid 1379018
                    ["name"] = "Teron Fielsang",
                }, -- [4]
                {
                    ["id"] = 1586,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gurtogg Bloodboil", -- artid 1378983
                    ["name"] = "Gurtogg Fièvresang",
                }, -- [5]
                {
                    ["id"] = 1587,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Reliquary of Souls", -- artid 1385764
                    ["name"] = "Reliquaire des âmes",
                }, -- [6]
                {
                    ["id"] = 1588,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mother Shahraz", -- artid 1379000
                    ["name"] = "Mère Shahraz",
                }, -- [7]
                {
                    ["id"] = 1589,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Illidari Council", -- artid 1385743
                    ["name"] = "Le conseil illidari",
                }, -- [8]
                {
                    ["id"] = 1590,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Illidan Stormrage", -- artid 1378987
                    ["name"] = "Illidan Hurlorage",
                }, -- [9]
            },
        }, -- [7]
        {
            ["id"] = 752,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-SunwellPlateau", -- artid 1396592
            ["name"] = "Plateau du Puits de soleil",
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
                    ["name"] = "Gangrebrume",
                }, -- [3]
                {
                    ["id"] = 1594,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Eredar Twins", -- artid 1390438
                    ["name"] = "Les jumelles érédars",
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
            ["id"] = 251,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CavernsOfTime", -- artid 608198
            ["name"] = "Contreforts de Hautebrande d'antan",
            ["bosses"] = {
                {
                    ["id"] = 538,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lieutenant Drake", -- artid 607689
                    ["name"] = "Lieutenant Drake",
                }, -- [1]
                {
                    ["id"] = 539,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Captain Skarloc", -- artid 607561
                    ["name"] = "Capitaine Skarloc",
                }, -- [2]
                {
                    ["id"] = 540,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Epoch Hunter", -- artid 607596
                    ["name"] = "Chasseur d'époques",
                }, -- [3]
            },
        }, -- [9]
        {
            ["id"] = 247,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Auchindoun", -- artid 608193
            ["name"] = "Cryptes Auchenaï",
            ["bosses"] = {
                {
                    ["id"] = 523,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shirrak the Dead Watcher", -- artid 607771
                    ["name"] = "Shirrak le Veillemort",
                }, -- [1]
                {
                    ["id"] = 524,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Exarch Maladaar", -- artid 607600
                    ["name"] = "Exarque Maladaar",
                }, -- [2]
            },
        }, -- [10]
        {
            ["id"] = 262,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CoilfangReservoir", -- artid 608199
            ["name"] = "La Basse-tourbière",
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
                    ["name"] = "Seigneur des marais Musel'ek",
                }, -- [3]
                {
                    ["id"] = 579,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Black Stalker", -- artid 607788
                    ["name"] = "La Traqueuse noire",
                }, -- [4]
            },
        }, -- [11]
        {
            ["id"] = 257,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TempestKeep", -- artid 608218
            ["name"] = "La Botanica",
            ["bosses"] = {
                {
                    ["id"] = 558,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Commander Sarannis", -- artid 607570
                    ["name"] = "Commandant Sarannis",
                }, -- [1]
                {
                    ["id"] = 559,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Botanist Freywinn", -- artid 607641
                    ["name"] = "Grand botaniste Freywinn",
                }, -- [2]
                {
                    ["id"] = 560,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thorngrin the Tender", -- artid 607794
                    ["name"] = "Rirépine le Tendre",
                }, -- [3]
                {
                    ["id"] = 561,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Laj", -- artid 607683
                    ["name"] = "Laj",
                }, -- [4]
                {
                    ["id"] = 562,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warp Splinter", -- artid 607816
                    ["name"] = "Brise-Dimension",
                }, -- [5]
            },
        }, -- [12]
        {
            ["id"] = 256,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HellfireCitadel", -- artid 608207
            ["name"] = "La Fournaise du sang",
            ["bosses"] = {
                {
                    ["id"] = 555,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Maker", -- artid 607789
                    ["name"] = "Le Faiseur",
                }, -- [1]
                {
                    ["id"] = 556,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Broggok", -- artid 607558
                    ["name"] = "Broggok",
                }, -- [2]
                {
                    ["id"] = 557,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kelidan the Breaker", -- artid 607670
                    ["name"] = "Keli'dan le Briseur",
                }, -- [3]
            },
        }, -- [13]
        {
            ["id"] = 253,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Auchindoun", -- artid 608193
            ["name"] = "Labyrinthe des Ombres",
            ["bosses"] = {
                {
                    ["id"] = 544,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ambassador Hellmaw", -- artid 607536
                    ["name"] = "Ambassadeur Gueule-d'Enfer",
                }, -- [1]
                {
                    ["id"] = 545,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Blackheart the Inciter", -- artid 607555
                    ["name"] = "Cœur-Noir le Séditieux",
                }, -- [2]
                {
                    ["id"] = 546,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grandmaster Vorpil", -- artid 607625
                    ["name"] = "Grand Maître Vorpil",
                }, -- [3]
                {
                    ["id"] = 547,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Murmur", -- artid 607720
                    ["name"] = "Marmon",
                }, -- [4]
            },
        }, -- [14]
        {
            ["id"] = 261,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CoilfangReservoir", -- artid 608199
            ["name"] = "Le caveau de la Vapeur",
            ["bosses"] = {
                {
                    ["id"] = 573,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hydromancer Thespia", -- artid 607651
                    ["name"] = "Hydromancienne Thespia",
                }, -- [1]
                {
                    ["id"] = 574,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mekgineer Steamrigger", -- artid 607713
                    ["name"] = "Mekgénieur Montevapeur",
                }, -- [2]
                {
                    ["id"] = 575,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warlord Kalithresh", -- artid 607815
                    ["name"] = "Seigneur de guerre Kalithresh",
                }, -- [3]
            },
        }, -- [15]
        {
            ["id"] = 258,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TempestKeep", -- artid 608218
            ["name"] = "Le Méchanar",
            ["bosses"] = {
                {
                    ["id"] = 563,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mechano Lord Capacitus", -- artid 607712
                    ["name"] = "Mécanoseigneur Capacitus",
                }, -- [1]
                {
                    ["id"] = 564,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Nethermancer Sepethrea", -- artid 607725
                    ["name"] = "Néantomancienne Sepethrea",
                }, -- [2]
                {
                    ["id"] = 565,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Pathaleon the Calculator", -- artid 607739
                    ["name"] = "Pathaleon le Calculateur",
                }, -- [3]
            },
        }, -- [16]
        {
            ["id"] = 255,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CavernsOfTime", -- artid 608198
            ["name"] = "Le Noir marécage",
            ["bosses"] = {
                {
                    ["id"] = 552,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Chrono Lord Deja", -- artid 607566
                    ["name"] = "Chronoseigneur Déjà",
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
            ["id"] = 260,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CoilfangReservoir", -- artid 608199
            ["name"] = "Les enclos aux esclaves",
            ["bosses"] = {
                {
                    ["id"] = 570,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mennu the Betrayer", -- artid 607715
                    ["name"] = "Mennu le Traître",
                }, -- [1]
                {
                    ["id"] = 571,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rokmar the Crackler", -- artid 607759
                    ["name"] = "Rokmar le Crépitant",
                }, -- [2]
                {
                    ["id"] = 572,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Quagmirran", -- artid 607750
                    ["name"] = "Bourbierreux",
                }, -- [3]
            },
        }, -- [18]
        {
            ["id"] = 259,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HellfireCitadel", -- artid 608207
            ["name"] = "Les salles Brisées",
            ["bosses"] = {
                {
                    ["id"] = 566,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grand Warlock Nethekurse", -- artid 607624
                    ["name"] = "Grand démoniste Néanathème",
                }, -- [1]
                {
                    ["id"] = 568,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warbringer Omrogg", -- artid 607811
                    ["name"] = "Porteguerre O'mrogg",
                }, -- [2]
                {
                    ["id"] = 569,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warchief Kargath Bladefist", -- artid 607812
                    ["name"] = "Chef de guerre Kargath Lamepoing",
                }, -- [3]
            },
        }, -- [19]
        {
            ["id"] = 252,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Auchindoun", -- artid 608193
            ["name"] = "Les salles des Sethekk",
            ["bosses"] = {
                {
                    ["id"] = 541,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Darkweaver Syth", -- artid 607583
                    ["name"] = "Sombre tisseur Syth",
                }, -- [1]
                {
                    ["id"] = 543,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Talon King Ikiss", -- artid 607780
                    ["name"] = "Roi-serre Ikiss",
                }, -- [2]
            },
        }, -- [20]
        {
            ["id"] = 254,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TempestKeep", -- artid 608218
            ["name"] = "L'Arcatraz",
            ["bosses"] = {
                {
                    ["id"] = 548,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Zereketh the Unbound", -- artid 607823
                    ["name"] = "Zereketh le Délié",
                }, -- [1]
                {
                    ["id"] = 549,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Dalliah the Doomsayer", -- artid 607574
                    ["name"] = "Dalliah l'Auspice-Funeste",
                }, -- [2]
                {
                    ["id"] = 550,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Wrath Scryer Soccothrates", -- artid 607820
                    ["name"] = "Scrute-courroux Soccothrates",
                }, -- [3]
                {
                    ["id"] = 551,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Harbinger Skyriss", -- artid 607635
                    ["name"] = "Messager Cieuriss",
                }, -- [4]
            },
        }, -- [21]
        {
            ["id"] = 248,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HellfireCitadel", -- artid 608207
            ["name"] = "Remparts des Flammes infernales",
            ["bosses"] = {
                {
                    ["id"] = 527,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Watchkeeper Gargolmar", -- artid 607817
                    ["name"] = "Gardien des guetteurs Gargolmar",
                }, -- [1]
                {
                    ["id"] = 528,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Omor the Unscarred", -- artid 607734
                    ["name"] = "Omor l'Intouché",
                }, -- [2]
                {
                    ["id"] = 529,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Vazruden", -- artid 607803
                    ["name"] = "Vazruden le Héraut",
                }, -- [3]
            },
        }, -- [22]
        {
            ["id"] = 249,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-MagistersTerrace", -- artid 608208
            ["name"] = "Terrasse des Magistères",
            ["bosses"] = {
                {
                    ["id"] = 530,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Selin Fireheart", -- artid 607767
                    ["name"] = "Selin Cœur-de-Feu",
                }, -- [1]
                {
                    ["id"] = 531,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Vexallus", -- artid 607806
                    ["name"] = "Vexallus",
                }, -- [2]
                {
                    ["id"] = 532,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Priestess Delrissa", -- artid 607742
                    ["name"] = "Prêtresse Delrissa",
                }, -- [3]
                {
                    ["id"] = 533,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-KaelThas Sunstrider", -- artid 607669
                    ["name"] = "Kael'thas Haut-Soleil",
                }, -- [4]
            },
        }, -- [23]
        {
            ["id"] = 250,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Auchindoun", -- artid 608193
            ["name"] = "Tombes-mana",
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
                    ["name"] = "Prince-nexus Shaffar",
                }, -- [3]
            },
        }, -- [24]
    },
    ["Donjons classiques"] = {
        {
            ["id"] = 741,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-MoltenCore", -- artid 1396586
            ["name"] = "Cœur du Magma",
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
                    ["name"] = "Messager de Sulfuron",
                }, -- [7]
                {
                    ["id"] = 1526,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Golemagg the Incinerator", -- artid 1378978
                    ["name"] = "Golemagg l'Incinérateur",
                }, -- [8]
                {
                    ["id"] = 1527,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Majordomo Executus", -- artid 1378998
                    ["name"] = "Chambellan Executus",
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
            ["name"] = "Repaire de l'Aile noire",
            ["bosses"] = {
                {
                    ["id"] = 1529,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Razorgore the Untamed", -- artid 1379008
                    ["name"] = "Tranchetripe l'Indompté",
                }, -- [1]
                {
                    ["id"] = 1530,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Vaelastrasz the Corrupt", -- artid 1379022
                    ["name"] = "Vaelastrasz le Corrompu",
                }, -- [2]
                {
                    ["id"] = 1531,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Broodlord Lashlayer", -- artid 1378968
                    ["name"] = "Seigneur des couvées Lanistaire",
                }, -- [3]
                {
                    ["id"] = 1532,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Firemaw", -- artid 1378973
                    ["name"] = "Gueule-de-feu",
                }, -- [4]
                {
                    ["id"] = 1533,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ebonroc", -- artid 1378971
                    ["name"] = "Rochébène",
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
            ["name"] = "Ruines d'Ahn'Qiraj",
            ["bosses"] = {
                {
                    ["id"] = 1537,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kurinnaxx", -- artid 1385749
                    ["name"] = "Kurinnaxx",
                }, -- [1]
                {
                    ["id"] = 1538,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-General Rajaxx", -- artid 1385734
                    ["name"] = "Général Rajaxx",
                }, -- [2]
                {
                    ["id"] = 1539,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Moam", -- artid 1385755
                    ["name"] = "Moam",
                }, -- [3]
                {
                    ["id"] = 1540,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Buru the Gorger", -- artid 1385723
                    ["name"] = "Buru Grandgosier",
                }, -- [4]
                {
                    ["id"] = 1541,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ayamiss the Hunter", -- artid 1385718
                    ["name"] = "Ayamiss le Chasseur",
                }, -- [5]
                {
                    ["id"] = 1542,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ossirian the Unscarred", -- artid 1385759
                    ["name"] = "Ossirian l'Intouché",
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
                    ["name"] = "Le prophète Skeram",
                }, -- [1]
                {
                    ["id"] = 1547,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Silithid Royalty", -- artid 1390436
                    ["name"] = "Famille royale silithide",
                }, -- [2]
                {
                    ["id"] = 1544,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Battleguard Sartura", -- artid 1385720
                    ["name"] = "Garde de guerre Sartura",
                }, -- [3]
                {
                    ["id"] = 1545,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Fankriss the Unyielding", -- artid 1385728
                    ["name"] = "Fankriss l'Inflexible",
                }, -- [4]
                {
                    ["id"] = 1548,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Viscidus", -- artid 1385771
                    ["name"] = "Viscidus",
                }, -- [5]
                {
                    ["id"] = 1546,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Princess Huhuran", -- artid 1385761
                    ["name"] = "Princesse Huhuran",
                }, -- [6]
                {
                    ["id"] = 1549,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Twin Emperors", -- artid 1390437
                    ["name"] = "Les Empereurs jumeaux",
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
                    ["name"] = "Grande veuve Faerlina",
                }, -- [2]
                {
                    ["id"] = 1554,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maexxna", -- artid 1378994
                    ["name"] = "Maexxna",
                }, -- [3]
                {
                    ["id"] = 1555,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Noth the Plaguebringer", -- artid 1379004
                    ["name"] = "Noth le Porte-Peste",
                }, -- [4]
                {
                    ["id"] = 1556,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Heigan the Unclean", -- artid 1378984
                    ["name"] = "Heigan l'Impur",
                }, -- [5]
                {
                    ["id"] = 1557,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Loatheb", -- artid 1378991
                    ["name"] = "Horreb",
                }, -- [6]
                {
                    ["id"] = 1558,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Instructor Razuvious", -- artid 1378988
                    ["name"] = "Instructeur Razuvious",
                }, -- [7]
                {
                    ["id"] = 1559,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gothik the Harvester", -- artid 1378979
                    ["name"] = "Gothik le Moissonneur",
                }, -- [8]
                {
                    ["id"] = 1560,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Four Horseman", -- artid 1385732
                    ["name"] = "Les quatre cavaliers",
                }, -- [9]
                {
                    ["id"] = 1561,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Patchwerk", -- artid 1379005
                    ["name"] = "Le Recousu",
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
                    ["name"] = "Saphiron",
                }, -- [14]
                {
                    ["id"] = 1566,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-KelThuzad", -- artid 1378989
                    ["name"] = "Kel'Thuzad",
                }, -- [15]
            },
        }, -- [5]
        {
            ["id"] = 229,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-BlackrockSpire", -- artid 608197
            ["name"] = "Bas du pic Rochenoire",
            ["bosses"] = {
                {
                    ["id"] = 388,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Highlord Omokk", -- artid 607645
                    ["name"] = "Généralissime Omokk",
                }, -- [1]
                {
                    ["id"] = 389,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shadow Hunter Voshgajin", -- artid 607769
                    ["name"] = "Chasseresse des ombres Vosh'gajin",
                }, -- [2]
                {
                    ["id"] = 390,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-War Master Voone", -- artid 607810
                    ["name"] = "Maître de guerre Voone",
                }, -- [3]
                {
                    ["id"] = 391,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mother Smolderweb", -- artid 607719
                    ["name"] = "Matriarche Couveuse",
                }, -- [4]
                {
                    ["id"] = 392,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Urok Doomhowl", -- artid 607801
                    ["name"] = "Urok Hurleruine",
                }, -- [5]
                {
                    ["id"] = 393,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Quartermaster Zigris", -- artid 607751
                    ["name"] = "Intendant Zigris",
                }, -- [6]
                {
                    ["id"] = 394,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Halycon", -- artid 607634
                    ["name"] = "Halycon",
                }, -- [7]
                {
                    ["id"] = 395,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gizrul the Slavener", -- artid 607615
                    ["name"] = "Gizrul l'esclavagiste",
                }, -- [8]
                {
                    ["id"] = 396,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Overlord Wyrmthalak", -- artid 607737
                    ["name"] = "Seigneur Wyrmthalak",
                }, -- [9]
            },
        }, -- [6]
        {
            ["id"] = 240,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-WailingCaverns", -- artid 608229
            ["name"] = "Cavernes des Lamentations",
            ["bosses"] = {
                {
                    ["id"] = 474,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lady Anacondra", -- artid 607680
                    ["name"] = "Dame Anacondra",
                }, -- [1]
                {
                    ["id"] = 476,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Pythas", -- artid 607696
                    ["name"] = "Seigneur Pythas",
                }, -- [2]
                {
                    ["id"] = 475,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Cobrahn", -- artid 607693
                    ["name"] = "Seigneur Cobrahn",
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
                    ["name"] = "Seigneur Serpentis",
                }, -- [6]
                {
                    ["id"] = 480,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Verdan the Everliving", -- artid 607805
                    ["name"] = "Verdan l'Immortel",
                }, -- [7]
                {
                    ["id"] = 481,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mutanus the Devourer", -- artid 607721
                    ["name"] = "Mutanus le Dévoreur",
                }, -- [8]
            },
        }, -- [7]
        {
            ["id"] = 64,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-ShadowFangKeep", -- artid 522358
            ["name"] = "Donjon d'Ombrecroc",
            ["bosses"] = {
                {
                    ["id"] = 96,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Baron Ashbury", -- artid 522205
                    ["name"] = "Baron Ashbury",
                }, -- [1]
                {
                    ["id"] = 97,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Baron Silverlaine", -- artid 522206
                    ["name"] = "Baron d'Argelaine",
                }, -- [2]
                {
                    ["id"] = 98,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Commander Springvale", -- artid 522213
                    ["name"] = "Commandant Printeval",
                }, -- [3]
                {
                    ["id"] = 99,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Walden", -- artid 522249
                    ["name"] = "Seigneur Walden",
                }, -- [4]
                {
                    ["id"] = 100,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Godfrey", -- artid 522247
                    ["name"] = "Seigneur Godfrey",
                }, -- [5]
            },
        }, -- [8]
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
                    ["name"] = "Retombée visqueuse",
                }, -- [2]
                {
                    ["id"] = 421,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Electrocutioner 6000", -- artid 607594
                    ["name"] = "Electrocuteur 6000",
                }, -- [3]
                {
                    ["id"] = 418,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Crowd Pummeler 9-60", -- artid 607572
                    ["name"] = "Disperseur de foule 9-60",
                }, -- [4]
                {
                    ["id"] = 422,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mekgineer Thermaplugg", -- artid 607714
                    ["name"] = "Mekgénieur Thermojoncteur",
                }, -- [5]
            },
        }, -- [9]
        {
            ["id"] = 226,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-RagefireChasm", -- artid 608211
            ["name"] = "Gouffre de Ragefeu",
            ["bosses"] = {
                {
                    ["id"] = 694,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Adarogg", -- artid 608309
                    ["name"] = "Adarogg",
                }, -- [1]
                {
                    ["id"] = 695,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Dark Shaman Koranthal", -- artid 608310
                    ["name"] = "Sombre chaman Koranthal",
                }, -- [2]
                {
                    ["id"] = 696,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Magmaw", -- artid 522251
                    ["name"] = "Crassegueule",
                }, -- [3]
                {
                    ["id"] = 697,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lava Guard Gordoth", -- artid 608315
                    ["name"] = "Garde de lave Gordoth",
                }, -- [4]
            },
        }, -- [10]
        {
            ["id"] = 230,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-DireMaul", -- artid 608200
            ["name"] = "Hache-Tripes",
            ["bosses"] = {
                {
                    ["id"] = 402,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Zevrim Thornhoof", -- artid 607824
                    ["name"] = "Zevrim Sabot-de-Ronce",
                }, -- [1]
                {
                    ["id"] = 403,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hydrospawn", -- artid 607653
                    ["name"] = "Hydrogénos",
                }, -- [2]
                {
                    ["id"] = 404,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lethtendris", -- artid 607686
                    ["name"] = "Lethtendris",
                }, -- [3]
                {
                    ["id"] = 405,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Alzzin the Wildshaper", -- artid 607533
                    ["name"] = "Alzzin le Modeleur",
                }, -- [4]
                {
                    ["id"] = 406,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Tendris Warpwood", -- artid 607785
                    ["name"] = "Tendris Crochebois",
                }, -- [5]
                {
                    ["id"] = 407,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Illyanna Ravenoak", -- artid 607656
                    ["name"] = "Illyanna Corvichêne",
                }, -- [6]
                {
                    ["id"] = 408,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Magister Kalendris", -- artid 607703
                    ["name"] = "Magistère Kalendris",
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
                    ["name"] = "Garde Mol'dar",
                }, -- [10]
                {
                    ["id"] = 412,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Stomper Kreeg", -- artid 607777
                    ["name"] = "Kreeg le Marteleur",
                }, -- [11]
                {
                    ["id"] = 413,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Guard Fengus", -- artid 607629
                    ["name"] = "Garde Fengus",
                }, -- [12]
                {
                    ["id"] = 414,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Guard Slipkik", -- artid 607631
                    ["name"] = "Garde Slip'kik",
                }, -- [13]
                {
                    ["id"] = 415,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Captain Kromcrush", -- artid 607560
                    ["name"] = "Capitaine Kromcrabouille",
                }, -- [14]
                {
                    ["id"] = 416,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-ChoRush the Observer", -- artid 607565
                    ["name"] = "Cho'Rush l'Observateur",
                }, -- [15]
                {
                    ["id"] = 417,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-King Gordok", -- artid 607673
                    ["name"] = "Roi Gordok",
                }, -- [16]
            },
        }, -- [11]
        {
            ["id"] = 234,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-RazorfenKraul", -- artid 608213
            ["name"] = "Kraal de Tranchebauge",
            ["bosses"] = {
                {
                    ["id"] = 896,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Aggem Thorncurse", -- artid 607531
                    ["name"] = "Chasseur Ossathure",
                }, -- [1]
                {
                    ["id"] = 895,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Roogug", -- artid 607760
                    ["name"] = "Roogug",
                }, -- [2]
                {
                    ["id"] = 899,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Overlord Ramtusk", -- artid 607736
                    ["name"] = "Seigneur de guerre Brusquebroche",
                }, -- [3]
                {
                    ["id"] = 900,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Groyat", -- artid 1064175
                    ["name"] = "Groyat, le chasseur aveugle",
                }, -- [4]
                {
                    ["id"] = 901,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Charlga Razorflank", -- artid 607563
                    ["name"] = "Charlga Trancheflanc",
                }, -- [5]
            },
        }, -- [12]
        {
            ["id"] = 238,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheStockade", -- artid 608223
            ["name"] = "Prison de Hurlevent",
            ["bosses"] = {
                {
                    ["id"] = 464,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hogger-New", -- artid 4776138
                    ["name"] = "Lardeur",
                }, -- [1]
                {
                    ["id"] = 465,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Overheat", -- artid 607695
                    ["name"] = "Seigneur Surchauffe",
                }, -- [2]
                {
                    ["id"] = 466,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Randolph Moloch", -- artid 607753
                    ["name"] = "Randolph Moloch",
                }, -- [3]
            },
        }, -- [13]
        {
            ["id"] = 237,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-SunkenTemple", -- artid 608217
            ["name"] = "Temple englouti",
            ["bosses"] = {
                {
                    ["id"] = 457,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Avatar of Hakkar", -- artid 607548
                    ["name"] = "Avatar d'Hakkar",
                }, -- [1]
                {
                    ["id"] = 458,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Jammalan the Prophet", -- artid 607665
                    ["name"] = "Jammal'an le Prophète",
                }, -- [2]
                {
                    ["id"] = 459,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Dreamscythe", -- artid 608311
                    ["name"] = "Protecteurs du Rêve",
                }, -- [3]
                {
                    ["id"] = 463,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shade of Eranikus", -- artid 607768
                    ["name"] = "Ombre d'Eranikus",
                }, -- [4]
            },
        }, -- [14]
        {
            ["id"] = 63,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Deadmines", -- artid 522352
            ["name"] = "Les Mortemines",
            ["bosses"] = {
                {
                    ["id"] = 89,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Glubtok", -- artid 522228
                    ["name"] = "Glubtok",
                }, -- [1]
                {
                    ["id"] = 90,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Helix Gearbreaker", -- artid 522234
                    ["name"] = "Hélix Engrecasse",
                }, -- [2]
                {
                    ["id"] = 91,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Foe Reaper 5000", -- artid 522225
                    ["name"] = "Faucheur 5000",
                }, -- [3]
                {
                    ["id"] = 92,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Admiral Ripsnarl", -- artid 522189
                    ["name"] = "Amiral Grondéventre",
                }, -- [4]
                {
                    ["id"] = 93,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Captain Cookie", -- artid 522210
                    ["name"] = "« Capitaine » Macaron",
                }, -- [5]
                {
                    ["id"] = 95,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Vanessa VanCleef", -- artid 522278
                    ["name"] = "Vanessa VanCleef",
                }, -- [6]
            },
        }, -- [15]
        {
            ["id"] = 232,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Maraudon", -- artid 608209
            ["name"] = "Maraudon",
            ["bosses"] = {
                {
                    ["id"] = 423,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Noxxion", -- artid 607728
                    ["name"] = "Noxcion",
                }, -- [1]
                {
                    ["id"] = 424,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Razorlash", -- artid 607756
                    ["name"] = "Tranchefouet",
                }, -- [2]
                {
                    ["id"] = 425,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Tinkerer Gizlock", -- artid 607796
                    ["name"] = "Bricoleur Kadenaz",
                }, -- [3]
                {
                    ["id"] = 427,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Vyletongue", -- artid 607699
                    ["name"] = "Seigneur Vylelangue",
                }, -- [4]
                {
                    ["id"] = 428,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Celebras the Cursed", -- artid 607562
                    ["name"] = "Celebras le Maudit",
                }, -- [5]
                {
                    ["id"] = 429,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Landslide", -- artid 607684
                    ["name"] = "Glissement de terrain",
                }, -- [6]
                {
                    ["id"] = 430,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rotgrip", -- artid 607761
                    ["name"] = "Grippe-charogne",
                }, -- [7]
                {
                    ["id"] = 431,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Princess Theradras", -- artid 607747
                    ["name"] = "Princesse Theradras",
                }, -- [8]
            },
        }, -- [16]
        {
            ["id"] = 316,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-ScarletMonastery", -- artid 608214
            ["name"] = "Monastère Écarlate",
            ["bosses"] = {
                {
                    ["id"] = 688,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thalnos the Soulrender", -- artid 630853
                    ["name"] = "Thalnos le Déchiqueteur d'âmes",
                }, -- [1]
                {
                    ["id"] = 671,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Brother Korloff", -- artid 630818
                    ["name"] = "Frère Korloff",
                }, -- [2]
                {
                    ["id"] = 674,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Inquisitor Whitemane", -- artid 607643
                    ["name"] = "Grande inquisitrice Blanchetête",
                }, -- [3]
            },
        }, -- [17]
        {
            ["id"] = 227,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-BlackfathomDeeps", -- artid 608195
            ["name"] = "Profondeurs de Brassenoire",
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
                    ["name"] = "Subjugateur Kor'ul",
                }, -- [3]
                {
                    ["id"] = 1145,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thruk", -- artid 1064181
                    ["name"] = "Thruk",
                }, -- [4]
                {
                    ["id"] = 447,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Guardian of the Deep", -- artid 1064182
                    ["name"] = "Gardien des profondeurs",
                }, -- [5]
                {
                    ["id"] = 1144,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Executioner Gore", -- artid 1064183
                    ["name"] = "Exécuteur Carnage",
                }, -- [6]
                {
                    ["id"] = 437,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Twilight Lord Bathiel", -- artid 1064184
                    ["name"] = "Seigneur du Crépuscule Bathiel",
                }, -- [7]
                {
                    ["id"] = 444,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Akumai", -- artid 607532
                    ["name"] = "Aku'mai",
                }, -- [8]
            },
        }, -- [18]
        {
            ["id"] = 228,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-BlackrockDepths", -- artid 608196
            ["name"] = "Profondeurs de Rochenoire",
            ["bosses"] = {
                {
                    ["id"] = 369,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Interrogator Gerstahn", -- artid 607644
                    ["name"] = "Grande Interrogatrice Gerstahn",
                }, -- [1]
                {
                    ["id"] = 370,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Roccor", -- artid 607697
                    ["name"] = "Seigneur Roccor",
                }, -- [2]
                {
                    ["id"] = 371,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Houndmaster Grebmar", -- artid 607647
                    ["name"] = "Maître-chien Grebmar",
                }, -- [3]
                {
                    ["id"] = 372,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Justice Grimstone", -- artid 608314
                    ["name"] = "Cercle de la loi",
                }, -- [4]
                {
                    ["id"] = 373,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Pyromancer Loregrain", -- artid 607749
                    ["name"] = "Pyromancien Blé-du-savoir",
                }, -- [5]
                {
                    ["id"] = 374,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Incendius", -- artid 607694
                    ["name"] = "Seigneur Incendius",
                }, -- [6]
                {
                    ["id"] = 375,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warder Stilgiss", -- artid 607814
                    ["name"] = "Gardien Stilgiss",
                }, -- [7]
                {
                    ["id"] = 376,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Fineous Darkvire", -- artid 607602
                    ["name"] = "Fineous Sombrevire",
                }, -- [8]
                {
                    ["id"] = 377,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-BaelGar", -- artid 607549
                    ["name"] = "Bael'Gar",
                }, -- [9]
                {
                    ["id"] = 378,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-General Angerforge", -- artid 607610
                    ["name"] = "Général Forgehargne",
                }, -- [10]
                {
                    ["id"] = 379,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Golem Lord Argelmach", -- artid 607618
                    ["name"] = "Seigneur golem Argelmach",
                }, -- [11]
                {
                    ["id"] = 380,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hurley Blackbreath", -- artid 607650
                    ["name"] = "Hurley Soufflenoir",
                }, -- [12]
                {
                    ["id"] = 381,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Phalanx", -- artid 607740
                    ["name"] = "Phalange",
                }, -- [13]
                {
                    ["id"] = 383,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Plugger Spazzring", -- artid 607741
                    ["name"] = "Lanfiche Brouillecircuit",
                }, -- [14]
                {
                    ["id"] = 384,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ambassador Flamelash", -- artid 607535
                    ["name"] = "Ambassadeur Cinglefouet",
                }, -- [15]
                {
                    ["id"] = 385,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-DoomRel", -- artid 607587
                    ["name"] = "Les Sept",
                }, -- [16]
                {
                    ["id"] = 386,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Magmus", -- artid 607705
                    ["name"] = "Magmus",
                }, -- [17]
                {
                    ["id"] = 387,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Emperor Thaurissan", -- artid 607595
                    ["name"] = "Empereur Dagran Thaurissan",
                }, -- [18]
            },
        }, -- [19]
        {
            ["id"] = 311,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-ScarletHalls", -- artid 643262
            ["name"] = "Salles Écarlates",
            ["bosses"] = {
                {
                    ["id"] = 660,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Houndmaster Braun", -- artid 630833
                    ["name"] = "Maître-chien Braun",
                }, -- [1]
                {
                    ["id"] = 654,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Armsmaster Harlan", -- artid 630816
                    ["name"] = "Maître d'armes Harlan",
                }, -- [2]
                {
                    ["id"] = 656,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Flameweaver Koegler", -- artid 630825
                    ["name"] = "Tisseur de flammes Koegler",
                }, -- [3]
            },
        }, -- [20]
        {
            ["id"] = 246,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Scholomance", -- artid 608215
            ["name"] = "Scholomance",
            ["bosses"] = {
                {
                    ["id"] = 659,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Instructor Chillheart", -- artid 630835
                    ["name"] = "Instructrice Froidecœur",
                }, -- [1]
                {
                    ["id"] = 663,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Jandice Barov", -- artid 607666
                    ["name"] = "Jandice Barov",
                }, -- [2]
                {
                    ["id"] = 665,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rattlegore", -- artid 607755
                    ["name"] = "Cliquettripes",
                }, -- [3]
                {
                    ["id"] = 666,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lillian Voss", -- artid 630838
                    ["name"] = "Lilian Voss",
                }, -- [4]
                {
                    ["id"] = 684,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Darkmaster Gandling", -- artid 607582
                    ["name"] = "Sombre Maître Gandling",
                }, -- [5]
            },
        }, -- [21]
        {
            ["id"] = 233,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-RazorfenDowns", -- artid 608212
            ["name"] = "Souilles de Tranchebauge",
            ["bosses"] = {
                {
                    ["id"] = 1142,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hadronox", -- artid 607633
                    ["name"] = "Aarux",
                }, -- [1]
                {
                    ["id"] = 433,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mordresh Fire Eye", -- artid 607718
                    ["name"] = "Mordresh Oeil-de-Feu",
                }, -- [2]
                {
                    ["id"] = 1143,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mushlump", -- artid 1064178
                    ["name"] = "Bouillegrume",
                }, -- [3]
                {
                    ["id"] = 1146,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Death Speaker Jargba", -- artid 607584
                    ["name"] = "Nécrorateur Noirépine",
                }, -- [4]
                {
                    ["id"] = 1141,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Amnennar the Coldbringer", -- artid 607537
                    ["name"] = "Amnennar le Porte-Froid",
                }, -- [5]
            },
        }, -- [22]
        {
            ["id"] = 236,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Stratholme", -- artid 608216
            ["name"] = "Stratholme",
            ["bosses"] = {
                {
                    ["id"] = 443,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hearthsinger Forresten", -- artid 607637
                    ["name"] = "Chanteloge Forrestin",
                }, -- [1]
                {
                    ["id"] = 445,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Timmy the Cruel", -- artid 607795
                    ["name"] = "Timmy le Cruel",
                }, -- [2]
                {
                    ["id"] = 749,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Commander Malor", -- artid 607569
                    ["name"] = "Commandant Malor",
                }, -- [3]
                {
                    ["id"] = 446,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Willey Hopebreaker", -- artid 607818
                    ["name"] = "Willey Mutilespoir",
                }, -- [4]
                {
                    ["id"] = 448,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Instructor Galford", -- artid 607660
                    ["name"] = "Instructeur Galford",
                }, -- [5]
                {
                    ["id"] = 449,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Balnazzar", -- artid 607551
                    ["name"] = "Balnazzar",
                }, -- [6]
                {
                    ["id"] = 450,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Unforgiven", -- artid 607792
                    ["name"] = "Le Condamné",
                }, -- [7]
                {
                    ["id"] = 451,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Baroness Anastari", -- artid 607553
                    ["name"] = "Baronne Anastari",
                }, -- [8]
                {
                    ["id"] = 452,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Nerubenkan", -- artid 607724
                    ["name"] = "Nerub'enkan",
                }, -- [9]
                {
                    ["id"] = 453,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maleki the Pallid", -- artid 607707
                    ["name"] = "Maleki le Blafard",
                }, -- [10]
                {
                    ["id"] = 454,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Ravenian", -- artid 607791
                    ["name"] = "Magistrat Barthilas",
                }, -- [11]
                {
                    ["id"] = 455,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ramstein the Gorger", -- artid 607752
                    ["name"] = "Ramstein Grandgosier",
                }, -- [12]
                {
                    ["id"] = 456,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Aurius Rivendare", -- artid 607692
                    ["name"] = "Seigneur Aurius Vaillefendre",
                }, -- [13]
            },
        }, -- [23]
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
                    ["name"] = "Les nains perdus",
                }, -- [2]
                {
                    ["id"] = 469,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ironaya", -- artid 607664
                    ["name"] = "Ironaya",
                }, -- [3]
                {
                    ["id"] = 748,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Obsidian Sentinel", -- artid 607729
                    ["name"] = "Sentinelle d'obsidienne",
                }, -- [4]
                {
                    ["id"] = 470,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ancient Stone Keeper", -- artid 607538
                    ["name"] = "Ancien gardien en pierre",
                }, -- [5]
                {
                    ["id"] = 471,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Galgann Firehammer", -- artid 607606
                    ["name"] = "Galgann Martel-de-Feu",
                }, -- [6]
                {
                    ["id"] = 472,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grimlok", -- artid 607626
                    ["name"] = "Grimelok",
                }, -- [7]
                {
                    ["id"] = 473,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Archaedas", -- artid 607546
                    ["name"] = "Archaedas",
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
                    ["name"] = "Theka le Martyr",
                }, -- [3]
                {
                    ["id"] = 486,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Witch Doctor Zumrah", -- artid 607819
                    ["name"] = "Féticheur Zum'rah",
                }, -- [4]
                {
                    ["id"] = 487,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Nekrum Gutchewer", -- artid 607723
                    ["name"] = "Nekrum et Sezz'ziz",
                }, -- [5]
                {
                    ["id"] = 489,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Chief Ukorz Sandscalp", -- artid 607564
                    ["name"] = "Chef Ukorz Scalpessable",
                }, -- [6]
            },
        }, -- [25]
    },
}
