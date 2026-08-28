local _, Cell = ...
local L = Cell.L
local F = Cell.funcs
local P = Cell.pixelPerfectFuncs
local A = Cell.animations

local readyBtn, pullBtn

local buttonsFrame = CreateFrame("Frame", "CellReadyAndPullFrame", Cell.frames.mainFrame, "SecureFrameTemplate")
Cell.frames.readyAndPullFrame = buttonsFrame
P.Size(buttonsFrame, 60, 55)
F.PixelUtil.SetPoint(buttonsFrame, "TOPRIGHT", CellParent, "CENTER", -1, -1)
buttonsFrame:SetClampedToScreen(true)
buttonsFrame:SetMovable(true)
buttonsFrame:RegisterForDrag("LeftButton")
buttonsFrame:SetScript("OnDragStart", function()
    buttonsFrame:StartMoving()
    buttonsFrame:SetUserPlaced(false)
end)
buttonsFrame:SetScript("OnDragStop", function()
    buttonsFrame:StopMovingOrSizing()
    P.SavePosition(buttonsFrame, CellDB["tools"]["readyAndPull"][4])
end)

-------------------------------------------------
-- mover
-------------------------------------------------
buttonsFrame.moverText = buttonsFrame:CreateFontString(nil, "OVERLAY", "CELL_FONT_WIDGET")
buttonsFrame.moverText:SetPoint("TOP", 0, -3)
buttonsFrame.moverText:SetText(L["Mover"])
buttonsFrame.moverText:Hide()

local function ShowMover(show)
    if show then
        if not CellDB["tools"]["readyAndPull"][1] then return end
        buttonsFrame:EnableMouse(true)
        buttonsFrame.moverText:Show()
        Cell.StylizeFrame(buttonsFrame, {0, 1, 0, 0.4}, {0, 0, 0, 0})
        if not F.HasPermission() then -- button not shown
            readyBtn:Show()
            pullBtn:Show()
        end
        buttonsFrame:SetAlpha(1)
    else
        buttonsFrame:EnableMouse(false)
        buttonsFrame.moverText:Hide()
        Cell.StylizeFrame(buttonsFrame, {0, 0, 0, 0}, {0, 0, 0, 0})
        if not F.HasPermission() then -- button should not shown
            readyBtn:Hide()
            pullBtn:Hide()
        end
        buttonsFrame:SetAlpha(CellDB["tools"]["fadeOut"] and 0 or 1)
    end
end
Cell.RegisterCallback("ShowMover", "RaidButtons_ShowMover", ShowMover)

-------------------------------------------------
-- pull
-------------------------------------------------
pullBtn = Cell.CreateStatusBarButton(buttonsFrame, L["Pull"], {60, 17}, 7, "SecureActionButtonTemplate")
pullBtn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
pullBtn:Hide()

-------------------------------------------------
-- pull bar
-------------------------------------------------
pullBtn:SetScript("OnEvent", function(self, event, ...)
    self[event](self, ...)
end)

local pullTicker, isPullTickerRunning
local function Start(sec, sendToChat)
    isPullTickerRunning = true
    pullBtn:SetMaxValue(sec)
    pullBtn:Start()

    -- update button text
    pullBtn:SetText(sec)
    if pullTicker then
        pullTicker:Cancel()
        pullTicker = nil
    end
    pullBtn.sec = sec
    pullTicker = F.C_Timer.NewTicker(1, function()
        pullBtn.sec = pullBtn.sec - 1
        if pullBtn.sec == 0 then
            isPullTickerRunning = false
            pullBtn:SetText(L["Go!"])
            if sendToChat then
                SendChatMessage(L["Go!"], F.IsInRaid() and "RAID_WARNING" or "PARTY")
            end
        elseif pullBtn.sec == -1 then
            pullBtn:SetText(L["Pull"])
        else
            pullBtn:SetText(pullBtn.sec)
            if sendToChat then
                if pullBtn.sec > 3 then
                    SendChatMessage(pullBtn.sec, F.IsInRaid() and "RAID" or "PARTY")
                else
                    SendChatMessage(pullBtn.sec, F.IsInRaid() and "RAID_WARNING" or "PARTY")
                end
            end
        end
    end, sec+1)
end

local function Stop()
    isPullTickerRunning = false
    pullBtn:Stop()

    -- update button text
    pullBtn:SetText(L["Pull"])
    if pullTicker then
        pullTicker:Cancel()
        pullTicker = nil
    end
end

local function SendDBMPull(sec)
    local command = SlashCmdList and SlashCmdList["DEADLYBOSSMODS"]
    if not DBM or type(command) ~= "function" then
        return
    end

    command("pull "..sec)
    return true
end

