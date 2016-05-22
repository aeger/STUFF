local aegerUI = ...

local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local profileVersion = "1.0"

function aegerUI:InstallnibChatTabs()
	if not IsAddOnLoaded("nibChatTabs") then return end
	
	if aegerUI.db.global.addonProfileVersion.nibChatTabs ~= profileVersion then
	
		_G.aegerUI_nibChatTabs_Install = {
			["Default"] = {
				["normal"] = {
					["colors"] = {
						["class"] = {
							["enabled"] = true,
							["shade"] = 1,
						},
					},
				},
				["font"] = {
					["size"] = 11,
				},
				["highlight"] = {
					["colors"] = {
						["class"] = {
							["enabled"] = true,
						},
						["b"] = 0.8901960784313725,
						["r"] = 0.9372549019607843,
					},
				},
				["alphas"] = {
					["mouseoveralpha"] = {
						["normal"] = 1,
					},
					["nomousealpha"] = {
						["normal"] = 1,
						["selected"] = 1,
					},
					["fadetimes"] = {
						["fadeout"] = {
							["delay"] = 0,
							["speed"] = 0,
						},
						["fadein"] = {
							["delay"] = 0,
							["speed"] = 0,
						},
					},
				},
				["textposition"] = {
					["combatlog"] = {
						["y"] = -1,
						["x"] = 7,
					},
					["normal"] = {
						["y"] = -1,
						["x"] = 7,
					},
				},
			},
		}
		
	for k,v in pairs(_G.aegerUI_nibChatTabs_Install) do
		nibChatTabsDB.profiles[k] = v
		aegerUI.db.global.addonProfileVersion.nibChatTabs = profileVersion
	end
	end
end