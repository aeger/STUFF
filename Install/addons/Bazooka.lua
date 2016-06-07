local name, ns = ...
local Stuff = LibStub("AceAddon-3.0"):GetAddon("Stuff")
local profileVersion = "1.0"

function StuffInstallBazooka()
	if not IsAddOnLoaded("Bazooka") then return end
	
	if (Stuff.db.global.addonProfileVersion.Bazooka == nil) or (Stuff.db.global.addonProfileVersion.Bazooka ~= profileVersion) then
			
	_G.Stuff_Bazooka_Install = {
		["BazBar1"] = {
			["numBars"] = 3,
			["plugins"] = {
				["data source"] = {
					["BugSack"] = {
						["area"] = "center",
						["pos"] = 1,
						["bar"] = 3,
					},
					["Portable"] = {
						["enabled"] = false,
						["showText"] = false,
						["pos"] = 10,
						["bar"] = 3,
					},
					["GGSocialState"] = {
						["showIcon"] = false,
						["area"] = "left",
						["pos"] = 4,
						["bar"] = 3,
					},
					["iCPU"] = {
						["area"] = "left",
						["pos"] = 9,
						["bar"] = 3,
					},
					["DailyGlobalCheck_broker"] = {
						["enabled"] = false,
						["pos"] = 14,
					},
					["iReputation"] = {
						["pos"] = 1,
					},
					["Daily Global Check"] = {
						["enabled"] = false,
						["pos"] = 8,
						["bar"] = 3,
					},
					["MyProf"] = {
						["showText"] = false,
						["pos"] = 11,
						["bar"] = 3,
					},
					["Broker_wDurability"] = {
						["showIcon"] = false,
						["area"] = "left",
						["pos"] = 8,
						["bar"] = 3,
					},
					["iMoney"] = {
						["showIcon"] = false,
						["pos"] = 6,
						["bar"] = 3,
					},
					["BagSyncLDB"] = {
						["area"] = "left",
						["enabled"] = false,
						["showText"] = false,
					},
				},
				["launcher"] = {
					["AutoLootToggle"] = {
						["pos"] = 1,
					},
					["Bazooka"] = {
						["enabled"] = false,
					},
					["Zygors"] = {
						["area"] = "right",
						["pos"] = 11,
						["bar"] = 3,
					},
				},
			},
			["locked"] = true,
			["bars"] = {
				{
					["fadeAlpha"] = 0,
					["y"] = -71,
					["x"] = 1,
					["frameWidth"] = 497,
					["pos"] = 0,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
				}, -- [1]
				{
					["bgEnabled"] = false,
					["fadeAlpha"] = 0.22,
					["fadeOutOfCombat"] = true,
					["y"] = -206.9999084472656,
					["x"] = -61.99810028076172,
					["frameWidth"] = 90.00001525878906,
					["pos"] = 0,
					["point"] = "TOPRIGHT",
					["relPoint"] = "TOPRIGHT",
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
					["fadeInCombat"] = true,
				}, -- [2]
				{
					["bgEnabled"] = false,
					["fadeAlpha"] = 0,
					["y"] = -1.000007510185242,
					["x"] = 1.000335693359375,
					["frameWidth"] = 497.0000305175781,
					["pos"] = 0,
					["frameHeight"] = 20.0000171661377,
				}, -- [3]
			},
		},
		["BazBar2"] = {
			["numBars"] = 3,
			["plugins"] = {
				["data source"] = {
					["BugSack"] = {
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 1,
					},
					["Portable"] = {
						["area"] = "center",
						["bar"] = 3,
						["pos"] = 4,
					},
				},
				["launcher"] = {
					["AutoLootToggle"] = {
						["pos"] = 1,
					},
					["Bazooka"] = {
						["enabled"] = false,
					},
					["Zygors"] = {
						["area"] = "right",
						["pos"] = 11,
						["bar"] = 3,
					},
				},
			},
			["locked"] = true,
			["bars"] = {
				{
					["fadeAlpha"] = 0,
					["y"] = -71,
					["x"] = 1,
					["frameWidth"] = 497,
					["pos"] = 0,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
				}, -- [1]
				{
					["bgEnabled"] = false,
					["fadeAlpha"] = 0.22,
					["fadeOutOfCombat"] = true,
					["y"] = -206.9999084472656,
					["fadeInCombat"] = true,
					["frameWidth"] = 90.00001525878906,
					["pos"] = 0,
					["point"] = "TOPRIGHT",
					["relPoint"] = "TOPRIGHT",
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
					["x"] = -61.99810028076172,
				}, -- [2]
				{
					["bgEnabled"] = false,
					["fadeAlpha"] = 0,
					["y"] = -1.000007510185242,
					["x"] = 1.000335693359375,
					["frameWidth"] = 497.0000305175781,
					["pos"] = 0,
					["frameHeight"] = 20.0000171661377,
				}, -- [3]
			},
		},
		["BazBar3"] = {
			["numBars"] = 3,
			["plugins"] = {
				["data source"] = {
					["BugSack"] = {
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 1,
					},
				},
				["launcher"] = {
					["AutoLootToggle"] = {
						["pos"] = 1,
					},
				},
			},
			["locked"] = true,
			["bars"] = {
				{
					["fadeAlpha"] = 0,
					["y"] = -71,
					["x"] = 1,
					["frameWidth"] = 497,
					["pos"] = 0,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
				}, -- [1]
				{
					["bgEnabled"] = false,
					["fadeAlpha"] = 0.22,
					["fadeOutOfCombat"] = true,
					["y"] = -206.9999084472656,
					["x"] = -61.99810028076172,
					["frameWidth"] = 90.00001525878906,
					["pos"] = 0,
					["point"] = "TOPRIGHT",
					["relPoint"] = "TOPRIGHT",
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
					["fadeInCombat"] = true,
				}, -- [2]
				{
					["bgEnabled"] = false,
					["fadeAlpha"] = 0,
					["y"] = -1.000007510185242,
					["x"] = 1.000335693359375,
					["frameWidth"] = 497.0000305175781,
					["pos"] = 0,
					["frameHeight"] = 20.0000171661377,
				}, -- [3]
			},
		},
		["BazBar4"] = {
			["numBars"] = 3,
			["plugins"] = {
				["data source"] = {
					["BugSack"] = {
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 1,
					},
				},
				["launcher"] = {
					["AutoLootToggle"] = {
						["pos"] = 1,
					},
				},
			},
			["locked"] = true,
			["bars"] = {
				{
					["fadeAlpha"] = 0,
					["y"] = -71,
					["x"] = 1,
					["frameWidth"] = 497,
					["pos"] = 0,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
				}, -- [1]
				{
					["bgEnabled"] = false,
					["fadeAlpha"] = 0.22,
					["fadeOutOfCombat"] = true,
					["y"] = -206.9999084472656,
					["fadeInCombat"] = true,
					["frameWidth"] = 90.00001525878906,
					["pos"] = 0,
					["point"] = "TOPRIGHT",
					["relPoint"] = "TOPRIGHT",
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
					["x"] = -61.99810028076172,
				}, -- [2]
				{
					["bgEnabled"] = false,
					["fadeAlpha"] = 0,
					["y"] = -1.000007510185242,
					["x"] = 1.000335693359375,
					["frameWidth"] = 497.0000305175781,
					["pos"] = 0,
					["frameHeight"] = 20.0000171661377,
				}, -- [3]
			},
		},
	}
	
	for k,v in pairs(Stuff_Bazooka_Install) do
		BazookaDB.profiles[k] = v
		Stuff.db.global.addonProfileVersion.Bazooka = profileVersion
	end
	end
end