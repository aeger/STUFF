local AUI, aui = ...
local profileVersion = "1.0"
 
 function aui.BagSyncOptions()
	if not IsAddOnLoaded("BagSync") then return end
	
	if aegerUI.db.global.addonProfileVersion.BagSync ~= profileVersion then
		
	_G.aegerUI_BS_Profile_Defaults = {
				["enableAuction"] = true,
				["showGuildNames"] = true,
				["tooltipOnlySearch"] = false,
				["enableTooltips"] = true,
				["enableMailbox"] = true,
				["enableFaction"] = true,
				["enableGuild"] = true,
				["showTotal"] = true,
				["enableTooltipSeperator"] = true,
				["enableUnitClass"] = true,
				["enableMinimap"] = false,
	}

	for k,v in pairs(aegerUI_BS_Profile_Defaults) do
		BagSyncOpt[k] = v
		aegerUI.db.global.addonProfileVersion.BagSync = profileVersion
	end
	end
end