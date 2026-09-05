local AddonName = ...
---@type Cell
local Cell = select(2, ...)

Cell.funcs = Cell.funcs or {}
---@class CellFuncs
local F = Cell.funcs

-- Lua API
local tinsert, tremove, format, max = table.insert, table.remove, string.format, math.max
local floor, ceil, abs = math.floor, math.ceil, math.abs

-- WoW API
local GetNumRaidMembers = _G.GetNumRaidMembers
local GetNumPartyMembers = _G.GetNumPartyMembers
local UnitClass = _G.UnitClass

local CLASS_IDS = {
    WARRIOR = 1,
    PALADIN = 2,
    HUNTER = 3,
    ROGUE = 4,
    PRIEST = 5,
    DEATHKNIGHT = 6,
    SHAMAN = 7,
    MAGE = 8,
    WARLOCK = 9,
    DRUID = 11,
}

---@return boolean
function F.IsInRaid()
    return GetNumRaidMembers() > 0
end

---@return boolean
function F.IsInGroup()
    return GetNumPartyMembers() > 0 or GetNumRaidMembers() > 0
end

---@return integer
function F.GetNumGroupMembers()
    if F.IsInRaid() then
        return GetNumRaidMembers()
    end

    local numPartyMembers = GetNumPartyMembers()
    return numPartyMembers > 0 and numPartyMembers + 1 or 0
end

---@return string|nil classFile
---@return integer|nil classID
function F.UnitClassBase(unit)
    local _, classFile = UnitClass(unit)
    return classFile, CLASS_IDS[classFile]
end

local function SetDesaturated(texture, desaturated, ...)
    texture.isDesaturated = desaturated and 1 or 0
    return texture._SetDesaturated(texture, desaturated, ...)
end

local function SetTexture(texture, ...)
    local applied = texture._SetTexture(texture, ...)
    if texture.isDesaturated ~= nil then
        texture._SetDesaturated(texture, texture.isDesaturated == 1)
    end
    return applied
end

function F.FixTextureDesaturation(texture)
    if texture._SetDesaturated then return texture end

    texture._SetDesaturated = texture.SetDesaturated
    texture._SetTexture = texture.SetTexture
    texture.SetDesaturated = SetDesaturated
    texture.SetTexture = SetTexture
    return texture
end

do
    local function SetFlipBookFrame(texture, frame, rows, columns)
        frame = frame - 1

        local row = floor(frame / columns)
        local column = frame - row * columns
        local width = 1 / columns
        local height = 1 / rows
        local left = column * width
        local right = left + width
        local top = row * height
        local bottom = top + height

        texture:SetTexCoord(left, right, top, bottom)
    end

    local function FlipBook_OnUpdate(self, elapsed)
        local data = self.data
        data.elapsed = data.elapsed + elapsed

        if data.elapsed < data.frameDuration then return end

        while data.elapsed >= data.frameDuration do
            data.elapsed = data.elapsed - data.frameDuration
            data.currentFrame = data.currentFrame + 1

            if data.currentFrame > data.frames then
                if data.looping then
                    data.currentFrame = 1
                else
                    data.currentFrame = data.frames
                    self:SetScript("OnUpdate", nil)
                    break
                end
            end
        end

        SetFlipBookFrame(data.texture, data.currentFrame, data.rows, data.columns)
    end

    local FlipBookPrototype = {}

    local function UpdateFrameDuration(self)
        self.data.frameDuration = self.data.duration / max(self.data.frames, 1)
    end

    function FlipBookPrototype:Play()
        self.data.elapsed = 0
        self.data.currentFrame = 1
        UpdateFrameDuration(self)
        SetFlipBookFrame(self.data.texture, 1, self.data.rows, self.data.columns)
        self.updater:SetScript("OnUpdate", FlipBook_OnUpdate)
        self.updater:Show()
    end

    function FlipBookPrototype:Stop()
        self.updater:SetScript("OnUpdate", nil)
        self.updater:Hide()
    end

    function FlipBookPrototype:SetDuration(duration)
        self.data.duration = duration or self.data.duration
        UpdateFrameDuration(self)
    end

    function FlipBookPrototype:SetRows(rows)
        self.data.rows = max(rows or self.data.rows, 1)
        SetFlipBookFrame(self.data.texture, self.data.currentFrame, self.data.rows, self.data.columns)
    end

    function FlipBookPrototype:SetColumns(columns)
        self.data.columns = max(columns or self.data.columns, 1)
        SetFlipBookFrame(self.data.texture, self.data.currentFrame, self.data.rows, self.data.columns)
    end

    function FlipBookPrototype:SetFrames(frames)
        self.data.frames = max(frames or self.data.frames, 1)
        if self.data.currentFrame > self.data.frames then
            self.data.currentFrame = self.data.frames
        end
        UpdateFrameDuration(self)
        SetFlipBookFrame(self.data.texture, self.data.currentFrame, self.data.rows, self.data.columns)
    end

    function F.CreateFlipBook(texture, duration, rows, columns, frames, looping)
        local parent = texture:GetParent()
        local updater = CreateFrame("Frame", nil, parent)
        updater:Hide()

        local data = {
            texture = texture,
            duration = duration or 1,
            rows = max(rows or 1, 1),
            columns = max(columns or 1, 1),
            frames = max(frames or 1, 1),
            looping = looping ~= false,
            currentFrame = 1,
            elapsed = 0,
        }

        updater.data = data
        data.frameDuration = data.duration / data.frames
        SetFlipBookFrame(texture, 1, data.rows, data.columns)

        return setmetatable({updater = updater, data = data}, {__index = FlipBookPrototype})
    end
