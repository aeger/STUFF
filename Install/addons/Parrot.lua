local aegerUI = ...

local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local profileVersion = "1.0"
	
function aegerUI:InstallParrot()
	if not IsAddOnLoaded("Parrot") then return end
	
	if aegerUI.db.global.addonProfileVersion.Parrot ~= profileVersion then
			
	_G.aegerUI_Parrot_Install = {
		["CombatEvents"] = {
			["CombatEvents"] = {
				["profiles"] = {
					["Default"] = {
						["dbver"] = 5,
					},
				},
			},
			["profiles"] = {
				["Default"] = {
					["dbver"] = 5,
				},
			},
			["Suppressions"] = {
			},
			["ScrollAreas"] = {
				["profiles"] = {
					["Default"] = {
						["areas"] = {
							["Notification"] = {
								["stickyDirection"] = "UP;CENTER",
								["direction"] = "UP;CENTER",
								["stickyAnimationStyle"] = "Pow",
								["xOffset"] = 0,
								["size"] = 150,
								["animationStyle"] = "Straight",
								["yOffset"] = 249.0000610351563,
							},
							["Incoming"] = {
								["stickyDirection"] = "DOWN;RIGHT",
								["direction"] = "DOWN;LEFT",
								["stickyAnimationStyle"] = "Pow",
								["iconSide"] = "RIGHT",
								["xOffset"] = -275.9993286132813,
								["size"] = 260,
								["animationStyle"] = "Parabola",
								["yOffset"] = 40.00018310546875,
							},
							["Outgoing"] = {
								["stickyDirection"] = "DOWN;LEFT",
								["direction"] = "DOWN;RIGHT",
								["stickyAnimationStyle"] = "Pow",
								["xOffset"] = 270.99951171875,
								["size"] = 260,
								["animationStyle"] = "Parabola",
								["yOffset"] = 41.0001220703125,
							},
						},
					},
				},
			},
			["Cooldowns"] = {
				["profiles"] = {
					["Default"] = {
						["threshold"] = 20,
					},
				},
			},
			["Display"] = {
			},
			["Triggers"] = {
				["profiles"] = {
					["Default"] = {
						["dbver"] = 9,
					},
				},
			},
		},
		["Suppressions"] = {
		},
		["ScrollAreas"] = {
			["profiles"] = {
				["Default"] = {
					["areas"] = {
						["Notification"] = {
							["stickyDirection"] = "UP;CENTER",
							["direction"] = "UP;CENTER",
							["yOffset"] = 175,
							["xOffset"] = 0,
							["size"] = 150,
							["animationStyle"] = "Straight",
							["stickyAnimationStyle"] = "Pow",
						},
						["Outgoing"] = {
							["stickyDirection"] = "DOWN;LEFT",
							["direction"] = "DOWN;RIGHT",
							["yOffset"] = 7.0001220703125,
							["xOffset"] = 362.0003662109375,
							["size"] = 260,
							["animationStyle"] = "Parabola",
							["stickyAnimationStyle"] = "Pow",
						},
						["Incoming"] = {
							["stickyDirection"] = "DOWN;RIGHT",
							["direction"] = "DOWN;LEFT",
							["yOffset"] = 10.0001220703125,
							["iconSide"] = "RIGHT",
							["xOffset"] = -362,
							["size"] = 260,
							["animationStyle"] = "Parabola",
							["stickyAnimationStyle"] = "Pow",
						},
					},
				},
			},
		},
		["Cooldowns"] = {
			["profiles"] = {
				["Default"] = {
					["threshold"] = 30,
				},
			},
		},
		["Display"] = {
		},
		["Triggers"] = {
			["profiles"] = {
				["Default"] = {
					["dbver"] = 9,
				},
			},
		},
	}


	for k,v in pairs(aegerUI_Parrot_Install) do
		ParrotDB.namespaces[k] = v
	end

	_G.aegerUI_ParrotProfiles = {
		["profiles"] = {
			["Default"] = {
		},
	},
	}

	for k,v in pairs(aegerUI_ParrotProfiles ) do
		ParrotDB[k] = v
		aegerUI.db.global.addonProfileVersion.Parrot = profileVersion
	end
	end
end