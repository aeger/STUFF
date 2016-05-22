local aegerUI = ...

local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local profileVersion = "1.0"

function aegerUI:InstallExtSocialUI()
	if not IsAddOnLoaded("ExtSocialUI") then return end
	
	if aegerUI.db.global.addonProfileVersion.ExtSocialUI ~= profileVersion then
	
		_G.aegerUI_ExtSocialUI_Install = {
			["show_load_message"] = false,
		}
		
for k,v in pairs(aegerUI_ExtSocialUI_Install) do
		EXTSOCIALUI_DATA.config[k] = v
		aegerUI.db.global.addonProfileVersion.ExtSocialUI = profileVersion
	end
	end
end