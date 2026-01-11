local _, Cell = ...
local L = Cell.L
local F = Cell.funcs
local P = Cell.pixelPerfectFuncs

local changelogsFrame
local init

local function CreateChangelogsFrame()
    changelogsFrame = Cell.CreateMovableFrame("Cell "..L["Changelogs"], "CellChangelogsFrame", 400, 450, "DIALOG", 1, true)
    Cell.frames.changelogsFrame = changelogsFrame
    changelogsFrame:SetToplevel(true)

    changelogsFrame.header.closeBtn:HookScript("OnClick", function()
        CellDB["changelogsViewed"] = Cell.version
    end)

    Cell.CreateScrollFrame(changelogsFrame)
    changelogsFrame.scrollFrame:SetScrollStep(37)

    local content = CreateFrame("SimpleHTML", "CellChangelogsContent", changelogsFrame.scrollFrame.content)
    content:SetSpacing("h1", 9)
    content:SetSpacing("h2", 7)
    content:SetSpacing("p", 5)
    content:SetFontObject("h1", "CELL_FONT_CLASS_TITLE")
    content:SetFontObject("h2", "CELL_FONT_CLASS")
    if LOCALE_zhCN then
        content:SetFontObject("p", "CELL_FONT_WIDGET")
    else
        content:SetFontObject("p", "CELL_FONT_CHINESE")
    end
    content:SetPoint("TOP", 0, -10)
    content:SetWidth(changelogsFrame:GetWidth() - 30)
    content:SetHeight(1)
    content:SetHyperlinkFormat("|H%s|h|cFFFFD100%s|r|h")

    local measureFonts = {
        h1 = changelogsFrame:CreateFontString(nil, "ARTWORK", "CELL_FONT_CLASS_TITLE"),
        h2 = changelogsFrame:CreateFontString(nil, "ARTWORK", "CELL_FONT_CLASS"),
        p = changelogsFrame:CreateFontString(nil, "ARTWORK", LOCALE_zhCN and "CELL_FONT_WIDGET" or "CELL_FONT_CHINESE"),
    }
    local spacings = {h1 = 9, h2 = 7, p = 5}
    for tag, fontString in pairs(measureFonts) do
        fontString:SetWidth(content:GetWidth())
        fontString:SetSpacing(spacings[tag])
        fontString:SetAlpha(0)
    end

    local function GetTextHeight(fontString, text)
        text = string.gsub(text, "<[^>]+>", "")
        text = string.gsub(text, "&amp;", "&")
        text = string.gsub(text, "&lt;", "<")
        text = string.gsub(text, "&gt;", ">")
        fontString:SetText(text)
        return fontString:GetStringHeight()
    end

    local function GetChangelogHeight(text)
        local height = 0
        for tag, fontString in pairs(measureFonts) do
            for block in string.gmatch(text, "<"..tag..">(.-)</"..tag..">") do
                height = height + GetTextHeight(fontString, block) + spacings[tag]
            end
        end

        local _, breaks = string.gsub(text, "<br%s*/>", "")
        measureFonts.p:SetText(" ")
        return math.ceil(height + breaks * (measureFonts.p:GetStringHeight() + spacings.p))
    end

    local function UpdateContentHeight(text, padding, resetScroll)
        F.C_Timer.After(0, function()
            local height = GetChangelogHeight(text)
            content:SetHeight(height)
            changelogsFrame.scrollFrame:SetContentHeight(height + padding)
            if resetScroll then
                changelogsFrame.scrollFrame:ResetScroll()
            end
        end)
    end

    changelogsFrame:SetScript("OnShow", function()
        local text = L["CHANGELOGS"]
        content:SetText("<html><body>" .. text .. "</body></html>")
        UpdateContentHeight(text, 100)
        F.C_Timer.After(0, function()
            P.PixelPerfectPoint(changelogsFrame)
        end)
    end)

    content:SetScript("OnHyperlinkClick", function(self, linkData, link, button)
        local text
        if linkData == "older" then
            text = L["OLDER_CHANGELOGS"]
        elseif linkData == "recent" then
            text = L["CHANGELOGS"]
        end

        if text then
            content:SetText("<html><body>" .. text .. "</body></html>")
            UpdateContentHeight(text, 30, true)
        end
    end)
end

function F.CheckWhatsNew(show)
    if show or CellDB["changelogsViewed"] ~= Cell.version then
        if not init then
            init = true
            CreateChangelogsFrame()
        end

        if changelogsFrame:IsShown() then
            changelogsFrame:Hide()
        else
            changelogsFrame:ClearAllPoints()
            changelogsFrame:SetPoint("CENTER")
            changelogsFrame:Show()
        end
    end
end
