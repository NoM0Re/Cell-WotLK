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

    local contents = {}
    local SetChangelogText, recentChangelogs

    local function CreateContent(name)
        local content = CreateFrame("SimpleHTML", name, changelogsFrame.scrollFrame.content)
        content:SetSpacing("h1", 8)
        content:SetSpacing("h2", 6)
        content:SetSpacing("h3", 4)
        content:SetSpacing("p", 4)
        content:SetFontObject("h1", "CELL_FONT_CLASS_TITLE")
        content:SetFontObject("h2", "CELL_FONT_CLASS")
        local bodyFont
        if LOCALE_zhCN then
            bodyFont = "CELL_FONT_WIDGET"
        else
            bodyFont = "CELL_FONT_CHINESE"
        end
        content:SetFontObject("h3", bodyFont)
        content:SetFontObject("p", bodyFont)
        content:SetTextColor("h3", 1, 1, 1, 0)
        content:SetWidth(changelogsFrame:GetWidth() - 30)
        content:SetHeight(1)
        content:SetHyperlinkFormat("|H%s|h|cFFFFD100%s|r|h")
        content:SetScript("OnHyperlinkClick", function(self, linkData, link, button)
            if linkData == "older" then
                SetChangelogText(L["OLDER_CHANGELOGS"], 15, true)
            elseif linkData == "recent" then
                SetChangelogText(recentChangelogs, 30, true)
            end
        end)
        contents[#contents + 1] = content
        return content
    end

    recentChangelogs = L["CHANGELOGS"]
    CreateContent("CellChangelogsContent")

    local function GetRenderedHeight(content)
        local point, relativeTo, relativePoint, x, y = content:GetPoint()
        content:ClearAllPoints()
        content:SetHeight(1)
        content:SetPoint("TOPLEFT", UIParent)
        local height = select(4, content:GetBoundsRect())
        content:ClearAllPoints()
        content:SetPoint(point, relativeTo, relativePoint, x, y)
        return height
    end

    local function GetChangelogChunks(text)
        local chunks = {}
        local chunk = ""

        for line in (text.."\n"):gmatch("(.-)\n") do
            if #chunk >= 20000 and line:find("^%s*<h1>") then
                chunks[#chunks + 1] = chunk
                chunk = ""
            end
            chunk = chunk .. line .. "\n"
        end

        chunks[#chunks + 1] = chunk
        return chunks
    end

    local updateId = 0
    SetChangelogText = function(text, padding, resetScroll)
        changelogsFrame.scrollFrame.content:SetAlpha(0)
        -- Wrath renders <br/> too tall; one transparent line matches modern spacing.
        text = string.gsub(text, "<br%s*/>", "<h3>.</h3>")

        local chunks = GetChangelogChunks(text)
        updateId = updateId + 1
        local currentUpdateId = updateId

        for i, chunk in ipairs(chunks) do
            local content = contents[i] or CreateContent()
            content:ClearAllPoints()
            if i == 1 then
                content:SetPoint("TOP", 0, -10)
            else
                content:SetPoint("TOP", contents[i - 1], "BOTTOM")
            end
            content:SetHeight(1)
            content:SetText("<html><body>" .. chunk .. "</body></html>")
            content:Show()
        end

        for i = #chunks + 1, #contents do
            contents[i]:Hide()
        end

        F.C_Timer.After(0, function()
            if currentUpdateId ~= updateId then return end

            local totalHeight = 0
            for i = 1, #chunks do
                local height = GetRenderedHeight(contents[i])
                contents[i]:SetHeight(height)
                totalHeight = totalHeight + height
            end

            changelogsFrame.scrollFrame:SetContentHeight(totalHeight + padding)
            changelogsFrame.scrollFrame.content:SetAlpha(1)
            if resetScroll then
                changelogsFrame.scrollFrame:ResetScroll()
            end
        end)
    end

    changelogsFrame:SetScript("OnShow", function()
        SetChangelogText(recentChangelogs, 100)
        F.C_Timer.After(0, function()
            P.PixelPerfectPoint(changelogsFrame)
        end)
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
