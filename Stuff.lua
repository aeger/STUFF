local _, aStuff = ...

---------------------------------------------------------------------------
--							Configuration								 --
---------------------------------------------------------------------------
local Ralert = true
local AutoRepair = true
local SellJunk = true
local GuildRepair = true
local AutoDepositRegs = true
local DisableChatFade = true

---------------------------------------------------------------------------
--							Stuff       								 --
---------------------------------------------------------------------------

local function RareAlert()
-- Based completely off Rare Alert by Haleth/Freethinker
	if not Ralert then return end

	local blacklist = {
	[971] = true, -- Alliance garrison
	[976] = true, -- Horde garrison
	}
	
	if blacklist[GetCurrentMapAreaID()] then return end

	PlaySoundFile("Sound\\Interface\\RaidWarning.ogg")
	RaidNotice_AddMessage(RaidWarningFrame, "OMFG Rare Get It!", ChatTypeInfo["RAID_WARNING"])
end

local function MerchantOperations(event, ...)
	local AutoRepair = AutoRepair
	local SellGreyCrap = SellJunk
	local AutoGuildRepair = GuildRepair
	if IsModifierKeyDown() then	
		return
	else
		local cost = GetRepairAllCost()
		if(AutoRepair == true and CanMerchantRepair() and cost > 0) then
			if AutoGuildRepair and CanGuildBankRepair() and cost <= GetGuildBankMoney() and (cost <= GetGuildBankWithdrawMoney() or GetGuildBankWithdrawMoney() == -1) then
				RepairAllItems(1)
				aStuff.Print("Repair cost using guild funds: ".. GetCoinTextureString(cost))
			elseif cost <= GetMoney() then
				RepairAllItems()
				aStuff.Print("Repair cost: ".. GetCoinTextureString(cost))
			else
				aStuff.Print("Not enough money to repair")
			end
		end
	end
			
	if(SellGreyCrap == true) then
		local profit = 0
		local bag, slot 
		for bag = 0, 4 do
			for slot = 0, GetContainerNumSlots(bag) do
				local link = GetContainerItemLink(bag, slot)
				local bText, iCount, bLocked, bQuality, bRead = GetContainerItemInfo(bag, slot)

				if link and (select (3, GetItemInfo(link))==0) then
					local iName, iLink, iRarity, iLvl, iMinLvl, iType, iSType, iStack, iEqLoc, iText, iPrice = GetItemInfo(link)
					UseContainerItem(bag, slot)
					profit = profit + ( iCount * iPrice )
				end
			end
		end
		if profit > 0 then
			aStuff.Print("Sold greys for: "..GetCoinTextureString(profit))
		end
	end
end

local function autodeposit()
	if AutoDepositRegs then 
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
		aStuff.Print("Reagents deposited in the bank.")
	end
	end
end

local function ChatFade()
	BazookaBar_1:Hide()
		if DisableChatFade then
			for i = 1, NUM_CHAT_WINDOWS do
				_G[("ChatFrame" .. i)]:SetFading(false)
			end
			-- Process temporary frames
			hooksecurefunc("FCF_OpenTemporaryWindow", function()
				local cf = FCF_GetCurrentChatFrame():GetName() or nil
				if cf then
					_G[cf]:SetFading(false)
				end
			end)
		end	
	end

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
		
		
aStuff.RegisterEvent("VIGNETTE_ADDED", RareAlert)
aStuff.RegisterEvent("MERCHANT_SHOW", MerchantOperations)
aStuff.RegisterEvent("BANKFRAME_OPENED", autodeposit)
aStuff.RegisterEvent("PLAYER_LOGIN", ChatFade)
aStuff.RegisterEvent("GOSSIP_SHOW", BodyGuardHide)

--  Reload  -------------------------------------------------------------------
SLASH_RELOADUI1 = "/rl"
SlashCmdList.RELOADUI = ReloadUI

--Stacked
_G.SLASH_FSTACK1 = '/fs'
SlashCmdList.FSTACK = function(msg) SlashCmdList.FRAMESTACK(msg) end

-- gm 
_G.SLASH_HELP1 = '/gm'
_G.SLASH_HELP2 = '/ticket'
SlashCmdList.HELP = ToggleHelpFrame