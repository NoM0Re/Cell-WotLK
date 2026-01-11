---------------------------------------------------------------------
-- File: Cell\RaidDebuffs\ExpansionData\ExpansionData_zhCN.lua
-- Author: enderneko (enderneko-dev@outlook.com)
-- Created : 2023-09-03 19:53:55 +08:00
-- Modified: 2024-06-01 19:49 +08:00
---------------------------------------------------------------------

if not LOCALE_zhCN then return end

Cell_ExpansionData.locale = "zhCN"

Cell_ExpansionData.expansions = {
    "巫妖王之怒",
    "燃烧的远征",
    "经典旧世",
}

Cell_ExpansionData.data = {
    ["巫妖王之怒"] = {
        {
            ["id"] = 753,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-VaultofArchavon", -- artid 1396596
            ["name"] = "阿尔卡冯的宝库",
            ["bosses"] = {
                {
                    ["id"] = 1597,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Archavon the Stone Watcher", -- artid 1385715
                    ["name"] = "岩石看守者阿尔卡冯",
                }, -- [1]
                {
                    ["id"] = 1598,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Emalon the Storm Watcher", -- artid 1385727
                    ["name"] = "风暴看守者埃玛尔隆",
                }, -- [2]
                {
                    ["id"] = 1599,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Koralon the Flame Watcher", -- artid 1385748
                    ["name"] = "火焰看守者科拉隆",
                }, -- [3]
                {
                    ["id"] = 1600,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Taravon the Ice Watcher", -- artid 1385767
                    ["name"] = "寒冰看守者图拉旺",
                }, -- [4]
            },
        }, -- [1]
        {
            ["id"] = 754,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Naxxramas", -- artid 1396587
            ["name"] = "纳克萨玛斯",
            ["bosses"] = {
                {
                    ["id"] = 1601,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-AnubRekhan", -- artid 1378964
                    ["name"] = "阿努布雷坎",
                }, -- [1]
                {
                    ["id"] = 1602,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grand Widow Faerlina", -- artid 1378980
                    ["name"] = "黑女巫法琳娜",
                }, -- [2]
                {
                    ["id"] = 1603,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maexxna", -- artid 1378994
                    ["name"] = "迈克斯纳",
                }, -- [3]
                {
                    ["id"] = 1604,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Noth the Plaguebringer", -- artid 1379004
                    ["name"] = "药剂师诺斯",
                }, -- [4]
                {
                    ["id"] = 1605,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Heigan the Unclean", -- artid 1378984
                    ["name"] = "肮脏的希尔盖",
                }, -- [5]
                {
                    ["id"] = 1606,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Loatheb", -- artid 1378991
                    ["name"] = "洛欧塞布",
                }, -- [6]
                {
                    ["id"] = 1607,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Instructor Razuvious", -- artid 1378988
                    ["name"] = "教官拉苏维奥斯",
                }, -- [7]
                {
                    ["id"] = 1608,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gothik the Harvester", -- artid 1378979
                    ["name"] = "收割者戈提克",
                }, -- [8]
                {
                    ["id"] = 1609,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Four Horseman", -- artid 1385732
                    ["name"] = "天启四骑士",
                }, -- [9]
                {
                    ["id"] = 1610,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Patchwerk", -- artid 1379005
                    ["name"] = "帕奇维克",
                }, -- [10]
                {
                    ["id"] = 1611,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grobbulus", -- artid 1378981
                    ["name"] = "格罗布鲁斯",
                }, -- [11]
                {
                    ["id"] = 1612,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gluth", -- artid 1378977
                    ["name"] = "格拉斯",
                }, -- [12]
                {
                    ["id"] = 1613,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thaddius", -- artid 1379019
                    ["name"] = "塔迪乌斯",
                }, -- [13]
                {
                    ["id"] = 1614,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sapphiron", -- artid 1379010
                    ["name"] = "萨菲隆",
                }, -- [14]
                {
                    ["id"] = 1615,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-KelThuzad", -- artid 1378989
                    ["name"] = "克尔苏加德",
                }, -- [15]
            },
        }, -- [2]
        {
            ["id"] = 755,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-ObsidianSanctum", -- artid 1396588
            ["name"] = "黑曜石圣殿",
            ["bosses"] = {
                {
                    ["id"] = 1616,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sartharion", -- artid 1385765
                    ["name"] = "萨塔里奥",
                }, -- [1]
            },
        }, -- [3]
        {
            ["id"] = 756,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-EyeofEternity", -- artid 1396581
            ["name"] = "永恒之眼",
            ["bosses"] = {
                {
                    ["id"] = 1617,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Malygos", -- artid 1385753
                    ["name"] = "玛里苟斯",
                }, -- [1]
            },
        }, -- [4]
        {
            ["id"] = 759,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Ulduar", -- artid 1396595
            ["name"] = "奥杜尔",
            ["bosses"] = {
                {
                    ["id"] = 1637,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Flame Leviathan", -- artid 1385731
                    ["name"] = "烈焰巨兽",
                }, -- [1]
                {
                    ["id"] = 1638,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ignis the Furnace Master", -- artid 1385742
                    ["name"] = "掌炉者伊格尼斯",
                }, -- [2]
                {
                    ["id"] = 1639,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Razorscale", -- artid 1385763
                    ["name"] = "锋鳞",
                }, -- [3]
                {
                    ["id"] = 1640,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-XT 002 Deconstructor", -- artid 1385773
                    ["name"] = "XT-002拆解者",
                }, -- [4]
                {
                    ["id"] = 1641,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Assembly Of Iron", -- artid 1390439
                    ["name"] = "钢铁议会",
                }, -- [5]
                {
                    ["id"] = 1642,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kologarn", -- artid 1385747
                    ["name"] = "科隆加恩",
                }, -- [6]
                {
                    ["id"] = 1643,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Auriaya", -- artid 1385717
                    ["name"] = "欧尔莉亚",
                }, -- [7]
                {
                    ["id"] = 1644,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hodir", -- artid 1385740
                    ["name"] = "霍迪尔",
                }, -- [8]
                {
                    ["id"] = 1645,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thorim", -- artid 1385770
                    ["name"] = "托里姆",
                }, -- [9]
                {
                    ["id"] = 1646,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Freya", -- artid 1385733
                    ["name"] = "弗蕾亚",
                }, -- [10]
                {
                    ["id"] = 1647,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mimiron", -- artid 1385754
                    ["name"] = "米米尔隆",
                }, -- [11]
                {
                    ["id"] = 1648,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-General Vezax", -- artid 1385735
                    ["name"] = "维扎克斯将军",
                }, -- [12]
                {
                    ["id"] = 1649,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Yogg Saron", -- artid 1385774
                    ["name"] = "尤格-萨隆",
                }, -- [13]
                {
                    ["id"] = 1650,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Algalon the Observer", -- artid 1385713
                    ["name"] = "观察者奥尔加隆",
                }, -- [14]
            },
        }, -- [5]
        {
            ["id"] = 757,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TrialoftheCrusader", -- artid 1396594
            ["name"] = "十字军的试炼",
            ["bosses"] = {
                {
                    ["id"] = 1618,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Northrend Beasts", -- artid 1390440
                    ["name"] = "诺森德猛兽",
                }, -- [1]
                {
                    ["id"] = 1619,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Jaraxxus", -- artid 1385752
                    ["name"] = "加拉克苏斯大王",
                }, -- [2]
                {
                    ["id"] = 1620,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-PVP Event Vs Horde", -- artid 1390442
                    ["name"] = "联盟的冠军",
                }, -- [3]
                {
                    ["id"] = 1622,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Twin Valkyr", -- artid 1390443
                    ["name"] = "瓦格里双子",
                }, -- [4]
                {
                    ["id"] = 1623,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Anubarak", -- artid 607542
                    ["name"] = "阿努巴拉克",
                }, -- [5]
            },
        }, -- [6]
        {
            ["id"] = 760,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Onyxia", -- artid 1396589
            ["name"] = "奥妮克希亚的巢穴",
            ["bosses"] = {
                {
                    ["id"] = 1651,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Onyxia", -- artid 1379025
                    ["name"] = "奥妮克希亚",
                }, -- [1]
            },
        }, -- [7]
        {
            ["id"] = 758,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-IcecrownCitadel", -- artid 1396583
            ["name"] = "冰冠堡垒",
            ["bosses"] = {
                {
                    ["id"] = 1624,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Marrowgar", -- artid 1378992
                    ["name"] = "玛洛加尔领主",
                }, -- [1]
                {
                    ["id"] = 1625,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lady Deathwhisper", -- artid 1378990
                    ["name"] = "亡语者女士",
                }, -- [2]
                {
                    ["id"] = 1627,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gunship Alliance", -- artid 1385736
                    ["name"] = "冰冠冰川炮舰战",
                }, -- [3]
                {
                    ["id"] = 1628,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Deathbringer Saurfang", -- artid 1378970
                    ["name"] = "死亡使者萨鲁法尔",
                }, -- [4]
                {
                    ["id"] = 1629,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Festergut", -- artid 1378972
                    ["name"] = "烂肠",
                }, -- [5]
                {
                    ["id"] = 1630,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rotface", -- artid 1379009
                    ["name"] = "腐面",
                }, -- [6]
                {
                    ["id"] = 1631,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Professor Putricide", -- artid 1379007
                    ["name"] = "普崔塞德教授",
                }, -- [7]
                {
                    ["id"] = 1632,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Blood Prince Council", -- artid 1385721
                    ["name"] = "鲜血王子议会",
                }, -- [8]
                {
                    ["id"] = 1633,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Blood Queen Lanathel", -- artid 1378967
                    ["name"] = "鲜血女王兰娜瑟尔",
                }, -- [9]
                {
                    ["id"] = 1634,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Valithria Dreamwalker", -- artid 1379023
                    ["name"] = "踏梦者瓦莉瑟瑞娅",
                }, -- [10]
                {
                    ["id"] = 1635,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sindragosa", -- artid 1379014
                    ["name"] = "辛达苟萨",
                }, -- [11]
                {
                    ["id"] = 1636,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lich King", -- artid 607688
                    ["name"] = "巫妖王",
                }, -- [12]
            },
        }, -- [8]
        {
            ["id"] = 761,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-RubySanctum", -- artid 1396590
            ["name"] = "红玉圣殿",
            ["bosses"] = {
                {
                    ["id"] = 1652,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Halion", -- artid 1385738
                    ["name"] = "海里昂",
                }, -- [1]
            },
        }, -- [9]
        {
            ["id"] = 286,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-UtgardePinnacle", -- artid 608227
            ["name"] = "乌特加德之巅",
            ["bosses"] = {
                {
                    ["id"] = 641,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Svala Sorrowgrave", -- artid 607778
                    ["name"] = "席瓦拉·索格蕾",
                }, -- [1]
                {
                    ["id"] = 642,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gortok Palehoof", -- artid 607620
                    ["name"] = "戈托克·苍蹄",
                }, -- [2]
                {
                    ["id"] = 643,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Skadi the Ruthless", -- artid 607773
                    ["name"] = "残忍的斯卡迪",
                }, -- [3]
                {
                    ["id"] = 644,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-King Ymiron", -- artid 607674
                    ["name"] = "伊米隆国王",
                }, -- [4]
            },
        }, -- [10]
        {
            ["id"] = 285,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-UtgardeKeep", -- artid 608226
            ["name"] = "乌特加德城堡",
            ["bosses"] = {
                {
                    ["id"] = 638,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Prince Keleseth", -- artid 607743
                    ["name"] = "凯雷塞斯王子",
                }, -- [1]
                {
                    ["id"] = 639,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Skarvald the Constructor", -- artid 607774
                    ["name"] = "斯卡瓦尔德和达尔隆",
                }, -- [2]
                {
                    ["id"] = 640,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ingvar the Plunderer", -- artid 607659
                    ["name"] = "掠夺者因格瓦尔",
                }, -- [3]
            },
        }, -- [11]
        {
            ["id"] = 284,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TrialOfTheChampion", -- artid 608224
            ["name"] = "冠军的试炼",
            ["bosses"] = {
                {
                    ["id"] = 834,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grand Champions-Alliance", -- artid 607621
                    ["name"] = "总冠军",
                }, -- [1]
                {
                    ["id"] = 635,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Eadric the Pure", -- artid 607591
                    ["name"] = "纯洁者耶德瑞克",
                }, -- [2]
                {
                    ["id"] = 636,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Argent Confessor Paletress", -- artid 607547
                    ["name"] = "银色神官帕尔崔丝",
                }, -- [3]
                {
                    ["id"] = 637,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Black Knight", -- artid 607787
                    ["name"] = "黑骑士",
                }, -- [4]
            },
        }, -- [12]
        {
            ["id"] = 279,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheCullingOfStratholme", -- artid 608219
            ["name"] = "净化斯坦索姆",
            ["bosses"] = {
                {
                    ["id"] = 611,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Meathook", -- artid 607711
                    ["name"] = "肉钩",
                }, -- [1]
                {
                    ["id"] = 612,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Salramm the Fleshcrafter", -- artid 607763
                    ["name"] = "塑血者沙尔拉姆",
                }, -- [2]
                {
                    ["id"] = 613,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Chrono Lord Epoch", -- artid 607567
                    ["name"] = "时光领主埃博克",
                }, -- [3]
                {
                    ["id"] = 614,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-MalGanis", -- artid 607708
                    ["name"] = "玛尔加尼斯",
                }, -- [4]
            },
        }, -- [13]
        {
            ["id"] = 274,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Gundrak", -- artid 608203
            ["name"] = "古达克",
            ["bosses"] = {
                {
                    ["id"] = 592,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sladran", -- artid 607776
                    ["name"] = "斯拉德兰",
                }, -- [1]
                {
                    ["id"] = 593,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Drakkari Colossus", -- artid 607589
                    ["name"] = "达卡莱巨像",
                }, -- [2]
                {
                    ["id"] = 594,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Moorabi", -- artid 607716
                    ["name"] = "莫拉比",
                }, -- [3]
                {
                    ["id"] = 596,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Galdarah", -- artid 607605
                    ["name"] = "迦尔达拉",
                }, -- [4]
            },
        }, -- [14]
        {
            ["id"] = 271,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-AhnkahetTheOldKingdom", -- artid 608192
            ["name"] = "安卡赫特：古代王国",
            ["bosses"] = {
                {
                    ["id"] = 580,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Elder Nadox", -- artid 607593
                    ["name"] = "纳多克斯长老",
                }, -- [1]
                {
                    ["id"] = 581,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Prince Taldaram", -- artid 607744
                    ["name"] = "塔达拉姆王子",
                }, -- [2]
                {
                    ["id"] = 582,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Jedoga Shadowseeker", -- artid 607667
                    ["name"] = "耶戈达·觅影者",
                }, -- [3]
                {
                    ["id"] = 584,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Herald Volazj", -- artid 607639
                    ["name"] = "传令官沃拉兹",
                }, -- [4]
            },
        }, -- [15]
        {
            ["id"] = 277,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HallsofStone", -- artid 608206
            ["name"] = "岩石大厅",
            ["bosses"] = {
                {
                    ["id"] = 604,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Krystallus", -- artid 607679
                    ["name"] = "克莱斯塔卢斯",
                }, -- [1]
                {
                    ["id"] = 605,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maiden of Grief", -- artid 607706
                    ["name"] = "悲伤圣女",
                }, -- [2]
                {
                    ["id"] = 606,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Tribunal of the Ages", -- artid 607797
                    ["name"] = "远古法庭",
                }, -- [3]
                {
                    ["id"] = 607,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sjonnir the Ironshaper", -- artid 607772
                    ["name"] = "塑铁者斯约尼尔",
                }, -- [4]
            },
        }, -- [16]
        {
            ["id"] = 276,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HallsofReflection", -- artid 608205
            ["name"] = "映像大厅",
            ["bosses"] = {
                {
                    ["id"] = 601,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Falric", -- artid 607601
                    ["name"] = "法瑞克",
                }, -- [1]
                {
                    ["id"] = 602,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Marwyn", -- artid 607710
                    ["name"] = "玛维恩",
                }, -- [2]
                {
                    ["id"] = 603,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lich King", -- artid 607688
                    ["name"] = "逃离阿尔萨斯",
                }, -- [3]
            },
        }, -- [17]
        {
            ["id"] = 280,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheForgeofSouls", -- artid 608220
            ["name"] = "灵魂洪炉",
            ["bosses"] = {
                {
                    ["id"] = 615,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Bronjahm", -- artid 607559
                    ["name"] = "布隆亚姆",
                }, -- [1]
                {
                    ["id"] = 616,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Devourer of Souls", -- artid 607585
                    ["name"] = "噬魂者",
                }, -- [2]
            },
        }, -- [18]
        {
            ["id"] = 283,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-VioletHold", -- artid 608228
            ["name"] = "紫罗兰监狱",
            ["bosses"] = {
                {
                    ["id"] = 626,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Erekem", -- artid 607597
                    ["name"] = "埃雷克姆",
                }, -- [1]
                {
                    ["id"] = 627,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Moragg", -- artid 607717
                    ["name"] = "摩拉格",
                }, -- [2]
                {
                    ["id"] = 628,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ichoron", -- artid 607654
                    ["name"] = "艾库隆",
                }, -- [3]
                {
                    ["id"] = 629,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Xevozz", -- artid 607821
                    ["name"] = "谢沃兹",
                }, -- [4]
                {
                    ["id"] = 630,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lavanthor", -- artid 607685
                    ["name"] = "拉文索尔",
                }, -- [5]
                {
                    ["id"] = 631,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Zuramat the Obliterator", -- artid 607825
                    ["name"] = "湮灭者祖拉玛特",
                }, -- [6]
                {
                    ["id"] = 632,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Cyanigosa", -- artid 607573
                    ["name"] = "塞安妮苟萨",
                }, -- [7]
            },
        }, -- [19]
        {
            ["id"] = 272,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-AzjolNerub", -- artid 608194
            ["name"] = "艾卓-尼鲁布",
            ["bosses"] = {
                {
                    ["id"] = 585,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Krikthir the Gatewatcher", -- artid 607678
                    ["name"] = "看门者克里克希尔",
                }, -- [1]
                {
                    ["id"] = 586,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hadronox", -- artid 607633
                    ["name"] = "哈多诺克斯",
                }, -- [2]
                {
                    ["id"] = 587,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Anubarak", -- artid 607542
                    ["name"] = "阿努巴拉克",
                }, -- [3]
            },
        }, -- [20]
        {
            ["id"] = 278,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-PitofSaron", -- artid 608210
            ["name"] = "萨隆矿坑",
            ["bosses"] = {
                {
                    ["id"] = 608,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Forgemaster Garfrost", -- artid 607603
                    ["name"] = "熔炉之主加弗斯特",
                }, -- [1]
                {
                    ["id"] = 609,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Krick", -- artid 607677
                    ["name"] = "伊克和科瑞克",
                }, -- [2]
                {
                    ["id"] = 610,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Scourgelord Tyrannus", -- artid 607765
                    ["name"] = "天灾领主泰兰努斯",
                }, -- [3]
            },
        }, -- [21]
        {
            ["id"] = 273,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-DrakTharonKeep", -- artid 608201
            ["name"] = "达克萨隆要塞",
            ["bosses"] = {
                {
                    ["id"] = 588,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Trollgore", -- artid 607798
                    ["name"] = "托尔戈",
                }, -- [1]
                {
                    ["id"] = 589,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Novos the Summoner", -- artid 607727
                    ["name"] = "召唤者诺沃斯",
                }, -- [2]
                {
                    ["id"] = 590,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-King Dred", -- artid 607672
                    ["name"] = "暴龙之王爵德",
                }, -- [3]
                {
                    ["id"] = 591,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Prophet Tharonja", -- artid 607790
                    ["name"] = "先知萨隆亚",
                }, -- [4]
            },
        }, -- [22]
        {
            ["id"] = 275,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HallsofLightning", -- artid 608204
            ["name"] = "闪电大厅",
            ["bosses"] = {
                {
                    ["id"] = 597,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-General Bjarngrim", -- artid 607611
                    ["name"] = "比亚格里将军",
                }, -- [1]
                {
                    ["id"] = 598,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Volkhan", -- artid 607809
                    ["name"] = "沃尔坎",
                }, -- [2]
                {
                    ["id"] = 599,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ionar", -- artid 607663
                    ["name"] = "艾欧纳尔",
                }, -- [3]
                {
                    ["id"] = 600,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Loken", -- artid 607690
                    ["name"] = "洛肯",
                }, -- [4]
            },
        }, -- [23]
        {
            ["id"] = 281,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheNexus", -- artid 608221
            ["name"] = "魔枢",
            ["bosses"] = {
                {
                    ["id"] = 618,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grand Magus Telestra", -- artid 607623
                    ["name"] = "大魔导师泰蕾丝塔",
                }, -- [1]
                {
                    ["id"] = 619,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Anomalus", -- artid 607540
                    ["name"] = "阿诺玛鲁斯",
                }, -- [2]
                {
                    ["id"] = 620,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ormorok the Tree Shaper", -- artid 607735
                    ["name"] = "塑树者奥莫洛克",
                }, -- [3]
                {
                    ["id"] = 621,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Keristrasza", -- artid 607671
                    ["name"] = "克莉斯塔萨",
                }, -- [4]
            },
        }, -- [24]
        {
            ["id"] = 282,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheOculus", -- artid 608222
            ["name"] = "魔环",
            ["bosses"] = {
                {
                    ["id"] = 622,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Drakos the Interrogator", -- artid 607590
                    ["name"] = "审讯者达库斯",
                }, -- [1]
                {
                    ["id"] = 623,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Varos Cloudstrider", -- artid 607802
                    ["name"] = "瓦尔洛斯·云击",
                }, -- [2]
                {
                    ["id"] = 624,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mage Lord Urom", -- artid 607702
                    ["name"] = "法师领主伊洛姆",
                }, -- [3]
                {
                    ["id"] = 625,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ley Guardian Eregos", -- artid 607687
                    ["name"] = "魔网守护者埃雷苟斯",
                }, -- [4]
            },
        }, -- [25]
    },
    ["燃烧的远征"] = {
        {
            ["id"] = 745,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Karazhan", -- artid 1396584
            ["name"] = "卡拉赞",
            ["bosses"] = {
                {
                    ["id"] = 1552,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Servant Quarters", -- artid 1385766
                    ["name"] = "仆役宿舍",
                }, -- [1]
                {
                    ["id"] = 1553,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Attumen the Huntsman", -- artid 1378965
                    ["name"] = "猎手阿图门",
                }, -- [2]
                {
                    ["id"] = 1554,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Moroes", -- artid 1378999
                    ["name"] = "莫罗斯",
                }, -- [3]
                {
                    ["id"] = 1555,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maiden of Virtue", -- artid 1378997
                    ["name"] = "贞节圣女",
                }, -- [4]
                {
                    ["id"] = 1556,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Opera", -- artid 1385758
                    ["name"] = "歌剧院",
                }, -- [5]
                {
                    ["id"] = 1557,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Curator", -- artid 1379020
                    ["name"] = "馆长",
                }, -- [6]
                {
                    ["id"] = 1559,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shade of Aran", -- artid 1379012
                    ["name"] = "埃兰之影",
                }, -- [7]
                {
                    ["id"] = 1560,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Terestian Illhoof", -- artid 1379017
                    ["name"] = "特雷斯坦·邪蹄",
                }, -- [8]
                {
                    ["id"] = 1561,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Netherspite", -- artid 1379002
                    ["name"] = "虚空幽龙",
                }, -- [9]
                {
                    ["id"] = 1764,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Chess Alliance", -- artid 1385724
                    ["name"] = "国际象棋",
                }, -- [10]
                {
                    ["id"] = 1563,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Prince Malchezaar", -- artid 1379006
                    ["name"] = "玛克扎尔王子",
                }, -- [11]
            },
        }, -- [1]
        {
            ["id"] = 746,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-GruulsLair", -- artid 1396582
            ["name"] = "格鲁尔的巢穴",
            ["bosses"] = {
                {
                    ["id"] = 1564,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High King Maulgar", -- artid 1378985
                    ["name"] = "莫加尔大王",
                }, -- [1]
                {
                    ["id"] = 1565,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gruul the Dragonkiller", -- artid 1378982
                    ["name"] = "屠龙者格鲁尔",
                }, -- [2]
            },
        }, -- [2]
        {
            ["id"] = 747,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-MagtheridonsLair", -- artid 1396585
            ["name"] = "玛瑟里顿的巢穴",
            ["bosses"] = {
                {
                    ["id"] = 1566,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Magtheridon", -- artid 1378996
                    ["name"] = "玛瑟里顿",
                }, -- [1]
            },
        }, -- [3]
        {
            ["id"] = 748,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CoilfangReservoir", -- artid 608199
            ["name"] = "毒蛇神殿",
            ["bosses"] = {
                {
                    ["id"] = 1567,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hydross the Unstable", -- artid 1385741
                    ["name"] = "不稳定的海度斯",
                }, -- [1]
                {
                    ["id"] = 1568,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Lurker Below", -- artid 1385768
                    ["name"] = "鱼斯拉",
                }, -- [2]
                {
                    ["id"] = 1569,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Leotheras the Blind", -- artid 1385751
                    ["name"] = "盲眼者莱欧瑟拉斯",
                }, -- [3]
                {
                    ["id"] = 1570,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Fathom Lord Karathress", -- artid 1385729
                    ["name"] = "深水领主卡拉瑟雷斯",
                }, -- [4]
                {
                    ["id"] = 1571,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Morogrim Tidewalker", -- artid 1385756
                    ["name"] = "莫洛格里·踏潮者",
                }, -- [5]
                {
                    ["id"] = 1572,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lady Vashj", -- artid 1385750
                    ["name"] = "瓦丝琪",
                }, -- [6]
            },
        }, -- [4]
        {
            ["id"] = 749,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TempestKeep", -- artid 608218
            ["name"] = "风暴要塞",
            ["bosses"] = {
                {
                    ["id"] = 1573,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Alar", -- artid 1385712
                    ["name"] = "奥",
                }, -- [1]
                {
                    ["id"] = 1574,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Void Reaver", -- artid 1385772
                    ["name"] = "空灵机甲",
                }, -- [2]
                {
                    ["id"] = 1575,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Astromancer Solarian", -- artid 1385739
                    ["name"] = "大星术师索兰莉安",
                }, -- [3]
                {
                    ["id"] = 1576,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-KaelThas Sunstrider", -- artid 607669
                    ["name"] = "凯尔萨斯·逐日者",
                }, -- [4]
            },
        }, -- [5]
        {
            ["id"] = 750,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CavernsOfTime", -- artid 608198
            ["name"] = "海加尔峰",
            ["bosses"] = {
                {
                    ["id"] = 1577,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rage Winterchill", -- artid 1385762
                    ["name"] = "雷基·冬寒",
                }, -- [1]
                {
                    ["id"] = 1578,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Anetheron", -- artid 1385714
                    ["name"] = "安纳塞隆",
                }, -- [2]
                {
                    ["id"] = 1579,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kazrogal", -- artid 1385745
                    ["name"] = "卡兹洛加",
                }, -- [3]
                {
                    ["id"] = 1580,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Azgalor", -- artid 1385719
                    ["name"] = "阿兹加洛",
                }, -- [4]
                {
                    ["id"] = 1581,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Archimonde", -- artid 1385716
                    ["name"] = "阿克蒙德",
                }, -- [5]
            },
        }, -- [6]
        {
            ["id"] = 751,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-BlackTemple", -- artid 1396579
            ["name"] = "黑暗神殿",
            ["bosses"] = {
                {
                    ["id"] = 1582,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Warlord Najentus", -- artid 1378986
                    ["name"] = "高阶督军纳因图斯",
                }, -- [1]
                {
                    ["id"] = 1583,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Supremus", -- artid 1379016
                    ["name"] = "苏普雷姆斯",
                }, -- [2]
                {
                    ["id"] = 1584,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shade of Akama", -- artid 1379011
                    ["name"] = "阿卡玛之影",
                }, -- [3]
                {
                    ["id"] = 1585,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Teron Gorefiend", -- artid 1379018
                    ["name"] = "塔隆·血魔",
                }, -- [4]
                {
                    ["id"] = 1586,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gurtogg Bloodboil", -- artid 1378983
                    ["name"] = "古尔图格·血沸",
                }, -- [5]
                {
                    ["id"] = 1587,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Reliquary of Souls", -- artid 1385764
                    ["name"] = "灵魂之匣",
                }, -- [6]
                {
                    ["id"] = 1588,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mother Shahraz", -- artid 1379000
                    ["name"] = "莎赫拉丝主母",
                }, -- [7]
                {
                    ["id"] = 1589,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Illidari Council", -- artid 1385743
                    ["name"] = "伊利达雷议会",
                }, -- [8]
                {
                    ["id"] = 1590,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Illidan Stormrage", -- artid 1378987
                    ["name"] = "伊利丹·怒风",
                }, -- [9]
            },
        }, -- [7]
        {
            ["id"] = 752,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-SunwellPlateau", -- artid 1396592
            ["name"] = "太阳之井高地",
            ["bosses"] = {
                {
                    ["id"] = 1591,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kalecgos", -- artid 1385744
                    ["name"] = "卡雷苟斯",
                }, -- [1]
                {
                    ["id"] = 1592,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Brutallus", -- artid 1385722
                    ["name"] = "布鲁塔卢斯",
                }, -- [2]
                {
                    ["id"] = 1593,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Felmyst", -- artid 1385730
                    ["name"] = "菲米丝",
                }, -- [3]
                {
                    ["id"] = 1594,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Eredar Twins", -- artid 1390438
                    ["name"] = "艾瑞达双子",
                }, -- [4]
                {
                    ["id"] = 1595,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Muru", -- artid 1385757
                    ["name"] = "穆鲁",
                }, -- [5]
                {
                    ["id"] = 1596,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kiljaeden", -- artid 1385746
                    ["name"] = "基尔加丹",
                }, -- [6]
            },
        }, -- [8]
        {
            ["id"] = 248,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HellfireCitadel", -- artid 608207
            ["name"] = "地狱火城墙",
            ["bosses"] = {
                {
                    ["id"] = 527,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Watchkeeper Gargolmar", -- artid 607817
                    ["name"] = "巡视者加戈玛",
                }, -- [1]
                {
                    ["id"] = 528,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Omor the Unscarred", -- artid 607734
                    ["name"] = "无疤者奥摩尔",
                }, -- [2]
                {
                    ["id"] = 529,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Vazruden", -- artid 607803
                    ["name"] = "传令官瓦兹德",
                }, -- [3]
            },
        }, -- [9]
        {
            ["id"] = 252,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Auchindoun", -- artid 608193
            ["name"] = "塞泰克大厅",
            ["bosses"] = {
                {
                    ["id"] = 541,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Darkweaver Syth", -- artid 607583
                    ["name"] = "黑暗编织者塞斯",
                }, -- [1]
                {
                    ["id"] = 543,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Talon King Ikiss", -- artid 607780
                    ["name"] = "利爪之王艾吉斯",
                }, -- [2]
            },
        }, -- [10]
        {
            ["id"] = 247,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Auchindoun", -- artid 608193
            ["name"] = "奥金尼地穴",
            ["bosses"] = {
                {
                    ["id"] = 523,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shirrak the Dead Watcher", -- artid 607771
                    ["name"] = "死亡观察者希尔拉克",
                }, -- [1]
                {
                    ["id"] = 524,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Exarch Maladaar", -- artid 607600
                    ["name"] = "大主教玛拉达尔",
                }, -- [2]
            },
        }, -- [11]
        {
            ["id"] = 260,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CoilfangReservoir", -- artid 608199
            ["name"] = "奴隶围栏",
            ["bosses"] = {
                {
                    ["id"] = 570,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mennu the Betrayer", -- artid 607715
                    ["name"] = "背叛者门努",
                }, -- [1]
                {
                    ["id"] = 571,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rokmar the Crackler", -- artid 607759
                    ["name"] = "巨钳鲁克玛尔",
                }, -- [2]
                {
                    ["id"] = 572,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Quagmirran", -- artid 607750
                    ["name"] = "夸格米拉",
                }, -- [3]
            },
        }, -- [12]
        {
            ["id"] = 262,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CoilfangReservoir", -- artid 608199
            ["name"] = "幽暗沼泽",
            ["bosses"] = {
                {
                    ["id"] = 576,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hungarfen", -- artid 607649
                    ["name"] = "霍加尔芬",
                }, -- [1]
                {
                    ["id"] = 577,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ghazan", -- artid 607614
                    ["name"] = "加兹安",
                }, -- [2]
                {
                    ["id"] = 578,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Swamplord Muselek", -- artid 607779
                    ["name"] = "沼地领主穆塞雷克",
                }, -- [3]
                {
                    ["id"] = 579,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Black Stalker", -- artid 607788
                    ["name"] = "黑色阔步者",
                }, -- [4]
            },
        }, -- [13]
        {
            ["id"] = 251,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CavernsOfTime", -- artid 608198
            ["name"] = "旧希尔斯布莱德丘陵",
            ["bosses"] = {
                {
                    ["id"] = 538,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lieutenant Drake", -- artid 607689
                    ["name"] = "德拉克中尉",
                }, -- [1]
                {
                    ["id"] = 539,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Captain Skarloc", -- artid 607561
                    ["name"] = "斯卡洛克上尉",
                }, -- [2]
                {
                    ["id"] = 540,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Epoch Hunter", -- artid 607596
                    ["name"] = "时空猎手",
                }, -- [3]
            },
        }, -- [14]
        {
            ["id"] = 253,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Auchindoun", -- artid 608193
            ["name"] = "暗影迷宫",
            ["bosses"] = {
                {
                    ["id"] = 544,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ambassador Hellmaw", -- artid 607536
                    ["name"] = "赫尔默大使",
                }, -- [1]
                {
                    ["id"] = 545,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Blackheart the Inciter", -- artid 607555
                    ["name"] = "煽动者布莱卡特",
                }, -- [2]
                {
                    ["id"] = 546,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grandmaster Vorpil", -- artid 607625
                    ["name"] = "沃匹尔大师",
                }, -- [3]
                {
                    ["id"] = 547,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Murmur", -- artid 607720
                    ["name"] = "摩摩尔",
                }, -- [4]
            },
        }, -- [15]
        {
            ["id"] = 250,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Auchindoun", -- artid 608193
            ["name"] = "法力陵墓",
            ["bosses"] = {
                {
                    ["id"] = 534,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Pandemonius", -- artid 607738
                    ["name"] = "潘德莫努斯",
                }, -- [1]
                {
                    ["id"] = 535,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Tavarok", -- artid 607782
                    ["name"] = "塔瓦洛克",
                }, -- [2]
                {
                    ["id"] = 537,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Nexus Prince Shaffar", -- artid 607726
                    ["name"] = "节点亲王沙法尔",
                }, -- [3]
            },
        }, -- [16]
        {
            ["id"] = 257,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TempestKeep", -- artid 608218
            ["name"] = "生态船",
            ["bosses"] = {
                {
                    ["id"] = 558,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Commander Sarannis", -- artid 607570
                    ["name"] = "指挥官萨拉妮丝",
                }, -- [1]
                {
                    ["id"] = 559,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Botanist Freywinn", -- artid 607641
                    ["name"] = "高级植物学家弗雷温",
                }, -- [2]
                {
                    ["id"] = 560,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thorngrin the Tender", -- artid 607794
                    ["name"] = "看管者索恩格林",
                }, -- [3]
                {
                    ["id"] = 561,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Laj", -- artid 607683
                    ["name"] = "拉伊",
                }, -- [4]
                {
                    ["id"] = 562,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warp Splinter", -- artid 607816
                    ["name"] = "迁跃扭木",
                }, -- [5]
            },
        }, -- [17]
        {
            ["id"] = 259,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HellfireCitadel", -- artid 608207
            ["name"] = "破碎大厅",
            ["bosses"] = {
                {
                    ["id"] = 566,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grand Warlock Nethekurse", -- artid 607624
                    ["name"] = "高阶术士奈瑟库斯",
                }, -- [1]
                {
                    ["id"] = 568,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warbringer Omrogg", -- artid 607811
                    ["name"] = "战争使者沃姆罗格",
                }, -- [2]
                {
                    ["id"] = 569,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warchief Kargath Bladefist", -- artid 607812
                    ["name"] = "酋长卡加斯·刃拳",
                }, -- [3]
            },
        }, -- [18]
        {
            ["id"] = 254,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TempestKeep", -- artid 608218
            ["name"] = "禁魔监狱",
            ["bosses"] = {
                {
                    ["id"] = 548,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Zereketh the Unbound", -- artid 607823
                    ["name"] = "自由的瑟雷凯斯",
                }, -- [1]
                {
                    ["id"] = 549,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Dalliah the Doomsayer", -- artid 607574
                    ["name"] = "末日预言者达尔莉安",
                }, -- [2]
                {
                    ["id"] = 550,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Wrath Scryer Soccothrates", -- artid 607820
                    ["name"] = "天怒预言者苏克拉底",
                }, -- [3]
                {
                    ["id"] = 551,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Harbinger Skyriss", -- artid 607635
                    ["name"] = "预言者斯克瑞斯",
                }, -- [4]
            },
        }, -- [19]
        {
            ["id"] = 258,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TempestKeep", -- artid 608218
            ["name"] = "能源舰",
            ["bosses"] = {
                {
                    ["id"] = 563,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mechano Lord Capacitus", -- artid 607712
                    ["name"] = "机械领主卡帕西图斯",
                }, -- [1]
                {
                    ["id"] = 564,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Nethermancer Sepethrea", -- artid 607725
                    ["name"] = "灵术师塞比瑟蕾",
                }, -- [2]
                {
                    ["id"] = 565,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Pathaleon the Calculator", -- artid 607739
                    ["name"] = "计算者帕萨雷恩",
                }, -- [3]
            },
        }, -- [20]
        {
            ["id"] = 261,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CoilfangReservoir", -- artid 608199
            ["name"] = "蒸汽地窟",
            ["bosses"] = {
                {
                    ["id"] = 573,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hydromancer Thespia", -- artid 607651
                    ["name"] = "水术师瑟丝比娅",
                }, -- [1]
                {
                    ["id"] = 574,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mekgineer Steamrigger", -- artid 607713
                    ["name"] = "机械师斯蒂里格",
                }, -- [2]
                {
                    ["id"] = 575,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warlord Kalithresh", -- artid 607815
                    ["name"] = "督军卡利瑟里斯",
                }, -- [3]
            },
        }, -- [21]
        {
            ["id"] = 249,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-MagistersTerrace", -- artid 608208
            ["name"] = "魔导师平台",
            ["bosses"] = {
                {
                    ["id"] = 530,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Selin Fireheart", -- artid 607767
                    ["name"] = "塞林·火心",
                }, -- [1]
                {
                    ["id"] = 531,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Vexallus", -- artid 607806
                    ["name"] = "维萨鲁斯",
                }, -- [2]
                {
                    ["id"] = 532,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Priestess Delrissa", -- artid 607742
                    ["name"] = "女祭司德莉希亚",
                }, -- [3]
                {
                    ["id"] = 533,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-KaelThas Sunstrider", -- artid 607669
                    ["name"] = "凯尔萨斯·逐日者",
                }, -- [4]
            },
        }, -- [22]
        {
            ["id"] = 256,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HellfireCitadel", -- artid 608207
            ["name"] = "鲜血熔炉",
            ["bosses"] = {
                {
                    ["id"] = 555,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Maker", -- artid 607789
                    ["name"] = "制造者",
                }, -- [1]
                {
                    ["id"] = 556,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Broggok", -- artid 607558
                    ["name"] = "布洛戈克",
                }, -- [2]
                {
                    ["id"] = 557,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kelidan the Breaker", -- artid 607670
                    ["name"] = "击碎者克里丹",
                }, -- [3]
            },
        }, -- [23]
        {
            ["id"] = 255,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CavernsOfTime", -- artid 608198
            ["name"] = "黑色沼泽",
            ["bosses"] = {
                {
                    ["id"] = 552,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Chrono Lord Deja", -- artid 607566
                    ["name"] = "时空领主德亚",
                }, -- [1]
                {
                    ["id"] = 553,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Temporus", -- artid 607784
                    ["name"] = "坦普卢斯",
                }, -- [2]
                {
                    ["id"] = 554,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Aeonus", -- artid 607529
                    ["name"] = "埃欧努斯",
                }, -- [3]
            },
        }, -- [24]
    },
    ["经典旧世"] = {
        {
            ["id"] = 741,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-MoltenCore", -- artid 1396586
            ["name"] = "熔火之心",
            ["bosses"] = {
                {
                    ["id"] = 1519,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lucifron", -- artid 1378993
                    ["name"] = "鲁西弗隆",
                }, -- [1]
                {
                    ["id"] = 1520,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Magmadar", -- artid 1378995
                    ["name"] = "玛格曼达",
                }, -- [2]
                {
                    ["id"] = 1521,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gehennas", -- artid 1378976
                    ["name"] = "基赫纳斯",
                }, -- [3]
                {
                    ["id"] = 1522,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Garr", -- artid 1378975
                    ["name"] = "加尔",
                }, -- [4]
                {
                    ["id"] = 1523,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shazzrah", -- artid 1379013
                    ["name"] = "沙斯拉尔",
                }, -- [5]
                {
                    ["id"] = 1524,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Baron Geddon", -- artid 1378966
                    ["name"] = "迦顿男爵",
                }, -- [6]
                {
                    ["id"] = 1525,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sulfuron Harbinger", -- artid 1379015
                    ["name"] = "萨弗隆先驱者",
                }, -- [7]
                {
                    ["id"] = 1526,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Golemagg the Incinerator", -- artid 1378978
                    ["name"] = "焚化者古雷曼格",
                }, -- [8]
                {
                    ["id"] = 1527,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Majordomo Executus", -- artid 1378998
                    ["name"] = "管理者埃克索图斯",
                }, -- [9]
                {
                    ["id"] = 1528,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ragnaros", -- artid 522261
                    ["name"] = "拉格纳罗斯",
                }, -- [10]
            },
        }, -- [1]
        {
            ["id"] = 742,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-BlackwingLair", -- artid 1396580
            ["name"] = "黑翼之巢",
            ["bosses"] = {
                {
                    ["id"] = 1529,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Razorgore the Untamed", -- artid 1379008
                    ["name"] = "狂野的拉佐格尔",
                }, -- [1]
                {
                    ["id"] = 1530,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Vaelastrasz the Corrupt", -- artid 1379022
                    ["name"] = "堕落的瓦拉斯塔兹",
                }, -- [2]
                {
                    ["id"] = 1531,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Broodlord Lashlayer", -- artid 1378968
                    ["name"] = "勒什雷尔",
                }, -- [3]
                {
                    ["id"] = 1532,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Firemaw", -- artid 1378973
                    ["name"] = "费尔默",
                }, -- [4]
                {
                    ["id"] = 1533,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ebonroc", -- artid 1378971
                    ["name"] = "埃博诺克",
                }, -- [5]
                {
                    ["id"] = 1534,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Flamegor", -- artid 1378974
                    ["name"] = "弗莱格尔",
                }, -- [6]
                {
                    ["id"] = 1535,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Chromaggus", -- artid 1378969
                    ["name"] = "克洛玛古斯",
                }, -- [7]
                {
                    ["id"] = 1536,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Nefarian", -- artid 1379001
                    ["name"] = "奈法利安",
                }, -- [8]
            },
        }, -- [2]
        {
            ["id"] = 743,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-RuinsofAhnQiraj", -- artid 1396591
            ["name"] = "安其拉废墟",
            ["bosses"] = {
                {
                    ["id"] = 1537,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kurinnaxx", -- artid 1385749
                    ["name"] = "库林纳克斯",
                }, -- [1]
                {
                    ["id"] = 1538,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-General Rajaxx", -- artid 1385734
                    ["name"] = "拉贾克斯将军",
                }, -- [2]
                {
                    ["id"] = 1539,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Moam", -- artid 1385755
                    ["name"] = "莫阿姆",
                }, -- [3]
                {
                    ["id"] = 1540,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Buru the Gorger", -- artid 1385723
                    ["name"] = "吞咽者布鲁",
                }, -- [4]
                {
                    ["id"] = 1541,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ayamiss the Hunter", -- artid 1385718
                    ["name"] = "狩猎者阿亚米斯",
                }, -- [5]
                {
                    ["id"] = 1542,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ossirian the Unscarred", -- artid 1385759
                    ["name"] = "无疤者奥斯里安",
                }, -- [6]
            },
        }, -- [3]
        {
            ["id"] = 744,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TempleofAhnQiraj", -- artid 1396593
            ["name"] = "安其拉",
            ["bosses"] = {
                {
                    ["id"] = 1543,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Prophet Skeram", -- artid 1385769
                    ["name"] = "预言者斯克拉姆",
                }, -- [1]
                {
                    ["id"] = 1547,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Silithid Royalty", -- artid 1390436
                    ["name"] = "安其拉三宝",
                }, -- [2]
                {
                    ["id"] = 1544,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Battleguard Sartura", -- artid 1385720
                    ["name"] = "沙尔图拉",
                }, -- [3]
                {
                    ["id"] = 1545,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Fankriss the Unyielding", -- artid 1385728
                    ["name"] = "顽强的范克瑞斯",
                }, -- [4]
                {
                    ["id"] = 1548,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Viscidus", -- artid 1385771
                    ["name"] = "维希度斯",
                }, -- [5]
                {
                    ["id"] = 1546,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Princess Huhuran", -- artid 1385761
                    ["name"] = "哈霍兰公主",
                }, -- [6]
                {
                    ["id"] = 1549,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Twin Emperors", -- artid 1390437
                    ["name"] = "双子皇帝",
                }, -- [7]
                {
                    ["id"] = 1550,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ouro", -- artid 1385760
                    ["name"] = "奥罗",
                }, -- [8]
                {
                    ["id"] = 1551,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-CThun", -- artid 1385726
                    ["name"] = "克苏恩",
                }, -- [9]
            },
        }, -- [4]
        {
            ["id"] = 745,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Naxxramas", -- artid 1396587
            ["name"] = "纳克萨玛斯",
            ["bosses"] = {
                {
                    ["id"] = 1552,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-AnubRekhan", -- artid 1378964
                    ["name"] = "阿努布雷坎",
                }, -- [1]
                {
                    ["id"] = 1553,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grand Widow Faerlina", -- artid 1378980
                    ["name"] = "黑女巫法琳娜",
                }, -- [2]
                {
                    ["id"] = 1554,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maexxna", -- artid 1378994
                    ["name"] = "迈克斯纳",
                }, -- [3]
                {
                    ["id"] = 1555,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Noth the Plaguebringer", -- artid 1379004
                    ["name"] = "药剂师诺斯",
                }, -- [4]
                {
                    ["id"] = 1556,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Heigan the Unclean", -- artid 1378984
                    ["name"] = "肮脏的希尔盖",
                }, -- [5]
                {
                    ["id"] = 1557,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Loatheb", -- artid 1378991
                    ["name"] = "洛欧塞布",
                }, -- [6]
                {
                    ["id"] = 1558,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Instructor Razuvious", -- artid 1378988
                    ["name"] = "教官拉苏维奥斯",
                }, -- [7]
                {
                    ["id"] = 1559,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gothik the Harvester", -- artid 1378979
                    ["name"] = "收割者戈提克",
                }, -- [8]
                {
                    ["id"] = 1560,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Four Horseman", -- artid 1385732
                    ["name"] = "天启四骑士",
                }, -- [9]
                {
                    ["id"] = 1561,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Patchwerk", -- artid 1379005
                    ["name"] = "帕奇维克",
                }, -- [10]
                {
                    ["id"] = 1562,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grobbulus", -- artid 1378981
                    ["name"] = "格罗布鲁斯",
                }, -- [11]
                {
                    ["id"] = 1563,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gluth", -- artid 1378977
                    ["name"] = "格拉斯",
                }, -- [12]
                {
                    ["id"] = 1564,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thaddius", -- artid 1379019
                    ["name"] = "塔迪乌斯",
                }, -- [13]
                {
                    ["id"] = 1565,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sapphiron", -- artid 1379010
                    ["name"] = "萨菲隆",
                }, -- [14]
                {
                    ["id"] = 1566,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-KelThuzad", -- artid 1378989
                    ["name"] = "克尔苏加德",
                }, -- [15]
            },
        }, -- [5]
        {
            ["id"] = 234,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-RazorfenKraul", -- artid 608213
            ["name"] = "剃刀沼泽",
            ["bosses"] = {
                {
                    ["id"] = 896,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Aggem Thorncurse", -- artid 607531
                    ["name"] = "猎手布塔斯克",
                }, -- [1]
                {
                    ["id"] = 895,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Roogug", -- artid 607760
                    ["name"] = "鲁古格",
                }, -- [2]
                {
                    ["id"] = 899,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Overlord Ramtusk", -- artid 607736
                    ["name"] = "督军拉姆塔斯",
                }, -- [3]
                {
                    ["id"] = 900,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Groyat", -- artid 1064175
                    ["name"] = "盲眼猎手格罗亚特",
                }, -- [4]
                {
                    ["id"] = 901,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Charlga Razorflank", -- artid 607563
                    ["name"] = "卡尔加·刺肋",
                }, -- [5]
            },
        }, -- [6]
        {
            ["id"] = 233,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-RazorfenDowns", -- artid 608212
            ["name"] = "剃刀高地",
            ["bosses"] = {
                {
                    ["id"] = 1142,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hadronox", -- artid 607633
                    ["name"] = "阿鲁克斯",
                }, -- [1]
                {
                    ["id"] = 433,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mordresh Fire Eye", -- artid 607718
                    ["name"] = "火眼莫德雷斯",
                }, -- [2]
                {
                    ["id"] = 1143,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mushlump", -- artid 1064178
                    ["name"] = "麦什伦",
                }, -- [3]
                {
                    ["id"] = 1146,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Death Speaker Jargba", -- artid 607584
                    ["name"] = "亡语者布莱克松",
                }, -- [4]
                {
                    ["id"] = 1141,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Amnennar the Coldbringer", -- artid 607537
                    ["name"] = "寒冰之王亚门纳尔",
                }, -- [5]
            },
        }, -- [7]
        {
            ["id"] = 230,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-DireMaul", -- artid 608200
            ["name"] = "厄运之槌",
            ["bosses"] = {
                {
                    ["id"] = 402,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Zevrim Thornhoof", -- artid 607824
                    ["name"] = "瑟雷姆·刺蹄",
                }, -- [1]
                {
                    ["id"] = 403,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hydrospawn", -- artid 607653
                    ["name"] = "海多斯博恩",
                }, -- [2]
                {
                    ["id"] = 404,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lethtendris", -- artid 607686
                    ["name"] = "蕾瑟塔蒂丝",
                }, -- [3]
                {
                    ["id"] = 405,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Alzzin the Wildshaper", -- artid 607533
                    ["name"] = "荒野变形者奥兹恩",
                }, -- [4]
                {
                    ["id"] = 406,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Tendris Warpwood", -- artid 607785
                    ["name"] = "特迪斯·扭木",
                }, -- [5]
                {
                    ["id"] = 407,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Illyanna Ravenoak", -- artid 607656
                    ["name"] = "伊琳娜·暗木",
                }, -- [6]
                {
                    ["id"] = 408,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Magister Kalendris", -- artid 607703
                    ["name"] = "卡雷迪斯镇长",
                }, -- [7]
                {
                    ["id"] = 409,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Immolthar", -- artid 607657
                    ["name"] = "伊莫塔尔",
                }, -- [8]
                {
                    ["id"] = 410,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Prince Tortheldrin", -- artid 607745
                    ["name"] = "托塞德林王子",
                }, -- [9]
                {
                    ["id"] = 411,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Guard Moldar", -- artid 607630
                    ["name"] = "卫兵摩尔达",
                }, -- [10]
                {
                    ["id"] = 412,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Stomper Kreeg", -- artid 607777
                    ["name"] = "践踏者克雷格",
                }, -- [11]
                {
                    ["id"] = 413,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Guard Fengus", -- artid 607629
                    ["name"] = "卫兵芬古斯",
                }, -- [12]
                {
                    ["id"] = 414,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Guard Slipkik", -- artid 607631
                    ["name"] = "卫兵斯里基克",
                }, -- [13]
                {
                    ["id"] = 415,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Captain Kromcrush", -- artid 607560
                    ["name"] = "克罗卡斯",
                }, -- [14]
                {
                    ["id"] = 416,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-ChoRush the Observer", -- artid 607565
                    ["name"] = "观察者克鲁什",
                }, -- [15]
                {
                    ["id"] = 417,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-King Gordok", -- artid 607673
                    ["name"] = "戈多克大王",
                }, -- [16]
            },
        }, -- [8]
        {
            ["id"] = 240,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-WailingCaverns", -- artid 608229
            ["name"] = "哀嚎洞穴",
            ["bosses"] = {
                {
                    ["id"] = 474,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lady Anacondra", -- artid 607680
                    ["name"] = "安娜科德拉",
                }, -- [1]
                {
                    ["id"] = 476,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Pythas", -- artid 607696
                    ["name"] = "皮萨斯",
                }, -- [2]
                {
                    ["id"] = 475,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Cobrahn", -- artid 607693
                    ["name"] = "考布莱恩",
                }, -- [3]
                {
                    ["id"] = 477,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kresh", -- artid 607676
                    ["name"] = "克雷什",
                }, -- [4]
                {
                    ["id"] = 478,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Skum", -- artid 607775
                    ["name"] = "斯卡姆",
                }, -- [5]
                {
                    ["id"] = 479,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Serpentis", -- artid 607698
                    ["name"] = "瑟芬迪斯",
                }, -- [6]
                {
                    ["id"] = 480,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Verdan the Everliving", -- artid 607805
                    ["name"] = "永生者沃尔丹",
                }, -- [7]
                {
                    ["id"] = 481,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mutanus the Devourer", -- artid 607721
                    ["name"] = "吞噬者穆坦努斯",
                }, -- [8]
            },
        }, -- [9]
        {
            ["id"] = 239,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Uldaman", -- artid 608225
            ["name"] = "奥达曼",
            ["bosses"] = {
                {
                    ["id"] = 467,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Revelosh", -- artid 607757
                    ["name"] = "鲁维罗什",
                }, -- [1]
                {
                    ["id"] = 468,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Baelog", -- artid 607550
                    ["name"] = "失落的矮人",
                }, -- [2]
                {
                    ["id"] = 469,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ironaya", -- artid 607664
                    ["name"] = "艾隆纳亚",
                }, -- [3]
                {
                    ["id"] = 748,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Obsidian Sentinel", -- artid 607729
                    ["name"] = "黑曜石哨兵",
                }, -- [4]
                {
                    ["id"] = 470,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ancient Stone Keeper", -- artid 607538
                    ["name"] = "远古巨石卫士",
                }, -- [5]
                {
                    ["id"] = 471,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Galgann Firehammer", -- artid 607606
                    ["name"] = "加加恩·火锤",
                }, -- [6]
                {
                    ["id"] = 472,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grimlok", -- artid 607626
                    ["name"] = "格瑞姆洛克",
                }, -- [7]
                {
                    ["id"] = 473,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Archaedas", -- artid 607546
                    ["name"] = "阿扎达斯",
                }, -- [8]
            },
        }, -- [10]
        {
            ["id"] = 64,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-ShadowFangKeep", -- artid 522358
            ["name"] = "影牙城堡",
            ["bosses"] = {
                {
                    ["id"] = 96,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Baron Ashbury", -- artid 522205
                    ["name"] = "灰葬男爵",
                }, -- [1]
                {
                    ["id"] = 97,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Baron Silverlaine", -- artid 522206
                    ["name"] = "席瓦莱恩男爵",
                }, -- [2]
                {
                    ["id"] = 98,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Commander Springvale", -- artid 522213
                    ["name"] = "指挥官斯普林瓦尔",
                }, -- [3]
                {
                    ["id"] = 99,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Walden", -- artid 522249
                    ["name"] = "沃登勋爵",
                }, -- [4]
                {
                    ["id"] = 100,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Godfrey", -- artid 522247
                    ["name"] = "高弗雷勋爵",
                }, -- [5]
            },
        }, -- [11]
        {
            ["id"] = 226,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-RagefireChasm", -- artid 608211
            ["name"] = "怒焰裂谷",
            ["bosses"] = {
                {
                    ["id"] = 694,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Adarogg", -- artid 608309
                    ["name"] = "阿达罗格",
                }, -- [1]
                {
                    ["id"] = 695,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Dark Shaman Koranthal", -- artid 608310
                    ["name"] = "黑暗萨满柯兰萨",
                }, -- [2]
                {
                    ["id"] = 696,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Magmaw", -- artid 522251
                    ["name"] = "焰喉",
                }, -- [3]
                {
                    ["id"] = 697,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lava Guard Gordoth", -- artid 608315
                    ["name"] = "熔岩守卫戈多斯",
                }, -- [4]
            },
        }, -- [12]
        {
            ["id"] = 236,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Stratholme", -- artid 608216
            ["name"] = "斯坦索姆",
            ["bosses"] = {
                {
                    ["id"] = 443,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hearthsinger Forresten", -- artid 607637
                    ["name"] = "弗雷斯特恩",
                }, -- [1]
                {
                    ["id"] = 445,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Timmy the Cruel", -- artid 607795
                    ["name"] = "悲惨的提米",
                }, -- [2]
                {
                    ["id"] = 749,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Commander Malor", -- artid 607569
                    ["name"] = "指挥官玛洛尔",
                }, -- [3]
                {
                    ["id"] = 446,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Willey Hopebreaker", -- artid 607818
                    ["name"] = "希望破坏者威利",
                }, -- [4]
                {
                    ["id"] = 448,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Instructor Galford", -- artid 607660
                    ["name"] = "档案管理员加尔福特",
                }, -- [5]
                {
                    ["id"] = 449,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Balnazzar", -- artid 607551
                    ["name"] = "巴纳扎尔",
                }, -- [6]
                {
                    ["id"] = 450,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Unforgiven", -- artid 607792
                    ["name"] = "不可宽恕者",
                }, -- [7]
                {
                    ["id"] = 451,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Baroness Anastari", -- artid 607553
                    ["name"] = "安娜丝塔丽男爵夫人",
                }, -- [8]
                {
                    ["id"] = 452,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Nerubenkan", -- artid 607724
                    ["name"] = "奈鲁布恩坎",
                }, -- [9]
                {
                    ["id"] = 453,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maleki the Pallid", -- artid 607707
                    ["name"] = "苍白的玛勒基",
                }, -- [10]
                {
                    ["id"] = 454,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Ravenian", -- artid 607791
                    ["name"] = "巴瑟拉斯镇长",
                }, -- [11]
                {
                    ["id"] = 455,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ramstein the Gorger", -- artid 607752
                    ["name"] = "吞咽者拉姆斯登",
                }, -- [12]
                {
                    ["id"] = 456,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Aurius Rivendare", -- artid 607692
                    ["name"] = "奥里克斯·瑞文戴尔领主",
                }, -- [13]
            },
        }, -- [13]
        {
            ["id"] = 63,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Deadmines", -- artid 522352
            ["name"] = "死亡矿井",
            ["bosses"] = {
                {
                    ["id"] = 89,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Glubtok", -- artid 522228
                    ["name"] = "格拉布托克",
                }, -- [1]
                {
                    ["id"] = 90,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Helix Gearbreaker", -- artid 522234
                    ["name"] = "赫利克斯·破甲",
                }, -- [2]
                {
                    ["id"] = 91,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Foe Reaper 5000", -- artid 522225
                    ["name"] = "死神5000",
                }, -- [3]
                {
                    ["id"] = 92,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Admiral Ripsnarl", -- artid 522189
                    ["name"] = "撕心狼将军",
                }, -- [4]
                {
                    ["id"] = 93,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Captain Cookie", -- artid 522210
                    ["name"] = "“船长”曲奇",
                }, -- [5]
                {
                    ["id"] = 95,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Vanessa VanCleef", -- artid 522278
                    ["name"] = "梵妮莎·范克里夫",
                }, -- [6]
            },
        }, -- [14]
        {
            ["id"] = 232,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Maraudon", -- artid 608209
            ["name"] = "玛拉顿",
            ["bosses"] = {
                {
                    ["id"] = 423,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Noxxion", -- artid 607728
                    ["name"] = "诺克赛恩",
                }, -- [1]
                {
                    ["id"] = 424,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Razorlash", -- artid 607756
                    ["name"] = "锐刺鞭笞者",
                }, -- [2]
                {
                    ["id"] = 425,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Tinkerer Gizlock", -- artid 607796
                    ["name"] = "工匠吉兹洛克",
                }, -- [3]
                {
                    ["id"] = 427,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Vyletongue", -- artid 607699
                    ["name"] = "维利塔恩",
                }, -- [4]
                {
                    ["id"] = 428,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Celebras the Cursed", -- artid 607562
                    ["name"] = "被诅咒的塞雷布拉斯",
                }, -- [5]
                {
                    ["id"] = 429,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Landslide", -- artid 607684
                    ["name"] = "兰斯利德",
                }, -- [6]
                {
                    ["id"] = 430,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rotgrip", -- artid 607761
                    ["name"] = "洛特格里普",
                }, -- [7]
                {
                    ["id"] = 431,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Princess Theradras", -- artid 607747
                    ["name"] = "瑟莱德丝公主",
                }, -- [8]
            },
        }, -- [15]
        {
            ["id"] = 238,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheStockade", -- artid 608223
            ["name"] = "暴风城监狱",
            ["bosses"] = {
                {
                    ["id"] = 464,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hogger-New", -- artid 4776138
                    ["name"] = "霍格",
                }, -- [1]
                {
                    ["id"] = 465,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Overheat", -- artid 607695
                    ["name"] = "灼热勋爵",
                }, -- [2]
                {
                    ["id"] = 466,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Randolph Moloch", -- artid 607753
                    ["name"] = "兰多菲·摩洛克",
                }, -- [3]
            },
        }, -- [16]
        {
            ["id"] = 241,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-ZulFarrak", -- artid 608230
            ["name"] = "祖尔法拉克",
            ["bosses"] = {
                {
                    ["id"] = 483,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ghazan", -- artid 607614
                    ["name"] = "加兹瑞拉",
                }, -- [1]
                {
                    ["id"] = 484,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Antusul", -- artid 607541
                    ["name"] = "安图苏尔",
                }, -- [2]
                {
                    ["id"] = 485,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Theka the Martyr", -- artid 607793
                    ["name"] = "殉教者塞卡",
                }, -- [3]
                {
                    ["id"] = 486,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Witch Doctor Zumrah", -- artid 607819
                    ["name"] = "巫医祖穆拉恩",
                }, -- [4]
                {
                    ["id"] = 487,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Nekrum Gutchewer", -- artid 607723
                    ["name"] = "耐克鲁姆和塞瑟斯",
                }, -- [5]
                {
                    ["id"] = 489,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Chief Ukorz Sandscalp", -- artid 607564
                    ["name"] = "乌克兹·沙顶",
                }, -- [6]
            },
        }, -- [17]
        {
            ["id"] = 316,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-ScarletMonastery", -- artid 608214
            ["name"] = "血色修道院",
            ["bosses"] = {
                {
                    ["id"] = 688,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thalnos the Soulrender", -- artid 630853
                    ["name"] = "裂魂者萨尔诺斯",
                }, -- [1]
                {
                    ["id"] = 671,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Brother Korloff", -- artid 630818
                    ["name"] = "科洛夫修士",
                }, -- [2]
                {
                    ["id"] = 674,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Inquisitor Whitemane", -- artid 607643
                    ["name"] = "大检察官怀特迈恩",
                }, -- [3]
            },
        }, -- [18]
        {
            ["id"] = 311,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-ScarletHalls", -- artid 643262
            ["name"] = "血色大厅",
            ["bosses"] = {
                {
                    ["id"] = 660,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Houndmaster Braun", -- artid 630833
                    ["name"] = "驯犬者布兰恩",
                }, -- [1]
                {
                    ["id"] = 654,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Armsmaster Harlan", -- artid 630816
                    ["name"] = "武器大师哈兰",
                }, -- [2]
                {
                    ["id"] = 656,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Flameweaver Koegler", -- artid 630825
                    ["name"] = "织焰者孔格勒",
                }, -- [3]
            },
        }, -- [19]
        {
            ["id"] = 231,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Gnomeregan", -- artid 608202
            ["name"] = "诺莫瑞根",
            ["bosses"] = {
                {
                    ["id"] = 419,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grubbis", -- artid 607628
                    ["name"] = "格鲁比斯",
                }, -- [1]
                {
                    ["id"] = 420,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Viscous Fallout", -- artid 607808
                    ["name"] = "粘性辐射尘",
                }, -- [2]
                {
                    ["id"] = 421,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Electrocutioner 6000", -- artid 607594
                    ["name"] = "电刑器6000型",
                }, -- [3]
                {
                    ["id"] = 418,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Crowd Pummeler 9-60", -- artid 607572
                    ["name"] = "群体打击者9-60",
                }, -- [4]
                {
                    ["id"] = 422,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mekgineer Thermaplugg", -- artid 607714
                    ["name"] = "机械师瑟玛普拉格",
                }, -- [5]
            },
        }, -- [20]
        {
            ["id"] = 246,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Scholomance", -- artid 608215
            ["name"] = "通灵学院",
            ["bosses"] = {
                {
                    ["id"] = 659,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Instructor Chillheart", -- artid 630835
                    ["name"] = "指导者寒心",
                }, -- [1]
                {
                    ["id"] = 663,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Jandice Barov", -- artid 607666
                    ["name"] = "詹迪斯·巴罗夫",
                }, -- [2]
                {
                    ["id"] = 665,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rattlegore", -- artid 607755
                    ["name"] = "血骨傀儡",
                }, -- [3]
                {
                    ["id"] = 666,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lillian Voss", -- artid 630838
                    ["name"] = "莉莉安·沃斯",
                }, -- [4]
                {
                    ["id"] = 684,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Darkmaster Gandling", -- artid 607582
                    ["name"] = "黑暗院长加丁",
                }, -- [5]
            },
        }, -- [21]
        {
            ["id"] = 237,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-SunkenTemple", -- artid 608217
            ["name"] = "沉没的神庙",
            ["bosses"] = {
                {
                    ["id"] = 457,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Avatar of Hakkar", -- artid 607548
                    ["name"] = "哈卡的化身",
                }, -- [1]
                {
                    ["id"] = 458,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Jammalan the Prophet", -- artid 607665
                    ["name"] = "预言者迦玛兰",
                }, -- [2]
                {
                    ["id"] = 459,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Dreamscythe", -- artid 608311
                    ["name"] = "梦境守望者",
                }, -- [3]
                {
                    ["id"] = 463,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shade of Eranikus", -- artid 607768
                    ["name"] = "伊兰尼库斯的阴影",
                }, -- [4]
            },
        }, -- [22]
        {
            ["id"] = 227,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-BlackfathomDeeps", -- artid 608195
            ["name"] = "黑暗深渊",
            ["bosses"] = {
                {
                    ["id"] = 368,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ghamoo-Ra", -- artid 1064179
                    ["name"] = "加摩拉",
                }, -- [1]
                {
                    ["id"] = 436,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Domina", -- artid 1064180
                    ["name"] = "多米尼娜",
                }, -- [2]
                {
                    ["id"] = 426,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Commander Ulthok", -- artid 522214
                    ["name"] = "征服者克鲁尔",
                }, -- [3]
                {
                    ["id"] = 1145,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thruk", -- artid 1064181
                    ["name"] = "苏克",
                }, -- [4]
                {
                    ["id"] = 447,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Guardian of the Deep", -- artid 1064182
                    ["name"] = "深渊守护者",
                }, -- [5]
                {
                    ["id"] = 1144,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Executioner Gore", -- artid 1064183
                    ["name"] = "刽子手戈尔",
                }, -- [6]
                {
                    ["id"] = 437,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Twilight Lord Bathiel", -- artid 1064184
                    ["name"] = "暮光领主巴赛尔",
                }, -- [7]
                {
                    ["id"] = 444,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Akumai", -- artid 607532
                    ["name"] = "阿库麦尔",
                }, -- [8]
            },
        }, -- [23]
        {
            ["id"] = 229,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-BlackrockSpire", -- artid 608197
            ["name"] = "黑石塔下层",
            ["bosses"] = {
                {
                    ["id"] = 388,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Highlord Omokk", -- artid 607645
                    ["name"] = "欧莫克大王",
                }, -- [1]
                {
                    ["id"] = 389,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shadow Hunter Voshgajin", -- artid 607769
                    ["name"] = "暗影猎手沃什加斯",
                }, -- [2]
                {
                    ["id"] = 390,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-War Master Voone", -- artid 607810
                    ["name"] = "指挥官沃恩",
                }, -- [3]
                {
                    ["id"] = 391,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mother Smolderweb", -- artid 607719
                    ["name"] = "烟网蛛后",
                }, -- [4]
                {
                    ["id"] = 392,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Urok Doomhowl", -- artid 607801
                    ["name"] = "尤洛克·暗嚎",
                }, -- [5]
                {
                    ["id"] = 393,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Quartermaster Zigris", -- artid 607751
                    ["name"] = "军需官兹格雷斯",
                }, -- [6]
                {
                    ["id"] = 394,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Halycon", -- artid 607634
                    ["name"] = "哈雷肯",
                }, -- [7]
                {
                    ["id"] = 395,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gizrul the Slavener", -- artid 607615
                    ["name"] = "奴役者基兹鲁尔",
                }, -- [8]
                {
                    ["id"] = 396,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Overlord Wyrmthalak", -- artid 607737
                    ["name"] = "维姆萨拉克",
                }, -- [9]
            },
        }, -- [24]
        {
            ["id"] = 228,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-BlackrockDepths", -- artid 608196
            ["name"] = "黑石深渊",
            ["bosses"] = {
                {
                    ["id"] = 369,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Interrogator Gerstahn", -- artid 607644
                    ["name"] = "审讯官格斯塔恩",
                }, -- [1]
                {
                    ["id"] = 370,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Roccor", -- artid 607697
                    ["name"] = "洛考尔",
                }, -- [2]
                {
                    ["id"] = 371,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Houndmaster Grebmar", -- artid 607647
                    ["name"] = "驯犬者格雷布玛尔",
                }, -- [3]
                {
                    ["id"] = 372,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Justice Grimstone", -- artid 608314
                    ["name"] = "秩序竞技场",
                }, -- [4]
                {
                    ["id"] = 373,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Pyromancer Loregrain", -- artid 607749
                    ["name"] = "控火师罗格雷恩",
                }, -- [5]
                {
                    ["id"] = 374,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Incendius", -- artid 607694
                    ["name"] = "伊森迪奥斯",
                }, -- [6]
                {
                    ["id"] = 375,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warder Stilgiss", -- artid 607814
                    ["name"] = "典狱官斯迪尔基斯",
                }, -- [7]
                {
                    ["id"] = 376,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Fineous Darkvire", -- artid 607602
                    ["name"] = "弗诺斯·达克维尔",
                }, -- [8]
                {
                    ["id"] = 377,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-BaelGar", -- artid 607549
                    ["name"] = "贝尔加",
                }, -- [9]
                {
                    ["id"] = 378,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-General Angerforge", -- artid 607610
                    ["name"] = "怒炉将军",
                }, -- [10]
                {
                    ["id"] = 379,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Golem Lord Argelmach", -- artid 607618
                    ["name"] = "傀儡统帅阿格曼奇",
                }, -- [11]
                {
                    ["id"] = 380,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hurley Blackbreath", -- artid 607650
                    ["name"] = "霍尔雷·黑须",
                }, -- [12]
                {
                    ["id"] = 381,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Phalanx", -- artid 607740
                    ["name"] = "法拉克斯",
                }, -- [13]
                {
                    ["id"] = 383,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Plugger Spazzring", -- artid 607741
                    ["name"] = "普拉格",
                }, -- [14]
                {
                    ["id"] = 384,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ambassador Flamelash", -- artid 607535
                    ["name"] = "弗莱拉斯总大使",
                }, -- [15]
                {
                    ["id"] = 385,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-DoomRel", -- artid 607587
                    ["name"] = "黑铁七贤",
                }, -- [16]
                {
                    ["id"] = 386,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Magmus", -- artid 607705
                    ["name"] = "玛格姆斯",
                }, -- [17]
                {
                    ["id"] = 387,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Emperor Thaurissan", -- artid 607595
                    ["name"] = "达格兰·索瑞森大帝",
                }, -- [18]
            },
        }, -- [25]
    },
}
