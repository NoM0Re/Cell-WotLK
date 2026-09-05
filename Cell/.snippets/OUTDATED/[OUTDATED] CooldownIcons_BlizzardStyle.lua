-------------------------------------------------
-- 2024-05-18 02:08:12 GMT+8
-- blizzard style cooldown animation
-------------------------------------------------
local DRAW_EDGE = true
local COLOR_BORDER_BY_DISPEL_TYPE = true

CELL_COOLDOWN_STYLE = "CLOCK"

local F = Cell.funcs
local I = Cell.iFuncs
local P = Cell.pixelPerfectFuncs

local function ConfigureCooldown(frame)
    local cooldown = frame and frame.cooldown
    if not cooldown then return end

    if cooldown.cooldownType ~= "clock" then
        cooldown:Hide()
        cooldown:SetParent(nil)

        cooldown = F.AcquireCooldown(frame, 1)
        frame.cooldown = cooldown
        frame.style = "CLOCK"
        P.Point(cooldown, "TOPLEFT", frame, CELL_BORDER_SIZE, -CELL_BORDER_SIZE)
        P.Point(cooldown, "BOTTOMRIGHT", frame, -CELL_BORDER_SIZE, CELL_BORDER_SIZE)

        if frame.textFrame then
            frame.textFrame:SetFrameLevel(cooldown:GetFrameLevel() + 2)
        end
    end

    F.SetCooldownReverse(cooldown, true)
    F.SetCooldownDrawEdge(cooldown, DRAW_EDGE)
    F.SetCooldownHideCountdownNumbers(cooldown, true)
end

local function ConfigureBorderColor(frame, _, _, debuffType)
    if not COLOR_BORDER_BY_DISPEL_TYPE then
        frame:SetBackdropColor(0, 0, 0, 1)
    elseif debuffType then
        frame:SetBackdropColor(I.GetDebuffTypeColor(debuffType))
    end
end

local function HookBorderColor(frame)
    if not (frame and frame.SetCooldown) or frame.blizzardStyleBorderHooked then return end

    frame.blizzardStyleBorderHooked = true
    hooksecurefunc(frame, "SetCooldown", ConfigureBorderColor)
end

local function ConfigureIndicator(indicator)
    ConfigureCooldown(indicator)
    HookBorderColor(indicator)
    if indicator and indicator.maxNum then
        for i = 1, indicator.maxNum do
            ConfigureCooldown(indicator[i])
            HookBorderColor(indicator[i])
        end
    end
end

local create = I.CreateAura_BarIcon
I.CreateAura_BarIcon = function(name, parent)
    local frame = create(name, parent)
    ConfigureCooldown(frame)
    HookBorderColor(frame)
    return frame
end

F.IterateAllUnitButtons(function(button)
    for name, indicator in pairs(button.indicators) do
        if name == "debuffs"
        or name == "defensiveCooldowns"
        or name == "externalCooldowns"
        or name == "allCooldowns"
        or string.find(name, "^indicator")
        then
            ConfigureIndicator(indicator)
        end
    end
end)
