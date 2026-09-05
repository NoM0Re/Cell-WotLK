---------------------------------------------------------------------
-- 2024-05-18 02:09:39 GMT+8
---------------------------------------------------------------------
-- show these debuffs as Raid Debuffs with HIGHEST priority
local debuffs = {
    -- 373509, -- Shadow Claws 暗影利爪
}

-- enabled in these instances as well
-- 在下列副本中也启用上述减益
local instances = {
    -- [1207] = true, -- Amirdrassil, the Dream's Hope 阿梅达希尔，梦境之愿
}
---------------------------------------------------------------------

local F = Cell.funcs
local offset = #debuffs
local instanceNameMapping = Cell.snippetVars.instanceNameMapping
local loadedDebuffs = Cell.snippetVars.loadedDebuffs

function F.GetDebuffList(instanceName)
    local list = {}
    local mapping = instanceNameMapping[instanceName]
    if not mapping then return list end

    local _, _, iId = F.SplitToNumber(":", mapping)

    if instances[iId] then
        for i, id in pairs(debuffs) do
            list[id] = {["order"]=i, ["condition"]={"None"}, ["useElapsedTime"]=false}
        end
    end

    if iId and loadedDebuffs[iId] then
        local n = 0
        -- check general
        if loadedDebuffs[iId]["general"] then
            n = #loadedDebuffs[iId]["general"]["enabled"]
            for _, t in ipairs(loadedDebuffs[iId]["general"]["enabled"]) do
                local spellName = F.GetSpellInfo(t["id"])
                if spellName then
                    -- list[spellName/spellId] = {order, glowType, glowOptions}
                    if t["trackByID"] then
                        list[t["id"]] = {["order"]=t["order"]+offset, ["condition"]=t["condition"], ["glowType"]=t["glowType"], ["glowOptions"]=t["glowOptions"], ["glowCondition"]=t["glowCondition"], ["useElapsedTime"]=t["useElapsedTime"]}
                    else
                        list[spellName] = {["order"]=t["order"]+offset, ["condition"]=t["condition"], ["glowType"]=t["glowType"], ["glowOptions"]=t["glowOptions"], ["glowCondition"]=t["glowCondition"], ["useElapsedTime"]=t["useElapsedTime"]}
                    end
                end
            end
        end
        -- check boss
        for bId, bTable in pairs(loadedDebuffs[iId]) do
            if bId ~= "general" then
                for _, st in pairs(bTable["enabled"]) do
                    local spellName = F.GetSpellInfo(st["id"])
                    if spellName then -- check again
                        if st["trackByID"] then
                            list[st["id"]] = {["order"]=st["order"]+n+offset, ["condition"]=st["condition"], ["glowType"]=st["glowType"], ["glowOptions"]=st["glowOptions"], ["glowCondition"]=st["glowCondition"], ["useElapsedTime"]=st["useElapsedTime"]}
                        else
                            list[spellName] = {["order"]=st["order"]+n+offset, ["condition"]=st["condition"], ["glowType"]=st["glowType"], ["glowOptions"]=st["glowOptions"], ["glowCondition"]=st["glowCondition"], ["useElapsedTime"]=st["useElapsedTime"]}
                        end
                    end
                end
            end
        end
    end
    -- texplore(list)

    return list
end
