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
    F = 1,
    G = 1,
}
local ActionAtlases = {
    A = ActionMediaPath .. "Action_A_horizontal.tga",
    AVertical = ActionMediaPath .. "Action_A_vertical.tga",
    B = ActionMediaPath .. "Action_B.tga",
    D = ActionMediaPath .. "Action_D.tga",
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

-------------------------------------------------
-- animation: C
-------------------------------------------------
local function TypeCOnUpdate(canvas, elapsed)
    if not canvas.elapsed then return end
    canvas.elapsed = canvas.elapsed + elapsed
    local progress = canvas.elapsed / canvas.duration
    if progress >= 2 then
        canvas.elapsed = nil
        canvas:SetScript("OnUpdate", nil)
        canvas.frame:SetAlpha(0)
        animationPool.C:Release(canvas)
        return
    end

    local offset = canvas.distance
    if progress < 1 then
        local easedProgress = 1 - (1 - progress)^2
        canvas.frame:SetAlpha(0.6 * easedProgress)
        offset = offset * easedProgress
    else
        canvas.frame:SetAlpha(0.6 * (1 - (progress - 1)^2))
    end
    canvas.frame:SetPoint(canvas.point, canvas, canvas.point, 0, offset)
end

local function CreateAnimation_TypeC()
    local canvas = CreateFrame("Frame")
    canvas:Hide()
    canvas.ag = canvas

    -- frame
    local f = CreateFrame("Frame", nil, canvas)
    canvas.frame = f

    -- texture
    local tex = f:CreateTexture(nil, "ARTWORK")
    tex:SetAllPoints(f)
    tex:SetTexture("Interface\\AddOns\\Cell\\Media\\Icons\\upgrade.tga")

    function canvas:Display(parent, subType, r, g, b)
        canvas:SetParent(parent)
        canvas:SetAllPoints(parent)
        canvas:SetFrameLevel(parent:GetFrameLevel() + 1)
        f:SetFrameLevel(canvas:GetFrameLevel())

        f:ClearAllPoints()
        if subType == "1" then
            canvas.point = "BOTTOMLEFT"
        elseif subType == "2" then
            canvas.point = "BOTTOM"
        else
            canvas.point = "BOTTOMRIGHT"
        end

        canvas.elapsed = 0
        canvas.duration = 0.5 / parent.speed
        canvas.distance = canvas:GetHeight() / 2

        f:SetSize(canvas.distance, canvas.distance)
        f:SetPoint(canvas.point, canvas, canvas.point, 0, 0)
        tex:SetGradientAlpha("VERTICAL", r, g, b, 0, r, g, b, 1)
        f:SetAlpha(0)
        canvas:SetScript("OnUpdate", TypeCOnUpdate)
        canvas:Show()
    end

    return canvas
end

animationPool.C = CreateObjectPool(CreateAnimation_TypeC, ResetterFunc)

-------------------------------------------------
-- animation: D
-------------------------------------------------
animationPool.D = CreateObjectPool(function() return CreateStopMotionAnimation("D") end, ResetterFunc)

-------------------------------------------------
-- animation: E
-------------------------------------------------
local function CreateAnimation_TypeE()
    local canvas = CreateFrame("Frame")
    canvas:Hide()
    canvas.ag = canvas

    local texture = canvas:CreateTexture(nil, "ARTWORK")
    texture:SetTexture("Interface\\AddOns\\Cell\\Media\\Icons\\arrow.tga")
    canvas.texture = texture

    function canvas:Display(parent, r, g, b)
        canvas:SetParent(parent)
        canvas:SetAllPoints(parent)
        canvas:SetFrameLevel(parent:GetFrameLevel() + 1)
        canvas.elapsed = 0
        canvas.duration = 0.8 / parent.speed
        canvas.arrowWidth = canvas:GetHeight() * 2

        texture:SetVertexColor(r, g, b, 0.6)
        texture:Hide()
        canvas:SetScript("OnUpdate", function(self, elapsed)
            self.elapsed = self.elapsed + elapsed
            local progress = self.elapsed / self.duration
            if progress >= 1 then
                self:SetScript("OnUpdate", nil)
                animationPool.E:Release(self)
                return
            end

            local easedProgress = progress < 0.5 and 2 * progress^2 or 1 - 2 * (1 - progress)^2
            local offset = -self.arrowWidth + (self.arrowWidth + self:GetWidth()) * easedProgress
            local left = max(0, offset)
            local right = min(self:GetWidth(), offset + self.arrowWidth)
            if right <= left then
                texture:Hide()
                return
            end

            texture:SetPoint("TOPLEFT", self, "TOPLEFT", left, 0)
            texture:SetSize(right - left, self:GetHeight())
            texture:SetTexCoord((left - offset) / self.arrowWidth, (right - offset) / self.arrowWidth, 0, 1)
            texture:Show()
        end)
        canvas:Show()
    end

    return canvas
end

animationPool.E = CreateObjectPool(CreateAnimation_TypeE, ResetterFunc)

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
