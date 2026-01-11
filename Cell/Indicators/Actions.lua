local _, Cell = ...
local L = Cell.L
---@type CellFuncs
local F = Cell.funcs
---@class CellIndicatorFuncs
local I = Cell.iFuncs

local orientation, speed
local band, bor = bit.band, bit.bor
local UnitGUID = UnitGUID

-------------------------------------------------
-- events
-------------------------------------------------
-- CLEU: subevent, source, target, spellId, spellName
-- [15:10] SPELL_HEAL 秋静葉 秋静葉 6262 治疗石
-- [15:10] SPELL_CAST_SUCCESS 秋静葉 nil 6262 治疗石
-- [15:13] SPELL_HEAL 秋静葉 秋静葉 307192 灵魂治疗药水
-- [15:13] SPELL_CAST_SUCCESS 秋静葉 nil 307192 灵魂治疗药水

-- COMBAT_LOG_EVENT_UNFILTERED
-- 3.3.5a: timestamp, subevent, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellID, spellName

local function Display(b, ...)
    b.indicators.actions:Display(...)
end

local GROUP_SOURCE_FLAGS = bor(COMBATLOG_OBJECT_AFFILIATION_MINE, COMBATLOG_OBJECT_AFFILIATION_PARTY, COMBATLOG_OBJECT_AFFILIATION_RAID)
local petGUID

local function UpdatePetGUID()
    petGUID = UnitGUID("pet")
end

local function IsGroupSource(sourceGUID, sourceFlags)
    if sourceGUID == Cell.vars.playerGUID or sourceGUID == petGUID then
        return true
    end
    return sourceFlags and band(sourceFlags, GROUP_SOURCE_FLAGS) ~= 0
end

local eventFrame = CreateFrame("Frame")
eventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "UNIT_PET" then
        local unit = ...
        if unit == "player" then
            UpdatePetGUID()
        end
        return
    end

    local timestamp, subevent, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellID, spellName = ...
    if subevent ~= "SPELL_CAST_SUCCESS" or not IsGroupSource(sourceGUID, sourceFlags) then return end

    if Cell.vars.actionsDebugModeEnabled then
        local name = F.GetSpellInfo(spellID)
        print("|cFFFF3030[Cell]|r |cFFB2B2B2" .. subevent .. ":|r", sourceName, "|cFF00FF00" .. (spellID or "nil") .. "|r", name)
    end

    if Cell.vars.actions[spellID] then
        F.HandleUnitButton("guid", sourceGUID, Display, unpack(Cell.vars.actions[spellID]))
    end
end)

-------------------------------------------------
-- pool
-------------------------------------------------
local animationPool = {}

local function ResetterFunc(_, canvas)
    canvas:Hide()
end

-------------------------------------------------
-- stop-motion animations
-------------------------------------------------
local ActionFrameCount = 64
local ActionAtlasColumns = 8
local ActionAtlasTileWidth = 128
local ActionAtlasTileHeight = 64
local ActionAtlasWidth = 1024
local ActionAtlasHeight = 512
local ActionMediaPath = "Interface\\AddOns\\Cell\\Media\\Actions\\"
local ActionDurations = {
    A = 1.1,
    B = 0.7,
    D = 1,
    E = 0.8,
    F = 1,
    G = 1,
}
local ActionAtlases = {
    A = ActionMediaPath .. "Action_A_horizontal.tga",
    AVertical = ActionMediaPath .. "Action_A_vertical.tga",
    B = ActionMediaPath .. "Action_B.tga",
    D = ActionMediaPath .. "Action_D.tga",
    E = ActionMediaPath .. "Action_E.tga",
    F = ActionMediaPath .. "Action_F.tga",
    G = ActionMediaPath .. "Action_G.tga",
}

