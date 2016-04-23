local name, aStuff = ...
local CharName = UnitName("player")

---------------------------------------------------------------------------
--							Stuff       								 --
---------------------------------------------------------------------------

--  Create globals
	StuffDB = StuffDB or {}
	StuffCDB = StuffCDB or {}
	
	local function RunOnce()
	
		StuffDB = {
      Ralert = true,
      DisableChatFade = true
   };
	
	end
	
	local function StartUp()
   if (StuffDB == nil) then
      RunOnce();
   end
   DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Welcome back|r|cFFFF0000 "..CharName.."|r|cFF00FF00 type |r/aui |cFF00FF00for aegerUI options", 1.0, 1.0, 1.0, nil, true);
	end
	
	aStuff.RegisterEvent("ADDON_LOADED", StartUp)

--	Version
	--LeaPlusLC["AddonVer"] = "6.2.38"

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