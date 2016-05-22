local aegerUI = ...

local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local profileVersion = "1.0"

function aegerUI:InstallBrokerMicroMenu()
	if not IsAddOnLoaded("Broker_MicroMenu") then return end
	
	if aegerUI.db.global.addonProfileVersion.Aanye_XP ~= profileVersion then
	
	local Microprofile = "Default"
		
	_G.aegerUI_BrokerMicroMenu_Install = {
		[Microprofile] = {
			["showHomeLatency"] = false,
			["fpsFirst"] = true,
			["disableColoring"] = false,
		},
	}
		
for k,v in pairs(aegerUI_BrokerMicroMenu_Install) do
		Broker_MicroMenuDB.profiles[k] = v
		aegerUI.db.global.addonProfileVersion.Aanye_XP = profileVersion
	end
	end
end