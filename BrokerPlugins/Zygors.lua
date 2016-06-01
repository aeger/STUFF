local name, ns = ...

if not IsAddOnLoaded("ZygorGuidesViewer") then return end
LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("Zygors", {
	type = "launcher",
	label = "Zygors",
	OnClick = function(_, msg)
	if msg == "LeftButton" then
			ZygorGuidesViewer:ToggleFrame()
    elseif msg == "RightButton" then
	    ZygorGuidesViewer:OpenOptions()
	end
	
end,
	icon = "Interface\\AddOns\\Stuff\\Textures\\Icons\\zglogo",
	 
	OnTooltipShow = function(tooltip)
		if not tooltip or not tooltip.AddLine then return end
		tooltip:AddLine("Zygors Guide Viewer")
		tooltip:AddLine("Left |cff00ff00Click|r to toggle Zygors Guide Viewer")
		tooltip:AddLine("Right |cff00ff00Click|r to open Zygors options window")
	end,
})