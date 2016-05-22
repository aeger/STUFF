local aegerUI = ...

local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local profileVersion = "1.0"

function aegerUI:InstallQuestUnTracker()
	if not IsAddOnLoaded("QuestUnTracker") then return end
	
	if aegerUI.db.global.addonProfileVersion.QuestUnTracker ~= profileVersion then
	
		_G.aegerUI_QuestUnTracker_Install = {
			["normals"] = true,
			["dailies"] = true,
		}
		
for k,v in pairs(aegerUI_QuestUnTracker_Install) do
		QuestUnTrackerDB.global[k] = v
		aegerUI.db.global.addonProfileVersion.QuestUnTracker = profileVersion
	end
	end
end