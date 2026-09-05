-- color custom indicator icons by spell ID
local iconColor = {
    -- [spellId] = {r, g, b},
    [367364] = {1, 0.5, 0.5}, -- Reversion - 逆转
    [376788] = {1, 0.4, 0.4}, -- Dream Breath - 梦境吐息
}

local I = Cell.iFuncs
local enabledIndicators = Cell.snippetVars.enabledIndicators
local customIndicators = Cell.snippetVars.customIndicators
local UpdateCustomIndicators = I.UpdateCustomIndicators
local ShowCustomIndicators = I.ShowCustomIndicators

local function SetIconColor(indicator, spellId)
    if not (indicator and indicator.icon) then return end

    local color = iconColor[spellId]
    if color then
        indicator.icon:SetVertexColor(color[1], color[2], color[3], color[4] or 1)
    else
        indicator.icon:SetVertexColor(1, 1, 1, 1)
    end
end

function I.UpdateCustomIndicators(unitButton, auraType, spellId, ...)
    local unit = unitButton.states.displayedUnit
    local previous = {}

    for indicatorName, indicatorTable in pairs(customIndicators[auraType]) do
        if enabledIndicators[indicatorName] and unitButton.indicators[indicatorName] then
            if indicatorTable["num"] then
                previous[indicatorTable] = #indicatorTable["found"][unit]
            else
                previous[indicatorTable] = indicatorTable["topOrder"][unit]
            end
        end
    end

    UpdateCustomIndicators(unitButton, auraType, spellId, ...)

    for indicatorName, indicatorTable in pairs(customIndicators[auraType]) do
        if enabledIndicators[indicatorName] and unitButton.indicators[indicatorName] then
            if indicatorTable["num"] then
                local found = indicatorTable["found"][unit]
                if #found > previous[indicatorTable] then
                    found[#found].spellId = spellId
                end
            elseif indicatorTable["topOrder"][unit] < previous[indicatorTable] then
                indicatorTable["top"][unit].spellId = spellId
            end
        end
    end
end

function I.ShowCustomIndicators(unitButton, auraType)
    if not unitButton._indicatorsReady then return end
    ShowCustomIndicators(unitButton, auraType)

    local unit = unitButton.states.displayedUnit
    for indicatorName, indicatorTable in pairs(customIndicators[auraType]) do
        local indicator = unitButton.indicators[indicatorName]
        if indicator and enabledIndicators[indicatorName] then
            if indicatorTable["num"] then
                local found = indicatorTable["found"][unit]
                for i = 1, indicatorTable["num"] do
                    SetIconColor(indicator[i], found[i] and found[i].spellId)
                end
            else
                SetIconColor(indicator, indicatorTable["top"][unit] and indicatorTable["top"][unit].spellId)
            end
        end
    end
end
