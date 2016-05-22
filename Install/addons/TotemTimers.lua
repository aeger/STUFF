local aegerUI = ...

local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local profileVersion = "1.0"

function aegerUI:InstallTotemTimers()
	if not IsAddOnLoaded("TotemTimers") then return end
	
	if aegerUI.db.profile.addonProfileVersionPC.TotemTimers ~= profileVersion then
	
	local CharName = UnitName("player")
	local ServerName = GetRealmName()
	local ProfileName = CharName.." - "..ServerName
	local playerClass = UnitClass("player")
	
	if playerClass ~= "Shaman" then return end
	
	_G.aegerUITTSink = {
		["Sink"] = {
			["sink20OutputSink"] = "Parrot",
			["sink20ScrollArea"] = "Notification",	
		},
	}
	
	for k,v in pairs(aegerUITTSink) do
		TotemTimers_GlobalSettings[k] = v
	end

	_G.aegerUITTProfiles = {
		[CharName] = {
			{
				["party"] = "default",
				["scenario"] = "default",
				["none"] = "default",
				["raid"] = "default",
				["arena"] = "default",
				["pvp"] = "default",
			}, -- [1]
			{
				["party"] = "default",
				["scenario"] = "default",
				["none"] = "default",
				["raid"] = "default",
				["arena"] = "default",
				["pvp"] = "default",
			}, -- [2]
			{
				["party"] = "default",
				["scenario"] = "default",
				["none"] = "default",
				["raid"] = "default",
				["arena"] = "default",
				["pvp"] = "default",
			}, -- [3]
		},
}

	for k,v in pairs(aegerUITTProfiles) do
		TotemTimers_GlobalSettings.Profiles[k] = v
	end

	_G.aegerUITTdefProfile = {
		["default"] = {
		["ShowTimerBars"] = true,
		["CrowdControlHex"] = true,
		["EnhanceCDsTimeHeight"] = 12,
		["TimerSpacing"] = 5,
		["EnhanceCDs_Spells"] = {
			{
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
				true, -- [5]
				true, -- [6]
				true, -- [7]
				true, -- [8]
				true, -- [9]
				true, -- [10]
				true, -- [11]
				[20] = true,
			}, -- [1]
			{
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
				true, -- [5]
				true, -- [6]
				true, -- [7]
				true, -- [8]
				true, -- [9]
				true, -- [10]
				true, -- [11]
				[21] = true,
				[22] = true,
				[20] = true,
			}, -- [2]
			{
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
				true, -- [5]
				true, -- [6]
				true, -- [7]
				[20] = true,
			}, -- [3]
		},
		["LastWeaponEnchant"] = 5,
		["HideInVehicle"] = true,
		["EnhanceCDsOOCAlpha"] = 0.4,
		["TotemTimerBarWidth"] = 36,
		["TooltipsAtButtons"] = true,
		["TimeFont"] = "Friz Quadrata TT",
		["FulminationAura"] = true,
		["FlashRed"] = true,
		["Show"] = true,
		["EnhanceCDs"] = false,
		["EnhanceCDs_Clickthrough"] = false,
		["Warnings"] = {
			["TotemWarning"] = {
				["a"] = 1,
				["enabled"] = true,
				["b"] = 0,
				["sound"] = "",
				["text"] = "Totem Expiring",
				["g"] = 0,
				["r"] = 1,
			},
			["Shield"] = {
				["a"] = 1,
				["enabled"] = true,
				["b"] = 0,
				["sound"] = "",
				["text"] = "Shield removed",
				["g"] = 0,
				["r"] = 1,
			},
			["Maelstrom"] = {
				["a"] = 1,
				["enabled"] = true,
				["b"] = 0,
				["sound"] = "",
				["text"] = "Maelstrom Notifier",
				["g"] = 0,
				["r"] = 1,
			},
			["TotemDestroyed"] = {
				["a"] = 1,
				["enabled"] = true,
				["b"] = 0,
				["sound"] = "",
				["text"] = "Totem Destroyed",
				["g"] = 0,
				["r"] = 1,
			},
			["EarthShield"] = {
				["a"] = 1,
				["enabled"] = true,
				["b"] = 0,
				["sound"] = "",
				["text"] = "Shield removed",
				["g"] = 0,
				["r"] = 1,
			},
			["TotemExpiration"] = {
				["a"] = 1,
				["enabled"] = true,
				["b"] = 0,
				["sound"] = "",
				["text"] = "Totem Expired",
				["g"] = 0,
				["r"] = 1,
			},
			["Weapon"] = {
				["a"] = 1,
				["enabled"] = true,
				["b"] = 0,
				["sound"] = "",
				["text"] = "Totem Expired",
				["g"] = 0,
				["r"] = 1,
			},
		},
		["ColorTimerBars"] = false,
		["TimerTimePos"] = "BOTTOM",
		["TimerTimeHeight"] = 12,
		["ShieldLeftButton"] = "Lightning Shield",
		["LastOffEnchants"] = {
			[87513] = {
				"Flametongue", -- [1]
				"INTERFACE\\ICONS\\spell_shaman_unleashweapon_flame", -- [2]
			},
		},
		["HiddenTotems"] = {
		},
		["Lock"] = true,
		["LavaSurgeAura"] = true,
		["CrowdControlArrange"] = "horizontal",
		["Tracker_Clickthrough"] = false,
		["StopPulse"] = true,
		["TrackerArrange"] = "horizontal",
		["EarthShieldTracker"] = false,
		["AnkhTracker"] = true,
		["CheckRaidRange"] = true,
		["HideDefaultTotemBar"] = false,
		["LongCooldowns"] = false,
		["ProcFlash"] = true,
		["EarthShieldButton4"] = "player",
		["FlameShockDurationOnTop"] = false,
		["LongCooldownSpells"] = {
			[108285] = true,
			[108271] = true,
			[114049] = true,
			[2825] = true,
			[79206] = true,
			[16188] = true,
			[32182] = true,
			[16166] = true,
			[108281] = true,
			[51533] = true,
		},
		["ShowOmniCCOnEnhanceCDs"] = true,
		["ReverseBarBindings"] = false,
		["CrowdControlSize"] = 30,
		["CrowdControlClickthrough"] = false,
		["LavaSurgeGlow"] = true,
		["TotemMenuSpacing"] = 0,
		["CheckPlayerRange"] = true,
		["TrackerTimeHeight"] = 12,
		["ShowKeybinds"] = true,
		["TimerBarTexture"] = "Blizzard",
		["TimerPositions"] = {
			{
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				-50, -- [4]
				-40, -- [5]
			}, -- [1]
			{
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				-70, -- [4]
				0, -- [5]
			}, -- [2]
			{
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				-30, -- [4]
				0, -- [5]
			}, -- [3]
			{
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				-50, -- [4]
				40, -- [5]
			}, -- [4]
		},
		["ShowCooldowns"] = false,
		["EnhanceCDsSize"] = 30,
		["TimerBarColor"] = {
			["a"] = 1,
			["b"] = 1,
			["g"] = 0.5,
			["r"] = 0.5,
		},
		["ESMainTankMenu"] = true,
		["LongCooldownsArrange"] = "horizontal",
		["OpenOnRightclick"] = false,
		["FulminationGlow"] = true,
		["TimerSize"] = 32,
		["TrackerSize"] = 30,
		["ActivateHiddenTimers"] = true,
		["CrowdControlTimePos"] = "BOTTOM",
		["CrowdControlEnable"] = false,
		["ESMainTankMenuDirection"] = "auto",
		["TrackerTimeSpacing"] = 0,
		["TimerTimeSpacing"] = 0,
		["TotemSets"] = {
			{
				3599, -- [1]
				8143, -- [2]
				5394, -- [3]
				8177, -- [4]
			}, -- [1]
		},
		["CooldownSpacing"] = 5,
		["TimeColor"] = {
			["b"] = 1,
			["g"] = 1,
			["r"] = 1,
		},
		["TimersOnButtons"] = true,
		["Arrange"] = "horizontal",
		["TrackerTimerBarWidth"] = 36,
		["CrowdControlBindElemental"] = true,
		["LastMainEnchants"] = {
			[87513] = {
				"Windfury", -- [1]
				"INTERFACE\\ICONS\\spell_shaman_unleashweapon_wind", -- [2]
			},
		},
		["CastBarDirection"] = "auto",
		["EarthShieldTargetName"] = true,
		["Order"] = {
			1, -- [1]
			2, -- [2]
			3, -- [3]
			4, -- [4]
		},
		["EnhanceCDs_Order"] = {
			{
				1, -- [1]
				2, -- [2]
				3, -- [3]
				4, -- [4]
				5, -- [5]
				6, -- [6]
				7, -- [7]
				8, -- [8]
				9, -- [9]
				10, -- [10]
				11, -- [11]
			}, -- [1]
			{
				1, -- [1]
				2, -- [2]
				3, -- [3]
				4, -- [4]
				5, -- [5]
				6, -- [6]
				7, -- [7]
				8, -- [8]
				9, -- [9]
				10, -- [10]
				11, -- [11]
			}, -- [2]
			{
				1, -- [1]
				2, -- [2]
				3, -- [3]
				4, -- [4]
				5, -- [5]
				6, -- [6]
				7, -- [7]
				8, -- [8]
				9, -- [9]
			}, -- [3]
		},
		["Tooltips"] = true,
		["ESChargesOnly"] = false,
		["ShieldMiddleButton"] = "Totemic Recall",
		["ShieldRightButton"] = "Water Shield",
		["MenusAlwaysVisible"] = false,
		["HideBlizzTimers"] = true,
		["BarBindings"] = true,
		["WeaponTracker"] = false,
		["WeaponMenuOnRightclick"] = false,
		["MiniIcons"] = true,
		["WeaponBarDirection"] = "auto",
		["ShieldTracker"] = false,
		["TrackerTimePos"] = "BOTTOM",
		["EarthShieldLeftButton"] = "recast",
		["TimeStyle"] = "mm:ss",
		["FramePositions"] = {
			["TotemTimers_CastBar2"] = {
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				-200, -- [4]
				-225, -- [5]
			},
			["TotemTimers_CastBar4"] = {
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				50, -- [4]
				-225, -- [5]
			},
			["TotemTimers_LongCooldownsFrame"] = {
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				150, -- [4]
				-80, -- [5]
			},
			["TotemTimers_EnhanceCDsFrame"] = {
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				0, -- [4]
				-170, -- [5]
			},
			["TotemTimers_CastBar3"] = {
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				50, -- [4]
				-190.0000152587891, -- [5]
			},
			["TotemTimers_CrowdControlFrame"] = {
				"BOTTOM", -- [1]
				nil, -- [2]
				"BOTTOM", -- [3]
				188.22216796875, -- [4]
				137.2327270507813, -- [5]
			},
			["TotemTimersFrame"] = {
				"BOTTOM", -- [1]
				nil, -- [2]
				"BOTTOM", -- [3]
				-40.71104431152344, -- [4]
				65.35463714599609, -- [5]
			},
			["TotemTimers_TrackerFrame"] = {
				"BOTTOM", -- [1]
				nil, -- [2]
				"BOTTOM", -- [3]
				-316.9335327148438, -- [4]
				79.14382934570313, -- [5]
			},
			["TotemTimers_CastBar1"] = {
				"CENTER", -- [1]
				nil, -- [2]
				"CENTER", -- [3]
				-200, -- [4]
				-190.0000152587891, -- [5]
			},
		},
		["LastWeaponEnchant2"] = "Flametongue Weapon",
		["EarthShieldRightButton"] = "target",
		["ShowRaidRangeTooltip"] = true,
		["CDTimersOnButtons"] = true,
		["LastTotems"] = {
			3599, -- [1]
			8143, -- [2]
			5394, -- [3]
			8177, -- [4]
		},
		["TrackerSpacing"] = 5,
		["EarthShieldMiddleButton"] = "targettarget",
		["EnhanceCDsMaelstromHeight"] = 14,
		["Timer_Clickthrough"] = false,
		["TotemOrder"] = {
			{
				2894, -- [1]
				3599, -- [2]
				8190, -- [3]
			}, -- [1]
			{
				2484, -- [1]
				108270, -- [2]
				2062, -- [3]
				8143, -- [4]
				51485, -- [5]
			}, -- [2]
			{
				5394, -- [1]
				16190, -- [2]
				108280, -- [3]
			}, -- [3]
			{
				8177, -- [1]
				108269, -- [2]
				120668, -- [3]
				98008, -- [4]
				108273, -- [5]
			}, -- [4]
		},
	},
	}

	for k,v in pairs(aegerUITTdefProfile) do
		TotemTimers_Profiles[k] = v
		aegerUI.db.profile.addonProfileVersionPC.TotemTimers = profileVersion
	end
	end
end