local function SetActionAtlasFrame(texture, frameIndex)
    local column = frameIndex % ActionAtlasColumns
    local row = floor(frameIndex / ActionAtlasColumns)
    local left = (column * ActionAtlasTileWidth + 1.5) / ActionAtlasWidth
    local right = ((column + 1) * ActionAtlasTileWidth - 1.5) / ActionAtlasWidth
    local top = (row * ActionAtlasTileHeight + 1.5) / ActionAtlasHeight
    local bottom = ((row + 1) * ActionAtlasTileHeight - 1.5) / ActionAtlasHeight
    texture:SetTexCoord(left, right, top, bottom)
end

local function StopMotionOnUpdate(canvas, elapsed)
    canvas.elapsed = canvas.elapsed + elapsed
    local progress = min(1, canvas.elapsed / canvas.duration)
    local frameIndex = floor(progress * (ActionFrameCount - 1) + 0.5)

    if frameIndex ~= canvas.frameIndex then
        canvas.frameIndex = frameIndex
        SetActionAtlasFrame(canvas.texture, frameIndex)
    end

    if progress == 1 then
        animationPool[canvas.animationType]:Release(canvas)
    end
end

local function CreateStopMotionAnimation(animationType)
    local canvas = CreateFrame("Frame")
    canvas:Hide()
    canvas.animationType = animationType

    local texture = canvas:CreateTexture(nil, "ARTWORK")
    texture:SetAllPoints(canvas)
    canvas.texture = texture
    canvas.ag = canvas
    canvas:SetScript("OnUpdate", StopMotionOnUpdate)

    function canvas:Display(parent, r, g, b)
        canvas:SetParent(parent)
        canvas:SetAllPoints(parent)
        canvas:SetFrameLevel(parent:GetFrameLevel() + 1)
        canvas.elapsed = 0
        canvas.duration = ActionDurations[animationType] / parent.speed
        canvas.frameIndex = nil

        if animationType == "A" and parent.orientation ~= "horizontal" then
            texture:SetTexture(ActionAtlases.AVertical)
        else
            texture:SetTexture(ActionAtlases[animationType])
        end
        texture:SetVertexColor(r, g, b, 1)
        SetActionAtlasFrame(texture, 0)
        canvas:Show()
    end

    return canvas
end

animationPool.A = CreateObjectPool(function() return CreateStopMotionAnimation("A") end, ResetterFunc)
animationPool.B = CreateObjectPool(function() return CreateStopMotionAnimation("B") end, ResetterFunc)

local function PlayNativeAnimation(animationGroup, frame)
    if animationGroup:IsPlaying() then
        animationGroup:Stop()
    end
    frame:SetAlpha(0)
    animationGroup:Play()
end

-------------------------------------------------
-- animation: C
-------------------------------------------------
local function CreateAnimationGroup_TypeC()
    local canvas = CreateFrame("Frame")

    -- frame
    local f = CreateFrame("Frame", nil, canvas)

    -- texture
    local tex = f:CreateTexture(nil, "ARTWORK")
    tex:SetAllPoints(f)
    tex:SetTexture("Interface\\AddOns\\Cell\\Media\\Icons\\upgrade.tga")

    -- animation
    local ag = f:CreateAnimationGroup()
    canvas.ag = ag

    local a1 = ag:CreateAnimation("Alpha")
    a1.duration = 0.5
    F.AlphaSetFromTo(a1, 0, 0.6)
    a1:SetOrder(1)
    a1:SetDuration(a1.duration)
    a1:SetSmoothing("OUT")
    local t1 = ag:CreateAnimation("Translation")
    t1.duration = 0.5
    t1:SetOrder(1)
    t1:SetSmoothing("OUT")
    t1:SetDuration(t1.duration)

    local a2 = ag:CreateAnimation("Alpha")
    a2.duration = 0.5
    F.AlphaSetFromTo(a2, 0.6, 0)
    a2:SetDuration(a2.duration)
    a2:SetOrder(2)
    a2:SetSmoothing("IN")

    ag:SetScript("OnPlay", function()
        canvas:Show()
    end)

    ag:SetScript("OnFinished", function()
        animationPool.C:Release(canvas)
    end)

    function ag:Display(parent, subType, r, g, b)
        canvas:SetParent(parent)
        canvas:SetAllPoints(parent)
        canvas:SetFrameLevel(parent:GetFrameLevel() + 1)
        f:SetFrameLevel(canvas:GetFrameLevel())

        f:ClearAllPoints()
        if subType == "1" then
            f:SetPoint("BOTTOMLEFT")
            f:SetPoint("TOPLEFT", canvas, "LEFT")
        elseif subType == "2" then
            f:SetPoint("BOTTOM")
            f:SetPoint("TOP", canvas, "CENTER")
        else
            f:SetPoint("BOTTOMRIGHT")
            f:SetPoint("TOPRIGHT", canvas, "RIGHT")
        end

        a1:SetDuration(a1.duration / parent.speed)
        t1:SetDuration(t1.duration / parent.speed)
        a2:SetDuration(a2.duration / parent.speed)

        f:SetWidth(canvas:GetHeight() / 2)
        t1:SetOffset(0, canvas:GetHeight() / 2 * canvas:GetEffectiveScale())
        tex:SetGradientAlpha("VERTICAL", r, g, b, 0, r, g, b, 1)
        PlayNativeAnimation(ag, f)
    end

    return canvas
