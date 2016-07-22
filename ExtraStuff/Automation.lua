local name, ns = ...
local Stuff = LibStub("AceAddon-3.0"):GetAddon("Stuff")

		----------------------------------------------------------------------
		--	Auto deposit reagents
		----------------------------------------------------------------------

local function autodeposit()
	if (Stuff.db.global.Automation.AutoDepositRegs) then 
		if IsModifierKeyDown() then	
			return
		else
	if not BankFrameItemButton_Update_ORI then -- Copy the function and re-write it
		BankFrameItemButton_Update_ORI = BankFrameItemButton_Update 
		
		BankFrameItemButton_Update = function(button)
				BankFrameItemButton_Update_ORI(button)
		end		
	end

	DepositReagentBank()
		ns:Print("Reagents deposited in the bank.")
	end
	end
	--ns:UnregisterEvent("BANKFRAME_OPENED");
end

ns:RegisterEvent("BANKFRAME_OPENED", autodeposit)

		----------------------------------------------------------------------
		-- Automatically accept resurrection requests
		----------------------------------------------------------------------

local function AutoAcceptRes()
		if (Stuff.db.profile..Automation.AcceptRez) then
			if GetCorpseRecoveryDelay() == 0 then
				if ((UnitAffectingCombat(arg1)) and (Stuff.db.profile.Automation.AcceptRezCombat)) or not (UnitAffectingCombat(arg1)) then
					AcceptResurrect()
					StaticPopup_Hide("RESURRECT_NO_TIMER")
					DoEmote("thank", arg1)
				end
			end
			return
		end
		ns:UnregisterEvent("RESURRECT_REQUEST");
end
		
ns:RegisterEvent("RESURRECT_REQUEST", AutoAcceptRes)

		----------------------------------------------------------------------
		-- Reset echo
		----------------------------------------------------------------------
				
local success = gsub(INSTANCE_RESET_SUCCESS, "%%s", "")
local failed = gsub(INSTANCE_RESET_FAILED, ".*%%s", "")
local fail_offline = gsub(INSTANCE_RESET_FAILED_OFFLINE, ".*%%s", "")
local fail_zone = gsub(INSTANCE_RESET_FAILED_ZONING, ".*%%s", "")

local function Echo(self, event, ...)
	local instance = ...

	if event == "CHAT_MSG_SYSTEM" then
		if UnitIsGroupLeader("player") and (strfind(instance, success) or strfind(instance, failed) or strfind(instance, fail_offline) or strfind(instance, fail_zone)) then
			SendChatMessage("ResetEcho - "..instance, "PARTY")
		end
	end
end

ns:RegisterEvent("CHAT_MSG_SYSTEM", Echo)

		----------------------------------------------------------------------
		-- Toggle nameplates on while in combat
		----------------------------------------------------------------------

local function PlatesOn()
	if (Stuff.db.global.Automation.showNameplatesInCombat) then
		SetCVar("nameplateShowEnemies", 1)
	end
end

local function PlatesOff()
	if (Stuff.db.global.Automation.showNameplatesInCombat) then
		SetCVar("nameplateShowEnemies", 0)
	end
end

ns:RegisterEvent("PLAYER_REGEN_DISABLED", PlatesOn)
ns:RegisterEvent("PLAYER_REGEN_ENABLED", PlatesOff)
