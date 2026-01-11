-- ColorMixin (Namespaced, no globals)
---@type Cell
local Cell = select(2, ...)

local F = Cell.funcs

---@class ColorMixin
---@field r number
---@field g number
---@field b number
---@field a number
Cell.ColorMixin = {}

---@alias CellColor ColorMixin
local ColorMixin = Cell.ColorMixin

-- Constructor
---@param r number
---@param g number
---@param b number
---@param a number?
---@return CellColor
function F.CreateColor(r, g, b, a)
    local color = F.CreateFromMixins(ColorMixin)
    color:OnLoad(r, g, b, a)
    return color
end

---@param r number
---@param g number
---@param b number
---@param a number?
function ColorMixin:OnLoad(r, g, b, a)
	self:SetRGBA(r, g, b, a)
end

-- Lifecycle
---@param r number
---@param g number
---@param b number
---@param a number?
function ColorMixin:SetRGBA(r, g, b, a)
    self.r = r
    self.g = g
    self.b = b
    self.a = a or 1
end

---@param r number
---@param g number
---@param b number
function ColorMixin:SetRGB(r, g, b)
    self:SetRGBA(r, g, b, nil)
end

-- Comparisons
---@param otherColor CellColor
---@return boolean
function ColorMixin:IsRGBEqualTo(otherColor)
	return self.r == otherColor.r
		and self.g == otherColor.g
		and self.b == otherColor.b
end

---@param otherColor CellColor
---@return boolean
function ColorMixin:IsEqualTo(otherColor)
    return self:IsRGBEqualTo(otherColor) and self.a == otherColor.a
end

-- Getters
---@return number, number, number
function ColorMixin:GetRGB()
    return self.r, self.g, self.b
end

---@return number h, number s, number l, number a
function ColorMixin:GetHSL()
	local r, g, b, a = self.r, self.g, self.b, self.a
	local max, min = math.max(r, g, b), math.min(r, g, b)
	local h, s, l

	l = (max + min) / 2

	if max == min then
		h, s = 0, 0 -- achromatic
	else
		local d = max - min
		if l > 0.5 then
			s = d / (2 - max - min)
		else
			s = d / (max + min)
		end
		if max == r then
			h = (g - b) / d
			if g < b then
				h = h + 6
			end
		elseif max == g then
			h = (b - r) / d + 2
		elseif max == b then
			h = (r - g) / d + 4
		end
		h = h / 6
	end

	return h, s, l, a or 1
end

---@return number, number, number
function ColorMixin:GetRGBAsBytes()
    return F.Round(self.r * 255), F.Round(self.g * 255), F.Round(self.b * 255)
end

---@return number, number, number, number
function ColorMixin:GetRGBA()
    return self.r, self.g, self.b, self.a
end

---@return number, number, number, number
function ColorMixin:GetRGBAAsBytes()
    return F.Round(self.r * 255), F.Round(self.g * 255), F.Round(self.b * 255), F.Round((self.a or 1) * 255)
end

-- Conversions
---@return string
-- NOTE: Alpha is always forced to 0xFF (Blizzard-style color code)
function ColorMixin:GenerateHexColor()
    return ("ff%.2x%.2x%.2x"):format(self:GetRGBAsBytes())
end

---@return string
function ColorMixin:GenerateHexColorNoAlpha()
    return ("%.2X%.2X%.2X"):format(self:GetRGBAsBytes())
end

---@return string
function ColorMixin:GenerateHexColorMarkup()
    return "|c" .. self:GenerateHexColor()
end

-- Text helpers
---@param text string
---@return string
function ColorMixin:WrapTextInColorCode(text)
	return F.WrapTextInColorCode(text, self:GenerateHexColor());
end

---@param text string
---@param colorHex string
---@return string
function F.WrapTextInColorCode(text, colorHex)
    return ("|c%s%s|r"):format(colorHex, text)
end

---@param text string
---@param color CellColor
---@return string
function F.WrapTextInColor(text, color)
	return F.WrapTextInColorCode(text, color:GenerateHexColor())
end
