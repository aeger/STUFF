local aegerUI = ...

local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local profileVersion = "1.0"
 
 function aegerUI:ZygorsGuideViewer()
	if not IsAddOnLoaded("ZygorGuidesViewer") then return end
	
	if aegerUI.db.profile.addonProfileVersionPC.ZygorGuidesViewer ~= profileVersion then
	
	local CharName = UnitName("player")
	local ServerName = GetRealmName()
	local ProfileName = CharName.." - "..ServerName
	
	_G.aegerUI_ZG_Profile_Defaults = {
			[ProfileName] = {
				["tmp__was_sheened"] = true,
				["mv_enabled"] = false,
				["foglight"] = false,
				["showmapbutton"] = false,
				["fixblizzardautoaccept"] = true,
				["showgreysellbutton"] = false,
				["autoturnin"] = true,
				["minicons"] = true,
				["visible"] = false,
				["ranconfig"] = true,
				["skipauxsteps"] = true,
				["magickey_bind"] = "",
				["autogear"] = false,
				["autoaccept"] = true,
				["contractmobs"] = true,
				["silentmode"] = true,
				["frame_anchor"] = {
				"BOTTOMRIGHT", -- [1]
				{
					["firstTimeLoaded"] = 1,
				}, -- [2]
				"BOTTOMRIGHT", -- [3]
				-441.9992370605469, -- [4]
				33.99997711181641, -- [5]
				},
				
			},
}

	for k,v in pairs(aegerUI_ZG_Profile_Defaults) do
		ZygorGuidesViewerSettings.profiles[k] = v
		aegerUI.db.profile.addonProfileVersionPC.ZygorGuidesViewer = profileVersion
	end
				
	--if ZygorGuidesViewerSettings.profileKeys[ProfileName] == nil then
		--tinsert(ZygorGuidesViewerSettings.profileKeys,ProfileName)
		--ZygorGuidesViewerSettings.profileKeys[ProfileName] = CharName
	--elseif ZygorGuidesViewerSettings.profileKeys[ProfileName] ~= CharName then
		--ZygorGuidesViewerSettings.profileKeys[ProfileName] = CharName
	--end
	end
end