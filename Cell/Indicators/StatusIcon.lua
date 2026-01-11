local _, Cell = ...
---@type CellFuncs
local F = Cell.funcs
---@class CellIndicatorFuncs
local I = Cell.iFuncs
---@type PixelPerfectFuncs
local P = Cell.pixelPerfectFuncs

local ResurrectionTexture = "Interface\\AddOns\\Cell\\Media\\Icons\\Raid-Icon-Rez.blp"

-------------------------------------------------
-- event
-------------------------------------------------
local eventFrame = CreateFrame("Frame")
eventFrame:SetScript("OnEvent", function()
    F.IterateAllUnitButtons(function(button)
        local unit = button.states.unit
        if unit and strfind(unit, "^party") then
            I.UpdateStatusIcon(button)
        end
    end)
end)

local function DiedWithSoulstone(b)
    b.states.hasSoulstone = true
    I.UpdateStatusIcon(b)
end

local rez = {}
local soulstones = {}
local SOULSTONE = F.GetSpellInfo(20707)
local RESURRECTING = F.GetSpellInfo(160029)

local cleuFrame = CreateFrame("Frame")
cleuFrame:SetScript("OnEvent", function(self, event, ...)
    local timestamp, subEvent, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellId, spellName = ...

    if subEvent == "SPELL_AURA_REMOVED" then
        if spellName == SOULSTONE then
            -- print("soulstone removed", timestamp, destName)
            soulstones[destGUID] = timestamp
            F.C_Timer.After(0.1, function()
                soulstones[destGUID] = nil
            end)
        elseif spellName == RESURRECTING then
            rez[destGUID] = nil
            F.HandleUnitButton("guid", destGUID, I.UpdateStatusIcon_Resurrection)
        end
    elseif subEvent == "UNIT_DIED" then
        -- print("died", timestamp, destName)
        if soulstones[destGUID] then
            F.HandleUnitButton("guid", destGUID, DiedWithSoulstone)
        end
        soulstones[destGUID] = nil
    elseif subEvent == "SPELL_RESURRECT" then
        local start, duration = GetTime(), 60
        rez[destGUID] = {start, duration}

        F.HandleUnitButton("guid", destGUID, I.UpdateStatusIcon_Resurrection, start, duration)
    end
end)

local function IncomingResurrectionChanged(name, event, _, _, success)
    F.IterateAllUnitButtons(function(b)
        local unit = b.states.unit
        if unit and UnitExists(unit) and UnitName(unit) == name then
            I.UpdateStatusIcon(b)
            if event == "ResComm_ResEnd" and success then
                local guid = b.states.guid or UnitGUID(unit)
                if guid then
                    local start, duration = GetTime(), 60
                    rez[guid] = {start, duration}
                    I.UpdateStatusIcon_Resurrection(b, start, duration)
                end
            end
        end
    end)
end

-------------------------------------------------
-- create
-------------------------------------------------
function I.CreateStatusIcon(parent)
    local statusIcon = CreateFrame("Frame", parent:GetName().."StatusIcon", parent.widgets.indicatorFrame)
    parent.indicators.statusIcon = statusIcon
    statusIcon:Hide()

    statusIcon.tex = statusIcon:CreateTexture(nil, "OVERLAY")
    statusIcon.tex:SetAllPoints(statusIcon)

    function statusIcon:SetTexture(tex)
        statusIcon.tex:SetTexture(tex)
    end

    function statusIcon:SetTexCoord(...)
        statusIcon.tex:SetTexCoord(...)
    end

    function statusIcon:SetVertexColor(...)
        statusIcon.tex:SetVertexColor(...)
    end

    -- resurrection icon ----------------------------------
    local resurrectionIcon = CreateFrame("Frame", parent:GetName().."ResurrectionIcon", parent.widgets.indicatorFrame)
    parent.indicators.resurrectionIcon = resurrectionIcon
    resurrectionIcon:SetAllPoints(statusIcon)
    resurrectionIcon:Hide()

    resurrectionIcon.tex = resurrectionIcon:CreateTexture(nil, "ARTWORK")
    F.FixTextureDesaturation(resurrectionIcon.tex)
    resurrectionIcon.tex:SetAllPoints(resurrectionIcon)
    resurrectionIcon.tex:SetDesaturated(true)
    resurrectionIcon.tex:SetVertexColor(0.4, 0.4, 0.4, 0.5)
    resurrectionIcon.tex:SetTexture(ResurrectionTexture)

    local fillIcon = resurrectionIcon:CreateTexture(nil, "ARTWORK")
    fillIcon:SetTexture(ResurrectionTexture)

    local timerFrame = CreateFrame("Frame", nil, resurrectionIcon)
    timerFrame:SetAllPoints(resurrectionIcon)
    timerFrame.elapsedTime = 0
    timerFrame:SetScript("OnUpdate", function(self, elapsed)
        if not timerFrame.startTime or not timerFrame.duration then
            timerFrame.startTime = nil
            timerFrame.duration = nil
            resurrectionIcon:Hide()
            return
        end

        if timerFrame.elapsedTime >= 0.25 then
            local value = GetTime() - timerFrame.startTime
            if value >= timerFrame.duration then
                timerFrame.startTime = nil
                timerFrame.duration = nil
                resurrectionIcon:Hide()
                return
            end
            local progress = max(0, min(1, (timerFrame.duration - value) / timerFrame.duration))
            F.SetVerticalTextureFill(fillIcon, resurrectionIcon, progress, false)
            timerFrame.elapsedTime = 0
        end
        timerFrame.elapsedTime = timerFrame.elapsedTime + elapsed
    end)

    function resurrectionIcon:SetTimer(start, duration)
        resurrectionIcon:Hide() -- pause OnUpdate
        timerFrame.startTime = start
        timerFrame.duration = duration + 13
        timerFrame.elapsedTime = 0.25
        local value = max(0, GetTime() - start)
        local progress = max(0, min(1, (timerFrame.duration - value) / timerFrame.duration))
        F.SetVerticalTextureFill(fillIcon, resurrectionIcon, progress, false)
        resurrectionIcon:Show()
    end

    resurrectionIcon:SetScript("OnHide", function()
        fillIcon:Hide()
        if resurrectionIcon.timer then
            resurrectionIcon.timer:Cancel()
            resurrectionIcon.timer = nil
        end
    end)
    -------------------------------------------------------

    statusIcon._SetFrameLevel = statusIcon.SetFrameLevel
    function statusIcon:SetFrameLevel(level)
        statusIcon:_SetFrameLevel(level)
        resurrectionIcon:SetFrameLevel(level)
    end
