local aegerUI = ...

local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local profileVersion = "1.0"

function aegerUI:InstallMasque()
	if not IsAddOnLoaded("Masque") then return end
	
	if aegerUI.db.global.addonProfileVersion.Masque ~= profileVersion then
	
	local Masqueprofile = "Default"
		
	_G.aegerUI_Masque_Install = {
		[Masqueprofile] = {
				["Groups"] = {
				["RazerGamingKeypad"] = {
					["Inherit"] = false,
					["SkinID"] = "Caith",
				},
				["Farmhand"] = {
					["Inherit"] = false,
					["SkinID"] = "Caith",
				},
				["Bartender4_StanceBar"] = {
					["SkinID"] = "Caith",
				},
				["Bartender4_Vehicle"] = {
					["SkinID"] = "Caith",
				},
				["Farmhand_Seeds"] = {
					["Inherit"] = false,
					["SkinID"] = "Caith",
				},
				["Bartender4_1"] = {
					["SkinID"] = "Caith",
				},
				["PhanxBuffs"] = {
					["Inherit"] = false,
					["SkinID"] = "Caith",
				},
				["Farmhand_Portals"] = {
					["Inherit"] = false,
					["SkinID"] = "Caith",
				},
				["Bartender4_2"] = {
					["Inherit"] = false,
					["SkinID"] = "Caith",
				},
				["Bartender4_BagBar"] = {
					["SkinID"] = "Shining",
					["Inherit"] = false,
				},
				["Bartender4_4"] = {
					["SkinID"] = "Caith",
				},
				["Masque"] = {
					["SkinID"] = "Caith",
				},
				["RazerGamingKeypad_Main Pad"] = {
					["Inherit"] = false,
					["SkinID"] = "Caith",
				},
				["Bartender4_10"] = {
					["Inherit"] = false,
					["SkinID"] = "Caith",
				},
				["Bartender4_9"] = {
					["Inherit"] = false,
					["SkinID"] = "Caith",
				},
				["Farmhand_Tools"] = {
					["Inherit"] = false,
					["SkinID"] = "Caith",
				},
				["Bartender4"] = {
					["SkinID"] = "Caith",
				},
				["Bartender4_6"] = {
					["SkinID"] = "Caith",
				},
				["RazerGamingKeypad_D Pad"] = {
					["Inherit"] = false,
					["SkinID"] = "Caith",
				},
				["Bartender4_MicroMenu"] = {
					["SkinID"] = "Shining",
					["Inherit"] = false,
				},
				["Bartender4_3"] = {
					["SkinID"] = "Caith",
				},
				["Bartender4_5"] = {
					["SkinID"] = "Caith",
				},
				["Bartender4_PetBar"] = {
					["SkinID"] = "Caith",
				},
				["Breakables"] = {
					["Inherit"] = false,
					["SkinID"] = "Caith",
				},
				["TotemTimers"] = {
					["Inherit"] = false,
					["SkinID"] = "Caith",
				},
			},
		},
}	
	
	for k,v in pairs(aegerUI_Masque_Install) do
		MasqueDB.profiles[k] = v
		aegerUI.db.global.addonProfileVersion.Masque = profileVersion
	end
	end
end