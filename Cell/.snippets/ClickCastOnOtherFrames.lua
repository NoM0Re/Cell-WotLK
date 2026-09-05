local F = Cell.funcs

local blizzardFrames = {
    "PlayerFrame",
    "TargetFrame",
    "PetFrame",
    "PartyMemberFrame1",
    "PartyMemberFrame2",
    "PartyMemberFrame3",
    "PartyMemberFrame4",
    "PartyMemberFrame1PetFrame",
    "PartyMemberFrame2PetFrame",
    "PartyMemberFrame3PetFrame",
    "PartyMemberFrame4PetFrame",
}

local eventFrame = CreateFrame("Frame", nil, UIParent, "SecureHandlerBaseTemplate")

local function UpdateFrame(frame, snippet, attributes)
    if not frame then return end
    for _, attribute in ipairs(frame.cellSnippetBindingAttributes or {}) do
        frame:SetAttribute(attribute, nil)
    end
    F.UpdateClickCastOnFrame(frame, snippet)
    frame.cellSnippetBindingAttributes = attributes
    if not frame.cellSnippetClickCastWrapped then
        frame.cellSnippetClickCastWrapped = true
        frame:RegisterForClicks("AnyUp")
        SecureHandlerWrapScript(frame, "OnEnter", eventFrame, nil, [[self:RunAttribute("_onenter")]])
        SecureHandlerWrapScript(frame, "OnLeave", eventFrame, nil, [[self:RunAttribute("_onleave")]])
        SecureHandlerWrapScript(frame, "OnHide", eventFrame, nil, [[self:RunAttribute("_onhide")]])
    end
end

local function UpdateClickCastings(noReload, onlyqueued)
    if InCombatLockdown() then
        eventFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
        return
    end
    F.UpdateClickCastings(noReload, onlyqueued)
    local snippet = F.GetBindingSnippet()
    local attributes = {"cell", "menu"}
    local bindings = Cell.vars.clickCastings
    local profile = bindings["useCommon"] and bindings["common"] or bindings[Cell.vars.playerSpecID]
    for _, binding in ipairs(profile) do
        local key = binding[1]
        if key ~= "notBound" then
            if strfind(key, "SCROLL") then
                local modifier, button = strmatch(key, "^(.*)type%-(.+)$")
                key = "type-"..string.gsub(modifier, "-", "")..button
            end
            tinsert(attributes, key)
            for _, action in ipairs({"spell", "macro", "macrotext", "item"}) do
                tinsert(attributes, (string.gsub(key, "type", action)))
            end
        end
    end
    local ClickCastFrames = _G.ClickCastFrames or {}
    for frame, _ in pairs(ClickCastFrames) do
        UpdateFrame(frame, snippet, attributes)
    end
    for _, name in pairs(blizzardFrames) do
        UpdateFrame(_G[name], snippet, attributes)
    end
end

local function UpdateQueuedClickCastings()
    UpdateClickCastings(true, true)
end

Cell.UnregisterCallback("UpdateClickCastings",  "UpdateClickCastings")
Cell.UnregisterCallback("UpdateQueuedClickCastings",  "UpdateQueuedClickCastings")

Cell.RegisterCallback("UpdateQueuedClickCastings", "UpdateQueuedClickCastings", UpdateQueuedClickCastings)
Cell.RegisterCallback("UpdateClickCastings",  "UpdateClickCastings", UpdateClickCastings)

eventFrame:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_REGEN_ENABLED")
    UpdateClickCastings(true)
end)

UpdateClickCastings(true)
