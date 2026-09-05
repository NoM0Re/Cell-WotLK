-- 鬼灵面具：减CD     356968 50  50  50  50  50  0    0  0
local cdr_icon = "Interface\\Icons\\Spell_Holy_BorrowedTime"

-- 鬼灵面具：减伤20%  356968  0   0   0   0   0  0  -20  0
local dr_icon = "Interface\\Icons\\Spell_Holy_PowerWordShield"

local I = Cell.iFuncs
local UpdateCustomIndicators = I.UpdateCustomIndicators

local tooltip = CreateFrame("GameTooltip", "CellSnippetHauntedMaskTooltip", UIParent, "GameTooltipTemplate")

local function GetAuraTexture(unit, auraType, spellId)
    if not unit then return end
    local filter = auraType == "buff" and "HELPFUL" or "HARMFUL"
    for i = 1, 40 do
        local name, _, _, _, _, _, _, _, _, _, id = UnitAura(unit, i, filter)
        if not name then break end
        if id == spellId then
            tooltip:SetOwner(UIParent, "ANCHOR_NONE")
            tooltip:ClearLines()
            tooltip:SetUnitAura(unit, i, filter)
            local cdr, dr
            for line = 2, tooltip:NumLines() do
                local text = _G[tooltip:GetName().."TextLeft"..line]:GetText() or ""
                for percent in text:gmatch("(%d+)%%") do
                    cdr = cdr or tonumber(percent) == 50
                    dr = dr or tonumber(percent) == 20
                end
            end
            tooltip:Hide()
            if cdr and not dr then return cdr_icon end
            if dr and not cdr then return dr_icon end
            return
        end
    end
end

function I.UpdateCustomIndicators(unitButton, auraType, spellId, spellName, start, duration, debuffType, texture, count, refreshing, castByMe)
    if spellId == 356968 then
        texture = GetAuraTexture(unitButton.states.displayedUnit, auraType, spellId) or texture
    end

    UpdateCustomIndicators(unitButton, auraType, spellId, spellName, start, duration, debuffType, texture, count, refreshing, castByMe)
end
