local name, ns = ...
local Stuff = LibStub("AceAddon-3.0"):GetAddon("Stuff")

	----------------------------------------------------------------------
	--	Hide error text
	----------------------------------------------------------------------

local errormessage_blocks = {
	'Ability is not ready yet',
	'Another action is in progress',
	'Can\'t attack while mounted',
	'Can\'t do that while moving',
	'Item is not ready yet',
	'Not enough',
	'Nothing to attack',
	'Nothing to dispel',
	'Spell is not ready yet',
	'There is nothing to attack',
	'You can\'t do that yet',
}

local old_uierrosframe_addmessage

local function uierrorsframe_addmessage (frame, text, red, green, blue, id)
	for i,v in ipairs(errormessage_blocks) do
  	if text and text:match(v) then
    	return
  	end
	end
	old_uierrosframe_addmessage(frame, text, red, green, blue, id)
end

local function HideErrors()
	if Stuff.db.global.Automation.HideErrors then
		old_uierrosframe_addmessage = UIErrorsFrame.AddMessage
		UIErrorsFrame.AddMessage = uierrorsframe_addmessage	
	end	
end

ns:RegisterEvent("ADDON_LOADED", HideErrors)
	
	----------------------------------------------------------------------
	-- Block duel requests
	----------------------------------------------------------------------

local function FriendCheck(name)
	ShowFriends()
	for i = 1, GetNumFriends() do
		if (name == GetFriendInfo(i)) then
			return true
		end
	end
	return false;
end

local function RealIDCheck(name)
-- Get name of inviting character (without realm)
	local invname = strsplit("-", name, 2)
	invname = strtrim(invname)

-- Update friends list
	ShowFriends()

-- Traverse friends list for name (does not check realm)
local numfriends = BNGetNumFriends()
	for i = 1, numfriends do
		local presenceID, void, void, void, toonname, void, client, isOnline = BNGetFriendInfo(i)
		if client == "WoW" and isOnline and toonname then
			if invname == toonname then
				return true
			end
		end
	end
	return false
end

local function BlockDuels()
	if Stuff.db.profile.Automation.BlockDuel and not RealIDCheck(arg1) and not FriendCheck(arg1) then
		CancelDuel();
		StaticPopup_Hide("DUEL_REQUESTED");
		return
	end
end

ns:RegisterEvent("DUEL_REQUESTED", BlockDuels)

	----------------------------------------------------------------------
	-- Block pet battle duel requests
	----------------------------------------------------------------------

local function BlockPetDuels()
	if Stuff.db.profile.Automation.BlockPetDuel and not RealIDCheck(arg1) and not FriendCheck(arg1) then
		C_PetBattles.CancelPVPDuel()
		return
	end
	ns:UnregisterEvent("PET_BATTLE_PVP_DUEL_REQUESTED")
end

ns:RegisterEvent("PET_BATTLE_PVP_DUEL_REQUESTED", BlockPetDuels)

	----------------------------------------------------------------------
	-- Hide bodyguard
	----------------------------------------------------------------------

local function BodyGuardHide()
	-- Do nothing if shift is being held
	if IsShiftKeyDown() then return end
	-- Traverse faction IDs for known bodyguards (wowhead.com/factions=1444.1735)
	local id = GetFriendshipReputation();
	if id then
		if id == 1733 -- Delvar Ironfist
		or id == 1736 -- Tormmok
		or id == 1737 -- Talonpriest Ishaal
		or id == 1738 -- Defender Illona
		or id == 1739 -- Vivianne
		or id == 1740 -- Aeda Brightdawn
		or id == 1741 -- Leorajh
		then
			-- Close gossip window if it's for a cooperating (active) bodyguard
			if UnitCanCooperate("target", "player") then
				CloseGossip()
			end
		end
	end
end

ns:RegisterEvent("GOSSIP_SHOW", BodyGuardHide)