end

-------------------------------------------------
-- resurrection
-------------------------------------------------
function I.UpdateStatusIcon_Resurrection(button, start, duration)
    local guid = button.states.guid
    local unit = button.states.unit
    local resurrectionIcon = button.indicators.resurrectionIcon

    if not (guid and unit) then
        resurrectionIcon:Hide()
        return
    end

    if not start then
        local dur, expir = select(5, F.FindAuraById(unit, "DEBUFF", 160029)) -- battle res
        if dur then --! check Resurrecting debuff
            start = expir - dur
            duration = dur
        elseif rez[guid] then --! check saved data (unit button changed)
            start = rez[guid][1]
            duration = rez[guid][2]
        else
            resurrectionIcon:Hide()
            return
        end
    end

    --! alive or expired
    if not UnitIsDeadOrGhost(unit) or start + duration <= GetTime() then
        rez[guid] = nil
        resurrectionIcon:Hide()
        return
    end

    resurrectionIcon:SetTimer(start, duration)
    -- timer
    if resurrectionIcon.timer then resurrectionIcon.timer:Cancel() end
    resurrectionIcon.timer = F.C_Timer.NewTimer(start + duration - GetTime(), function()
        rez[guid] = nil
        resurrectionIcon:Hide()
    end)
end

-------------------------------------------------
-- update (UnitButton_UpdateAuras)
-------------------------------------------------
function I.UpdateStatusIcon(button)
    local unit = button.states.unit
    if not unit then return end

    local icon = button.indicators.statusIcon

    -- Interface\FrameXML\CompactUnitFrame.lua, CompactUnitFrame_UpdateCenterStatusIcon
    if F.UnitHasIncomingResurrection(unit) then
        icon:SetVertexColor(1, 1, 1, 1)
        icon:SetTexture(ResurrectionTexture)
        icon:SetTexCoord(0, 1, 0, 1)
        icon:Show()
    elseif button.states.hasRezDebuff or button.states.hasSoulstone then
        icon:SetVertexColor(0.6, 1, 0.6, 1)
        icon:SetTexture(ResurrectionTexture)
        icon:SetTexCoord(0, 1, 0, 1)
        icon:Show()
    -- elseif UnitIsDeadOrGhost(unit) then
    --     icon:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Skull")
    --     icon:SetTexCoord(0, 1, 0, 1)
    --     icon:Show()
    elseif button.states.BGFlag then
        icon:SetVertexColor(1, 1, 1, 1)
        F.SetTexture(icon, button.states.BGFlag.."_icon_and_flag-dynamicIcon")
        icon:Show()
    else
        icon:Hide()
    end
end

-------------------------------------------------
-- enable
-------------------------------------------------
function I.EnableStatusIcon(enabled)
    if enabled then
        F.RegisterIncomingResurrectionCallback("StatusIcon", IncomingResurrectionChanged)
        eventFrame:RegisterEvent("PARTY_MEMBER_DISABLE")
        eventFrame:RegisterEvent("PARTY_MEMBER_ENABLE")
        -- resurrection
        cleuFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    else
        F.UnregisterIncomingResurrectionCallback("StatusIcon")
        eventFrame:UnregisterAllEvents()
        cleuFrame:UnregisterAllEvents()
        F.IterateAllUnitButtons(function(b)
            b.indicators.statusIcon:Hide()
            b.indicators.resurrectionIcon:Hide()
        end)
    end
end
