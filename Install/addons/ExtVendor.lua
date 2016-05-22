local aegerUI = ...

local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local profileVersion = "1.0"

function aegerUI:InstallExtVendor()
	if not IsAddOnLoaded("ExtVendor") then return end
	
	if aegerUI.db.global.addonProfileVersion.ExtVendor ~= profileVersion then
				
	_G.aegerUI_ExtVendor_Install = {
			
			["show_load_message"] = false,
			["hide_known_recipes"] = false,
			["quickvendor_unusable"] = false,
			["quickvendor_suboptimal"] = false,
			["scale"] = 1,
			["show_suboptimal_armor"] = false,
			["enable_quickvendor"] = false,
			["quickvendor_whitegear"] = false,
			["hide_filtered"] = false,
			["optimal_armor"] = false,
			["filter_purchased_recipes"] = true,
			["stockfilter_defall"] = false,
			["usable_items"] = false,
			["quickvendor_alreadyknown"] = false,
			["mousewheel_paging"] = true,
		
}
		
for k,v in pairs(aegerUI_ExtVendor_Install) do
		EXTVENDOR_DATA.config[k] = v
		aegerUI.db.global.addonProfileVersion.ExtVendor = profileVersion
	end
	end
end