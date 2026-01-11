local _, Cell = ...
local F = Cell.funcs
local A = Cell.animations

-------------------------------------------------
-- pool
-------------------------------------------------
local pool

local function creationFunc()
    local f = CreateFrame("Frame")
    f:Hide()

    local tex = f:CreateTexture(nil, "ARTWORK")
    tex:SetTexture("Interface\\AddOns\\Cell\\Media\\star.tga")
    tex:SetAllPoints(f)

    local ag = f:CreateAnimationGroup()
    ag:SetScript("OnFinished", function()
        if pool:IsActive(f) then
            pool:Release(f)
        end
    end)

    -- in -------------------------------------------------------------------- --
    local in_t = ag:CreateAnimation("Translation")
    in_t:SetOrder(2)
    in_t:SetDuration(0.3)
    in_t:SetSmoothing("IN_OUT")

    local in_s0 = ag:CreateAnimation("Scale")
    in_s0:SetOrder(1)
    in_s0:SetScale(0.01, 0.01)
    in_s0:SetDuration(0)

    local in_s = ag:CreateAnimation("Scale")
    in_s:SetOrder(2)
    in_s:SetScale(100, 100)
    in_s:SetDuration(0.3)

    local in_a = ag:CreateAnimation("Alpha")
    in_a:SetOrder(2)
    F.AlphaSetFromTo(in_a, 0, 1)
    in_a:SetDuration(0.3)

    local in_spinning = ag:CreateAnimation("Rotation")
    in_spinning:SetOrder(2)
    in_spinning:SetDegrees(-360)
    in_spinning:SetDuration(0.5)
    in_spinning:SetEndDelay(0.5)

    -- main ------------------------------------------------------------------ --
    local main_s1 = ag:CreateAnimation("Scale")
    main_s1:SetOrder(3)
    main_s1:SetScale(1.25, 1.25)
    main_s1:SetDuration(0.2)

    local main_t1 = ag:CreateAnimation("Translation")
    main_t1:SetOffset(0, 5)
    main_t1:SetDuration(0.1)
    main_t1:SetOrder(3)
    main_t1:SetSmoothing("OUT")

    local main_t2 = ag:CreateAnimation("Translation")
    main_t2:SetOffset(0, -5)
    main_t2:SetDuration(0.1)
    main_t2:SetOrder(3)
    main_t2:SetSmoothing("IN")
    main_t2:SetStartDelay(0.1)
    main_t2:SetEndDelay(0.25)

    local main_s2 = ag:CreateAnimation("Scale")
    main_s2:SetOrder(4)
    main_s2:SetScale(1.25, 1.25)
    main_s2:SetDuration(0.2)

    local main_t3 = ag:CreateAnimation("Translation")
    main_t3:SetOffset(0, 5)
    main_t3:SetDuration(0.1)
    main_t3:SetOrder(4)
    main_t3:SetSmoothing("OUT")

    local main_t4 = ag:CreateAnimation("Translation")
    main_t4:SetOffset(0, -5)
    main_t4:SetDuration(0.1)
    main_t4:SetOrder(4)
    main_t4:SetSmoothing("IN")
    main_t4:SetStartDelay(0.1)
    main_t4:SetEndDelay(0.5)

    -- out ------------------------------------------------------------------- --
    local out_s = ag:CreateAnimation("Scale")
    out_s:SetOrder(5)
    out_s:SetScale(0.01, 0.01)
    out_s:SetDuration(0.5)
    out_s:SetSmoothing("IN")

    local out_spinning = ag:CreateAnimation("Rotation")
    out_spinning:SetOrder(5)
    out_spinning:SetDegrees(-360)
    out_spinning:SetDuration(0.5)

    local out_t = ag:CreateAnimation("Translation")
    out_t:SetOrder(5)
    out_t:SetStartDelay(0.2)
    out_t:SetDuration(0.3)
    out_t:SetSmoothing("IN_OUT")

    local out_a = ag:CreateAnimation("Alpha")
    out_a:SetOrder(5)
    F.AlphaSetFromTo(out_a, 1, 0)
    out_a:SetStartDelay(0.2)
    out_a:SetDuration(0.3)

    function f:Display(x, y)
        in_t:SetOffset(x, y)
        out_t:SetOffset(x, -y)
        f:Show()
        ag:Play()
    end

    return f
end

local function resetterFunc(_, f)
    f:Hide()
end

pool = CreateObjectPool(creationFunc, resetterFunc)

local function Display(b)
    local f = pool:Acquire()
    local indicatorFrame = b.widgets.indicatorFrame
    f:SetParent(indicatorFrame)
    f:ClearAllPoints()
    f:SetPoint("CENTER", b, "BOTTOMLEFT")
    f:SetFrameLevel(indicatorFrame:GetFrameLevel() + 1)

    local size = max(min(b:GetHeight(), b:GetWidth()), 64)
    f:SetSize(size, size)

    f:Display(ceil(b:GetWidth()/2), ceil(b:GetHeight()/2))
    -- f:FadeIn()
    -- F.C_Timer.After(3, f.FadeOut)
end

