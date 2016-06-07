local name, ns = ...
local Stuff = LibStub("AceAddon-3.0"):GetAddon("Stuff")

-- Adjust scale via slash cmds
local function SetScaleSmall() --Called in options panel
	UIParent:SetScale(0.64);
	SetCVar("uiscale", "0.64");
	SetCVar("useUiScale", 1);
end
	
local function SetScaleNormal() --Called in options panel
	UIParent:SetScale(1.0);
	SetCVar("uiscale", "1.0");
	SetCVar("useUiScale", 0);
end

-- Options panel	
local function GetOptions()
	local options = {
		name = GetAddOnMetadata("Stuff", "Title"),
		type = "group",
		childGroups = "tab",
		args = {
			stuffdesc = {
				type = "description",
				order = 1,
				name = _G.GAME_VERSION_LABEL .. ": " .. Stuff.version .. "\n",
				cmdHidden = true,
			},
			general = {
				order = 100,
				type = "group",
				name = "General",
				cmdHidden = false,
				args = {
					startupmessage = {
						order = 100,
						name = "Startup message",
						type = "toggle",
						get = function() return Stuff.db.global.Greeting end,
						set = function(info, value) Stuff.db.global.Greeting = value
						end,
					},
					chainstyle = {
						order = 101,
						name = "Player Chain Style",
						type = "select",
						style = "dropdown",
						values = function()
							chain_style = {
								[0] = "None",
								[1] = "Rare",
								[2] = "Elite",
								[3] = "Rare-Elite",
							}
							return chain_style
						end,
						get = function() return Stuff.db.profile.Chain end,
						set = function(info, value) Stuff.db.profile.Chain = value
						end,
					},							
					automation = {
						order = 200,
						type = "group",
						name = "Automation",
						cmdHidden = false,
						args = {
							autoHeader = {
								order = 100,
								type = "header",
								name = "Automation options",
								cmdHidden = true,
							},
							autoDesc = {
								order = 101,
								type = "description",
								name = "Most automatic functions can be temp disabled by holding down a modifier key like shift while clicking \n" .. "\n",
							},
							autoRepair = {
								order = 110,
								name = "Auto Repair",
								type = "toggle",
								get = function() return Stuff.db.global.Automation.AutoRepair end,
								set = function(info, value) Stuff.db.global.Automation.AutoRepair = value
								end,
							},
							autoDeposit = {
								order = 130,
								name = "Auto Deposit Reagents",
								type = "toggle",
								get = function() return Stuff.db.global.Automation.AutoDepositRegs end,
								set = function(info, value) Stuff.db.global.Automation.AutoDepositRegs = value
								end,
							},
							autoSell = {
								order = 140,
								name = "Auto Sell Grey Items",
								type = "toggle",
								get = function() return Stuff.db.global.Automation.AutoSell end,
								set = function(info, value) Stuff.db.global.Automation.AutoSell = value
								end,
							},
							autoRez = {
								order = 191,
								name = "Auto accept resurrection requests",
								width = "full",
								type = "toggle",
								get = function() return Stuff.db.profile.Automation.AcceptRez end,
								set = function(info, value) Stuff.db.profile.Automation.AcceptRez = value
								end,
							},
							autoReload = {
								order = 194,
								name = "Reload UI to set options",
								type = "execute",
								func = function() ReloadUI() end,
							},
						},
					},
					blockers = {
						order = 200,
						type = "group",
						name = "Blockers",
						cmdHidden = false,
						args = {
							blockDuel = {
								order = 220,
								name = "Block duel requests",
								width = "full",
								type = "toggle",
								get = function() return Stuff.db.profile.Automation.BlockDuel end,
								set = function(info, value) Stuff.db.profile.Automation.BlockDuel = value
								end,
							},
							blockPetduel = {
								order = 230,
								name = "Block pet duel requests",
								width = "full",
								type = "toggle",
								get = function() return Stuff.db.profile.Automation.BlockPetDuel 	end,
								set = function(info, value) Stuff.db.profile.Automation.BlockPetDuel = value
								end,
							},
							disableerrormessage = {
								order = 240,
								name = "Hide error messages",
								type = "toggle",
								get = function() return Stuff.db.global.Automation.HideErrors end,
								set = function(info, value) Stuff.db.global.Automation.HideErrors = value
								end,
							},
							blockReload = {
								order = 241,
								name = "Reload UI to set options",
								type = "execute",
								func = function() ReloadUI() end,
							},
						},
					},
					brokerplugins = {
						name = "Broker Plugins",
						type = "group",
						order = 300,
						args = {
							bdesc = {
								order = 301,
								type = "description",
								name = "Enable/Disable DataBroker plugins for Stuff" .. "\n",
							},
							bautoloot = {
								order = 310,
								name = "Auto Loot",
								type = "toggle",
								get = function() return Stuff.db.global.BrokerPlugins.AutoLoot end,
								set = function(info, value) Stuff.db.global.BrokerPlugins.AutoLoot = value
								end,
							},
							bdurability = {
								order = 320,
								name = "Durability",
								type = "toggle",
								get = function() return Stuff.db.global.BrokerPlugins.BDurability end,
								set = function(info, value) Stuff.db.global.BrokerPlugins.BDurability = value
								end,
							},
							bdurability = {
								order = 321,
								name = "Stuff LDB",
								type = "toggle",
								get = function() return Stuff.db.global.BrokerPlugins.StuffLDB end,
								set = function(info, value) Stuff.db.global.BrokerPlugins.StuffLDB = value
								end,
							},
							btinydps = {
								order = 340,
								name = "TinyDPS",
								type = "toggle",
								get = function() return Stuff.db.global.BrokerPlugins.TinyDPS end,
								set = function(info, value) Stuff.db.global.BrokerPlugins.TinyDPS = value
								end,
							},
							bzygors = {
								order = 350,
								name = "Zygors",
								type = "toggle",
								get = function() return Stuff.db.global.BrokerPlugins.Zygors end,
								set = function(info, value) Stuff.db.global.BrokerPlugins.Zygors = value
								end,
							},
							bspacer = {
								order = 360,
								type = "description",
								width = "full",
								name = "\n\n",
							},
							breload = {
								order = 370,
								name = "Reload UI to set options",
								type = "execute",
								func = function() ReloadUI() end,
							},					
						},
					},
					keybinds = {
						name = "Key bindings",
						type = "group",
						order = 400,
						args = {
							keyHeader = {
								order = 100,
								type = "header",
								name = "Keybindings",
							},
							keybindtopmenu = {
								order = 110,
								name = "Toggle TopMenu",
								type = "keybinding",
								get = function() return GetBindingKey("ToggleTopMenu") end,
								set = function(key1, value)
									key1 = GetBindingKey("ToggleTopMenu")
									if key1 ~= nil then
									SetBinding(key1)
									end
									SetBinding(value, "ToggleTopMenu")
									SaveBindings(GetCurrentBindingSet())
								end,
							},
						},
					},
				},
			},
			modules = {
				name = "Modules",
				type = "group",
				order = 200,
				args = {
					modMinimap = {
						order = 110,
						name = "Minimap enabled",
						width = "full",
						type = "toggle",
						get = function() return Stuff.db.global.Minimap end,
						set = function(info, value) Stuff.db.global.Minimap = value
						end,
					},
					modActionBars = {
						order = 120,
						name = "ActionBars",
						width = "full",
						type = "toggle",
						get = function() return Stuff.db.global.ActionBars end,
						set = function(info, value) Stuff.db.global.ActionBars = value
						end,
					},
					modReload = {
								order = 121,
								name = "Reload UI to set options",
								type = "execute",
								func = function() ReloadUI() end,
							},
				},
			},
			reinstall = {
				name = "Reinstall",
				type = "group",
				order = 300,
				args = {
					reisntalldesc = {
						order = 31,
						type = "description",
						name = "Reinstall Stuff, this will overwrite any changes made to saved variables." .. "\n",
					},
					reinstall = {
						type = "execute",
						name = "Reinstall Stuff",
						order = 32,
						func = function()
							Stuff.db.global.addonProfileVersion = {}
							Stuff.db.profile.addonProfileVersionPC = {}
							Stuff:EnableModule("SetupUI")
							Stuff:DoSetup()
						end,
					},
				},
			},
			about = {
				order = 900,
				type = "group",
				name = "About",
				cmdHidden = false,
				args = {
					aboutHeader = {
						order = 100,
						type = "header",
						name = "Stuff",
						cmdHidden = true,
					},
					version = {				
						order = 200,
						type = "description",
						fontSize = "medium",
						name = _G.GAME_VERSION_LABEL .. ": " .. Stuff.version .. "\n",
						cmdHidden = true,
					},
					about = {
						order = 300,
						type = "description",
						fontSize = "medium",
						name = ("Author: Aeger - Terokkar\n \nThanks to: Leatrix and Abu for all the code I stole."),
						cmdHidden = true,
					},
				},
			},
			
			scalesmall = {
				type = "execute",
				name = "Set UI scale to 0.64",
				hidden = true,
				order = 99,
				func = function()
					SetScaleSmall()
				end,
			},
			scalenormal = {
				type = "execute",
				name = "Set UI scale to 1",
				hidden = true,
				order = 99,
				func = function()
					SetScaleNormal()
				end,
			},
			install = {
				type = "execute",
				name = "Reinstall Stuff",
				hidden = true,
				order = 60,
				func = function()
					Stuff:EnableModule("SetupUI")
					Stuff:DoSetup()
				end,
			},
		},
	}
	options.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(Stuff.db)
	return options
end


function Stuff:SetupOptions()
	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("Stuff", GetOptions)
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Stuff", "Stuff")
end


