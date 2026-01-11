---------------------------------------------------------------------
-- File: Cell\RaidDebuffs\ExpansionData\ExpansionData_koKR.lua
-- Author: enderneko (enderneko-dev@outlook.com)
-- Created : 2023-09-03 19:57:01 +08:00
-- Modified: 2024-06-01 19:53 +08:00
---------------------------------------------------------------------

if not LOCALE_koKR then return end

Cell_ExpansionData.locale = "koKR"

Cell_ExpansionData.expansions = {
    "리치 왕의 분노",
    "불타는 성전",
    "오리지널",
}

Cell_ExpansionData.data = {
    ["리치 왕의 분노"] = {
        {
            ["id"] = 753,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-VaultofArchavon", -- artid 1396596
            ["name"] = "아카본 석실",
            ["bosses"] = {
                {
                    ["id"] = 1597,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Archavon the Stone Watcher", -- artid 1385715
                    ["name"] = "바위 감시자 아카본",
                }, -- [1]
                {
                    ["id"] = 1598,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Emalon the Storm Watcher", -- artid 1385727
                    ["name"] = "폭풍 감시자 에말론",
                }, -- [2]
                {
                    ["id"] = 1599,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Koralon the Flame Watcher", -- artid 1385748
                    ["name"] = "화염 감시자 코랄론",
                }, -- [3]
                {
                    ["id"] = 1600,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Taravon the Ice Watcher", -- artid 1385767
                    ["name"] = "얼음 감시자 토라본",
                }, -- [4]
            },
        }, -- [1]
        {
            ["id"] = 754,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Naxxramas", -- artid 1396587
            ["name"] = "낙스라마스",
            ["bosses"] = {
                {
                    ["id"] = 1601,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-AnubRekhan", -- artid 1378964
                    ["name"] = "아눕레칸",
                }, -- [1]
                {
                    ["id"] = 1602,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grand Widow Faerlina", -- artid 1378980
                    ["name"] = "귀부인 팰리나",
                }, -- [2]
                {
                    ["id"] = 1603,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maexxna", -- artid 1378994
                    ["name"] = "맥스나",
                }, -- [3]
                {
                    ["id"] = 1604,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Noth the Plaguebringer", -- artid 1379004
                    ["name"] = "역병술사 노스",
                }, -- [4]
                {
                    ["id"] = 1605,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Heigan the Unclean", -- artid 1378984
                    ["name"] = "부정의 헤이건",
                }, -- [5]
                {
                    ["id"] = 1606,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Loatheb", -- artid 1378991
                    ["name"] = "로데브",
                }, -- [6]
                {
                    ["id"] = 1607,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Instructor Razuvious", -- artid 1378988
                    ["name"] = "훈련교관 라주비어스",
                }, -- [7]
                {
                    ["id"] = 1608,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gothik the Harvester", -- artid 1378979
                    ["name"] = "영혼 착취자 고딕",
                }, -- [8]
                {
                    ["id"] = 1609,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Four Horseman", -- artid 1385732
                    ["name"] = "4인 기사단",
                }, -- [9]
                {
                    ["id"] = 1610,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Patchwerk", -- artid 1379005
                    ["name"] = "패치워크",
                }, -- [10]
                {
                    ["id"] = 1611,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grobbulus", -- artid 1378981
                    ["name"] = "그라불루스",
                }, -- [11]
                {
                    ["id"] = 1612,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gluth", -- artid 1378977
                    ["name"] = "글루스",
                }, -- [12]
                {
                    ["id"] = 1613,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thaddius", -- artid 1379019
                    ["name"] = "타디우스",
                }, -- [13]
                {
                    ["id"] = 1614,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sapphiron", -- artid 1379010
                    ["name"] = "사피론",
                }, -- [14]
                {
                    ["id"] = 1615,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-KelThuzad", -- artid 1378989
                    ["name"] = "켈투자드",
                }, -- [15]
            },
        }, -- [2]
        {
            ["id"] = 755,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-ObsidianSanctum", -- artid 1396588
            ["name"] = "흑요석 성소",
            ["bosses"] = {
                {
                    ["id"] = 1616,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sartharion", -- artid 1385765
                    ["name"] = "살타리온",
                }, -- [1]
            },
        }, -- [3]
        {
            ["id"] = 756,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-EyeofEternity", -- artid 1396581
            ["name"] = "영원의 눈",
            ["bosses"] = {
                {
                    ["id"] = 1617,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Malygos", -- artid 1385753
                    ["name"] = "말리고스",
                }, -- [1]
            },
        }, -- [4]
        {
            ["id"] = 759,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Ulduar", -- artid 1396595
            ["name"] = "울두아르",
            ["bosses"] = {
                {
                    ["id"] = 1637,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Flame Leviathan", -- artid 1385731
                    ["name"] = "거대 화염전차",
                }, -- [1]
                {
                    ["id"] = 1638,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ignis the Furnace Master", -- artid 1385742
                    ["name"] = "용광로 군주 이그니스",
                }, -- [2]
                {
                    ["id"] = 1639,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Razorscale", -- artid 1385763
                    ["name"] = "칼날비늘",
                }, -- [3]
                {
                    ["id"] = 1640,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-XT 002 Deconstructor", -- artid 1385773
                    ["name"] = "XT-002 해체자",
                }, -- [4]
                {
                    ["id"] = 1641,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Assembly Of Iron", -- artid 1390439
                    ["name"] = "무쇠 평의회",
                }, -- [5]
                {
                    ["id"] = 1642,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kologarn", -- artid 1385747
                    ["name"] = "콜로간",
                }, -- [6]
                {
                    ["id"] = 1643,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Auriaya", -- artid 1385717
                    ["name"] = "아우리아야",
                }, -- [7]
                {
                    ["id"] = 1644,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hodir", -- artid 1385740
                    ["name"] = "호디르",
                }, -- [8]
                {
                    ["id"] = 1645,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thorim", -- artid 1385770
                    ["name"] = "토림",
                }, -- [9]
                {
                    ["id"] = 1646,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Freya", -- artid 1385733
                    ["name"] = "프레이야",
                }, -- [10]
                {
                    ["id"] = 1647,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mimiron", -- artid 1385754
                    ["name"] = "미미론",
                }, -- [11]
                {
                    ["id"] = 1648,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-General Vezax", -- artid 1385735
                    ["name"] = "장군 베작스",
                }, -- [12]
                {
                    ["id"] = 1649,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Yogg Saron", -- artid 1385774
                    ["name"] = "요그사론",
                }, -- [13]
                {
                    ["id"] = 1650,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Algalon the Observer", -- artid 1385713
                    ["name"] = "관찰자 알갈론",
                }, -- [14]
            },
        }, -- [5]
        {
            ["id"] = 757,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TrialoftheCrusader", -- artid 1396594
            ["name"] = "십자군의 시험장",
            ["bosses"] = {
                {
                    ["id"] = 1618,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Northrend Beasts", -- artid 1390440
                    ["name"] = "노스렌드 야수",
                }, -- [1]
                {
                    ["id"] = 1619,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Jaraxxus", -- artid 1385752
                    ["name"] = "군주 자락서스",
                }, -- [2]
                {
                    ["id"] = 1620,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-PVP Event Vs Horde", -- artid 1390442
                    ["name"] = "얼라이언스의 용사",
                }, -- [3]
                {
                    ["id"] = 1622,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Twin Valkyr", -- artid 1390443
                    ["name"] = "발키르 쌍둥이",
                }, -- [4]
                {
                    ["id"] = 1623,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Anubarak", -- artid 607542
                    ["name"] = "아눕아락",
                }, -- [5]
            },
        }, -- [6]
        {
            ["id"] = 760,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Onyxia", -- artid 1396589
            ["name"] = "오닉시아의 둥지",
            ["bosses"] = {
                {
                    ["id"] = 1651,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Onyxia", -- artid 1379025
                    ["name"] = "오닉시아",
                }, -- [1]
            },
        }, -- [7]
        {
            ["id"] = 758,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-IcecrownCitadel", -- artid 1396583
            ["name"] = "얼음왕관 성채",
            ["bosses"] = {
                {
                    ["id"] = 1624,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Marrowgar", -- artid 1378992
                    ["name"] = "군주 매로우가르",
                }, -- [1]
                {
                    ["id"] = 1625,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lady Deathwhisper", -- artid 1378990
                    ["name"] = "여교주 데스위스퍼",
                }, -- [2]
                {
                    ["id"] = 1627,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gunship Alliance", -- artid 1385736
                    ["name"] = "얼음왕관 비행포격선 전투",
                }, -- [3]
                {
                    ["id"] = 1628,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Deathbringer Saurfang", -- artid 1378970
                    ["name"] = "죽음의 인도자 사울팽",
                }, -- [4]
                {
                    ["id"] = 1629,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Festergut", -- artid 1378972
                    ["name"] = "구린속",
                }, -- [5]
                {
                    ["id"] = 1630,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rotface", -- artid 1379009
                    ["name"] = "썩은얼굴",
                }, -- [6]
                {
                    ["id"] = 1631,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Professor Putricide", -- artid 1379007
                    ["name"] = "교수 퓨트리사이드",
                }, -- [7]
                {
                    ["id"] = 1632,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Blood Prince Council", -- artid 1385721
                    ["name"] = "피의 공작 의회",
                }, -- [8]
                {
                    ["id"] = 1633,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Blood Queen Lanathel", -- artid 1378967
                    ["name"] = "피의 여왕 라나텔",
                }, -- [9]
                {
                    ["id"] = 1634,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Valithria Dreamwalker", -- artid 1379023
                    ["name"] = "발리스리아 드림워커",
                }, -- [10]
                {
                    ["id"] = 1635,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sindragosa", -- artid 1379014
                    ["name"] = "신드라고사",
                }, -- [11]
                {
                    ["id"] = 1636,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lich King", -- artid 607688
                    ["name"] = "리치 왕",
                }, -- [12]
            },
        }, -- [8]
        {
            ["id"] = 761,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-RubySanctum", -- artid 1396590
            ["name"] = "루비 성소",
            ["bosses"] = {
                {
                    ["id"] = 1652,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Halion", -- artid 1385738
                    ["name"] = "할리온",
                }, -- [1]
            },
        }, -- [9]
        {
            ["id"] = 274,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Gundrak", -- artid 608203
            ["name"] = "군드락",
            ["bosses"] = {
                {
                    ["id"] = 592,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sladran", -- artid 607776
                    ["name"] = "슬라드란",
                }, -- [1]
                {
                    ["id"] = 593,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Drakkari Colossus", -- artid 607589
                    ["name"] = "드라카리 거대골렘",
                }, -- [2]
                {
                    ["id"] = 594,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Moorabi", -- artid 607716
                    ["name"] = "무라비",
                }, -- [3]
                {
                    ["id"] = 596,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Galdarah", -- artid 607605
                    ["name"] = "갈다라",
                }, -- [4]
            },
        }, -- [10]
        {
            ["id"] = 277,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HallsofStone", -- artid 608206
            ["name"] = "돌의 전당",
            ["bosses"] = {
                {
                    ["id"] = 604,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Krystallus", -- artid 607679
                    ["name"] = "크리스탈루스",
                }, -- [1]
                {
                    ["id"] = 605,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maiden of Grief", -- artid 607706
                    ["name"] = "고뇌의 마녀",
                }, -- [2]
                {
                    ["id"] = 606,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Tribunal of the Ages", -- artid 607797
                    ["name"] = "시대의 심판장",
                }, -- [3]
                {
                    ["id"] = 607,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sjonnir the Ironshaper", -- artid 607772
                    ["name"] = "무쇠구체자 쇼니르",
                }, -- [4]
            },
        }, -- [11]
        {
            ["id"] = 273,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-DrakTharonKeep", -- artid 608201
            ["name"] = "드락타론 성채",
            ["bosses"] = {
                {
                    ["id"] = 588,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Trollgore", -- artid 607798
                    ["name"] = "송곳아귀",
                }, -- [1]
                {
                    ["id"] = 589,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Novos the Summoner", -- artid 607727
                    ["name"] = "소환사 노보스",
                }, -- [2]
                {
                    ["id"] = 590,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-King Dred", -- artid 607672
                    ["name"] = "랩터왕 서슬발톱",
                }, -- [3]
                {
                    ["id"] = 591,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Prophet Tharonja", -- artid 607790
                    ["name"] = "예언자 타론자",
                }, -- [4]
            },
        }, -- [12]
        {
            ["id"] = 282,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheOculus", -- artid 608222
            ["name"] = "마력의 눈",
            ["bosses"] = {
                {
                    ["id"] = 622,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Drakos the Interrogator", -- artid 607590
                    ["name"] = "심문관 드라코스",
                }, -- [1]
                {
                    ["id"] = 623,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Varos Cloudstrider", -- artid 607802
                    ["name"] = "바로스 클라우드스트라이더",
                }, -- [2]
                {
                    ["id"] = 624,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mage Lord Urom", -- artid 607702
                    ["name"] = "마법사 군주 우롬",
                }, -- [3]
                {
                    ["id"] = 625,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ley Guardian Eregos", -- artid 607687
                    ["name"] = "지맥 수호자 에레고스",
                }, -- [4]
            },
        }, -- [13]
        {
            ["id"] = 281,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheNexus", -- artid 608221
            ["name"] = "마력의 탑",
            ["bosses"] = {
                {
                    ["id"] = 618,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grand Magus Telestra", -- artid 607623
                    ["name"] = "대학자 텔레스트라",
                }, -- [1]
                {
                    ["id"] = 619,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Anomalus", -- artid 607540
                    ["name"] = "아노말루스",
                }, -- [2]
                {
                    ["id"] = 620,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ormorok the Tree Shaper", -- artid 607735
                    ["name"] = "정원사 오르모로크",
                }, -- [3]
                {
                    ["id"] = 621,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Keristrasza", -- artid 607671
                    ["name"] = "케리스트라자",
                }, -- [4]
            },
        }, -- [14]
        {
            ["id"] = 275,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HallsofLightning", -- artid 608204
            ["name"] = "번개의 전당",
            ["bosses"] = {
                {
                    ["id"] = 597,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-General Bjarngrim", -- artid 607611
                    ["name"] = "장군 비야른그림",
                }, -- [1]
                {
                    ["id"] = 598,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Volkhan", -- artid 607809
                    ["name"] = "볼칸",
                }, -- [2]
                {
                    ["id"] = 599,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ionar", -- artid 607663
                    ["name"] = "아이오나",
                }, -- [3]
                {
                    ["id"] = 600,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Loken", -- artid 607690
                    ["name"] = "로켄",
                }, -- [4]
            },
        }, -- [15]
        {
            ["id"] = 283,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-VioletHold", -- artid 608228
            ["name"] = "보랏빛 요새",
            ["bosses"] = {
                {
                    ["id"] = 626,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Erekem", -- artid 607597
                    ["name"] = "에레켐",
                }, -- [1]
                {
                    ["id"] = 627,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Moragg", -- artid 607717
                    ["name"] = "모라그",
                }, -- [2]
                {
                    ["id"] = 628,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ichoron", -- artid 607654
                    ["name"] = "이코론",
                }, -- [3]
                {
                    ["id"] = 629,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Xevozz", -- artid 607821
                    ["name"] = "제보즈",
                }, -- [4]
                {
                    ["id"] = 630,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lavanthor", -- artid 607685
                    ["name"] = "라반토르",
                }, -- [5]
                {
                    ["id"] = 631,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Zuramat the Obliterator", -- artid 607825
                    ["name"] = "파멸자 주라마트",
                }, -- [6]
                {
                    ["id"] = 632,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Cyanigosa", -- artid 607573
                    ["name"] = "시아니고사",
                }, -- [7]
            },
        }, -- [16]
        {
            ["id"] = 278,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-PitofSaron", -- artid 608210
            ["name"] = "사론의 구덩이",
            ["bosses"] = {
                {
                    ["id"] = 608,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Forgemaster Garfrost", -- artid 607603
                    ["name"] = "제련장인 가프로스트",
                }, -- [1]
                {
                    ["id"] = 609,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Krick", -- artid 607677
                    ["name"] = "이크와 크리크",
                }, -- [2]
                {
                    ["id"] = 610,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Scourgelord Tyrannus", -- artid 607765
                    ["name"] = "스컬지군주 티라누스",
                }, -- [3]
            },
        }, -- [17]
        {
            ["id"] = 272,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-AzjolNerub", -- artid 608194
            ["name"] = "아졸네룹",
            ["bosses"] = {
                {
                    ["id"] = 585,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Krikthir the Gatewatcher", -- artid 607678
                    ["name"] = "문지기 크릭시르",
                }, -- [1]
                {
                    ["id"] = 586,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hadronox", -- artid 607633
                    ["name"] = "하드로녹스",
                }, -- [2]
                {
                    ["id"] = 587,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Anubarak", -- artid 607542
                    ["name"] = "아눕아락",
                }, -- [3]
            },
        }, -- [18]
        {
            ["id"] = 271,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-AhnkahetTheOldKingdom", -- artid 608192
            ["name"] = "안카헤트: 고대 왕국",
            ["bosses"] = {
                {
                    ["id"] = 580,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Elder Nadox", -- artid 607593
                    ["name"] = "장로 나독스",
                }, -- [1]
                {
                    ["id"] = 581,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Prince Taldaram", -- artid 607744
                    ["name"] = "공작 탈다람",
                }, -- [2]
                {
                    ["id"] = 582,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Jedoga Shadowseeker", -- artid 607667
                    ["name"] = "어둠추적자 제도가",
                }, -- [3]
                {
                    ["id"] = 584,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Herald Volazj", -- artid 607639
                    ["name"] = "사자 볼라즈",
                }, -- [4]
            },
        }, -- [19]
        {
            ["id"] = 280,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheForgeofSouls", -- artid 608220
            ["name"] = "영혼의 제련소",
            ["bosses"] = {
                {
                    ["id"] = 615,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Bronjahm", -- artid 607559
                    ["name"] = "브론잠",
                }, -- [1]
                {
                    ["id"] = 616,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Devourer of Souls", -- artid 607585
                    ["name"] = "영혼의 포식자",
                }, -- [2]
            },
        }, -- [20]
        {
            ["id"] = 279,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheCullingOfStratholme", -- artid 608219
            ["name"] = "옛 스트라솔름",
            ["bosses"] = {
                {
                    ["id"] = 611,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Meathook", -- artid 607711
                    ["name"] = "살덩이갈고리",
                }, -- [1]
                {
                    ["id"] = 612,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Salramm the Fleshcrafter", -- artid 607763
                    ["name"] = "살덩이창조자 살람",
                }, -- [2]
                {
                    ["id"] = 613,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Chrono Lord Epoch", -- artid 607567
                    ["name"] = "시간의 군주 에포크",
                }, -- [3]
                {
                    ["id"] = 614,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-MalGanis", -- artid 607708
                    ["name"] = "말가니스",
                }, -- [4]
            },
        }, -- [21]
        {
            ["id"] = 284,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TrialOfTheChampion", -- artid 608224
            ["name"] = "용사의 시험장",
            ["bosses"] = {
                {
                    ["id"] = 834,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grand Champions-Alliance", -- artid 607621
                    ["name"] = "최고 용사",
                }, -- [1]
                {
                    ["id"] = 635,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Eadric the Pure", -- artid 607591
                    ["name"] = "성기사 에드릭",
                }, -- [2]
                {
                    ["id"] = 636,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Argent Confessor Paletress", -- artid 607547
                    ["name"] = "은빛 고해사제 페일트레스",
                }, -- [3]
                {
                    ["id"] = 637,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Black Knight", -- artid 607787
                    ["name"] = "흑기사",
                }, -- [4]
            },
        }, -- [22]
        {
            ["id"] = 285,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-UtgardeKeep", -- artid 608226
            ["name"] = "우트가드 성채",
            ["bosses"] = {
                {
                    ["id"] = 638,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Prince Keleseth", -- artid 607743
                    ["name"] = "공작 켈레세스",
                }, -- [1]
                {
                    ["id"] = 639,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Skarvald the Constructor", -- artid 607774
                    ["name"] = "스카발드와 달론",
                }, -- [2]
                {
                    ["id"] = 640,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ingvar the Plunderer", -- artid 607659
                    ["name"] = "약탈자 잉그바르",
                }, -- [3]
            },
        }, -- [23]
        {
            ["id"] = 286,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-UtgardePinnacle", -- artid 608227
            ["name"] = "우트가드 첨탑",
            ["bosses"] = {
                {
                    ["id"] = 641,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Svala Sorrowgrave", -- artid 607778
                    ["name"] = "스발라 소로우그레이브",
                }, -- [1]
                {
                    ["id"] = 642,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gortok Palehoof", -- artid 607620
                    ["name"] = "고르톡 페일후프",
                }, -- [2]
                {
                    ["id"] = 643,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Skadi the Ruthless", -- artid 607773
                    ["name"] = "학살자 스카디",
                }, -- [3]
                {
                    ["id"] = 644,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-King Ymiron", -- artid 607674
                    ["name"] = "왕 이미론",
                }, -- [4]
            },
        }, -- [24]
        {
            ["id"] = 276,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HallsofReflection", -- artid 608205
            ["name"] = "투영의 전당",
            ["bosses"] = {
                {
                    ["id"] = 601,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Falric", -- artid 607601
                    ["name"] = "팔릭",
                }, -- [1]
                {
                    ["id"] = 602,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Marwyn", -- artid 607710
                    ["name"] = "마윈",
                }, -- [2]
                {
                    ["id"] = 603,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lich King", -- artid 607688
                    ["name"] = "아서스에게서 도망치기",
                }, -- [3]
            },
        }, -- [25]
    },
    ["불타는 성전"] = {
        {
            ["id"] = 745,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Karazhan", -- artid 1396584
            ["name"] = "카라잔",
            ["bosses"] = {
                {
                    ["id"] = 1552,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Servant Quarters", -- artid 1385766
                    ["name"] = "하인 숙소",
                }, -- [1]
                {
                    ["id"] = 1553,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Attumen the Huntsman", -- artid 1378965
                    ["name"] = "사냥꾼 어튜멘",
                }, -- [2]
                {
                    ["id"] = 1554,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Moroes", -- artid 1378999
                    ["name"] = "모로스",
                }, -- [3]
                {
                    ["id"] = 1555,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maiden of Virtue", -- artid 1378997
                    ["name"] = "고결의 여신",
                }, -- [4]
                {
                    ["id"] = 1556,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Opera", -- artid 1385758
                    ["name"] = "오페라 극장",
                }, -- [5]
                {
                    ["id"] = 1557,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Curator", -- artid 1379020
                    ["name"] = "전시 관리인",
                }, -- [6]
                {
                    ["id"] = 1559,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shade of Aran", -- artid 1379012
                    ["name"] = "아란의 망령",
                }, -- [7]
                {
                    ["id"] = 1560,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Terestian Illhoof", -- artid 1379017
                    ["name"] = "테레스티안 일후프",
                }, -- [8]
                {
                    ["id"] = 1561,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Netherspite", -- artid 1379002
                    ["name"] = "황천의 원령",
                }, -- [9]
                {
                    ["id"] = 1764,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Chess Alliance", -- artid 1385724
                    ["name"] = "체스 이벤트",
                }, -- [10]
                {
                    ["id"] = 1563,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Prince Malchezaar", -- artid 1379006
                    ["name"] = "공작 말체자르",
                }, -- [11]
            },
        }, -- [1]
        {
            ["id"] = 746,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-GruulsLair", -- artid 1396582
            ["name"] = "그룰의 둥지",
            ["bosses"] = {
                {
                    ["id"] = 1564,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High King Maulgar", -- artid 1378985
                    ["name"] = "왕중왕 마울가르",
                }, -- [1]
                {
                    ["id"] = 1565,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gruul the Dragonkiller", -- artid 1378982
                    ["name"] = "용 학살자 그룰",
                }, -- [2]
            },
        }, -- [2]
        {
            ["id"] = 747,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-MagtheridonsLair", -- artid 1396585
            ["name"] = "마그테리돈의 둥지",
            ["bosses"] = {
                {
                    ["id"] = 1566,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Magtheridon", -- artid 1378996
                    ["name"] = "마그테리돈",
                }, -- [1]
            },
        }, -- [3]
        {
            ["id"] = 748,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CoilfangReservoir", -- artid 608199
            ["name"] = "불뱀 제단",
            ["bosses"] = {
                {
                    ["id"] = 1567,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hydross the Unstable", -- artid 1385741
                    ["name"] = "불안정한 히드로스",
                }, -- [1]
                {
                    ["id"] = 1568,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Lurker Below", -- artid 1385768
                    ["name"] = "심연의 잠복꾼",
                }, -- [2]
                {
                    ["id"] = 1569,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Leotheras the Blind", -- artid 1385751
                    ["name"] = "눈먼 레오테라스",
                }, -- [3]
                {
                    ["id"] = 1570,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Fathom Lord Karathress", -- artid 1385729
                    ["name"] = "심해군주 카라드레스",
                }, -- [4]
                {
                    ["id"] = 1571,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Morogrim Tidewalker", -- artid 1385756
                    ["name"] = "겅둥파도 모로그림",
                }, -- [5]
                {
                    ["id"] = 1572,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lady Vashj", -- artid 1385750
                    ["name"] = "여군주 바쉬",
                }, -- [6]
            },
        }, -- [4]
        {
            ["id"] = 749,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TempestKeep", -- artid 608218
            ["name"] = "폭풍우 요새",
            ["bosses"] = {
                {
                    ["id"] = 1573,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Alar", -- artid 1385712
                    ["name"] = "알라르",
                }, -- [1]
                {
                    ["id"] = 1574,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Void Reaver", -- artid 1385772
                    ["name"] = "공허의 절단기",
                }, -- [2]
                {
                    ["id"] = 1575,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Astromancer Solarian", -- artid 1385739
                    ["name"] = "고위 점성술사 솔라리안",
                }, -- [3]
                {
                    ["id"] = 1576,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-KaelThas Sunstrider", -- artid 607669
                    ["name"] = "캘타스 선스트라이더",
                }, -- [4]
            },
        }, -- [5]
        {
            ["id"] = 750,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CavernsOfTime", -- artid 608198
            ["name"] = "하이잘 정상",
            ["bosses"] = {
                {
                    ["id"] = 1577,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rage Winterchill", -- artid 1385762
                    ["name"] = "격노한 윈터칠",
                }, -- [1]
                {
                    ["id"] = 1578,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Anetheron", -- artid 1385714
                    ["name"] = "아네테론",
                }, -- [2]
                {
                    ["id"] = 1579,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kazrogal", -- artid 1385745
                    ["name"] = "카즈로갈",
                }, -- [3]
                {
                    ["id"] = 1580,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Azgalor", -- artid 1385719
                    ["name"] = "아즈갈로",
                }, -- [4]
                {
                    ["id"] = 1581,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Archimonde", -- artid 1385716
                    ["name"] = "아키몬드",
                }, -- [5]
            },
        }, -- [6]
        {
            ["id"] = 751,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-BlackTemple", -- artid 1396579
            ["name"] = "검은 사원",
            ["bosses"] = {
                {
                    ["id"] = 1582,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Warlord Najentus", -- artid 1378986
                    ["name"] = "대장군 나젠투스",
                }, -- [1]
                {
                    ["id"] = 1583,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Supremus", -- artid 1379016
                    ["name"] = "궁극의 심연",
                }, -- [2]
                {
                    ["id"] = 1584,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shade of Akama", -- artid 1379011
                    ["name"] = "아카마의 망령",
                }, -- [3]
                {
                    ["id"] = 1585,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Teron Gorefiend", -- artid 1379018
                    ["name"] = "테론 고어핀드",
                }, -- [4]
                {
                    ["id"] = 1586,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gurtogg Bloodboil", -- artid 1378983
                    ["name"] = "구르토그 블러드보일",
                }, -- [5]
                {
                    ["id"] = 1587,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Reliquary of Souls", -- artid 1385764
                    ["name"] = "영혼의 성물함",
                }, -- [6]
                {
                    ["id"] = 1588,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mother Shahraz", -- artid 1379000
                    ["name"] = "대모 샤라즈",
                }, -- [7]
                {
                    ["id"] = 1589,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Illidari Council", -- artid 1385743
                    ["name"] = "일리다리 의회",
                }, -- [8]
                {
                    ["id"] = 1590,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Illidan Stormrage", -- artid 1378987
                    ["name"] = "일리단 스톰레이지",
                }, -- [9]
            },
        }, -- [7]
        {
            ["id"] = 752,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-SunwellPlateau", -- artid 1396592
            ["name"] = "태양샘 고원",
            ["bosses"] = {
                {
                    ["id"] = 1591,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kalecgos", -- artid 1385744
                    ["name"] = "칼렉고스",
                }, -- [1]
                {
                    ["id"] = 1592,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Brutallus", -- artid 1385722
                    ["name"] = "브루탈루스",
                }, -- [2]
                {
                    ["id"] = 1593,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Felmyst", -- artid 1385730
                    ["name"] = "지옥안개",
                }, -- [3]
                {
                    ["id"] = 1594,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Eredar Twins", -- artid 1390438
                    ["name"] = "에레다르 쌍둥이",
                }, -- [4]
                {
                    ["id"] = 1595,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Muru", -- artid 1385757
                    ["name"] = "므우루",
                }, -- [5]
                {
                    ["id"] = 1596,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kiljaeden", -- artid 1385746
                    ["name"] = "킬제덴",
                }, -- [6]
            },
        }, -- [8]
        {
            ["id"] = 260,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CoilfangReservoir", -- artid 608199
            ["name"] = "강제 노역소",
            ["bosses"] = {
                {
                    ["id"] = 570,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mennu the Betrayer", -- artid 607715
                    ["name"] = "배반자 멘누",
                }, -- [1]
                {
                    ["id"] = 571,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rokmar the Crackler", -- artid 607759
                    ["name"] = "딱딱이 로크마르",
                }, -- [2]
                {
                    ["id"] = 572,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Quagmirran", -- artid 607750
                    ["name"] = "쿠아그미란",
                }, -- [3]
            },
        }, -- [9]
        {
            ["id"] = 255,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CavernsOfTime", -- artid 608198
            ["name"] = "검은늪",
            ["bosses"] = {
                {
                    ["id"] = 552,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Chrono Lord Deja", -- artid 607566
                    ["name"] = "시간의 군주 데자",
                }, -- [1]
                {
                    ["id"] = 553,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Temporus", -- artid 607784
                    ["name"] = "템퍼루스",
                }, -- [2]
                {
                    ["id"] = 554,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Aeonus", -- artid 607529
                    ["name"] = "아에누스",
                }, -- [3]
            },
        }, -- [10]
        {
            ["id"] = 250,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Auchindoun", -- artid 608193
            ["name"] = "마나 무덤",
            ["bosses"] = {
                {
                    ["id"] = 534,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Pandemonius", -- artid 607738
                    ["name"] = "팬더모니우스",
                }, -- [1]
                {
                    ["id"] = 535,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Tavarok", -- artid 607782
                    ["name"] = "타바로크",
                }, -- [2]
                {
                    ["id"] = 537,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Nexus Prince Shaffar", -- artid 607726
                    ["name"] = "연합왕자 샤파르",
                }, -- [3]
            },
        }, -- [11]
        {
            ["id"] = 249,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-MagistersTerrace", -- artid 608208
            ["name"] = "마법학자의 정원",
            ["bosses"] = {
                {
                    ["id"] = 530,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Selin Fireheart", -- artid 607767
                    ["name"] = "셀린 파이어하트",
                }, -- [1]
                {
                    ["id"] = 531,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Vexallus", -- artid 607806
                    ["name"] = "벡살루스",
                }, -- [2]
                {
                    ["id"] = 532,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Priestess Delrissa", -- artid 607742
                    ["name"] = "여사제 델리사",
                }, -- [3]
                {
                    ["id"] = 533,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-KaelThas Sunstrider", -- artid 607669
                    ["name"] = "캘타스 선스트라이더",
                }, -- [4]
            },
        }, -- [12]
        {
            ["id"] = 258,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TempestKeep", -- artid 608218
            ["name"] = "메카나르",
            ["bosses"] = {
                {
                    ["id"] = 563,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mechano Lord Capacitus", -- artid 607712
                    ["name"] = "기계군주 캐퍼시투스",
                }, -- [1]
                {
                    ["id"] = 564,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Nethermancer Sepethrea", -- artid 607725
                    ["name"] = "황천술사 세페스레아",
                }, -- [2]
                {
                    ["id"] = 565,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Pathaleon the Calculator", -- artid 607739
                    ["name"] = "철두철미한 파탈리온",
                }, -- [3]
            },
        }, -- [13]
        {
            ["id"] = 252,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Auchindoun", -- artid 608193
            ["name"] = "세데크 전당",
            ["bosses"] = {
                {
                    ["id"] = 541,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Darkweaver Syth", -- artid 607583
                    ["name"] = "흑마술사 시스",
                }, -- [1]
                {
                    ["id"] = 543,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Talon King Ikiss", -- artid 607780
                    ["name"] = "갈퀴대왕 이키스",
                }, -- [2]
            },
        }, -- [14]
        {
            ["id"] = 257,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TempestKeep", -- artid 608218
            ["name"] = "신록의 정원",
            ["bosses"] = {
                {
                    ["id"] = 558,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Commander Sarannis", -- artid 607570
                    ["name"] = "지휘관 새래니스",
                }, -- [1]
                {
                    ["id"] = 559,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Botanist Freywinn", -- artid 607641
                    ["name"] = "고위 식물학자 프레이윈",
                }, -- [2]
                {
                    ["id"] = 560,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thorngrin the Tender", -- artid 607794
                    ["name"] = "감시인 쏜그린",
                }, -- [3]
                {
                    ["id"] = 561,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Laj", -- artid 607683
                    ["name"] = "라즈",
                }, -- [4]
                {
                    ["id"] = 562,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warp Splinter", -- artid 607816
                    ["name"] = "차원의 분리자",
                }, -- [5]
            },
        }, -- [15]
        {
            ["id"] = 247,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Auchindoun", -- artid 608193
            ["name"] = "아키나이 납골당",
            ["bosses"] = {
                {
                    ["id"] = 523,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shirrak the Dead Watcher", -- artid 607771
                    ["name"] = "죽음의 감시인 쉴라크",
                }, -- [1]
                {
                    ["id"] = 524,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Exarch Maladaar", -- artid 607600
                    ["name"] = "총독 말라다르",
                }, -- [2]
            },
        }, -- [16]
        {
            ["id"] = 254,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TempestKeep", -- artid 608218
            ["name"] = "알카트라즈",
            ["bosses"] = {
                {
                    ["id"] = 548,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Zereketh the Unbound", -- artid 607823
                    ["name"] = "속박 풀린 제레케스",
                }, -- [1]
                {
                    ["id"] = 549,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Dalliah the Doomsayer", -- artid 607574
                    ["name"] = "파멸의 예언자 달리아",
                }, -- [2]
                {
                    ["id"] = 550,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Wrath Scryer Soccothrates", -- artid 607820
                    ["name"] = "격노의 점술사 소코드라테스",
                }, -- [3]
                {
                    ["id"] = 551,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Harbinger Skyriss", -- artid 607635
                    ["name"] = "선구자 스키리스",
                }, -- [4]
            },
        }, -- [17]
        {
            ["id"] = 253,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Auchindoun", -- artid 608193
            ["name"] = "어둠의 미궁",
            ["bosses"] = {
                {
                    ["id"] = 544,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ambassador Hellmaw", -- artid 607536
                    ["name"] = "사자 지옥아귀",
                }, -- [1]
                {
                    ["id"] = 545,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Blackheart the Inciter", -- artid 607555
                    ["name"] = "선동자 검은심장",
                }, -- [2]
                {
                    ["id"] = 546,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grandmaster Vorpil", -- artid 607625
                    ["name"] = "단장 보르필",
                }, -- [3]
                {
                    ["id"] = 547,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Murmur", -- artid 607720
                    ["name"] = "울림",
                }, -- [4]
            },
        }, -- [18]
        {
            ["id"] = 251,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CavernsOfTime", -- artid 608198
            ["name"] = "옛 언덕마루 구릉지",
            ["bosses"] = {
                {
                    ["id"] = 538,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lieutenant Drake", -- artid 607689
                    ["name"] = "부관 드레이크",
                }, -- [1]
                {
                    ["id"] = 539,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Captain Skarloc", -- artid 607561
                    ["name"] = "경비대장 스칼록",
                }, -- [2]
                {
                    ["id"] = 540,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Epoch Hunter", -- artid 607596
                    ["name"] = "시대의 사냥꾼",
                }, -- [3]
            },
        }, -- [19]
        {
            ["id"] = 259,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HellfireCitadel", -- artid 608207
            ["name"] = "으스러진 손의 전당",
            ["bosses"] = {
                {
                    ["id"] = 566,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grand Warlock Nethekurse", -- artid 607624
                    ["name"] = "대흑마법사 네더쿠르스",
                }, -- [1]
                {
                    ["id"] = 568,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warbringer Omrogg", -- artid 607811
                    ["name"] = "전쟁인도자 오므로그",
                }, -- [2]
                {
                    ["id"] = 569,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warchief Kargath Bladefist", -- artid 607812
                    ["name"] = "대족장 카르가스 블레이드피스트",
                }, -- [3]
            },
        }, -- [20]
        {
            ["id"] = 261,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CoilfangReservoir", -- artid 608199
            ["name"] = "증기 저장고",
            ["bosses"] = {
                {
                    ["id"] = 573,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hydromancer Thespia", -- artid 607651
                    ["name"] = "풍수사 세스피아",
                }, -- [1]
                {
                    ["id"] = 574,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mekgineer Steamrigger", -- artid 607713
                    ["name"] = "기계박사 스팀리거",
                }, -- [2]
                {
                    ["id"] = 575,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warlord Kalithresh", -- artid 607815
                    ["name"] = "장군 칼리스레쉬",
                }, -- [3]
            },
        }, -- [21]
        {
            ["id"] = 248,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HellfireCitadel", -- artid 608207
            ["name"] = "지옥불 성루",
            ["bosses"] = {
                {
                    ["id"] = 527,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Watchkeeper Gargolmar", -- artid 607817
                    ["name"] = "감시자 가르골마르",
                }, -- [1]
                {
                    ["id"] = 528,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Omor the Unscarred", -- artid 607734
                    ["name"] = "무적의 오모르",
                }, -- [2]
                {
                    ["id"] = 529,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Vazruden", -- artid 607803
                    ["name"] = "사자 바즈루덴",
                }, -- [3]
            },
        }, -- [22]
        {
            ["id"] = 262,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-CoilfangReservoir", -- artid 608199
            ["name"] = "지하수렁",
            ["bosses"] = {
                {
                    ["id"] = 576,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hungarfen", -- artid 607649
                    ["name"] = "헝가르펜",
                }, -- [1]
                {
                    ["id"] = 577,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ghazan", -- artid 607614
                    ["name"] = "가즈안",
                }, -- [2]
                {
                    ["id"] = 578,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Swamplord Muselek", -- artid 607779
                    ["name"] = "늪군주 뮤즐레크",
                }, -- [3]
                {
                    ["id"] = 579,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Black Stalker", -- artid 607788
                    ["name"] = "검은 추적자",
                }, -- [4]
            },
        }, -- [23]
        {
            ["id"] = 256,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-HellfireCitadel", -- artid 608207
            ["name"] = "피의 용광로",
            ["bosses"] = {
                {
                    ["id"] = 555,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Maker", -- artid 607789
                    ["name"] = "재앙의 창조자",
                }, -- [1]
                {
                    ["id"] = 556,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Broggok", -- artid 607558
                    ["name"] = "브로고크",
                }, -- [2]
                {
                    ["id"] = 557,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kelidan the Breaker", -- artid 607670
                    ["name"] = "파괴자 켈리단",
                }, -- [3]
            },
        }, -- [24]
    },
    ["오리지널"] = {
        {
            ["id"] = 741,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-MoltenCore", -- artid 1396586
            ["name"] = "화산 심장부",
            ["bosses"] = {
                {
                    ["id"] = 1519,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lucifron", -- artid 1378993
                    ["name"] = "루시프론",
                }, -- [1]
                {
                    ["id"] = 1520,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Magmadar", -- artid 1378995
                    ["name"] = "마그마다르",
                }, -- [2]
                {
                    ["id"] = 1521,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gehennas", -- artid 1378976
                    ["name"] = "게헨나스",
                }, -- [3]
                {
                    ["id"] = 1522,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Garr", -- artid 1378975
                    ["name"] = "가르",
                }, -- [4]
                {
                    ["id"] = 1523,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shazzrah", -- artid 1379013
                    ["name"] = "샤즈라",
                }, -- [5]
                {
                    ["id"] = 1524,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Baron Geddon", -- artid 1378966
                    ["name"] = "남작 게돈",
                }, -- [6]
                {
                    ["id"] = 1525,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sulfuron Harbinger", -- artid 1379015
                    ["name"] = "설퍼론 선구자",
                }, -- [7]
                {
                    ["id"] = 1526,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Golemagg the Incinerator", -- artid 1378978
                    ["name"] = "초열의 골레마그",
                }, -- [8]
                {
                    ["id"] = 1527,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Majordomo Executus", -- artid 1378998
                    ["name"] = "청지기 이그젝큐투스",
                }, -- [9]
                {
                    ["id"] = 1528,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ragnaros", -- artid 522261
                    ["name"] = "라그나로스",
                }, -- [10]
            },
        }, -- [1]
        {
            ["id"] = 742,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-BlackwingLair", -- artid 1396580
            ["name"] = "검은날개 둥지",
            ["bosses"] = {
                {
                    ["id"] = 1529,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Razorgore the Untamed", -- artid 1379008
                    ["name"] = "폭군 서슬송곳니",
                }, -- [1]
                {
                    ["id"] = 1530,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Vaelastrasz the Corrupt", -- artid 1379022
                    ["name"] = "타락한 밸라스트라즈",
                }, -- [2]
                {
                    ["id"] = 1531,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Broodlord Lashlayer", -- artid 1378968
                    ["name"] = "용기대장 래쉬레이어",
                }, -- [3]
                {
                    ["id"] = 1532,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Firemaw", -- artid 1378973
                    ["name"] = "화염아귀",
                }, -- [4]
                {
                    ["id"] = 1533,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ebonroc", -- artid 1378971
                    ["name"] = "에본로크",
                }, -- [5]
                {
                    ["id"] = 1534,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Flamegor", -- artid 1378974
                    ["name"] = "플레임고르",
                }, -- [6]
                {
                    ["id"] = 1535,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Chromaggus", -- artid 1378969
                    ["name"] = "크로마구스",
                }, -- [7]
                {
                    ["id"] = 1536,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Nefarian", -- artid 1379001
                    ["name"] = "네파리안",
                }, -- [8]
            },
        }, -- [2]
        {
            ["id"] = 743,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-RuinsofAhnQiraj", -- artid 1396591
            ["name"] = "안퀴라즈 폐허",
            ["bosses"] = {
                {
                    ["id"] = 1537,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kurinnaxx", -- artid 1385749
                    ["name"] = "쿠린낙스",
                }, -- [1]
                {
                    ["id"] = 1538,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-General Rajaxx", -- artid 1385734
                    ["name"] = "장군 라작스",
                }, -- [2]
                {
                    ["id"] = 1539,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Moam", -- artid 1385755
                    ["name"] = "모암",
                }, -- [3]
                {
                    ["id"] = 1540,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Buru the Gorger", -- artid 1385723
                    ["name"] = "먹보 부루",
                }, -- [4]
                {
                    ["id"] = 1541,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ayamiss the Hunter", -- artid 1385718
                    ["name"] = "사냥꾼 아야미스",
                }, -- [5]
                {
                    ["id"] = 1542,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ossirian the Unscarred", -- artid 1385759
                    ["name"] = "무적의 오시리안",
                }, -- [6]
            },
        }, -- [3]
        {
            ["id"] = 744,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TempleofAhnQiraj", -- artid 1396593
            ["name"] = "안퀴라즈",
            ["bosses"] = {
                {
                    ["id"] = 1543,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Prophet Skeram", -- artid 1385769
                    ["name"] = "예언자 스케람",
                }, -- [1]
                {
                    ["id"] = 1547,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Silithid Royalty", -- artid 1390436
                    ["name"] = "실리시드 왕실",
                }, -- [2]
                {
                    ["id"] = 1544,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Battleguard Sartura", -- artid 1385720
                    ["name"] = "전투감시병 살투라",
                }, -- [3]
                {
                    ["id"] = 1545,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Fankriss the Unyielding", -- artid 1385728
                    ["name"] = "불굴의 판크리스",
                }, -- [4]
                {
                    ["id"] = 1548,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Viscidus", -- artid 1385771
                    ["name"] = "비시두스",
                }, -- [5]
                {
                    ["id"] = 1546,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Princess Huhuran", -- artid 1385761
                    ["name"] = "공주 후후란",
                }, -- [6]
                {
                    ["id"] = 1549,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Twin Emperors", -- artid 1390437
                    ["name"] = "쌍둥이 제왕",
                }, -- [7]
                {
                    ["id"] = 1550,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ouro", -- artid 1385760
                    ["name"] = "아우로",
                }, -- [8]
                {
                    ["id"] = 1551,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-CThun", -- artid 1385726
                    ["name"] = "크툰",
                }, -- [9]
            },
        }, -- [4]
        {
            ["id"] = 745,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Naxxramas", -- artid 1396587
            ["name"] = "낙스라마스",
            ["bosses"] = {
                {
                    ["id"] = 1552,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-AnubRekhan", -- artid 1378964
                    ["name"] = "아눕레칸",
                }, -- [1]
                {
                    ["id"] = 1553,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grand Widow Faerlina", -- artid 1378980
                    ["name"] = "귀부인 팰리나",
                }, -- [2]
                {
                    ["id"] = 1554,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maexxna", -- artid 1378994
                    ["name"] = "맥스나",
                }, -- [3]
                {
                    ["id"] = 1555,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Noth the Plaguebringer", -- artid 1379004
                    ["name"] = "역병술사 노스",
                }, -- [4]
                {
                    ["id"] = 1556,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Heigan the Unclean", -- artid 1378984
                    ["name"] = "부정의 헤이건",
                }, -- [5]
                {
                    ["id"] = 1557,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Loatheb", -- artid 1378991
                    ["name"] = "로데브",
                }, -- [6]
                {
                    ["id"] = 1558,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Instructor Razuvious", -- artid 1378988
                    ["name"] = "훈련교관 라주비어스",
                }, -- [7]
                {
                    ["id"] = 1559,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gothik the Harvester", -- artid 1378979
                    ["name"] = "영혼 착취자 고딕",
                }, -- [8]
                {
                    ["id"] = 1560,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Four Horseman", -- artid 1385732
                    ["name"] = "4인 기사단",
                }, -- [9]
                {
                    ["id"] = 1561,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Patchwerk", -- artid 1379005
                    ["name"] = "패치워크",
                }, -- [10]
                {
                    ["id"] = 1562,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grobbulus", -- artid 1378981
                    ["name"] = "그라불루스",
                }, -- [11]
                {
                    ["id"] = 1563,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gluth", -- artid 1378977
                    ["name"] = "글루스",
                }, -- [12]
                {
                    ["id"] = 1564,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thaddius", -- artid 1379019
                    ["name"] = "타디우스",
                }, -- [13]
                {
                    ["id"] = 1565,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Sapphiron", -- artid 1379010
                    ["name"] = "사피론",
                }, -- [14]
                {
                    ["id"] = 1566,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-KelThuzad", -- artid 1378989
                    ["name"] = "켈투자드",
                }, -- [15]
            },
        }, -- [5]
        {
            ["id"] = 233,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-RazorfenDowns", -- artid 608212
            ["name"] = "가시덩굴 구릉",
            ["bosses"] = {
                {
                    ["id"] = 1142,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hadronox", -- artid 607633
                    ["name"] = "아룩스",
                }, -- [1]
                {
                    ["id"] = 433,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mordresh Fire Eye", -- artid 607718
                    ["name"] = "불꽃눈 모드레쉬",
                }, -- [2]
                {
                    ["id"] = 1143,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mushlump", -- artid 1064178
                    ["name"] = "살점곤죽",
                }, -- [3]
                {
                    ["id"] = 1146,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Death Speaker Jargba", -- artid 607584
                    ["name"] = "죽음예언자 블랙쏜",
                }, -- [4]
                {
                    ["id"] = 1141,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Amnennar the Coldbringer", -- artid 607537
                    ["name"] = "혹한의 암네나르",
                }, -- [5]
            },
        }, -- [6]
        {
            ["id"] = 234,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-RazorfenKraul", -- artid 608213
            ["name"] = "가시덩굴 우리",
            ["bosses"] = {
                {
                    ["id"] = 896,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Aggem Thorncurse", -- artid 607531
                    ["name"] = "사냥꾼 본터스크",
                }, -- [1]
                {
                    ["id"] = 895,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Roogug", -- artid 607760
                    ["name"] = "루구그",
                }, -- [2]
                {
                    ["id"] = 899,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Overlord Ramtusk", -- artid 607736
                    ["name"] = "장군 램터스크",
                }, -- [3]
                {
                    ["id"] = 900,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Groyat", -- artid 1064175
                    ["name"] = "눈먼사냥꾼 그로얏",
                }, -- [4]
                {
                    ["id"] = 901,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Charlga Razorflank", -- artid 607563
                    ["name"] = "서슬깃 차를가",
                }, -- [5]
            },
        }, -- [7]
        {
            ["id"] = 228,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-BlackrockDepths", -- artid 608196
            ["name"] = "검은바위 나락",
            ["bosses"] = {
                {
                    ["id"] = 369,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Interrogator Gerstahn", -- artid 607644
                    ["name"] = "대심문관 게르스탄",
                }, -- [1]
                {
                    ["id"] = 370,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Roccor", -- artid 607697
                    ["name"] = "불의 군주 록코르",
                }, -- [2]
                {
                    ["id"] = 371,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Houndmaster Grebmar", -- artid 607647
                    ["name"] = "사냥개조련사 그렙마르",
                }, -- [3]
                {
                    ["id"] = 372,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Justice Grimstone", -- artid 608314
                    ["name"] = "법의 심판장",
                }, -- [4]
                {
                    ["id"] = 373,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Pyromancer Loregrain", -- artid 607749
                    ["name"] = "화염술사 로어그레인",
                }, -- [5]
                {
                    ["id"] = 374,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Incendius", -- artid 607694
                    ["name"] = "불의 군주 인센디우스",
                }, -- [6]
                {
                    ["id"] = 375,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Warder Stilgiss", -- artid 607814
                    ["name"] = "문지기 스틸기스",
                }, -- [7]
                {
                    ["id"] = 376,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Fineous Darkvire", -- artid 607602
                    ["name"] = "파이너스 다크바이어",
                }, -- [8]
                {
                    ["id"] = 377,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-BaelGar", -- artid 607549
                    ["name"] = "밸가르",
                }, -- [9]
                {
                    ["id"] = 378,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-General Angerforge", -- artid 607610
                    ["name"] = "사령관 앵거포지",
                }, -- [10]
                {
                    ["id"] = 379,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Golem Lord Argelmach", -- artid 607618
                    ["name"] = "골렘 군주 아젤마크",
                }, -- [11]
                {
                    ["id"] = 380,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hurley Blackbreath", -- artid 607650
                    ["name"] = "헐레이 블랙브레스",
                }, -- [12]
                {
                    ["id"] = 381,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Phalanx", -- artid 607740
                    ["name"] = "팔랑크스",
                }, -- [13]
                {
                    ["id"] = 383,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Plugger Spazzring", -- artid 607741
                    ["name"] = "플러거 스패즈링",
                }, -- [14]
                {
                    ["id"] = 384,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ambassador Flamelash", -- artid 607535
                    ["name"] = "사자 화염채찍",
                }, -- [15]
                {
                    ["id"] = 385,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-DoomRel", -- artid 607587
                    ["name"] = "일곱 현자",
                }, -- [16]
                {
                    ["id"] = 386,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Magmus", -- artid 607705
                    ["name"] = "마그무스",
                }, -- [17]
                {
                    ["id"] = 387,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Emperor Thaurissan", -- artid 607595
                    ["name"] = "제왕 다그란 타우릿산",
                }, -- [18]
            },
        }, -- [8]
        {
            ["id"] = 229,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-BlackrockSpire", -- artid 608197
            ["name"] = "검은바위 첨탑 하층",
            ["bosses"] = {
                {
                    ["id"] = 388,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Highlord Omokk", -- artid 607645
                    ["name"] = "대영주 오모크",
                }, -- [1]
                {
                    ["id"] = 389,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shadow Hunter Voshgajin", -- artid 607769
                    ["name"] = "어둠사냥꾼 보쉬가진",
                }, -- [2]
                {
                    ["id"] = 390,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-War Master Voone", -- artid 607810
                    ["name"] = "대장군 부네",
                }, -- [3]
                {
                    ["id"] = 391,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mother Smolderweb", -- artid 607719
                    ["name"] = "여왕 불그물거미",
                }, -- [4]
                {
                    ["id"] = 392,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Urok Doomhowl", -- artid 607801
                    ["name"] = "우로크 둠하울",
                }, -- [5]
                {
                    ["id"] = 393,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Quartermaster Zigris", -- artid 607751
                    ["name"] = "병참장교 지그리스",
                }, -- [6]
                {
                    ["id"] = 394,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Halycon", -- artid 607634
                    ["name"] = "할리콘",
                }, -- [7]
                {
                    ["id"] = 395,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Gizrul the Slavener", -- artid 607615
                    ["name"] = "흉포한 기즈룰",
                }, -- [8]
                {
                    ["id"] = 396,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Overlord Wyrmthalak", -- artid 607737
                    ["name"] = "대군주 웜타라크",
                }, -- [9]
            },
        }, -- [9]
        {
            ["id"] = 227,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-BlackfathomDeeps", -- artid 608195
            ["name"] = "검은심연 나락",
            ["bosses"] = {
                {
                    ["id"] = 368,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ghamoo-Ra", -- artid 1064179
                    ["name"] = "가무라",
                }, -- [1]
                {
                    ["id"] = 436,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Domina", -- artid 1064180
                    ["name"] = "도미나",
                }, -- [2]
                {
                    ["id"] = 426,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Commander Ulthok", -- artid 522214
                    ["name"] = "정복자 코르울",
                }, -- [3]
                {
                    ["id"] = 1145,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thruk", -- artid 1064181
                    ["name"] = "쓰럭",
                }, -- [4]
                {
                    ["id"] = 447,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Guardian of the Deep", -- artid 1064182
                    ["name"] = "심연의 수호자",
                }, -- [5]
                {
                    ["id"] = 1144,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Executioner Gore", -- artid 1064183
                    ["name"] = "집행자 고어",
                }, -- [6]
                {
                    ["id"] = 437,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Twilight Lord Bathiel", -- artid 1064184
                    ["name"] = "황혼의 군주 바시엘",
                }, -- [7]
                {
                    ["id"] = 444,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Akumai", -- artid 607532
                    ["name"] = "아쿠마이",
                }, -- [8]
            },
        }, -- [10]
        {
            ["id"] = 64,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-ShadowFangKeep", -- artid 522358
            ["name"] = "그림자송곳니 성채",
            ["bosses"] = {
                {
                    ["id"] = 96,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Baron Ashbury", -- artid 522205
                    ["name"] = "남작 애쉬버리",
                }, -- [1]
                {
                    ["id"] = 97,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Baron Silverlaine", -- artid 522206
                    ["name"] = "남작 실버레인",
                }, -- [2]
                {
                    ["id"] = 98,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Commander Springvale", -- artid 522213
                    ["name"] = "사령관 스프링베일",
                }, -- [3]
                {
                    ["id"] = 99,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Walden", -- artid 522249
                    ["name"] = "월든 경",
                }, -- [4]
                {
                    ["id"] = 100,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Godfrey", -- artid 522247
                    ["name"] = "고드프리 경",
                }, -- [5]
            },
        }, -- [11]
        {
            ["id"] = 231,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Gnomeregan", -- artid 608202
            ["name"] = "놈리건",
            ["bosses"] = {
                {
                    ["id"] = 419,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grubbis", -- artid 607628
                    ["name"] = "그루비스",
                }, -- [1]
                {
                    ["id"] = 420,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Viscous Fallout", -- artid 607808
                    ["name"] = "방사성 폐기물",
                }, -- [2]
                {
                    ["id"] = 421,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Electrocutioner 6000", -- artid 607594
                    ["name"] = "기계화 문지기 6000",
                }, -- [3]
                {
                    ["id"] = 418,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Crowd Pummeler 9-60", -- artid 607572
                    ["name"] = "고철 압축기 9-60",
                }, -- [4]
                {
                    ["id"] = 422,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mekgineer Thermaplugg", -- artid 607714
                    ["name"] = "기계박사 텔마플러그",
                }, -- [5]
            },
        }, -- [12]
        {
            ["id"] = 232,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Maraudon", -- artid 608209
            ["name"] = "마라우돈",
            ["bosses"] = {
                {
                    ["id"] = 423,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Noxxion", -- artid 607728
                    ["name"] = "녹시온",
                }, -- [1]
                {
                    ["id"] = 424,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Razorlash", -- artid 607756
                    ["name"] = "칼날채찍",
                }, -- [2]
                {
                    ["id"] = 425,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Tinkerer Gizlock", -- artid 607796
                    ["name"] = "땜장이 기즐록",
                }, -- [3]
                {
                    ["id"] = 427,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Vyletongue", -- artid 607699
                    ["name"] = "군주 바일텅",
                }, -- [4]
                {
                    ["id"] = 428,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Celebras the Cursed", -- artid 607562
                    ["name"] = "저주받은 셀레브라스",
                }, -- [5]
                {
                    ["id"] = 429,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Landslide", -- artid 607684
                    ["name"] = "산사태",
                }, -- [6]
                {
                    ["id"] = 430,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rotgrip", -- artid 607761
                    ["name"] = "썩은아귀",
                }, -- [7]
                {
                    ["id"] = 431,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Princess Theradras", -- artid 607747
                    ["name"] = "공주 테라드라스",
                }, -- [8]
            },
        }, -- [13]
        {
            ["id"] = 316,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-ScarletMonastery", -- artid 608214
            ["name"] = "붉은십자군 수도원",
            ["bosses"] = {
                {
                    ["id"] = 688,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Thalnos the Soulrender", -- artid 630853
                    ["name"] = "영혼분리자 탈노스",
                }, -- [1]
                {
                    ["id"] = 671,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Brother Korloff", -- artid 630818
                    ["name"] = "수사 콜로프",
                }, -- [2]
                {
                    ["id"] = 674,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-High Inquisitor Whitemane", -- artid 607643
                    ["name"] = "종교재판관 화이트메인",
                }, -- [3]
            },
        }, -- [14]
        {
            ["id"] = 311,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-ScarletHalls", -- artid 643262
            ["name"] = "붉은십자군 전당",
            ["bosses"] = {
                {
                    ["id"] = 660,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Houndmaster Braun", -- artid 630833
                    ["name"] = "사냥개조련사 브라운",
                }, -- [1]
                {
                    ["id"] = 654,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Armsmaster Harlan", -- artid 630816
                    ["name"] = "무기전문가 할란",
                }, -- [2]
                {
                    ["id"] = 656,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Flameweaver Koegler", -- artid 630825
                    ["name"] = "화염술사 쾨글러",
                }, -- [3]
            },
        }, -- [15]
        {
            ["id"] = 226,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-RagefireChasm", -- artid 608211
            ["name"] = "성난불길 협곡",
            ["bosses"] = {
                {
                    ["id"] = 694,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Adarogg", -- artid 608309
                    ["name"] = "아다로그",
                }, -- [1]
                {
                    ["id"] = 695,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Dark Shaman Koranthal", -- artid 608310
                    ["name"] = "암흑주술사 코란살",
                }, -- [2]
                {
                    ["id"] = 696,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Magmaw", -- artid 522251
                    ["name"] = "화산아귀",
                }, -- [3]
                {
                    ["id"] = 697,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lava Guard Gordoth", -- artid 608315
                    ["name"] = "용암경비병 고르도스",
                }, -- [4]
            },
        }, -- [16]
        {
            ["id"] = 246,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Scholomance", -- artid 608215
            ["name"] = "스칼로맨스",
            ["bosses"] = {
                {
                    ["id"] = 659,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Instructor Chillheart", -- artid 630835
                    ["name"] = "조교 칠하트",
                }, -- [1]
                {
                    ["id"] = 663,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Jandice Barov", -- artid 607666
                    ["name"] = "잔다이스 바로브",
                }, -- [2]
                {
                    ["id"] = 665,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Rattlegore", -- artid 607755
                    ["name"] = "들창엄니",
                }, -- [3]
                {
                    ["id"] = 666,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lillian Voss", -- artid 630838
                    ["name"] = "릴리안 보스",
                }, -- [4]
                {
                    ["id"] = 684,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Darkmaster Gandling", -- artid 607582
                    ["name"] = "암흑스승 간들링",
                }, -- [5]
            },
        }, -- [17]
        {
            ["id"] = 238,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-TheStockade", -- artid 608223
            ["name"] = "스톰윈드 지하감옥",
            ["bosses"] = {
                {
                    ["id"] = 464,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hogger-New", -- artid 4776138
                    ["name"] = "들창코",
                }, -- [1]
                {
                    ["id"] = 465,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Overheat", -- artid 607695
                    ["name"] = "군주 열지옥",
                }, -- [2]
                {
                    ["id"] = 466,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Randolph Moloch", -- artid 607753
                    ["name"] = "란돌프 몰로크",
                }, -- [3]
            },
        }, -- [18]
        {
            ["id"] = 236,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Stratholme", -- artid 608216
            ["name"] = "스트라솔름",
            ["bosses"] = {
                {
                    ["id"] = 443,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hearthsinger Forresten", -- artid 607637
                    ["name"] = "하스싱어 포레스턴",
                }, -- [1]
                {
                    ["id"] = 445,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Timmy the Cruel", -- artid 607795
                    ["name"] = "잔혹한 티미",
                }, -- [2]
                {
                    ["id"] = 749,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Commander Malor", -- artid 607569
                    ["name"] = "사령관 말로",
                }, -- [3]
                {
                    ["id"] = 446,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Willey Hopebreaker", -- artid 607818
                    ["name"] = "윌리 호프브레이커",
                }, -- [4]
                {
                    ["id"] = 448,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Instructor Galford", -- artid 607660
                    ["name"] = "교관 갈포드",
                }, -- [5]
                {
                    ["id"] = 449,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Balnazzar", -- artid 607551
                    ["name"] = "발나자르",
                }, -- [6]
                {
                    ["id"] = 450,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Unforgiven", -- artid 607792
                    ["name"] = "용서받지 못한 자",
                }, -- [7]
                {
                    ["id"] = 451,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Baroness Anastari", -- artid 607553
                    ["name"] = "남작부인 아나스타리",
                }, -- [8]
                {
                    ["id"] = 452,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Nerubenkan", -- artid 607724
                    ["name"] = "네룹엔칸",
                }, -- [9]
                {
                    ["id"] = 453,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Maleki the Pallid", -- artid 607707
                    ["name"] = "냉혈한 말레키",
                }, -- [10]
                {
                    ["id"] = 454,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-The Ravenian", -- artid 607791
                    ["name"] = "집정관 발실라스",
                }, -- [11]
                {
                    ["id"] = 455,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ramstein the Gorger", -- artid 607752
                    ["name"] = "먹보 람스타인",
                }, -- [12]
                {
                    ["id"] = 456,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Aurius Rivendare", -- artid 607692
                    ["name"] = "군주 아우리우스 리븐데어",
                }, -- [13]
            },
        }, -- [19]
        {
            ["id"] = 237,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-SunkenTemple", -- artid 608217
            ["name"] = "가라앉은 사원",
            ["bosses"] = {
                {
                    ["id"] = 457,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Avatar of Hakkar", -- artid 607548
                    ["name"] = "학카르의 화신",
                }, -- [1]
                {
                    ["id"] = 458,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Jammalan the Prophet", -- artid 607665
                    ["name"] = "예언자 잠말란",
                }, -- [2]
                {
                    ["id"] = 459,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Dreamscythe", -- artid 608311
                    ["name"] = "꿈의 감독관",
                }, -- [3]
                {
                    ["id"] = 463,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Shade of Eranikus", -- artid 607768
                    ["name"] = "에라니쿠스의 사령",
                }, -- [4]
            },
        }, -- [20]
        {
            ["id"] = 239,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Uldaman", -- artid 608225
            ["name"] = "울다만",
            ["bosses"] = {
                {
                    ["id"] = 467,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Revelosh", -- artid 607757
                    ["name"] = "레벨로쉬",
                }, -- [1]
                {
                    ["id"] = 468,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Baelog", -- artid 607550
                    ["name"] = "길 잃은 드워프",
                }, -- [2]
                {
                    ["id"] = 469,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ironaya", -- artid 607664
                    ["name"] = "아이로나야",
                }, -- [3]
                {
                    ["id"] = 748,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Obsidian Sentinel", -- artid 607729
                    ["name"] = "흑요석 파수꾼",
                }, -- [4]
                {
                    ["id"] = 470,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ancient Stone Keeper", -- artid 607538
                    ["name"] = "고대 바위 문지기",
                }, -- [5]
                {
                    ["id"] = 471,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Galgann Firehammer", -- artid 607606
                    ["name"] = "갈간 파이어해머",
                }, -- [6]
                {
                    ["id"] = 472,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Grimlok", -- artid 607626
                    ["name"] = "그림로크",
                }, -- [7]
                {
                    ["id"] = 473,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Archaedas", -- artid 607546
                    ["name"] = "아카에다스",
                }, -- [8]
            },
        }, -- [21]
        {
            ["id"] = 63,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-Deadmines", -- artid 522352
            ["name"] = "죽음의 폐광",
            ["bosses"] = {
                {
                    ["id"] = 89,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Glubtok", -- artid 522228
                    ["name"] = "글럽톡",
                }, -- [1]
                {
                    ["id"] = 90,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Helix Gearbreaker", -- artid 522234
                    ["name"] = "헬릭스 기어브레이커",
                }, -- [2]
                {
                    ["id"] = 91,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Foe Reaper 5000", -- artid 522225
                    ["name"] = "전투 절단기 5000",
                }, -- [3]
                {
                    ["id"] = 92,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Admiral Ripsnarl", -- artid 522189
                    ["name"] = "제독 으르렁니",
                }, -- [4]
                {
                    ["id"] = 93,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Captain Cookie", -- artid 522210
                    ["name"] = "\"선장\" 쿠키",
                }, -- [5]
                {
                    ["id"] = 95,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Vanessa VanCleef", -- artid 522278
                    ["name"] = "바네사 밴클리프",
                }, -- [6]
            },
        }, -- [22]
        {
            ["id"] = 241,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-ZulFarrak", -- artid 608230
            ["name"] = "줄파락",
            ["bosses"] = {
                {
                    ["id"] = 483,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Ghazan", -- artid 607614
                    ["name"] = "가즈릴라",
                }, -- [1]
                {
                    ["id"] = 484,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Antusul", -- artid 607541
                    ["name"] = "안투술",
                }, -- [2]
                {
                    ["id"] = 485,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Theka the Martyr", -- artid 607793
                    ["name"] = "순교자 데카",
                }, -- [3]
                {
                    ["id"] = 486,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Witch Doctor Zumrah", -- artid 607819
                    ["name"] = "의술사 줌라",
                }, -- [4]
                {
                    ["id"] = 487,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Nekrum Gutchewer", -- artid 607723
                    ["name"] = "네크룸과 세즈지즈",
                }, -- [5]
                {
                    ["id"] = 489,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Chief Ukorz Sandscalp", -- artid 607564
                    ["name"] = "족장 우코르즈 샌드스칼프",
                }, -- [6]
            },
        }, -- [23]
        {
            ["id"] = 240,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-WailingCaverns", -- artid 608229
            ["name"] = "통곡의 동굴",
            ["bosses"] = {
                {
                    ["id"] = 474,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lady Anacondra", -- artid 607680
                    ["name"] = "여군주 아나콘드라",
                }, -- [1]
                {
                    ["id"] = 476,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Pythas", -- artid 607696
                    ["name"] = "군주 피타스",
                }, -- [2]
                {
                    ["id"] = 475,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Cobrahn", -- artid 607693
                    ["name"] = "군주 코브란",
                }, -- [3]
                {
                    ["id"] = 477,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Kresh", -- artid 607676
                    ["name"] = "크레쉬",
                }, -- [4]
                {
                    ["id"] = 478,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Skum", -- artid 607775
                    ["name"] = "스컴",
                }, -- [5]
                {
                    ["id"] = 479,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lord Serpentis", -- artid 607698
                    ["name"] = "군주 서펜티스",
                }, -- [6]
                {
                    ["id"] = 480,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Verdan the Everliving", -- artid 607805
                    ["name"] = "영생의 베르단",
                }, -- [7]
                {
                    ["id"] = 481,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Mutanus the Devourer", -- artid 607721
                    ["name"] = "걸신들린 무타누스",
                }, -- [8]
            },
        }, -- [24]
        {
            ["id"] = 230,
            ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-DUNGEONBUTTON-DireMaul", -- artid 608200
            ["name"] = "혈투의 전장",
            ["bosses"] = {
                {
                    ["id"] = 402,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Zevrim Thornhoof", -- artid 607824
                    ["name"] = "제브림 쏜후프",
                }, -- [1]
                {
                    ["id"] = 403,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Hydrospawn", -- artid 607653
                    ["name"] = "히드로스폰",
                }, -- [2]
                {
                    ["id"] = 404,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Lethtendris", -- artid 607686
                    ["name"] = "레스텐드리스",
                }, -- [3]
                {
                    ["id"] = 405,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Alzzin the Wildshaper", -- artid 607533
                    ["name"] = "칼날바람 알진",
                }, -- [4]
                {
                    ["id"] = 406,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Tendris Warpwood", -- artid 607785
                    ["name"] = "굽이나무 텐드리스",
                }, -- [5]
                {
                    ["id"] = 407,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Illyanna Ravenoak", -- artid 607656
                    ["name"] = "일리아나 레이븐오크",
                }, -- [6]
                {
                    ["id"] = 408,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Magister Kalendris", -- artid 607703
                    ["name"] = "마법학자 칼렌드리스",
                }, -- [7]
                {
                    ["id"] = 409,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Immolthar", -- artid 607657
                    ["name"] = "이몰타르",
                }, -- [8]
                {
                    ["id"] = 410,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Prince Tortheldrin", -- artid 607745
                    ["name"] = "왕자 토르텔드린",
                }, -- [9]
                {
                    ["id"] = 411,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Guard Moldar", -- artid 607630
                    ["name"] = "경비병 몰다르",
                }, -- [10]
                {
                    ["id"] = 412,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Stomper Kreeg", -- artid 607777
                    ["name"] = "천둥발 크리그",
                }, -- [11]
                {
                    ["id"] = 413,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Guard Fengus", -- artid 607629
                    ["name"] = "경비병 펜구스",
                }, -- [12]
                {
                    ["id"] = 414,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Guard Slipkik", -- artid 607631
                    ["name"] = "경비병 슬립킥",
                }, -- [13]
                {
                    ["id"] = 415,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-Captain Kromcrush", -- artid 607560
                    ["name"] = "대장 크롬크러쉬",
                }, -- [14]
                {
                    ["id"] = 416,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-ChoRush the Observer", -- artid 607565
                    ["name"] = "정찰병 초루쉬",
                }, -- [15]
                {
                    ["id"] = 417,
                    ["image"] = "Interface\\AddOns\\Cell\\Media\\EncounterJournal\\UI-EJ-BOSS-King Gordok", -- artid 607673
                    ["name"] = "왕 고르독",
                }, -- [16]
            },
        }, -- [25]
    },
}
