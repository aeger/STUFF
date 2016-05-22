local aegerUI = ...

local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local profileVersion = "1.0"

function aegerUI:InstallTinyDPS()
	if not IsAddOnLoaded("TinyDPS") then return end
	
	if aegerUI.db.global.addonProfileVersion.TinyDPS ~= profileVersion then
				
	_G.aegerUI_TinyDPS_Install = {
		["hideOOC"] = true,
		["hideIC"] = true,
		["barHeight"] = 15,
		["onlyBossSegments"] = false,
		["spacing"] = 2,
		["speed"] = 2,
		["autoReset"] = true,
		["hideSolo"] = true,
		["border"] = {
			0, -- [1]
			0, -- [2]
			0, -- [3]
			0.8, -- [4]
		},
		["hidePvP"] = true,
		["tooltipSpells"] = 3,
		["layout"] = 10,
		["backdrop"] = {
			0, -- [1]
			0, -- [2]
			0, -- [3]
			0.8, -- [4]
		},
		["width"] = 190,
		["version"] = "0.942",
		["tooltipTargets"] = 3,
		["showMinimapButton"] = false,
		["anchor"] = "TOPLEFT",
		["barbackdrop"] = {
			1, -- [1]
			1, -- [2]
			1, -- [3]
			0.05, -- [4]
		},
		["showRank"] = true,
		["swapColor"] = true,
		["bar"] = {
			0.9, -- [1]
			0.9, -- [2]
			0.9, -- [3]
			1, -- [4]
		},	
}
		
for k,v in pairs(aegerUI_TinyDPS_Install) do
		tdps[k] = v
	end


_G.aegerUI_TinyDPS_Pos_Install = {
		["y"] = -367.9994506835938,
		["x"] = 493.0009765625,
	}
		
for k,v in pairs(aegerUI_TinyDPS_Pos_Install) do
		tdpsPosition[k] = v
		aegerUI.db.global.addonProfileVersion.TinyDPS = profileVersion
	end
	end
end