end

animationPool.C = CreateObjectPool(CreateAnimationGroup_TypeC, ResetterFunc)

-------------------------------------------------
-- animation: D
-------------------------------------------------
animationPool.D = CreateObjectPool(function() return CreateStopMotionAnimation("D") end, ResetterFunc)

-------------------------------------------------
-- animation: E
-------------------------------------------------
animationPool.E = CreateObjectPool(function() return CreateStopMotionAnimation("E") end, ResetterFunc)

-------------------------------------------------
-- animation: F
-------------------------------------------------
animationPool.F = CreateObjectPool(function() return CreateStopMotionAnimation("F") end, ResetterFunc)

-------------------------------------------------
-- animation: G
-------------------------------------------------
animationPool.G = CreateObjectPool(function() return CreateStopMotionAnimation("G") end, ResetterFunc)

-------------------------------------------------
-- indicator
-------------------------------------------------
local previews = {}
local previewOrientation

local function Actions_SetSpeed(self, speed)
    self.speed = speed
end

local function Actions_Display(self, animationType, color)
    -- animations[animationType]:Display(unpack(color))
    if strfind(animationType, "^C") then
        local subType = strmatch(animationType, "%d")
        local canvas = animationPool.C:Acquire()
        canvas.ag:Display(self, subType, color[1], color[2], color[3])
    else
        local canvas = animationPool[animationType]:Acquire()
        canvas.ag:Display(self, color[1], color[2], color[3])
    end
end

function I.CreateActions(parent, isPreview)
    local actions = CreateFrame("Frame", parent:GetName() .. "ActionsParent", isPreview and parent or parent.widgets.indicatorFrame)

    if isPreview then
        parent.actions = actions
        tinsert(previews, parent)
        actions:SetPoint("TOPLEFT", 1, -1)
        actions:SetPoint("BOTTOMRIGHT", -1, 1)
        actions.orientation = previewOrientation
    else
        parent.indicators.actions = actions
        actions:SetAllPoints(parent.widgets.healthBar)
    end

    actions.speed = 1
    actions.SetSpeed = Actions_SetSpeed
    actions.Display = Actions_Display
end

function I.UpdateActionsOrientation(button, barOrientation)
    button.indicators.actions.orientation = barOrientation

    if previewOrientation ~= barOrientation then
        previewOrientation = barOrientation
        for _, p in pairs(previews) do
            p.actions.orientation = barOrientation
        end
    end
end

function I.EnableActions(enabled)
    if enabled then
        UpdatePetGUID()
        eventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
        eventFrame:RegisterEvent("UNIT_PET")
    else
        eventFrame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
        eventFrame:UnregisterEvent("UNIT_PET")
    end
end
