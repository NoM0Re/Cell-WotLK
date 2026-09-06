---------------------------------------------------------------------
-- File: Cell\RaidDebuffs\RaidDebuffs_TBC.lua
-- Author: enderneko (enderneko-dev@outlook.com)
-- Created : 2022-08-05 17:45:05 +08:00
-- Modified: 2025-02-20 16:08 +08:00
---------------------------------------------------------------------

local _, Cell = ...
local F = Cell.funcs

local debuffs = {
    [745] = { -- 卡拉赞
        ["general"] = {
            -- Nightbane
            37091, -- Rain of Bones
            30210, -- Smoldering Breath
            30129, -- Charred Earth
            30127, -- Searing Cinders
            36922, -- Bellowing Roar
        },
        [1552] = { -- 仆役宿舍
        },
        [1553] = { -- 猎手阿图门
            29833, -- Intangible Presence
            29711, -- Knockdown
        },
        [1554] = { -- 莫罗斯
            29425, -- Gouge
            34694, -- Blind
            37066, -- Garrote
        },
        [1555] = { -- 贞节圣女
            29511, -- Repentance
            29522, -- Holy Fire
            29512, -- Holy Ground
        },
        [1556] = { -- 歌剧院
            30822, -- Poisoned Thrust
            30889, -- Powerful Attraction
            30890, -- Blinding Passion
        },
        [1557] = { -- 馆长
        },
        [1559] = { -- 埃兰之影
            29946, -- Flame Wreath
            29990, -- Slow
            29991, -- Chains of Ice
            29954, -- Frostbolt
            29951, -- Blizzard
        },
        [1560] = { -- 特雷斯坦·邪蹄
            30053, -- Amplify Flames
            30115, -- Sacrifice
        },
        [1561] = { -- 虚空幽龙
            "38637", -- Nether Exhaustion (Red)
            "38638", -- Nether Exhaustion (Green)
            "38639", -- Nether Exhaustion (Blue)
            30400, -- Nether Beam - Perseverence
            30401, -- Nether Beam - Serenity
            30402, -- Nether Beam - Dominance
            30421, -- Nether Portal - Perseverence
            30422, -- Nether Portal - Serenity
            30423, -- Nether Portal - Dominance
        },
        [1764] = { -- 国际象棋
            30529, -- Recently In Game
        },
        [1563] = { -- 玛克扎尔王子
            39095, -- Amplify Damage
            30898, -- Shadow Word: Pain
        },
    },

    [746] = { -- 格鲁尔的巢穴
        ["general"] = {
        },
        [1564] = { -- 莫加尔大王
            11726, -- Enslave Demon
            33129, -- Dark Decay
            33175, -- Arcane Shock
            33061, -- Blast Wave
            33130, -- Death Coil
            16508, -- Intimidating Roar
        },
        [1565] = { -- 屠龙者格鲁尔
            38927, -- Fel Ache
            36240, -- Cave In
            33652, -- Stoned
            33525, -- Ground Slam
        },
    },

    [747] = { -- 玛瑟里顿的巢穴
        ["general"] = {
        },
        [1566] = { -- 玛瑟里顿
            44032, -- Mind Exhaustion
            30530, -- Fear
        },
    },

    [748] = { -- 毒蛇神殿
        ["general"] = {
            39042, -- Rampant Infection
            39032, -- Initial Infection
            39044, -- Serpentshrine Parasite
            38591, -- Shatter Armor
            38634, -- Arcane Lightning
            38572, -- Mortal Cleave
            38635, -- Rain of Fire
            38491, -- Silence
        },
        [1567] = { -- 不稳定的海度斯
            38235, -- Water Tomb
            38246, -- Vile Sludge
        },
        [1568] = { -- 鱼斯拉
        },
        [1569] = { -- 盲眼者莱欧瑟拉斯
            37749, -- Consuming Madness
            37676, -- Insidious Whisper
            37675, -- Chaos Blast
            37641, -- Whirlwind
        },
        [1570] = { -- 深水领主卡拉瑟雷斯
            29436, -- Leeching Throw
            39261, -- Gusting Winds
        },
        [1571] = { -- 莫洛格里·踏潮者
            38049, -- Watery Grave
        },
        [1572] = { -- 瓦丝琪
            38280, -- Static Charge
            38316, -- Entangle
        },
    },

    [749] = { -- 风暴要塞
        ["general"] = {
            37122, -- Domination
            37118, -- Shell Shock
            37133, -- Arcane Buffet
            37120, -- Fragmentation Bomb
            37123, -- Saw Blade
            37132, -- Arcane Shock
            13005, -- Hammer of Justice
            37279, -- Rain of Fire
            "37160", -- Silence
        },
        [1573] = { -- 奥
            35410, -- Melt Armor
        },
        [1574] = { -- 空灵机甲
        },
        [1575] = { -- 大星术师索兰莉安
            42783, -- Wrath of the Astromancer
            34322, -- Psychic Scream
        },
        [1576] = { -- 凯尔萨斯·逐日者
            44863, -- Bellowing Roar
            37027, -- Remote Toy
            36797, -- Mind Control
            36965, -- Rend
            "30225", -- Silence
            37018, -- Conflagration
        },
    },

    [750] = { -- 海加尔山之战
        ["general"] = {
            31610, -- Knockdown
            28991, -- Web
        },
        [1577] = { -- 雷基·冬寒
            31249, -- Icebolt
            31250, -- Frost Nova
        },
        [1578] = { -- 安纳塞隆
            31306, -- Carrion Swarm
            31298, -- Sleep
            31302, -- Inferno Effect
        },
        [1579] = { -- 卡兹洛加
            31447, -- Mark of Kaz'rogal
        },
        [1580] = { -- 阿兹加洛
            31347, -- Doom
            31341, -- Unquenchable Flames
            31340, -- Rain of Fire
        },
        [1581] = { -- 阿克蒙德
            31972, -- Grip of the Legion
            31944, -- Doomfire
            31970, -- Fear
        },
    },

    [751] = { -- 黑暗神殿
        ["general"] = {
            41213, -- Throw Shield
            40864, -- Throbbing Stun
            41197, -- Shield Bash
            41171, -- Skeleton Shot
            41338, -- Love Tap
            13444, -- Sunder Armor
            41396, -- Sleep
            41334, -- Polymorph
            24698, -- Gouge
            41150, -- Fear
            34654, -- Blind
            39674, -- Banish
        },
        [1582] = { -- 高阶督军纳因图斯
            39837, -- Impaling Spine
        },
        [1583] = { -- 苏普雷姆斯
            40253, -- Molten Flame
        },
        [1584] = { -- 阿卡玛之影
            42023, -- Rain of Fire
        },
        [1585] = { -- 塔隆·血魔
            40239, -- Incinerate
            40243, -- Crushing Shadows
            40251, -- Shadow of Death
        },
        [1586] = { -- 古尔图格·血沸
            40481, -- Acidic Wound
            40491, -- Bewildering Strike
            40604, -- Fel Rage
            40599, -- Arcing Smash
            40508, -- Fel-Acid Breath
            42005, -- Bloodboil
        },
        [1587] = { -- 灵魂之匣
            41303, -- Soul Drain
            41410, -- Deaden
            41376, -- Spite
            41426, -- Spirit Shock
            41294, -- Fixate
        },
        [1588] = { -- 莎赫拉丝主母
            41001, -- Fatal Attraction
            40860, -- Vile Beam
            40823, -- Silencing Shriek
        },
        [1589] = { -- 伊利达雷议会
            41461, -- Judgement of Blood
            41485, -- Deadly Poison
            41472, -- Divine Wrath
            41468, -- Hammer of Justice
            41481, -- Flamestrike
            41541, -- Consecration
            41482, -- Blizzard
        },
        [1590] = { -- 伊利丹·怒风
            40932, -- Agonizing Flames
            41032, -- Shear
            40585, -- Dark Barrage
            41914, -- Parasitic Shadowfiend
            41142, -- Aura of Dread
        },
    },

    [752] = { -- 太阳之井高地
        ["general"] = {
        },
        [1591] = { -- 卡雷苟斯
            45018, -- Arcane Buffet
            45032, -- Curse of Boundless Agony
        },
        [1592] = { -- 布鲁塔卢斯
            45185, -- Stomp
            46394, -- Burn
            45150, -- Meteor Slash
        },
        [1593] = { -- 菲米丝
            45665, -- Encapsulate
            45717, -- Fog of Corruption
            45855, -- Gas Nova
            45402, -- Demonic Vapor
        },
        [1594] = { -- 艾瑞达双子
            45342, -- Conflagration
            45256, -- Confounding Blow
            46771, -- Flame Sear
            45270, -- Shadowfury
            45347, -- Dark Touched
            45348, -- Flame Touched
        },
        [1595] = { -- 穆鲁
            45996, -- Darkness
        },
        [1596] = { -- 基尔加丹
            45641, -- Fire Bloom
            45442, -- Soul Flay
            45737, -- Flame Dart
            45885, -- Shadow Spike
        },
    },

    [248] = { -- 地狱火城墙
        ["general"] = {
        },
        [527] = { -- 巡视者加戈玛
        },
        [528] = { -- 无疤者奥摩尔
        },
        [529] = { -- 传令官瓦兹德
        },
    },

    [252] = { -- 塞泰克大厅
        ["general"] = {
        },
        [541] = { -- 黑暗编织者塞斯
        },
        [543] = { -- 利爪之王艾吉斯
        },
    },

    [247] = { -- 奥金尼地穴
        ["general"] = {
        },
        [523] = { -- 死亡观察者希尔拉克
        },
        [524] = { -- 大主教玛拉达尔
        },
    },

    [260] = { -- 奴隶围栏
        ["general"] = {
        },
        [570] = { -- 背叛者门努
        },
        [571] = { -- 巨钳鲁克玛尔
        },
        [572] = { -- 夸格米拉
        },
    },

    [262] = { -- 幽暗沼泽
        ["general"] = {
        },
        [576] = { -- 霍加尔芬
        },
        [577] = { -- 加兹安
        },
        [578] = { -- 沼地领主穆塞雷克
        },
        [579] = { -- 黑色阔步者
        },
    },

    [251] = { -- 旧希尔斯布莱德丘陵
        ["general"] = {
        },
        [538] = { -- 德拉克中尉
        },
        [539] = { -- 斯卡洛克上尉
        },
        [540] = { -- 时空猎手
        },
    },

    [253] = { -- 暗影迷宫
        ["general"] = {
        },
        [544] = { -- 赫尔默大使
        },
        [545] = { -- 煽动者布莱卡特
        },
        [546] = { -- 沃匹尔大师
        },
        [547] = { -- 摩摩尔
        },
    },

    [250] = { -- 法力陵墓
        ["general"] = {
        },
        [534] = { -- 潘德莫努斯
        },
        [535] = { -- 塔瓦洛克
        },
        [537] = { -- 节点亲王沙法尔
        },
    },

    [257] = { -- 生态船
        ["general"] = {
        },
        [558] = { -- 指挥官萨拉妮丝
        },
        [559] = { -- 高级植物学家弗雷温
        },
        [560] = { -- 看管者索恩格林
        },
        [561] = { -- 拉伊
        },
        [562] = { -- 迁跃扭木
        },
    },

    [259] = { -- 破碎大厅
        ["general"] = {
        },
        [566] = { -- 高阶术士奈瑟库斯
        },
        [568] = { -- 战争使者沃姆罗格
        },
        [569] = { -- 酋长卡加斯·刃拳
        },
    },

    [254] = { -- 禁魔监狱
        ["general"] = {
        },
        [548] = { -- 自由的瑟雷凯斯
        },
        [549] = { -- 末日预言者达尔莉安
        },
        [550] = { -- 天怒预言者苏克拉底
        },
        [551] = { -- 预言者斯克瑞斯
        },
    },

    [258] = { -- 能源舰
        ["general"] = {
        },
        [563] = { -- 机械领主卡帕西图斯
        },
        [564] = { -- 灵术师塞比瑟蕾
        },
        [565] = { -- 计算者帕萨雷恩
        },
    },

    [261] = { -- 蒸汽地窟
        ["general"] = {
        },
        [573] = { -- 水术师瑟丝比娅
        },
        [574] = { -- 机械师斯蒂里格
        },
        [575] = { -- 督军卡利瑟里斯
        },
    },

    [249] = { -- 魔导师平台
        ["general"] = {
        },
        [530] = { -- 塞林·火心
        },
        [531] = { -- 维萨鲁斯
        },
        [532] = { -- 女祭司德莉希亚
        },
        [533] = { -- 凯尔萨斯·逐日者
        },
    },

    [256] = { -- 鲜血熔炉
        ["general"] = {
        },
        [555] = { -- 制造者
        },
        [556] = { -- 布洛戈克
        },
        [557] = { -- 击碎者克里丹
        },
    },

    [255] = { -- 黑色沼泽
        ["general"] = {
        },
        [552] = { -- 时空领主德亚
        },
        [553] = { -- 坦普卢斯
        },
        [554] = { -- 埃欧努斯
        },
    },
}

F.LoadBuiltInDebuffs(debuffs)