end

local function Clamp(value, min, max)
	if value > max then
		return max;
	elseif value < min then
		return min;
	end
	return value;
end

local PixelUtil = {}
F.PixelUtil = PixelUtil

local function PixelUtilRound(num)
    if num >= 0 then
        return floor(num + 0.5)
    else
        return ceil(num - 0.5)
    end
end

function PixelUtil.GetPixelToUIUnitFactor()
    local resolution = ({GetScreenResolutions()})[GetCurrentResolution()]
    local physicalHeight = resolution and tonumber((select(2, strsplit("x", resolution))))
    if physicalHeight then
        return 768 / physicalHeight
    end
    return 1
end

function PixelUtil.GetNearestPixelSize(uiUnitSize, layoutScale, minPixels)
    if uiUnitSize == 0 and (not minPixels or minPixels == 0) then
        return 0
    end

    layoutScale = layoutScale or UIParent:GetEffectiveScale()
    local uiUnitFactor = PixelUtil.GetPixelToUIUnitFactor()
    local numPixels = PixelUtilRound((uiUnitSize * layoutScale) / uiUnitFactor)

    if minPixels then
        if uiUnitSize < 0 then
            if numPixels > -minPixels then
                numPixels = -minPixels
            end
        elseif numPixels < minPixels then
            numPixels = minPixels
        end
    end

    return numPixels * uiUnitFactor / layoutScale
end

function PixelUtil.GetNearestPixelSizeForRegion(region, uiUnitSize, minPixels)
    return PixelUtil.GetNearestPixelSize(uiUnitSize, region:GetEffectiveScale(), minPixels)
end

function PixelUtil.SetPoint(region, point, relativeTo, relativePoint, x, y, minXPixels, minYPixels)
    region:SetPoint(point, relativeTo, relativePoint,
        PixelUtil.GetNearestPixelSizeForRegion(region, x or 0, minXPixels),
        PixelUtil.GetNearestPixelSizeForRegion(region, y or 0, minYPixels)
    )
end

function PixelUtil.SetWidth(region, width, minPixels)
    region:SetWidth(PixelUtil.GetNearestPixelSizeForRegion(region, width, minPixels))
end

function PixelUtil.SetHeight(region, height, minPixels)
    region:SetHeight(PixelUtil.GetNearestPixelSizeForRegion(region, height, minPixels))
end

function PixelUtil.SetSize(region, width, height, minWidthPixels, minHeightPixels)
    PixelUtil.SetWidth(region, width, minWidthPixels)
    PixelUtil.SetHeight(region, height, minHeightPixels)
end

---@return nil
function F.noop() end

---@return nil
function F.AlphaSetFromTo(alphaAnim, fromAlpha, toAlpha)
    fromAlpha = Clamp(fromAlpha or 0, 0, 1)
    toAlpha   = Clamp(toAlpha   or 0, 0, 1)

    alphaAnim:SetChange(toAlpha - fromAlpha)
end

UNIT_NAME_FONT_KOREAN = "Interface\\Addons\\Cell\\Media\\Fonts\\2002B.TTF"
UNIT_NAME_FONT_CHINESE = "Interface\\Addons\\Cell\\Media\\Fonts\\ARKai_T.ttf"
UNIT_NAME_FONT_CYRILLIC = "Interface\\Addons\\Cell\\Media\\Fonts\\FRIZQT___CYR.TTF"
UNIT_NAME_FONT_ROMAN = "Interface\\Addons\\Cell\\Media\\Fonts\\FRIZQT__.TTF"

---@return nil
function F.SetEnabled(frame, enabled)
	if frame.Enable and frame.Disable then
		if enabled then
			frame:Enable()
		else
			frame:Disable()
		end
	end
end

---@return nil
function F.SetShown(frame, shown)
    if shown then
        frame:Show()
    else
        frame:Hide()
    end
end