-------------------------------------------------
-- mvp pool
-------------------------------------------------
local mvpPool = CreateObjectPool(function(pool)
    local f = CreateFrame("ScrollFrame")
    f:Hide()
    f:EnableMouse(false)

    local content = CreateFrame("Frame", nil, f)
    content:EnableMouse(false)
    f:SetScrollChild(content)
    content:SetAllPoints(f)
    f.content = content

    local tex = content:CreateTexture(nil, "ARTWORK")
    tex:SetTexture("Interface\\AddOns\\Cell\\Media\\FlipBooks\\mvp.tga")
    tex:SetSize(128, 128)
    tex:SetPoint("CENTER", content, "CENTER")

    local flip = F.CreateFlipBook(tex, 2, 8, 4, 32, true)

    f:SetScript("OnShow", function()
        flip:Play()
        f.timer = F.C_Timer.NewTimer(3, f.FadeOut)
    end)
    f:SetScript("OnHide", function()
        flip:Stop()
    end)

    A.CreateFadeIn(f, 0, 1, 0.2)
    A.CreateFadeOut(f, 1, 0, 0.2, nil, function()
        f.timer = nil
        if pool:IsActive(f) then
            pool:Release(f)
        end
    end)

    return f
end, function(_, f)
    if f.timer then
        f.timer:Cancel()
        f.timer = nil
    end
    f:Hide()
end)

local function DisplayMVP(b)
    local f = mvpPool:Acquire()
    local indicatorFrame = b.widgets.indicatorFrame
    f:SetParent(indicatorFrame)
    f:ClearAllPoints()
    f:SetAllPoints(indicatorFrame)
    f:SetFrameLevel(indicatorFrame:GetFrameLevel() + 1)
    f.content:SetFrameLevel(f:GetFrameLevel())

    f:FadeIn()
end

-------------------------------------------------
-- goat pool
-------------------------------------------------
local goatPool = CreateObjectPool(function(pool)
    local f = CreateFrame("ScrollFrame")
    f:Hide()
    f:EnableMouse(false)

    local content = CreateFrame("Frame", nil, f)
    content:EnableMouse(false)
    f:SetScrollChild(content)
    content:SetAllPoints(f)
    f.content = content

    local tex = content:CreateTexture(nil, "ARTWORK")
    tex:SetTexture("Interface\\AddOns\\Cell\\Media\\FlipBooks\\goat.tga")
    tex:SetSize(128, 128)
    tex:SetPoint("BOTTOMRIGHT", content, "BOTTOMRIGHT")

    local flip = F.CreateFlipBook(tex, 2, 8, 8, 52, true)

    f:SetScript("OnShow", function()
        flip:Play()
        f.timer = F.C_Timer.NewTimer(3.8, f.FadeOut)
    end)
    f:SetScript("OnHide", function()
        flip:Stop()
    end)

    A.CreateFadeIn(f, 0, 1, 0.2)
    A.CreateFadeOut(f, 1, 0, 0.2, nil, function()
        f.timer = nil
        if pool:IsActive(f) then
            pool:Release(f)
        end
    end)

    return f
end, function(_, f)
    if f.timer then
        f.timer:Cancel()
        f.timer = nil
    end
    f:Hide()
end)

local function DisplayGOAT(b)
    local f = goatPool:Acquire()
    local indicatorFrame = b.widgets.indicatorFrame
    f:SetParent(indicatorFrame)
    f:ClearAllPoints()
    f:SetAllPoints(indicatorFrame)
    f:SetFrameLevel(indicatorFrame:GetFrameLevel() + 1)
    f.content:SetFrameLevel(f:GetFrameLevel())

    f:FadeIn()
end

-------------------------------------------------
-- events
-------------------------------------------------
local eventFrame = CreateFrame("Frame")

local displays = {
    [true] = Display,
    ["mvp"] = DisplayMVP,
    ["goat"] = DisplayGOAT,
}

local function DisplaySupporter(unit)
    local fullName = F.UnitFullName(unit)
    if not fullName then
        return
    end

    local supporter = Cell.wowSupporters[fullName]
    if supporter then
        F.HandleUnitButton("unit", unit, displays[supporter])
    end
end

local function Check()
    pool:ReleaseAll()
    mvpPool:ReleaseAll()
    goatPool:ReleaseAll()

    -- Cell.wowSupporters[Cell.vars.playerNameFull] = true

    if F.IsInGroup() then
        for unit in F.IterateGroupMembers() do
            DisplaySupporter(unit)
        end
    else
        DisplaySupporter("player")
    end
end

local timer

local function OnEvent()
    if InCombatLockdown() then return end

    if timer then
        timer:Cancel()
    end
    timer = F.C_Timer.NewTimer(5, function()
        timer = nil
        Check()
    end)
end

Cell.RegisterCallback("UnitButtonsInitialized", "Supporter_UnitButtonsInitialized", function()
    Cell.UnregisterCallback("UnitButtonsInitialized", "Supporter_UnitButtonsInitialized")
    eventFrame:RegisterEvent("RAID_ROSTER_UPDATE")
    eventFrame:RegisterEvent("PARTY_MEMBERS_CHANGED")
    OnEvent(eventFrame)
end)

eventFrame:SetScript("OnEvent", OnEvent)
