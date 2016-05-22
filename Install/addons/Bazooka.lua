local name, ns = ...
local profileVersion = "1.0"

function StuffInstallBazooka()
	if not IsAddOnLoaded("Bazooka") then return end
	
	if (StuffDB.addonProfileVersion.Bazooka == nil) or (StuffDB.addonProfileVersion.Bazooka ~= profileVersion) then
			
	_G.Stuff_Bazooka_Install = {
		["BazBar1"] = {
			["numBars"] = 3,
			["plugins"] = {
				["data source"] = {
					["DailyGlobalCheck_broker"] = {
						["enabled"] = false,
						["pos"] = 14,
					},
					["|cFFFFB366Ara|r Tradeskills"] = {
						["showText"] = false,
						["pos"] = 13,
						["bar"] = 3,
					},
					["BugSack"] = {
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 1,
					},
					["Broker_TimelessIsleChests"] = {
						["enabled"] = false,
						["pos"] = 14,
					},
					["Broker_DurabilityInfo"] = {
						["showIcon"] = false,
						["area"] = "left",
						["pos"] = 12,
						["bar"] = 3,
					},
					["SOCD - Daily Reset"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
					["Broker_MicroMenu"] = {
						["showIcon"] = false,
						["area"] = "center",
						["bar"] = 2,
						["pos"] = 1,
					},
					["Progress"] = {
						["showIcon"] = false,
						["area"] = "center",
						["bar"] = 3,
						["pos"] = 1,
					},
					["BagSyncLDB"] = {
						["area"] = "left",
						["enabled"] = false,
						["showText"] = false,
					},
					["Broker_MoneyFu"] = {
						["showIcon"] = false,
						["area"] = "left",
						["pos"] = 10,
						["bar"] = 3,
					},
					["SOCD-AltTrack"] = {
						["enabled"] = false,
						["pos"] = 11,
					},
					["Memory"] = {
						["area"] = "left",
						["enabled"] = false,
					},
					["DualSpeccer"] = {
						["area"] = "left",
						["enabled"] = false,
					},
					["SocialState"] = {
						["showIcon"] = false,
						["area"] = "left",
						["pos"] = 8,
						["bar"] = 3,
					},
					["TimelessDailyCheck"] = {
						["enabled"] = false,
						["pos"] = 1,
					},
				},
				["launcher"] = {
					["Masque"] = {
						["enabled"] = false,
					},
					["AtlasLoot"] = {
						["enabled"] = false,
					},
					["Parrot"] = {
						["enabled"] = false,
					},
					["TinyDPS"] = {
						["area"] = "right",
						["pos"] = 7,
						["bar"] = 3,
					},
					["AutoLootToggle"] = {
						["pos"] = 1,
					},
					["Bartender4"] = {
						["enabled"] = false,
					},
					["AvgItemLvl"] = {
						["enabled"] = false,
						["pos"] = 9,
					},
					["AskMrRobot"] = {
						["enabled"] = false,
					},
					["Bazooka"] = {
						["enabled"] = false,
					},
					["IfThen Edit"] = {
						["enabled"] = false,
						["pos"] = 13,
					},
					["Prat"] = {
						["enabled"] = false,
					},
					["GatherMate2"] = {
						["enabled"] = false,
					},
					["Zygors"] = {
						["area"] = "right",
						["pos"] = 11,
						["bar"] = 3,
					},
					["TradeSkillInfo"] = {
						["enabled"] = false,
					},
					["IfThen Help"] = {
						["enabled"] = false,
						["pos"] = 14,
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
					["DailyGlobalCheck_broker"] = {
						["enabled"] = false,
						["pos"] = 14,
					},
					["|cFFFFB366Ara|r Tradeskills"] = {
						["showText"] = false,
						["pos"] = 13,
						["bar"] = 3,
					},
					["BugSack"] = {
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 1,
					},
					["Broker_TimelessIsleChests"] = {
						["area"] = "left",
						["bar"] = 3,
						["pos"] = 3,
					},
					["Broker_DurabilityInfo"] = {
						["showIcon"] = false,
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 12,
						["bar"] = 3,
					},
					["SOCD - Daily Reset"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
					["Broker_MicroMenu"] = {
						["showIcon"] = false,
						["area"] = "center",
						["bar"] = 2,
						["pos"] = 1,
					},
					["Aanye_XP"] = {
						["showIcon"] = false,
						["area"] = "center",
						["enabled"] = false,
						["pos"] = 1,
						["bar"] = 3,
					},
					["BagSyncLDB"] = {
						["area"] = "left",
						["showText"] = false,
						["pos"] = 4,
						["bar"] = 3,
					},
					["Broker_MoneyFu"] = {
						["showIcon"] = false,
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 10,
						["bar"] = 3,
					},
					["SOCD-AltTrack"] = {
						["enabled"] = false,
						["pos"] = 11,
					},
					["Memory"] = {
						["area"] = "left",
						["enabled"] = false,
					},
					["DualSpeccer"] = {
						["area"] = "center",
						["pos"] = 1,
						["bar"] = 3,
					},
					["SocialState"] = {
						["showIcon"] = false,
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 8,
						["bar"] = 3,
					},
					["TimelessDailyCheck"] = {
						["enabled"] = false,
						["pos"] = 1,
					},
				},
				["launcher"] = {
					["Masque"] = {
						["enabled"] = false,
					},
					["AtlasLoot"] = {
						["pos"] = 1,
						["bar"] = 3,
					},
					["Parrot"] = {
						["enabled"] = false,
					},
					["TinyDPS"] = {
						["area"] = "right",
						["pos"] = 7,
						["bar"] = 3,
					},
					["AutoLootToggle"] = {
						["pos"] = 1,
					},
					["Bartender4"] = {
						["enabled"] = false,
					},
					["AvgItemLvl"] = {
						["enabled"] = false,
						["bar"] = 3,
						["pos"] = 9,
					},
					["AskMrRobot"] = {
						["area"] = "right",
						["pos"] = 2,
						["bar"] = 3,
					},
					["Bazooka"] = {
						["enabled"] = false,
					},
					["IfThen Edit"] = {
						["enabled"] = false,
						["pos"] = 13,
					},
					["Prat"] = {
						["enabled"] = false,
					},
					["GatherMate2"] = {
						["pos"] = 5,
						["bar"] = 3,
					},
					["Zygors"] = {
						["area"] = "right",
						["pos"] = 11,
						["bar"] = 3,
					},
					["TradeSkillInfo"] = {
						["enabled"] = false,
					},
					["IfThen Help"] = {
						["enabled"] = false,
						["pos"] = 14,
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
					["DailyGlobalCheck_broker"] = {
						["enabled"] = false,
						["pos"] = 14,
					},
					["|cFFFFB366Ara|r Tradeskills"] = {
						["showText"] = false,
						["pos"] = 13,
						["bar"] = 3,
					},
					["BugSack"] = {
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 1,
					},
					["Broker_TimelessIsleChests"] = {
						["enabled"] = false,
						["pos"] = 14,
					},
					["Broker_DurabilityInfo"] = {
						["showIcon"] = false,
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 12,
						["bar"] = 3,
					},
					["SOCD - Daily Reset"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
					["Broker_MicroMenu"] = {
						["showIcon"] = false,
						["area"] = "center",
						["bar"] = 2,
						["pos"] = 1,
					},
					["Aanye_XP"] = {
						["showIcon"] = false,
						["area"] = "center",
						["enabled"] = false,
						["pos"] = 1,
						["bar"] = 3,
					},
					["BagSyncLDB"] = {
						["area"] = "left",
						["enabled"] = false,
						["showText"] = false,
					},
					["Broker_MoneyFu"] = {
						["showIcon"] = false,
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 10,
						["bar"] = 3,
					},
					["SOCD-AltTrack"] = {
						["enabled"] = false,
						["pos"] = 11,
					},
					["Memory"] = {
						["area"] = "center",
						["pos"] = 1,
						["bar"] = 3,
					},
					["DualSpeccer"] = {
						["area"] = "left",
						["enabled"] = false,
					},
					["SocialState"] = {
						["showIcon"] = false,
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 8,
						["bar"] = 3,
					},
					["TimelessDailyCheck"] = {
						["enabled"] = false,
						["pos"] = 1,
					},
				},
				["launcher"] = {
					["Masque"] = {
						["enabled"] = false,
					},
					["AtlasLoot"] = {
						["enabled"] = false,
					},
					["Parrot"] = {
						["enabled"] = false,
					},
					["TinyDPS"] = {
						["area"] = "right",
						["pos"] = 7,
						["bar"] = 3,
					},
					["AutoLootToggle"] = {
						["pos"] = 1,
					},
					["Bartender4"] = {
						["enabled"] = false,
					},
					["AvgItemLvl"] = {
						["enabled"] = false,
						["pos"] = 9,
					},
					["AskMrRobot"] = {
						["enabled"] = false,
					},
					["Bazooka"] = {
						["enabled"] = false,
					},
					["IfThen Edit"] = {
						["bar"] = 3,
						["pos"] = 2,
					},
					["Prat"] = {
						["enabled"] = false,
					},
					["GatherMate2"] = {
						["enabled"] = false,
					},
					["Zygors"] = {
						["area"] = "right",
						["pos"] = 11,
						["bar"] = 3,
					},
					["TradeSkillInfo"] = {
						["enabled"] = false,
					},
					["IfThen Help"] = {
						["bar"] = 3,
						["pos"] = 3,
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
					["DailyGlobalCheck_broker"] = {
						["enabled"] = false,
						["pos"] = 14,
					},
					["|cFFFFB366Ara|r Tradeskills"] = {
						["showText"] = false,
						["pos"] = 13,
						["bar"] = 3,
					},
					["BugSack"] = {
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 1,
					},
					["Broker_TimelessIsleChests"] = {
						["enabled"] = false,
						["pos"] = 14,
					},
					["Broker_DurabilityInfo"] = {
						["showIcon"] = false,
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 12,
						["bar"] = 3,
					},
					["SOCD - Daily Reset"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
					["Broker_MicroMenu"] = {
						["showIcon"] = false,
						["area"] = "center",
						["bar"] = 2,
						["pos"] = 1,
					},
					["Aanye_XP"] = {
						["showIcon"] = false,
						["area"] = "center",
						["enabled"] = false,
						["pos"] = 1,
						["bar"] = 3,
					},
					["BagSyncLDB"] = {
						["area"] = "left",
						["enabled"] = false,
						["showText"] = false,
					},
					["Broker_MoneyFu"] = {
						["showIcon"] = false,
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 10,
						["bar"] = 3,
					},
					["SOCD-AltTrack"] = {
						["enabled"] = false,
						["pos"] = 11,
					},
					["Memory"] = {
						["area"] = "left",
						["enabled"] = false,
					},
					["DualSpeccer"] = {
						["area"] = "left",
						["enabled"] = false,
					},
					["SocialState"] = {
						["showIcon"] = false,
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 8,
						["bar"] = 3,
					},
					["TimelessDailyCheck"] = {
						["enabled"] = false,
						["pos"] = 1,
					},
				},
				["launcher"] = {
					["Masque"] = {
						["pos"] = 4,
						["bar"] = 3,
					},
					["AtlasLoot"] = {
						["enabled"] = false,
					},
					["Parrot"] = {
						["pos"] = 3,
						["bar"] = 3,
					},
					["TinyDPS"] = {
						["area"] = "right",
						["pos"] = 7,
						["bar"] = 3,
					},
					["AutoLootToggle"] = {
						["pos"] = 1,
					},
					["Bartender4"] = {
						["pos"] = 5,
						["bar"] = 3,
					},
					["AvgItemLvl"] = {
						["enabled"] = false,
						["pos"] = 9,
					},
					["AskMrRobot"] = {
						["enabled"] = false,
					},
					["Bazooka"] = {
						["enabled"] = false,
					},
					["IfThen Edit"] = {
						["enabled"] = false,
						["pos"] = 13,
					},
					["Prat"] = {
						["enabled"] = false,
						["pos"] = 2,
						["bar"] = 3,
					},
					["GatherMate2"] = {
						["enabled"] = false,
					},
					["Zygors"] = {
						["area"] = "right",
						["pos"] = 11,
						["bar"] = 3,
					},
					["TradeSkillInfo"] = {
						["enabled"] = false,
					},
					["IfThen Help"] = {
						["enabled"] = false,
						["pos"] = 14,
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
		StuffDB.addonProfileVersion.Bazooka = profileVersion
	end
	end
end