function pullBtn:CHAT_MSG_ADDON(prefix, text)
    if prefix == "D4" then -- DBM
        local pre, sec = strsplit("\t", text)
        sec = tonumber(sec)
        if pre == "PT" and sec > 0 then -- start
            Start(sec)
        elseif pre == "PT" and sec  == 0 then -- cancel
            Stop()
        end
    elseif prefix == "DBMv4-PT" then
        local sec = strsplit("\t", text)
        sec = tonumber(sec)
        if sec and sec > 0 then
            Start(sec)
        elseif sec == 0 then
            Stop()
        end

    -- elseif prefix == "BigWigs" then
    --     local _, pre, sec = strsplit("^", text)
    --     sec = tonumber(sec)
    --     if pre == "Pull" and sec > 0 then -- start
    --     elseif pre == "Pull" and sec  == 0 then -- cancel
    --     end
    end
end

function pullBtn:START_TIMER(timerType, timeRemaining, totalTime)
    if totalTime > 0 then
        Start(totalTime)
    else
        Stop()
    end
end

-------------------------------------------------
-- ready
-------------------------------------------------
readyBtn = Cell.CreateStatusBarButton(buttonsFrame, L["Ready"], {60, 17}, 35)
-- P.Point(readyBtn, "BOTTOMLEFT", pullBtn, "TOPLEFT", 0, 3)
readyBtn:Hide()

readyBtn:RegisterForClicks("LeftButtonDown")
readyBtn:SetScript("OnClick", function()
    DoReadyCheck()
end)

