  local name, ns = ...
  local CharName = UnitName("player")

---------------------------------------------------------------------------
--							Stuff       								 --
---------------------------------------------------------------------------
	local function Greeting()
		if (not ns.Config.Greeting) then return end
			DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Welcome back|r|cFFFF0000 "..CharName.."", 1.0, 1.0, 1.0, nil, true);
	end
		
	
	local function StuffLoaded()
  	ns:UnregisterEvent("PLAYER_LOGIN")
   	Greeting()
  end
  	
	ns:RegisterEvent("PLAYER_LOGIN", StuffLoaded)

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