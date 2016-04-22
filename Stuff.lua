local name, aStuff = ...

---------------------------------------------------------------------------
--							Stuff       								 --
---------------------------------------------------------------------------

--  Create globals
	StuffDB = StuffDB or {}
	StuffCDB = StuffCDB or {}
	
	local function Load()
	
		if StuffDB.Ralert ~= true or false then
			StuffDB.Ralert == true
		end
		
	
	end

--	Version
	LeaPlusLC["AddonVer"] = "6.2.38"

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