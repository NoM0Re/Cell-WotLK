-------------------------------------------------
-- 2024-06-27 14:00:21 GMT+8
-- add a swingTimer bar for each unitbutton
-- 为单位按钮添加一个被普攻的计时条
-------------------------------------------------
local SOURCE = "target"
local ONLY_SHOW_SOURCE = false

local POINT1, POINT1_X, POINT1_Y = "TOPLEFT", 0, 0
local POINT2, POINT2_X, POINT2_Y = "TOPRIGHT", 0, -5
local FRAME_LEVEL = 10
local COLOR = {1, 0, 0}

-------------------------------------------------
-- function codes
-------------------------------------------------
local F = Cell.funcs
local I = Cell.iFuncs
local P = Cell.pixelPerfectFuncs

local timers = {}
local sourceUnits = {"target", "focus", "mouseover"}

local function FindSourceUnit(sourceGUID)
    for _, unit in ipairs(sourceUnits) do
        if UnitGUID(unit) == sourceGUID then return unit end
    end
    for unit in F.IterateGroupMembers() do
        local target = unit.."target"
        if UnitGUID(target) == sourceGUID then return target end
    end
end

local function Display(b, sourceGUID)
    if not sourceGUID then return end

    -- check SOURCE
    if UnitGUID(SOURCE) == sourceGUID and UnitCanAttack("player", SOURCE) then
        if b.swingTimer:Display(SOURCE) then
            timers[b.swingTimer] = sourceGUID
            b.swingTimer.lock = true
        end
    elseif not (ONLY_SHOW_SOURCE or b.swingTimer.lock) then
        local unit = FindSourceUnit(sourceGUID)
        if unit and UnitCanAttack("player", unit) and b.swingTimer:Display(unit) then
            timers[b.swingTimer] = sourceGUID
        end
    end
end

F.IterateAllUnitButtons(function(b)
    local swingTimer = I.CreateAura_Bar(b:GetName().."SwingTimer", b.widgets.indicatorFrame)
    b.swingTimer = swingTimer
    swingTimer.unitButton = b
    swingTimer:Hide()
    swingTimer:SetPoint(POINT1, P.Scale(POINT1_X), P.Scale(POINT1_Y))
    swingTimer:SetPoint(POINT2, P.Scale(POINT2_X), P.Scale(POINT2_Y))
    swingTimer:SetStatusBarColor(unpack(COLOR))
    swingTimer:SetFrameLevel(b.widgets.indicatorFrame:GetFrameLevel()+FRAME_LEVEL)

    function swingTimer:Display(sourceUnit)
        local speed = UnitAttackSpeed(sourceUnit)
        if not speed or speed <= 0 then return false end
        swingTimer:SetMinMaxValues(0, speed)
        swingTimer:SetValue(speed)

        local start = GetTime()
        swingTimer:SetScript("OnUpdate", function()
            local remain = speed-(GetTime()-start)
            if remain >= 0 then
                swingTimer:SetValue(remain)
            else
                swingTimer:Hide()
            end
        end)
        swingTimer:Show()
        return true
    end

    swingTimer:HookScript("OnHide", function(self)
        self.lock = nil
        timers[self] = nil
        self:SetScript("OnUpdate", nil)
    end)
    b:HookScript("OnAttributeChanged", function(_, name)
        if name == "unit" then swingTimer:Hide() end
    end)
end)

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
eventFrame:SetScript("OnEvent", function(self, event, ...)
    local _, subEvent, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags = ...
    if subEvent == "SWING_DAMAGE" or subEvent == "SWING_MISSED" then
        F.HandleUnitButton("guid", destGUID, Display, sourceGUID)
    elseif subEvent == "UNIT_DIED" then
        for timer, source in pairs(timers) do
            if source == destGUID or (timer.unitButton.states.unit and UnitGUID(timer.unitButton.states.unit) == destGUID) then
                timer:Hide()
            end
        end
    end
end)

Cell.RegisterCallback("LeaveInstance", "CellSwingTimer_LeaveInstance", function()
    for t in pairs(timers) do
        t:Hide()
    end
    wipe(timers)
end)