do
    local DBMEncounterIDRevision = 20250929200404
    local encounterInProgress = false
    local dbmRegistered
    local tracker = CreateFrame("Frame")
    local DBMEncounterEvents = {
        DBM_Pull = {"EncounterStart"},
        DBM_Kill = {"EncounterEnd", 1},
        DBM_Wipe = {"EncounterEnd", 0},
    }
    local GetDBMEncounterID = function()
        return 0
    end

    function F.IsEncounterInProgress()
        return encounterInProgress
    end

    local function OnDBMEncounterEvent(event, mod)
        local eventName, success = unpack(DBMEncounterEvents[event])
        local currentEncounterID = GetDBMEncounterID(mod)
        local currentEncounterName = mod.combatInfo.name or ""
        local _, _, currentDifficultyID, _, currentGroupSize = GetInstanceInfo()

        encounterInProgress = event == "DBM_Pull"
        Cell.Fire(eventName, currentEncounterID, currentEncounterName, currentDifficultyID or 0, currentGroupSize or 0, success)
    end

    local function RegisterDBMEncounterCallbacks()
        if dbmRegistered then
            return
        end

        local loadedDBM = DBM
        if type(loadedDBM) ~= "table" or type(loadedDBM.RegisterCallback) ~= "function" or type(loadedDBM.Revision) ~= "number" then
            return
        end

        local dbmHasEncounterIDs = loadedDBM.Revision >= DBMEncounterIDRevision
        if dbmHasEncounterIDs then
            GetDBMEncounterID = function(mod)
                return tonumber(mod.encounterId) or 0
            end
        end
        for event in pairs(DBMEncounterEvents) do
            loadedDBM:RegisterCallback(event, OnDBMEncounterEvent)
        end

        dbmRegistered = true
        tracker:UnregisterEvent("ADDON_LOADED")
    end

    tracker:RegisterEvent("ADDON_LOADED")
    tracker:SetScript("OnEvent", function(_, _, addonName)
        if addonName == "DBM-Core" then
            RegisterDBMEncounterCallbacks()
        end
    end)

    RegisterDBMEncounterCallbacks()
end

---@return table
function F.Mixin(object, ...)
	for i = 1, select("#", ...) do
		local mixin = select(i, ...);
		for k, v in pairs(mixin) do
			object[k] = v;
		end
	end
	return object;
end

function F.CreateFromMixins(...)
	return F.Mixin({}, ...)
end

function F.FixStatusBarZeroValue(statusBar)
    local setValue, getValue = statusBar.SetValue, statusBar.GetValue
    local empty = false

    function statusBar:SetValue(value)
        local minValue, maxValue = self:GetMinMaxValues()
        empty = minValue == 0 and value <= 0
        if empty and maxValue > 0 then
            value = math.min(0.0001, maxValue * 0.0001)
        end
        setValue(self, value)
    end

    function statusBar:GetValue()
        if empty and self:GetMinMaxValues() == 0 then return 0 end
        return getValue(self)
    end
end

function F.SetStatusBarRotatesTexture(statusBar, rotate)
    statusBar.rotatesTexture = rotate and true or false

    local texture = statusBar:GetStatusBarTexture()
    if statusBar.rotatesTexture and statusBar:GetOrientation() == "VERTICAL" then
        texture:SetTexCoord(0, 1, 1, 1, 0, 0, 1, 0)
    else
        texture:SetTexCoord(0, 0, 0, 1, 1, 0, 1, 1)
    end
end

do
    local driver = CreateFrame("Frame")
    local activeBars = {}
    local barsActive

    local function FrameDeltaLerp(startValue, endValue, amount, elapsed)
        if startValue == endValue then
            return endValue
        end

        amount = 1 - (1 - amount) ^ (elapsed * 60)
        return startValue + (endValue - startValue) * amount
    end

    local function IsCloseEnough(bar, newValue, targetValue)
        local min, max = bar:GetMinMaxValues()
        local range = max - min
        if range > 0 then
            return abs((newValue - targetValue) / range) < 0.00001
        end

        return true
    end

    local function ProcessSmoothStatusBars(self, elapsed)
        barsActive = 0

        for bar, targetValue in pairs(activeBars) do
            local effectiveTargetValue = Clamp(targetValue, bar:GetMinMaxValues())
            local newValue = FrameDeltaLerp(bar:GetValue(), effectiveTargetValue, 0.25, elapsed)

            if IsCloseEnough(bar, newValue, effectiveTargetValue) then
                activeBars[bar] = nil
                bar:SetValue(effectiveTargetValue)
            else
                bar:SetValue(newValue)
            end

            barsActive = barsActive + 1
        end

        if barsActive == 0 then
            self:SetScript("OnUpdate", nil)
            barsActive = nil
        end
    end

    F.SmoothStatusBarMixin = {}

    function F.SmoothStatusBarMixin:ResetSmoothedValue(value)
        local targetValue = activeBars[self]
        if targetValue then
            activeBars[self] = nil
            self:SetValue(value or targetValue)
        elseif value then
            self:SetValue(value)
        end
    end

    function F.SmoothStatusBarMixin:SetSmoothedValue(value)
        activeBars[self] = value

        if not barsActive then
            driver:SetScript("OnUpdate", ProcessSmoothStatusBars)
        end
    end

    function F.SmoothStatusBarMixin:SetMinMaxSmoothedValue(min, max)
        self:SetMinMaxValues(min, max)

        local targetValue = activeBars[self]
        if targetValue then
            local ratio = 1
            if max ~= 0 and self.lastSmoothedMax and self.lastSmoothedMax ~= 0 then
                ratio = max / self.lastSmoothedMax
            end

            activeBars[self] = targetValue * ratio
        end

        self.lastSmoothedMin = min
        self.lastSmoothedMax = max
    end
