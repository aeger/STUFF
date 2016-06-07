local name, ns = ...
local Stuff = LibStub("AceAddon-3.0"):GetAddon("Stuff")

function Stuff_StuffLDB:OnEnable()

if not IsAddOnLoaded("Stuff") then return end
local function toggle()
  LibStub("AceConfigDialog-3.0"):Open("Stuff")
  PlaySoundFile("Interface\\AddOns\\Stuff\\Textures\\sound\\click.mp3")
end

LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("Stuff", {
	type = "launcher",
	label = "Stuff",
	OnClick = function(_, msg)
	if msg == "LeftButton" then
			toggle()
    end
end,
	icon = "Interface\\AddOns\\Stuff\\Textures\\Icons\\stuffldb",
	 
	OnTooltipShow = function(tooltip)
		if not tooltip or not tooltip.AddLine then return end
		tooltip:AddLine("Stuff")
		tooltip:AddLine("Left |cff00ff00Click|r to open Stuff options")
	end,
})
end