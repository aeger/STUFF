local aegerUI = ...

local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local profileVersion = "1.0"

function aegerUI:InstallMapster()
	if not IsAddOnLoaded("Mapster") then return end
	
	if aegerUI.db.global.addonProfileVersion.Mapster ~= profileVersion then
	
		_G.aegerUI_Mapster_Install = {
		["namespaces"] = {
		["GroupIcons"] = {
		},
		["Coords"] = {
		},
		["FogClear"] = {
			["global"] = {
				["errata"] = {
					["Hyjal_terrain1"] = {
						["esVengeance"] = 5704560910,
						["thann"] = 344249940240,
						["erGorge"] = 138154564928,
						["oldrinn"] = 18375574819,
						["l"] = 411373081,
						["OfFlame"] = 406208154019,
						["oost"] = 468297425173,
						["th"] = 271711534521,
						["Hill"] = 211845035278,
						["edPlain"] = 232359469421,
					},
				},
			},
		},
		["BattleMap"] = {
		},
		},
		["profiles"] = {
		["Default"] = {
			["scale"] = 1.147136211395264,
			["questPanels"] = 0,
			["y"] = -45.999765336368,
			["x"] = -57.66607988117903,
			["point"] = "TOP",
		},
		},
		}
		
for k,v in pairs(aegerUI_Mapster_Install) do
		MapsterDB[k] = v
		aegerUI.db.global.addonProfileVersion.Mapster = profileVersion
	end
	end
end