end

-- C_Timer
do
	local Timer = {}

	local TickerPrototype = {}
	local TickerMetatable = {__index = TickerPrototype}

	local WaitTable = {}

	local function ReleaseTicker(ticker)
		ticker._cancelled = true
		ticker._callback = nil
	end

	local function WaitFunc(self, elapsed)
		local total = #WaitTable
		local i = 1

		while i <= total do
			local ticker = WaitTable[i]

			if ticker._cancelled then
				ReleaseTicker(tremove(WaitTable, i))
				total = total - 1
			elseif ticker._delay > elapsed then
				ticker._delay = ticker._delay - elapsed
				i = i + 1
			else
				ticker._callback(ticker)

				if ticker._iterations == -1 then
					ticker._delay = ticker._duration
					i = i + 1
				elseif ticker._iterations > 1 then
					ticker._iterations = ticker._iterations - 1
					ticker._delay = ticker._duration
					i = i + 1
				elseif ticker._iterations == 1 then
					ReleaseTicker(tremove(WaitTable, i))
					total = total - 1
				end
			end
		end

		if #WaitTable == 0 then
			self:Hide()
		end
	end

	local WaitFrame = CreateFrame("Frame")
	WaitFrame:Hide()
	WaitFrame:SetScript("OnUpdate", WaitFunc)

	local function AddDelayedCall(ticker)
		tinsert(WaitTable, ticker)
		WaitFrame:Show()
	end

	local function ValidateArguments(duration, callback, callFunc)
		if type(duration) ~= "number" then
			error(format(
				"Bad argument #1 to '" .. callFunc .. "' (number expected, got %s)",
				duration ~= nil and type(duration) or "no value"
			), 2)
		elseif type(callback) ~= "function" then
			error(format(
				"Bad argument #2 to '" .. callFunc .. "' (function expected, got %s)",
				callback ~= nil and type(callback) or "no value"
			), 2)
		end
	end

	local function ValidateIterations(iterations)
		if iterations ~= nil and (type(iterations) ~= "number" or iterations < 1 or iterations ~= floor(iterations)) then
			error(format(
				"Bad argument #3 to 'NewTicker' (positive integer expected, got %s)",
				iterations ~= nil and tostring(iterations) or "no value"
			), 3)
		end
	end

	function Timer.After(duration, callback)
		ValidateArguments(duration, callback, "After")

		local ticker = {}

		ticker._iterations = 1
		ticker._delay = max(0.01, duration)
		ticker._callback = callback

		AddDelayedCall(ticker)
	end

	local function CreateTicker(duration, callback, iterations)
		local ticker = {}
		setmetatable(ticker, TickerMetatable)

		ticker._iterations = iterations or -1
		ticker._delay = max(0.01, duration)
		ticker._duration = ticker._delay
		ticker._callback = callback

		AddDelayedCall(ticker)
		return ticker
	end

	function Timer.NewTicker(duration, callback, iterations)
		ValidateArguments(duration, callback, "NewTicker")
		ValidateIterations(iterations)
		return CreateTicker(duration, callback, iterations)
	end

	function Timer.NewTimer(duration, callback)
		ValidateArguments(duration, callback, "NewTimer")
		return CreateTicker(duration, callback, 1)
	end

	function Timer.CancelTimer(ticker, silent)
		if ticker and ticker.Cancel then
			ticker:Cancel()
		elseif not silent then
			error(AddonName .. ": CancelTimer(timer[, silent]): '"..tostring(ticker).."' - no such timer registered")
		end
		return nil
	end

	function TickerPrototype:Cancel()
		self._cancelled = true
	end
	function TickerPrototype:IsCancelled()
		return self._cancelled
	end

	F.C_Timer = Timer
end
