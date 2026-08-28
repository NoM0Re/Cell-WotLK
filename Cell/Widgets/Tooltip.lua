local _, Cell = ...
local F = Cell.funcs
local P = Cell.pixelPerfectFuncs

-----------------------------------------
-- Tooltip
-----------------------------------------
local function CreateTooltip(name, hasIcon)
    local tooltip = CreateFrame("GameTooltip", name, CellParent, "CellTooltipTemplate")
    tooltip:SetBackdrop({bgFile = Cell.vars.whiteTexture, edgeFile = Cell.vars.whiteTexture, edgeSize = 1})
    tooltip:SetBackdropColor(0.1, 0.1, 0.1, 0.9)
    tooltip:SetBackdropBorderColor(Cell.GetAccentColorRGB())
    tooltip:SetOwner(CellParent, "ANCHOR_NONE")

    if hasIcon then
        local iconBG = tooltip:CreateTexture(nil, "BACKGROUND")
        tooltip.iconBG = iconBG
        iconBG:SetSize(35, 35)
        iconBG:SetPoint("TOPRIGHT", tooltip, "TOPLEFT", -1, 0)
        iconBG:SetTexture(Cell.GetAccentColorRGB())
        iconBG:Hide()

        local icon = tooltip:CreateTexture(nil, "ARTWORK")
        tooltip.icon = icon
        P.Point(icon, "TOPLEFT", iconBG, 1, -1)
        P.Point(icon, "BOTTOMRIGHT", iconBG, -1, 1)
        icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
        icon:Hide()

        function tooltip:SetSpellByID(id, tex)
            self:SetHyperlink("spell:" .. (id or 0))
            if tex then
                iconBG:Show()
                icon:SetTexture(tex)
                icon:Show()
            end
        end
    end

    tooltip:SetScript("OnTooltipCleared", function()
        -- reset border color
        tooltip:SetBackdropBorderColor(Cell.GetAccentColorRGB())
    end)

    -- tooltip:SetScript("OnTooltipSetItem", function()
    --     -- color border with item quality color
    --     tooltip:SetBackdropBorderColor(_G[name.."TextLeft1"]:GetTextColor())
    -- end)

    tooltip:SetScript("OnHide", function()
        -- SetX with invalid data may or may not clear the tooltip's contents.
        tooltip:ClearLines()

        if hasIcon then
            tooltip.iconBG:Hide()
            tooltip.icon:Hide()
        end
    end)

    function tooltip:UpdatePixelPerfect()
        tooltip:SetBackdrop({bgFile = Cell.vars.whiteTexture, edgeFile = Cell.vars.whiteTexture, edgeSize = P.Scale(1)})
        tooltip:SetBackdropColor(0.1, 0.1, 0.1, 0.9)
        tooltip:SetBackdropBorderColor(Cell.GetAccentColorRGB())
        if hasIcon then
            P.Repoint(tooltip.icon)
            tooltip.iconBG:SetTexture(Cell.GetAccentColorRGB())
        end
    end
end

CreateTooltip("CellTooltip")
CreateTooltip("CellSpellTooltip", true)
-- CreateTooltip("CellScanningTooltip")

local cursorAnchor = CreateFrame("Frame", nil, UIParent)
cursorAnchor:SetSize(1, 1)
cursorAnchor:EnableMouse(false)
cursorAnchor:Hide()
local function UpdateCursorAnchor(self)
    local scale = UIParent:GetEffectiveScale()
    local x, y = GetCursorPosition()
    self:ClearAllPoints()
    self:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", x / scale, y / scale)
end
cursorAnchor:SetScript("OnUpdate", UpdateCursorAnchor)

local function SetCursorTooltip(anchor, point, relativePoint, x, y)
    UpdateCursorAnchor(cursorAnchor)
    GameTooltip:SetOwner(anchor, "ANCHOR_NONE")
    GameTooltip:ClearAllPoints()
    GameTooltip:SetPoint(point, cursorAnchor, relativePoint, x, y)
    cursorAnchor:Show()
end

GameTooltip:HookScript("OnHide", function()
    cursorAnchor:Hide()
end)

GameTooltip:HookScript("OnTooltipSetUnit", function(self)
    self:Show()
end)

function F.ShowSpellTooltips(tooltip, spellID)
    tooltip:SetSpellByID(spellID)
    tooltip:Show()
end

function F.ShowTooltips(anchor, tooltipType, unit, aura, filter)
    if not CellDB["general"]["enableTooltips"] or (tooltipType == "unit" and CellDB["general"]["hideTooltipsInCombat"] and InCombatLockdown()) then return end

    cursorAnchor:Hide()
    local position = CellDB["general"]["tooltipsPosition"][2]
    if position == "Default" then
        GameTooltip_SetDefaultAnchor(GameTooltip, anchor)
    elseif position == "Cell" then
        GameTooltip:SetOwner(Cell.frames.mainFrame, "ANCHOR_NONE")
        GameTooltip:SetPoint(CellDB["general"]["tooltipsPosition"][1], Cell.frames.mainFrame, CellDB["general"]["tooltipsPosition"][3], CellDB["general"]["tooltipsPosition"][4], CellDB["general"]["tooltipsPosition"][5])
    elseif position == "Unit Button" then
        GameTooltip:SetOwner(anchor, "ANCHOR_NONE")
        GameTooltip:SetPoint(CellDB["general"]["tooltipsPosition"][1], anchor, CellDB["general"]["tooltipsPosition"][3], CellDB["general"]["tooltipsPosition"][4], CellDB["general"]["tooltipsPosition"][5])
    elseif position == "Cursor" then
        SetCursorTooltip(anchor, "BOTTOM", "TOP", 0, 0)
    elseif position == "Cursor Left" then
        SetCursorTooltip(anchor, "BOTTOMRIGHT", "BOTTOMLEFT", CellDB["general"]["tooltipsPosition"][4], CellDB["general"]["tooltipsPosition"][5])
    elseif position == "Cursor Right" then
        SetCursorTooltip(anchor, "BOTTOMLEFT", "BOTTOMRIGHT", CellDB["general"]["tooltipsPosition"][4], CellDB["general"]["tooltipsPosition"][5])
    end

    if tooltipType == "unit" then
        GameTooltip:SetUnit(unit)
    elseif tooltipType == "spell" and unit and aura then
        -- GameTooltip:SetSpellByID(aura)
        GameTooltip:SetUnitAura(unit, aura, filter)
    elseif tooltipType == "aura" and unit and aura then
        GameTooltip:SetUnitAura(unit, aura, filter)
    end
end
