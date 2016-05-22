local aegerUI = ...

local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local profileVersion = "1.0"

function aegerUI:InstallCombuctor()
	if not IsAddOnLoaded("Combuctor") then return end
	
	if aegerUI.db.profile.addonProfileVersionPC.Combuctor ~= profileVersion then
	
	local CharName = UnitName("player")
	local ServerName = GetRealmName()
	local ProfileName = CharName.." - "..ServerName
	
		_G.aegerUI_Combuctor_Install = {
			[ProfileName] = {
			["inventory"] = {
				["showBags"] = false,
				["h"] = 508.9999389648438,
				["exclude"] = {
					["All"] = {
						"All", -- [1]
					},
				},
				["position"] = {
					"BOTTOMRIGHT", -- [1]
					nil, -- [2]
					"BOTTOMRIGHT", -- [3]
					0, -- [4]
					32, -- [5]
				},
				["sets"] = {
					"All", -- [1]
					"Equipment", -- [2]
					"Quest", -- [3]
					"Trade Goods", -- [4]
					"Usable", -- [5]
					"Miscellaneous", -- [6]
				},
				["bags"] = {
					0, -- [1]
					1, -- [2]
					2, -- [3]
					3, -- [4]
					4, -- [5]
				},
				["w"] = 469.9999694824219,
				["leftSideFilter"] = true,
			},
			["bank"] = {
				["h"] = 560,
				["position"] = {
					"TOPLEFT", -- [1]
					nil, -- [2]
					"TOPLEFT", -- [3]
					24.99997138977051, -- [4]
					-16.99999618530273, -- [5]
				},
				["exclude"] = {
					["All"] = {
						"All", -- [1]
					},
				},
				["bags"] = {
					-1, -- [1]
					5, -- [2]
					6, -- [3]
					7, -- [4]
					8, -- [5]
					9, -- [6]
					10, -- [7]
					11, -- [8]
				},
				["sets"] = {
					"All", -- [1]
					"Equipment", -- [2]
					"Trade Goods", -- [3]
					"Miscellaneous", -- [4]
					"Usable", -- [5]
					"Quest", -- [6]
				},
				["w"] = 621.0001220703125,
				["showBags"] = false,
			},
			["tipCounts"] = true,
		},
	}
		
		
for k,v in pairs(aegerUI_Combuctor_Install) do
		CombuctorDB2.profiles[k] = v
		aegerUI.db.profile.addonProfileVersionPC.Combuctor = profileVersion
	end
	end
end