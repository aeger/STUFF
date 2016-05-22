local aegerUI = ...

local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local profileVersion = "1.0"

function aegerUI:InstallSocialState()
	if not IsAddOnLoaded("SocialState") then return end
	
	if aegerUI.db.global.addonProfileVersion.SocialState ~= profileVersion then
				
	_G.aegerUI_SocialState_Install = {
			["RealIDSort"] = "REALID",
			["GuildSort"] = "RANKINDEX",
			["hide_LDB_labels"] = true,
			["tooltip_autohide"] = "0.25",
			["hide_LDB_totals"] = true,
	}
		
for k,v in pairs(aegerUI_SocialState_Install) do
		SocialStateDB[k] = v
		aegerUI.db.global.addonProfileVersion.SocialState = profileVersion
	end
	end
end