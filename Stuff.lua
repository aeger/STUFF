  local _, aStuff = ...
  local CharName = UnitName("player")

---------------------------------------------------------------------------
--							Stuff       								 --
---------------------------------------------------------------------------
		
	local function aStuffGreeting()
		if not StuffDB.Greeting then return end
			DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Welcome back|r|cFFFF0000 "..CharName.."", 1.0, 1.0, 1.0, nil, true);
		end
	
	
	local function aStuffDBLoad()
		StuffDB = {
      DisableChatFade = true,
      Greeting = true,
      Ralert = true,
      Version = 1
    };
  	StuffCDB = {
    	AutoDepositRegs = true,
    	TEST = 1,
    	TEST2 = 2
    };
  end
  
  local function aStuffDBupgrade()
		StuffDB = {
      DisableChatFade = true,
      Greeting = true,
      Ralert = true,
      Version = 1
    };
	end
	
	local function aStuffLoaded()
   if (StuffDB == nil) then
      aStuffDBLoad();
   end
   if StuffDB.Version ~= 2 then
   	aStuffDBupgrade()
   end
   aStuffGreeting()
   aStuff:UnregisterEvent("PLAYER_LOGIN")
  end
  	
	aStuff.RegisterEvent("PLAYER_LOGIN", aStuffLoaded)

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