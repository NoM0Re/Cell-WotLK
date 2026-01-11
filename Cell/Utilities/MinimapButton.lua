local _, Cell = ...
local L = Cell.L
local F = Cell.funcs

local LDB = LibStub("LibDataBroker-1.1")
local LDBIcon = LibStub("LibDBIcon-1.0")

local minimapButton = LDB:NewDataObject("Cell", {
    type = "launcher",
    text = "Cell",
    icon = "Interface\\AddOns\\Cell\\Media\\icon.tga",
    OnClick = function(_, button)
        if button == "LeftButton" then
            F.ShowOptionsFrame()
        end
    end,
    OnTooltipShow = function(tooltip)
        tooltip:ClearLines()
        tooltip:AddDoubleLine("Cell", Cell.version or "", 1, 0.82, 0, 1, 0.82, 0)
        tooltip:AddLine(" ")
        tooltip:AddLine(L["|cffeda55fLeft-Click|r to toggle showing the options window."], 0.2, 1, 0.2)
    end,
})

function F.UpdateMinimapButton()
    if CellDB["minimap"]["hide"] then
        LDBIcon:Hide("Cell")
    else
        LDBIcon:Show("Cell")
    end
end

Cell.RegisterCallback("AddonLoaded", "MinimapButton_AddonLoaded", function()
    LDBIcon:Register("Cell", minimapButton, CellDB["minimap"])
end)
