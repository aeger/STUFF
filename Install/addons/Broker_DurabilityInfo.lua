local aegerUI = ...

local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local profileVersion = "1.0"

function aegerUI:InstallBrokerDurability()
	if not IsAddOnLoaded("Broker_DurabilityInfo") then return end
	
	if aegerUI.db.global.addonProfileVersion.Broker_DurabilityInfo ~= profileVersion then
	
	local Duraprofile = "Default"
		
	_G.aegerUI_BrokerDurability_Install = {
		[Duraprofile] = {
			["repairFromGuild"] = true,
			["repairType"] = 1,
		},
	}
		
for k,v in pairs(aegerUI_BrokerDurability_Install) do
		Broker_DurabilityInfoDB.profiles[k] = v
		aegerUI.db.global.addonProfileVersion.Broker_DurabilityInfo = profileVersion
	end
	end
end