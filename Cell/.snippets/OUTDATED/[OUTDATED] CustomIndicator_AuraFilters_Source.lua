-- BUFFS ONLY

-- show buffs from anyone
local ignoreSource = {
    -- ["spellName"] = true,
    -- [spellId] = true,
}

-- show only buffs cast by the player or pet
local filterOutOthers = {
    -- ["spellName"] = true,
    -- [spellId] = true,
}

-------------------------------------------------
-- override
-------------------------------------------------
local I = Cell.iFuncs
local enabledIndicators = Cell.snippetVars.enabledIndicators
local customIndicators = Cell.snippetVars.customIndicators

local function Update(indicatorTable, unit, spell, start, duration, debuffType, icon, count, refreshing)
    local auraData = indicatorTable["auras"][spell] or indicatorTable["auras"][0]
    if indicatorTable["num"] then
        if indicatorTable["hasColor"] then
            tinsert(indicatorTable["found"][unit], {auraData[1], start, duration, debuffType, icon, count, refreshing, auraData[2]})
        else
            tinsert(indicatorTable["found"][unit], {auraData, start, duration, debuffType, icon, count, refreshing})
        end
    elseif indicatorTable["hasColor"] then
        if auraData[1] < indicatorTable["topOrder"][unit] then
            indicatorTable["topOrder"][unit] = auraData[1]
            indicatorTable["top"][unit] = {start=start, duration=duration, debuffType=debuffType, texture=icon, count=count, refreshing=refreshing, color=auraData[2]}
        end
    elseif auraData < indicatorTable["topOrder"][unit] then
        indicatorTable["topOrder"][unit] = auraData
        indicatorTable["top"][unit] = {start=start, duration=duration, debuffType=debuffType, texture=icon, count=count, refreshing=refreshing}
    end
end

local function IsCasterAllowed(indicatorTable, castByMe)
    return (indicatorTable["castBy"] == "me" and castByMe)
        or (indicatorTable["castBy"] == "others" and not castByMe)
        or indicatorTable["castBy"] == "anyone"
end

function I.UpdateCustomIndicators(unitButton, auraType, spellId, spellName, start, duration, debuffType, icon, count, refreshing, castByMe)
    local unit = unitButton.states.displayedUnit

    for indicatorName, indicatorTable in pairs(customIndicators[auraType]) do
        if enabledIndicators[indicatorName] and unitButton.indicators[indicatorName] then
            local spell = indicatorTable["trackByName"] and spellName or spellId
            if indicatorTable["auras"][spell] or (indicatorTable["auras"][0] and duration ~= 0) then
                local show = IsCasterAllowed(indicatorTable, castByMe)
                if auraType == "buff" then
                    if ignoreSource[spellId] or ignoreSource[spellName] then
                        show = true
                    elseif filterOutOthers[spellId] or filterOutOthers[spellName] then
                        show = castByMe
                    end
                end
                if show then
                    Update(indicatorTable, unit, spell, start, duration, debuffType, icon, count, refreshing)
                end
            end
        end
    end
end
