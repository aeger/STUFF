local aegerUI = ...

local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local profileVersion = "1.0"

function aegerUI:InstallBrokerMoneyFu()
	if not IsAddOnLoaded("Broker_MoneyFu") then return end
	
	if aegerUI.db.global.addonProfileVersion.Broker_MoneyFu ~= profileVersion then
	
	local MoneyFuprofile = "Default"
		
	_G.aegerUI_BrokerMoneyFu_Install = {
		[MoneyFuprofile] = {
			["simpleTooltip"] = true,
			["style"] = "SHORT",
			["minimap"] = {
				["hide"] = true,
			},
		},
	}
		
for k,v in pairs(aegerUI_BrokerMoneyFu_Install) do
		Broker_MoneyFuDB.profiles[k] = v
		aegerUI.db.global.addonProfileVersion.Broker_MoneyFu = profileVersion
	end
	end
end