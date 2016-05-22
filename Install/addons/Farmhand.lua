local aegerUI = ...

local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local profileVersion = "1.0"

function aegerUI:InstallFarmhand()
	if not IsAddOnLoaded("Farmhand") then return end
	
	if aegerUI.db.global.addonProfileVersion.Farmhand ~= profileVersion then
				
	_G.aegerUI_Farmhand_Install = {
			["PlayScannerSounds"] = true,
			["ShowPortals"] = false,
			["ToolsLocked"] = false,
			["StockTipPosition"] = "BELOW",
			["Y"] = 455.3998970985413,
			["X"] = -789.0002498626709,
			["ShowStockTip"] = true,
			["ShowVeggieIconsForSeeds"] = false,
			["HideInCombat"] = true,
			["ShowVeggieIconsForBags"] = false,
			["PrintScannerMessages"] = true,
	}
		
for k,v in pairs(aegerUI_Farmhand_Install) do
		FarmhandData[k] = v
		aegerUI.db.global.addonProfileVersion.Farmhand = profileVersion
	end
	end
end