local ready = {}
readyBtn:SetScript("OnEvent", function(self, event, arg1, arg2)
    if event == "READY_CHECK" then
        readyBtn:SetMaxValue(arg2)
        readyBtn:Start()
        wipe(ready)
        tinsert(ready, "player")
        readyBtn:SetText("1 / "..F.GetNumGroupMembers())
    elseif event == "READY_CHECK_FINISHED" then
        readyBtn:Stop()
        readyBtn:SetText(L["Ready"])
    else
        if arg2 then -- isReady
            if F.IsInRaid() then
                if string.find(arg1, "raid") then tinsert(ready, arg1) end
            else
                tinsert(ready, arg1)
            end
            readyBtn:SetText(#ready.." / "..F.GetNumGroupMembers())
        end
    end
end)

-------------------------------------------------
-- style
-------------------------------------------------
local function CreateTexture(b, tex)
    b.tex = b:CreateTexture(nil, "ARTWORK")
    b.tex:SetPoint("CENTER")
    P.Size(b.tex, 16, 16)
    b.tex:SetTexture(tex)

    -- push effect
    b.onMouseDown = function()
        b.tex:ClearAllPoints()
        b.tex:SetPoint("CENTER", 0, -1)
    end
    b.onMouseUp = function()
        b.tex:ClearAllPoints()
        b.tex:SetPoint("CENTER")
    end
    b:SetScript("OnMouseDown", b.onMouseDown)
    b:SetScript("OnMouseUp", b.onMouseUp)

    -- enable / disable
    b:HookScript("OnEnable", function()
        b.tex:SetVertexColor(1, 1, 1)
        b:SetScript("OnMouseDown", b.onMouseDown)
        b:SetScript("OnMouseUp", b.onMouseUp)
    end)
    b:HookScript("OnDisable", function()
        b.tex:SetVertexColor(0.4, 0.4, 0.4)
        b:SetScript("OnMouseDown", nil)
        b:SetScript("OnMouseUp", nil)
    end)
end

local function UpdateStyle()
    P.ClearPoints(pullBtn)
    P.ClearPoints(readyBtn)

    if CellDB["tools"]["readyAndPull"][2] == "text_button" then
        readyBtn:RegisterEvent("READY_CHECK")
        readyBtn:RegisterEvent("READY_CHECK_FINISHED")
        readyBtn:RegisterEvent("READY_CHECK_CONFIRM")

        P.Size(buttonsFrame, 60, 55)
        P.Size(pullBtn, 60, 17)
        P.Size(readyBtn, 60, 17)

        P.Point(pullBtn, "BOTTOMLEFT")
        P.Point(readyBtn, "BOTTOMLEFT", pullBtn, "TOPLEFT", 0, 3)

        pullBtn.tex:Hide()
        pullBtn:SetText(L["Pull"])
        readyBtn.tex:Hide()
        readyBtn:SetText(L["Ready"])
    else
        Stop()
        readyBtn:Stop()

        pullBtn:UnregisterAllEvents()
        readyBtn:UnregisterAllEvents()

        if CellDB["tools"]["readyAndPull"][2] == "icon_button_h" then -- horizontal
            buttonsFrame:SetSize(P.Scale(40)+P.Scale(2), P.Scale(40))
            P.Size(pullBtn, 20, 20)
            P.Size(readyBtn, 20, 20)

            P.Point(readyBtn, "BOTTOMLEFT")
            P.Point(pullBtn, "BOTTOMLEFT", readyBtn, "BOTTOMRIGHT", 2, 0)
        else -- vertical
            P.Size(buttonsFrame, 20, 62)
            P.Size(pullBtn, 20, 20)
            P.Size(readyBtn, 20, 20)

            P.Point(pullBtn, "BOTTOMLEFT")
            P.Point(readyBtn, "BOTTOMLEFT", pullBtn, "TOPLEFT", 0, 2)
        end

        pullBtn.tex:Show()
        pullBtn:SetText("")
        readyBtn.tex:Show()
        readyBtn:SetText("")
    end
end

-------------------------------------------------
-- fade out
-------------------------------------------------
A.ApplyFadeInOutToParent(buttonsFrame, function()
    return CellDB["tools"]["fadeOut"] and not buttonsFrame.moverText:IsShown()
end, readyBtn, pullBtn)

-------------------------------------------------
-- functions
-------------------------------------------------
local function CheckPermission()
    if InCombatLockdown() then
        buttonsFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
    else
        buttonsFrame:UnregisterEvent("PLAYER_REGEN_ENABLED")
        if F.HasPermission() and CellDB["tools"]["readyAndPull"][1] then
            readyBtn:Show()
            F.SetEnabled(readyBtn, true)
            pullBtn:Show()
            F.SetEnabled(pullBtn, true)
        else
            readyBtn:Hide()
            F.SetEnabled(readyBtn, false)
            pullBtn:Hide()
            F.SetEnabled(pullBtn, false)
        end
    end
end

buttonsFrame:SetScript("OnEvent", function()
    CheckPermission()
end)

Cell.RegisterCallback("PermissionChanged", "RaidButtons_PermissionChanged", CheckPermission)

local function UpdateTools(which)
    if not which or which == "buttons" then
        CheckPermission()
        ShowMover(Cell.vars.showMover and CellDB["tools"]["readyAndPull"][1])
    end

    if not which or which == "readyAndPull" then
        if not pullBtn.tex then CreateTexture(pullBtn, "Interface\\AddOns\\Cell\\Media\\Icons\\pull") end
        if not readyBtn.tex then CreateTexture(readyBtn, "Interface\\AddOns\\Cell\\Media\\Icons\\ready") end

        pullBtn:UnregisterAllEvents()
        pullBtn:SetScript("OnMouseUp", pullBtn.onMouseUp)
        pullBtn:SetAttribute("type1", "macro")
        pullBtn:SetAttribute("type2", "macro")

        if CellDB["tools"]["readyAndPull"][3][1] == "mrt" then
            pullBtn:RegisterEvent("CHAT_MSG_ADDON")
            pullBtn:SetAttribute("macrotext1", "/ert pull "..CellDB["tools"]["readyAndPull"][3][2])
            pullBtn:SetAttribute("macrotext2", "/ert pull 0")
        elseif CellDB["tools"]["readyAndPull"][3][1] == "dbm" then
            pullBtn:RegisterEvent("CHAT_MSG_ADDON")
            pullBtn:SetAttribute("macrotext1", "/dbm pull "..CellDB["tools"]["readyAndPull"][3][2])
            pullBtn:SetAttribute("macrotext2", "/dbm pull 0")
        elseif CellDB["tools"]["readyAndPull"][3][1] == "bw" then
            pullBtn:RegisterEvent("CHAT_MSG_ADDON")
            pullBtn:SetAttribute("macrotext1", "/pull "..CellDB["tools"]["readyAndPull"][3][2])
            pullBtn:SetAttribute("macrotext2", "/pull 0")
        else -- default
            pullBtn:SetAttribute("type1", nil)
            pullBtn:SetAttribute("type2", nil)
            pullBtn:RegisterEvent("CHAT_MSG_ADDON")
            pullBtn:SetScript("OnMouseUp", function(self, button)
                if button == "LeftButton" then
                    local sec = CellDB["tools"]["readyAndPull"][3][2]
                    if not SendDBMPull(sec) then
                        SendChatMessage(L["Pull in %d sec"]:format(sec), F.IsInRaid() and "RAID_WARNING" or "PARTY")
                        Start(sec, true)
                    end
                else
                    if not SendDBMPull(0) and isPullTickerRunning then
                        SendChatMessage(L["Pull timer cancelled"], F.IsInRaid() and "RAID_WARNING" or "PARTY")
                        Stop()
                    end
                end
                pullBtn.onMouseUp()
            end)
        end

        UpdateStyle()
    end

    if not which or which == "fadeOut" then
        if CellDB["tools"]["fadeOut"] and not buttonsFrame.moverText:IsShown() then
            buttonsFrame:SetAlpha(0)
        else
            buttonsFrame:SetAlpha(1)
        end
    end

    if not which then -- position
        P.LoadPosition(buttonsFrame, CellDB["tools"]["readyAndPull"][4])
    end
end
Cell.RegisterCallback("UpdateTools", "RaidButtons_UpdateTools", UpdateTools)

local function UpdatePixelPerfect()
    -- P.Resize(buttonsFrame)
    readyBtn:UpdatePixelPerfect()
    pullBtn:UpdatePixelPerfect()
end
Cell.RegisterCallback("UpdatePixelPerfect", "RaidButtons_UpdatePixelPerfect", UpdatePixelPerfect)
