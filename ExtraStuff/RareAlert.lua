local name, ns = ...

-- Based completely off Rare Alert by Haleth/Freethinker

local function RareAlert()
	if (not Stuff.db.global.Ralert) then return; end

	local blacklist = {
		[971] = true, -- Alliance garrison
		[976] = true, -- Horde garrison
	}
	
	if blacklist[GetCurrentMapAreaID()] then return end

	PlaySoundFile("Sound\\Interface\\RaidWarning.ogg")
	RaidNotice_AddMessage(RaidWarningFrame, "OMFG Rare Get It!", ChatTypeInfo["RAID_WARNING"])
end

ns:RegisterEvent("VIGNETTE_ADDED", RareAlert)