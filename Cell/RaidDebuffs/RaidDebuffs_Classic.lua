---------------------------------------------------------------------
-- File: Cell\RaidDebuffs\RaidDebuffs_Classic.lua
-- Author: enderneko (enderneko-dev@outlook.com)
-- Created : 2022-08-05 17:46:11 +08:00
-- Modified: 2026-01-22 19:01 +08:00
---------------------------------------------------------------------

local _, Cell = ...
local F = Cell.funcs

local debuffs = {
    [741] = { -- 熔火之心
        ["general"] = {
            19366, -- 灼烧之焰
            15732, -- 献祭
            19695, -- Inferno
            19641, -- Pyroclast Barrage
            19364, -- Ground Stomp
            19631, -- Melt Armor
            16168, -- Flame Buffet
            20276, -- Knockdown
        },
        [1519] = { -- 鲁西弗隆
            19702, -- 末日迫近
            19703, -- 鲁西弗隆的诅咒
            20604, -- 统御意志
        },
        [1520] = { -- 玛格曼达
            19428, -- 燃烧
            19450, -- 熔岩喷吐
            19408, -- 恐慌
        },
        [1521] = { -- 基赫纳斯
            19717, -- 火焰之雨
            15502, -- 破甲攻击
            20277, -- 拉格纳罗斯之拳
            19716, -- 基赫纳斯的诅咒
        },
        [1522] = { -- 加尔
            15732, -- 献祭
            19496, -- Magma Shackles
        },
        [1523] = { -- 沙斯拉尔
            19713, -- 沙斯拉尔的诅咒
        },
        [1524] = { -- 迦顿男爵
            20475, -- 活化炸弹
            19659, -- 点燃法力
        },
        [1525] = { -- 萨弗隆先驱者
            19780, -- 拉格纳罗斯之手
            -- 19776, -- 暗言术:痛
            20294, -- 献祭
            19778, -- Demoralizing Shout
        },
        [1526] = { -- 焚化者古雷曼格
            13880, -- 熔岩喷溅
            19820, -- 裂伤
            20228, -- 炎爆术
        },
        [1527] = { -- 管理者埃克索图斯
            20229, -- 冲击波
            19369, -- 上古绝望
            19635, -- 煽动烈焰
            19367, -- 枯萎热浪
            19365, -- 上古恐慌
            19776, -- 暗言术:痛
            19393, -- 灵魂燃烧
            47836, -- 腐蚀之种
            55360, -- 活动炸弹
            19372, -- 上古恐惧
        },
        [1528] = { -- 拉格纳罗斯
            20564, -- Elemental Fire
        },
    },

    [742] = { -- 黑翼之巢
        ["general"] = {
            23023, -- Conflagration
            18173, -- Burning Adrenaline
            24573, -- Mortal Strike
            23340, -- Shadow of Ebonroc
            23170, -- Brood Affliction: Bronze
            22687, -- Veil of Shadow
            22424, -- Blast Wave
            22433, -- Flame Buffet
            22558, -- Brood Power: Red
            22642, -- Brood Power: Bronze
            22561, -- Brood Power: Green
            22559, -- Brood Power: Blue
            22442, -- Growing Flames
            22275, -- Flamestrike
            22423, -- Flame Shock
            22335, -- Bottle of Poison
            19717, -- Rain of Fire
            22274, -- Greater Polymorph
            14515, -- Dominate Mind
            13747, -- Slow
            22682, -- Shadow Flame
        },
        [1529] = { -- 狂野的拉佐格尔
            24375, -- War Stomp
        },
        [1530] = { -- 堕落的瓦拉斯塔兹
            23461, -- Flame Breath
        },
        [1531] = { -- 勒什雷尔
            22247, -- Suppression Aura
        },
        [1532] = { -- 费尔默
        },
        [1533] = { -- 埃博诺克
        },
        [1534] = { -- 弗莱格尔
        },
        [1535] = { -- 克洛玛古斯
            23310, -- Time Lapse
            23313, -- Corrosive Acid
            23315, -- Ignite Flesh
            23187, -- Frost Burn
            23153, -- Brood Affliction: Blue
            23154, -- Brood Affliction: Black
            23155, -- Brood Affliction: Red
            23169, -- Brood Affliction: Green
            23174, -- Chromatic Mutation
        },
        [1536] = { -- 奈法利安
            22667, -- Shadow Command
            22678, -- Fear
            22686, -- Bellowing Roar
            23364, -- Tail Lash
            23397, -- Berserk
            23414, -- Paralyze
            23410, -- Wild Magic
            23398, -- Involuntary Transformation
            23401, -- Corrupted Healing
            23418, -- Siphon Blessing
            23425, -- Corrupted Totems
            23427, -- Summon Infernals
        },
    },

    [743] = { -- 安其拉废墟
        ["general"] = {
            25646, -- Mortal Wound
            25471, -- Attack Order
            96, -- Dismember
            25725, -- Paralyze
            25189, -- Enveloping Winds
            17742, -- Cloud of Disease
            24317, -- Sunder Armor
            19134, -- Frightening Shout
            25425, -- Shockwave
            26550, -- Lightning Cloud
        },
        [1537] = { -- 库林纳克斯
        },
        [1538] = { -- 拉贾克斯将军
            6713, -- Disarm
        },
        [1539] = { -- 莫阿姆
        },
        [1540] = { -- 吞咽者布鲁
            20512, -- Creeping Plague
        },
        [1541] = { -- 狩猎者阿亚米斯
            25748, -- Poison Stinger
            25852, -- Lash
        },
        [1542] = { -- 无疤者奥斯里安
            25161, -- Harsh Winds
            25195, -- Curse of Tongues
        },
    },

    [744] = { -- 安其拉神殿
        ["general"] = {
            785, -- True Fulfillment
            26580, -- Fear
            26050, -- Acid Spit
            26180, -- Wyvern Sting
            26053, -- Noxious Poison
            26613, -- Unbalancing Strike
            26044, -- Mind Flay
            26071, -- Entangling Roots
            24573, -- Mortal Strike
            26552, -- Nullify
            26069, -- Silence
            23931, -- Thunderclap
            26079, -- Cause Insanity
            26049, -- Mana Burn
            19134, -- Frightening Shout
            25809, -- Crippling Poison
            26601, -- Poison Bolt
            25051, -- Sunder Armor
            26025, -- Impale
        },
        [1543] = { -- 预言者斯克拉姆
        },
        [1547] = { -- 安其拉三宝
            25812, -- Toxic Volley
            38718, -- Toxic Pool
            19408, -- Panic
        },
        [1544] = { -- 沙尔图拉
        },
        [1545] = { -- 顽强的范克瑞斯
            28467, -- Mortal Wound
        },
        [1548] = { -- 维希度斯
            25991, -- Poison Bolt Volley
            25989, -- Toxin
        },
        [1546] = { -- 哈霍兰公主
        },
        [1549] = { -- 双子皇帝
            26607, -- Blizzard
            568, -- Arcane Burst
        },
        [1550] = { -- 奥罗
            26102, -- Sand Blast
        },
        [1551] = { -- 克苏恩
            26141, -- Hamstring
            26476, -- Digestive Acid
        },
    },

    [745] = { -- 纳克萨玛斯
        ["general"] = {
            28732, -- Widow's Embrace
            28622, -- Web Wrap
            28169, -- Mutating Injection
            29213, -- Curse of the Plaguebringer
            28835, -- Mark of Zeliek
            27808, -- Frost Blast
            28410, -- Chains of Kel'Thuzad
            27819, -- Detonate Mana
        },
        [1552] = { -- 阿努布雷坎
        },
        [1553] = { -- 黑女巫法琳娜
        },
        [1554] = { -- 迈克斯纳
        },
        [1555] = { -- 药剂师诺斯
        },
        [1556] = { -- 肮脏的希尔盖
        },
        [1557] = { -- 洛欧塞布
        },
        [1558] = { -- 教官拉苏维奥斯
        },
        [1559] = { -- 收割者戈提克
        },
        [1560] = { -- 天启四骑士
        },
        [1561] = { -- 帕奇维克
        },
        [1562] = { -- 格罗布鲁斯
        },
        [1563] = { -- 格拉斯
        },
        [1564] = { -- 塔迪乌斯
        },
        [1565] = { -- 萨菲隆
        },
        [1566] = { -- 克尔苏加德
        },
    },

    [309] = { -- 祖尔格拉布
        ["general"] = {
            23931, -- 雷霆一击
            24002, -- 宁神毒药
            24003, -- 宁神毒药
            24011, -- 毒液喷吐
            24063, -- 疾病之云
            24321, -- 酸性血液
            24778, -- 沉睡
            24818, -- 毒性吐息
            24839, -- 酸液吐息
            24840, -- 毒云
            22678, -- Fear
            6713, -- Disarm
            24048, -- Whirling Trip
            13445, -- Rend
            21401, -- Frost Shock
            24619, -- Soul Tap
            16790, -- Knockdown
            15655, -- Shield Slam
            16508, -- Intimidating Roar
            24335, -- Wyvern Sting
            3604, -- Tendon Rip
            24671, -- Snap Kick
            24611, -- Fireball
            24612, -- Flamestrike
            12097, -- Pierce Armor
            13730, -- Demoralizing Shout
        },
        [784] = { -- 高阶祭司温诺希斯
            23849, -- 温诺希斯变形
            23860, -- 神圣之火
            23861, -- 毒云
            23862, -- 毒液喷吐
            23865, -- 寄生蛇
            23895, -- 恢复
            24688, -- 温诺希斯的守护
        },
        [785] = { -- 高阶祭司耶克里克
            22884, -- 心灵尖啸
            23918, -- 音爆
            23919, -- 猛扑
            23952, -- 暗言术：痛
            23953, -- 精神鞭笞
            23966, -- 耶克里克变形
            24004, -- 沉睡
            22911, -- Charge
        },
        [786] = { -- 高阶祭司玛尔里
            24084, -- 玛尔里的变形术
            24097, -- 中毒
            24099, -- 毒液箭雨
            24109, -- 放大
            24110, -- 包围之网
            24111, -- 腐蚀毒药
            24300, -- 吸取生命
        },
        [787] = { -- 血领主曼多基尔
            16856, -- 致死打击
            24314, -- 威慑凝视
            24317, -- 破甲
            24318, -- 狂乱
            24573, -- 致死打击
        },
        [788] = { -- 疯狂之缘
            8269, -- 狂乱
            24157, -- 不祥的妖术
            24327, -- 疯狂
            24388, -- 脑部损伤
            24415, -- 减速
            24646, -- 天神下凡
            24664, -- 睡眠
            24674, -- 暗影迷雾
            24683, -- 落雷之云
            24698, -- 凿击
            24699, -- 消失
            6524, -- Ground Tremor
        },
        [789] = { -- 高阶祭司塞卡尔
            12540, -- 凿击
            21060, -- 致盲
            24331, -- 斜掠
            24332, -- 斜掠
            24333, -- 毁灭
            22859, -- Mortal Cleave
            22666, -- Silence
        },
        [790] = { -- 加兹兰卡
            16099, -- 冰霜吐息
            -- 24326, -- 加兹兰卡猛击：直接伤害/击退，没有玩家 aura，RaidDebuffs 无法显示。
        },
        [791] = { -- 高阶祭司娅尔罗
            24190, -- 娅尔罗变形
            24210, -- 娅尔罗的印记
            24212, -- 暗言术：痛
            24223, -- 消失
            24339, -- 感染撕咬
        },
        [792] = { -- 妖术师金度
            17172, -- 妖术
            24053, -- 妖术
            24261, -- 洗脑
            24300, -- 吸取生命
            24306, -- 金度的欺骗
            24600, -- 织网
            24618, -- 吸取生命
        },
        [793] = { -- 哈卡
            24178, -- 哈卡的意志
            24322, -- 血液虹吸
            24323, -- 血液虹吸
            24324, -- 血液虹吸
            24327, -- 疯狂
            24328, -- 堕落之血
            24673, -- 血之诅咒
            24686, -- 玛尔里的守护
            24687, -- 耶克里克的守护
            24688, -- 温诺希斯的守护
            24689, -- 塞卡尔的守护
            24690, -- 娅尔罗的守护
        },
    },

    [234] = { -- 剃刀沼泽
        ["general"] = {
            14515, -- Dominate Mind
            6533, -- Net
            15548, -- Thunderclap
            8400, -- Fireball
            8282, -- Curse of Blood
            8281, -- Sonic Burst
            8275, -- Poisoned Shot
            6984, -- Frost Shot
            8046, -- Earth Shock
            6524, -- Ground Tremor
            6728, -- Enveloping Winds
            9672, -- Frostbolt
            113, -- Chains of Ice
        },
        [896] = { -- 猎手布塔斯克
        },
        [895] = { -- 鲁古格
        },
        [899] = { -- 督军拉姆塔斯
        },
        [900] = { -- 盲眼猎手格罗亚特
        },
        [901] = { -- 卡尔加·刺肋
        },
    },

    [233] = { -- 剃刀高地
        ["general"] = {
            12255, -- Curse of Tuten'kash
            12252, -- Web Spray
            7645, -- Dominate Mind
            12946, -- Putrid Stench
            9672, -- Frostbolt
            11831, -- Frost Nova
            12251, -- Virulent Poison
            744, -- Poison
            745, -- Web
            12528, -- Silence
            8078, -- Thunderclap
            12461, -- Backhand
            11980, -- Curse of Weakness
            11443, -- Cripple
            6725, -- Flame Spike
            11436, -- Slow
        },
        [1142] = { -- 阿鲁克斯
        },
        [433] = { -- 火眼莫德雷斯
        },
        [1143] = { -- 麦什伦
        },
        [1146] = { -- 亡语者布莱克松
        },
        [1141] = { -- 寒冰之王亚门纳尔
        },
    },

    [230] = { -- 厄运之槌
        ["general"] = {
            12742, -- Immolate
            15063, -- Frost Nova
            22519, -- Ice Nova
            22356, -- Slow
            21749, -- Thorn Volley
            5416, -- Venom Sting
            13737, -- Mortal Strike
            13738, -- Rend
            3604, -- Tendon Rip
            11428, -- Knockdown
            15654, -- Shadow Word: Pain
            17831, -- Call of the Grave
            16838, -- Banshee Shriek
            18101, -- Chilled
            15530, -- Frostbolt
            22744, -- Chains of Ice
            15244, -- Cone of Cold
            22823, -- Starshards
            13323, -- Polymorph
            12540, -- Gouge
            21060, -- Blind
            22415, -- Entangling Roots
            14331, -- Vicious Rend
            20754, -- Rain of Fire
            12096, -- Fear
            22371, -- Curse of Impotence
            12493, -- Curse of Weakness
            3609, -- Paralyzing Poison
            15583, -- Rupture
            9080, -- Hamstring
            16145, -- Sunder Armor
            8994, -- Banish
            16102, -- Flamestrike
            12024, -- Net
            23224, -- Veil of Shadow
            20989, -- Sleep
            22946, -- Lightning Cloud
            22909, -- Eye of Immol'thar
            16046, -- Blast Wave
            22713, -- Flame Buffet
        },
        [402] = { -- 瑟雷姆·刺蹄
            22478, -- Intense Pain
            22651, -- Sacrifice
        },
        [403] = { -- 海多斯博恩
            22419, -- Riptide
        },
        [404] = { -- 蕾瑟塔蒂丝
        },
        [405] = { -- 荒野变形者奥兹恩
            22691, -- Disarm
            22689, -- Mangle
            22662, -- Wither
        },
        [406] = { -- 特迪斯·扭木
            22924, -- Grasping Vines
            22994, -- Entangle
        },
        [407] = { -- 伊琳娜·暗木
            22908, -- Volley
            22914, -- Concussive Shot
            22915, -- Improved Concussive Shot
        },
        [408] = { -- 卡雷迪斯镇长
            22919, -- Mind Flay
            7645, -- Dominate Mind
        },
        [409] = { -- 伊莫塔尔
            16128, -- Infected Bite
        },
        [410] = { -- 托塞德林王子
        },
        [411] = { -- 卫兵摩尔达
        },
        [412] = { -- 践踏者克雷格
        },
        [413] = { -- 卫兵芬古斯
        },
        [414] = { -- 卫兵斯里基克
        },
        [415] = { -- 克罗卡斯
            22859, -- Mortal Cleave
            19134, -- Frightening Shout
        },
        [416] = { -- 观察者克鲁什
            22884, -- Psychic Scream
        },
        [417] = { -- 戈多克大王
            16727, -- War Stomp
        },
    },

    [240] = { -- 哀嚎洞穴
        ["general"] = {
            8040, -- Druid's Slumber
            8142, -- Grasping Vines
            7967, -- Naralex's Nightmare
            8150, -- Thundercrack
            7947, -- Localized Toxin
            744, -- Poison
            7399, -- Terrify
            3604, -- Tendon Rip
        },
        [474] = { -- 安娜科德拉
        },
        [476] = { -- 皮萨斯
            8147, -- Thunderclap
        },
        [475] = { -- 考布莱恩
        },
        [477] = { -- 克雷什
        },
        [478] = { -- 斯卡姆
        },
        [479] = { -- 瑟芬迪斯
            700, -- Sleep
        },
        [480] = { -- 永生者沃尔丹
            5164, -- Knockdown
        },
        [481] = { -- 吞噬者穆坦努斯
        },
    },

    [239] = { -- 奥达曼
        ["general"] = {
            3356, -- Flame Lash
            6524, -- Ground Tremor
            3636, -- Crystalline Slumber
            8281, -- Sonic Burst
            8242, -- Shield Slam
            6685, -- Piercing Shot
            8814, -- Flame Spike
            10452, -- Flame Buffet
            6713, -- Disarm
            2767, -- Shadow Word: Pain
            6726, -- Silence
            8257, -- Venom Sting
            744, -- Poison
            2941, -- Immolate
        },
        [467] = { -- 鲁维罗什
        },
        [468] = { -- 失踪的矮人
        },
        [469] = { -- 艾隆纳亚
            11876, -- War Stomp
        },
        [748] = { -- 黑曜石哨兵
        },
        [470] = { -- 远古巨石卫士
        },
        [471] = { -- 加加恩·火锤
            8053, -- Flame Shock
            9482, -- Amplify Flames
        },
        [472] = { -- 格瑞姆洛克
        },
        [473] = { -- 阿扎达斯
        },
    },

    [64] = { -- 影牙城堡
        ["general"] = {
            7068, -- Veil of Shadow
            7125, -- Toxic Saliva
            7621, -- Arugal's Curse
            68607, -- Alluring Perfume Spray
            68821, -- Chain Reaction
            68948, -- Irresistible Cologne Spray
            7803, -- Thundershock
            7124, -- Arugal's Gift
            7295, -- Soul Drain
            7074, -- Screams of the Past
            9080, -- Hamstring
            7140, -- Expose Weakness
            6713, -- Disarm
            7139, -- Fel Stomp
            7127, -- Wavering Will
            970, -- Shadow Word: Pain
            6136, -- Chilled
        },
        [96] = { -- 灰葬男爵
        },
        [97] = { -- 席瓦莱恩男爵
        },
        [98] = { -- 指挥官斯普林瓦尔
            5588, -- Hammer of Justice
        },
        [99] = { -- 沃登勋爵
        },
        [100] = { -- 高弗雷勋爵
        },
    },

    [226] = { -- 怒焰裂谷
        ["general"] = {
            2818, -- Deadly Poison
            11980, -- Curse of Weakness
            20800, -- Immolate
            8242, -- Shield Slam
            18266, -- Curse of Agony
        },
        [694] = { -- 阿达罗格
        },
        [695] = { -- 黑暗萨满柯兰萨
        },
        [696] = { -- 焰喉
        },
        [697] = { -- 熔岩守卫戈多斯
        },
    },

    [236] = { -- 斯坦索姆
        ["general"] = {
            16798, -- Enchanting Lullaby
            12734, -- Ground Smash
            17293, -- Burning Winds
            17405, -- Domination
            16867, -- Banshee Curse
            6016, -- Pierce Armor
            16869, -- Ice Tomb
            17307, -- Knockout
            14518, -- Crusader Strike
            9672, -- Frostbolt
            6253, -- Backhand
            8552, -- Curse of Weakness
            17831, -- Call of the Grave
            3589, -- Deafening Screech
            17146, -- Shadow Word: Pain
            17165, -- Mind Flay
            11667, -- Immolate
            17145, -- Blast Wave
            17142, -- Holy Fire
            17274, -- Pyroblast
            6136, -- Chilled
            13323, -- Polymorph
            14331, -- Vicious Rend
            13005, -- Hammer of Justice
            12674, -- Frost Nova
            6713, -- Disarm
            16866, -- Venom Spit
            7992, -- Slowing Poison
            15471, -- Enveloping Web
            8715, -- Terrifying Howl
            13738, -- Rend
            16458, -- Ghoul Plague
            16430, -- Soul Tap
            11443, -- Cripple
            16429, -- Piercing Shadow
            9080, -- Hamstring
            16143, -- Cadaver Worms
            7713, -- Wailing Dead
            12889, -- Curse of Tongues
        },
        [443] = { -- 弗雷斯特恩
        },
        [445] = { -- 悲惨的提米
        },
        [749] = { -- 指挥官玛洛尔
        },
        [446] = { -- 希望破坏者威利
        },
        [448] = { -- 档案管理员加尔福特
        },
        [449] = { -- 巴纳扎尔
            17286, -- Crusader's Hammer
            13704, -- Psychic Scream
            12098, -- Sleep
        },
        [450] = { -- 不可宽恕者
        },
        [451] = { -- 安娜丝塔丽男爵夫人
            18327, -- Silence
            17244, -- Possess
        },
        [452] = { -- 奈鲁布恩坎
            4962, -- Encasing Webs
        },
        [453] = { -- 苍白的玛勒基
            20743, -- Drain Life
        },
        [454] = { -- 巴瑟拉斯镇长
        },
        [455] = { -- 吞咽者拉姆斯登
        },
        [456] = { -- 奥里克斯·瑞文戴尔领主
            15708, -- Mortal Strike
        },
    },

    [63] = { -- 死亡矿井
        ["general"] = {
            6304, -- Rhahk'Zor Slam
            12097, -- Pierce Armor
            7399, -- Terrify
            6713, -- Disarm
            5213, -- Molten Metal
            5208, -- Poisoned Harpoon
            6432, -- Smite Stomp
            6435, -- Smite Slam
            6136, -- Chilled
            122, -- Frost Nova
            113, -- Chains of Ice
            5159, -- Melt Ore
            6685, -- Piercing Shot
            11829, -- Flamestrike
            6306, -- Acid Splash
            6466, -- Axe Toss
        },
        [89] = { -- 格拉布托克
        },
        [90] = { -- 赫利克斯·破甲
        },
        [91] = { -- 死神5000
        },
        [92] = { -- 撕心狼将军
        },
        [93] = { -- “船长”曲奇
        },
    },

    [232] = { -- 玛拉顿
        ["general"] = {
            7964, -- Smoke Bomb
            21869, -- Repulsive Gaze
            11922, -- Entangling Roots
            11428, -- Knockdown
            5413, -- Noxious Catalyst
            11876, -- War Stomp
            26419, -- Acid Spray
            21070, -- Noxious Cloud
            21749, -- Thorn Volley
            21069, -- Larva Goo
            744, -- Poison
            21068, -- Corruption
            21067, -- Poison Bolt
            21787, -- Deadly Poison
            7992, -- Slowing Poison
            9080, -- Hamstring
            12540, -- Gouge
            8281, -- Sonic Burst
        },
        [423] = { -- 诺克赛恩
            21687, -- Toxic Volley
        },
        [424] = { -- 锐刺鞭笞者
            15976, -- Puncture
        },
        [425] = { -- 工匠吉兹洛克
        },
        [427] = { -- 维利塔恩
        },
        [428] = { -- 被诅咒的塞雷布拉斯
        },
        [429] = { -- 兰斯利德
            21808, -- Landslide
        },
        [430] = { -- 洛特格里普
        },
        [431] = { -- 瑟莱德丝公主
        },
    },

    [238] = { -- 监狱
        ["general"] = {
            19134, -- Frightening Shout
            7964, -- Smoke Bomb
            6253, -- Backhand
            6547, -- Rend
            3427, -- Infected Wound
            6713, -- Disarm
            8242, -- Shield Slam
        },
        [464] = { -- 霍格
        },
        [465] = { -- 灼热勋爵
        },
        [466] = { -- 兰多菲·摩洛克
        },
    },

    [241] = { -- 祖尔法拉克
        ["general"] = {
            11836, -- Freeze Solid
            3427, -- Infected Wound
            11641, -- Hex
            11020, -- Petrify
            12741, -- Curse of Weakness
            11962, -- Immolate
            11990, -- Rain of Fire
            12540, -- Gouge
            14032, -- Shadow Word: Pain
        },
        [483] = { -- 加兹瑞拉
            11131, -- Icicle
        },
        [484] = { -- 安图苏尔
        },
        [485] = { -- 殉教者塞卡
            8600, -- Fevered Plague
        },
        [486] = { -- 巫医祖穆拉恩
        },
        [487] = { -- 耐克鲁姆和塞瑟斯
        },
        [489] = { -- 乌克兹·沙顶
        },
    },

    [316] = { -- 血色修道院
        ["general"] = {
            9034, -- Immolate
            8814, -- Flame Spike
            8988, -- Silence
            9256, -- Deep Sleep
            8282, -- Curse of Blood
            13323, -- Polymorph
            17831, -- Call of the Grave
            7399, -- Terrify
            7290, -- Soul Siphon
            8053, -- Flame Shock
            42380, -- Conflagration
            42514, -- Squash Soul
            12096, -- Fear
            1090, -- Sleep
            2767, -- Shadow Word: Pain
            14518, -- Crusader Strike
            5589, -- Hammer of Justice
            8398, -- Frostbolt Volley
            17313, -- Mind Flay
            15531, -- Frost Nova
            3815, -- Poison Cloud
            6713, -- Disarm
            9672, -- Frostbolt
            6146, -- Slow
            8422, -- Flamestrike
            7068, -- Veil of Shadow
        },
        [688] = { -- 裂魂者萨尔诺斯
        },
        [671] = { -- 科洛夫修士
        },
        [674] = { -- 大检察官怀特迈恩
        },
    },

    [311] = { -- 血色大厅
        ["general"] = {
        },
        [660] = { -- 驯犬者布兰恩
        },
        [654] = { -- 武器大师哈兰
        },
        [656] = { -- 织焰者孔格勒
        },
    },

    [231] = { -- 诺莫瑞根
        ["general"] = {
            11820, -- Electrified Net
            6533, -- Net
            10730, -- Pacify
            22519, -- Ice Nova
            11264, -- Ice Blast
            5116, -- Concussive Shot
            10341, -- Radiation Cloud
        },
        [419] = { -- 格鲁比斯
        },
        [420] = { -- 粘性辐射尘
        },
        [421] = { -- 电刑器6000型
        },
        [418] = { -- 群体打击者9-60
        },
        [422] = { -- 机械师瑟玛普拉格
        },
    },

    [246] = { -- 通灵学院
        ["general"] = {
            16509, -- Rend
            18103, -- Backhand
            18671, -- Curse of Agony
            14515, -- Dominate Mind
            12542, -- Fear
            6726, -- Silence
            12020, -- Call of the Grave
            11672, -- Corruption
            12279, -- Curse of Blood
            18144, -- Swoop
            8379, -- Disarm
            20294, -- Immolate
            7068, -- Veil of Shadow
            18270, -- Dark Plague
            23313, -- Corrosive Acid
            18151, -- Noxious Catalyst
            15043, -- Frostbolt
            18101, -- Chilled
            18763, -- Freeze
            18099, -- Chill Nova
            8398, -- Frostbolt Volley
            25174, -- Sundering Cleave
            16046, -- Blast Wave
            3436, -- Wandering Plague
            17742, -- Cloud of Disease
            17716, -- Consuming Shadows
            17620, -- Drain Life
            15655, -- Shield Slam
            15654, -- Shadow Word: Pain
            11428, -- Knockdown
            15588, -- Thunderclap
            17243, -- Drain Mana
            17165, -- Mind Flay
            11443, -- Cripple
            15244, -- Cone of Cold
            15499, -- Frost Shock
            15474, -- Web Explosion
            3583, -- Deadly Poison
            22371, -- Curse of Impotence
            12493, -- Curse of Weakness
            3609, -- Paralyzing Poison
            6016, -- Pierce Armor
            12889, -- Curse of Tongues
            24928, -- Volatile Infection
        },
        [659] = { -- 指导者寒心
        },
        [663] = { -- 詹迪斯·巴罗夫
        },
        [665] = { -- 血骨傀儡
            16727, -- War Stomp
        },
        [666] = { -- 莉莉安·沃斯
        },
        [684] = { -- 黑暗院长加丁
            18702, -- Curse of the Darkmaster
        },
    },

    [237] = { -- 阿塔哈卡神庙
        ["general"] = {
            12889, -- Curse of Tongues
            12888, -- Cause Insanity
            12479, -- Hex of Jammal'an
            12493, -- Curse of Weakness
            12890, -- Deep Slumber
            24375, -- War Stomp
            7992, -- Slowing Poison
            12884, -- Acid Breath
            12279, -- Curse of Blood
            8242, -- Shield Slam
            11639, -- Shadow Word: Pain
            12280, -- Acid of Hakkar
            8398, -- Frostbolt Volley
            5708, -- Swoop
            11831, -- Frost Nova
            12098, -- Sleep
            12096, -- Fear
            16186, -- Fevered Plague
            11641, -- Hex
            13445, -- Rend
            6524, -- Ground Tremor
        },
        [457] = { -- 哈卡的化身
        },
        [458] = { -- 预言者迦玛兰
            12468, -- Flamestrike
        },
        [459] = { -- 梦境守望者
        },
        [463] = { -- 伊兰尼库斯的阴影
        },
    },

    [227] = { -- 黑暗深渊
        ["general"] = {
            8391, -- Ravage
            122, -- Frost Nova
            8398, -- Frostbolt Volley
            6533, -- Net
            8399, -- Sleep
            246, -- Slow
            3604, -- Tendon Rip
            8382, -- Leech Poison
            8379, -- Disarm
            15039, -- Flame Shock
            12548, -- Frost Shock
            7645, -- Dominate Mind
            9672, -- Frostbolt
            6136, -- Chilled
        },
        [368] = { -- 加摩拉
        },
        [436] = { -- 多米尼娜
        },
        [426] = { -- 征服者克鲁尔
        },
        [1145] = { -- 苏克
        },
        [447] = { -- 深渊守护者
        },
        [1144] = { -- 刽子手戈尔
        },
        [437] = { -- 暮光领主巴赛尔
        },
        [444] = { -- 阿库麦尔
            3815, -- Poison Cloud
        },
    },

    [229] = { -- 黑石塔下层
        ["general"] = {
            16805, -- Conflagration
            15548, -- Thunderclap
            16359, -- Corrosive Acid Breath
            16350, -- Freeze
            16104, -- Crystallize
            16168, -- Flame Buffet
            17274, -- Pyroblast
            14030, -- Hooked Net
            13737, -- Mortal Strike
            11428, -- Knockdown
            11641, -- Hex
            15570, -- Immolate
            14100, -- Terrifying Roar
            15618, -- Snap Kick
            15532, -- Frost Nova
            13747, -- Slow
            11876, -- War Stomp
            15744, -- Blast Wave
            12468, -- Flamestrike
            14032, -- Shadow Word: Pain
            16249, -- Frostbolt
            6253, -- Backhand
            15655, -- Shield Slam
            16145, -- Sunder Armor
            7068, -- Veil of Shadow
            12540, -- Gouge
            15128, -- Mark of Flames
            16071, -- Curse of the Firebrand
            15096, -- Flame Shock
            16001, -- Impale
            13323, -- Polymorph
        },
        [388] = { -- 欧莫克大王
        },
        [389] = { -- 暗影猎手沃什加斯
            24673, -- Curse of Blood
        },
        [390] = { -- 指挥官沃恩
            16075, -- Throw Axe
        },
        [391] = { -- 烟网蛛后
            16468, -- Mother's Milk
        },
        [392] = { -- 尤洛克·暗嚎
        },
        [393] = { -- 军需官兹格雷斯
            16497, -- Stun Bomb
        },
        [394] = { -- 哈雷肯
            13738, -- Rend
        },
        [395] = { -- 奴役者基兹鲁尔
            16128, -- Infected Bite
        },
        [396] = { -- 维姆萨拉克
            23511, -- Demoralizing Shout
        },
    },

    [228] = { -- 黑石深渊
        ["general"] = {
            13704, -- Psychic Scream
            47340, -- Dark Brewmaiden's Stun
            47442, -- Barreled!
            9080, -- Hamstring
            10894, -- Shadow Word: Pain
            12742, -- Immolate
            11980, -- Curse of Weakness
            6713, -- Disarm
            14868, -- Curse of Agony
            15583, -- Rupture
            15621, -- Skull Crack
            19134, -- Frightening Shout
            20615, -- Intercept
            16856, -- Mortal Strike
            6136, -- Chilled
            12675, -- Frostbolt
            15244, -- Cone of Cold
            11831, -- Frost Nova
            6253, -- Backhand
            15042, -- Curse of Blood
            12540, -- Gouge
            14030, -- Hooked Net
            13729, -- Flame Shock
            13298, -- Poison
            11436, -- Slow
            7140, -- Expose Weakness
            13445, -- Rend
            12551, -- Frost Shot
            12248, -- Amplify Damage
            15499, -- Frost Shock
            13902, -- Fist of Ragnaros
            8364, -- Blizzard
            3604, -- Tendon Rip
            47310, -- Direbrew's Disarm
        },
        [369] = { -- 审讯官格斯塔恩
        },
        [370] = { -- 洛考尔
            6524, -- Ground Tremor
        },
        [371] = { -- 驯犬者格雷布玛尔
        },
        [372] = { -- 秩序竞技场
        },
        [373] = { -- 控火师罗格雷恩
        },
        [374] = { -- 伊森迪奥斯
            26977, -- Curse of the Elemental Lord
            13899, -- Fire Storm
        },
        [375] = { -- 典狱官斯迪尔基斯
        },
        [376] = { -- 弗诺斯·达克维尔
        },
        [377] = { -- 贝尔加
        },
        [378] = { -- 怒炉将军
        },
        [379] = { -- 傀儡统帅阿格曼奇
        },
        [380] = { -- 霍尔雷·黑须
        },
        [381] = { -- 法拉克斯
        },
        [383] = { -- 普拉格
        },
        [384] = { -- 弗莱拉斯总大使
        },
        [385] = { -- 黑铁七贤
        },
        [386] = { -- 玛格姆斯
            24375, -- War Stomp
        },
        [387] = { -- 达格兰·索瑞森大帝
            17492, -- Hand of Thaurissan
        },
    },
}

local classicNaxxramas = debuffs[745]
if classicNaxxramas then
    local remapped = {
        ["general"] = classicNaxxramas["general"],
    }
    for bossId, bossDebuffs in pairs(classicNaxxramas) do
        if type(bossId) == "number" then
            remapped[900000 + bossId] = bossDebuffs
        end
    end
    debuffs[745] = nil
    debuffs[900745] = remapped
end

F.LoadBuiltInDebuffs(debuffs)
