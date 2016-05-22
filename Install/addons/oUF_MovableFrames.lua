local aegerUI = ...

local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local profileVersion = "1.0"

function aegerUI:InstalloUF_MovableFrames()
	if not IsAddOnLoaded("oUF_MovableFrames") then return end
	
	if aegerUI.db.global.addonProfileVersion.oUF_MovableFrames ~= profileVersion then
	
		_G.aegerUI_oUF_MovableFrames_Install = {
			["__INITIAL"] = {
				["Phanx"] = {
					["oUFPhanxParty"] = "RIGHTUIParent-80-711.000",
					["oUFPhanxBoss1"] = "TOPRIGHTUIParent-15-2491.000",
				},
			},
			["Phanx"] = {
				["oUFPhanxParty"] = "LEFTUIParent6361.000",
				["oUFPhanxBoss1"] = "TOPUIParent-434-61.000",
			},
		}
		
	for k,v in pairs(aegerUI_oUF_MovableFrames_Install) do
		bb08df87101dd7f2161e5b77cf750f753c58ef1b[k] = v
		aegerUI.db.global.addonProfileVersion.oUF_MovableFrames = profileVersion
	end
	end
end