local name, ns = ...
local Stuff = LibStub("AceAddon-3.0"):GetAddon("Stuff")
local profileVersion = "1.0"
 
 function StuffInstallBagSync()
	if not IsAddOnLoaded("BagSync") then return end
	
	if (Stuff.db.global.addonProfileVersion.BagSync == nil) or (Stuff.db.global.addonProfileVersion.BagSync ~= profileVersion) then
		
	_G.Stuff_BagSync_Install = {
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

	for k,v in pairs(Stuff_BagSync_Install) do
		BagSyncOpt[k] = v
		Stuff.db.global.addonProfileVersion.BagSync = profileVersion
	end
	end
end