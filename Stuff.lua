  local name, ns = ...
  local CharName = UnitName("player")
  
  _G['StuffGlobal'] = {
	GlobalConfig = ns.GlobalConfig,
	SetupFrameForSliding = ns.SetupFrameForSliding,
	UIFrameFadeIn = ns.UIFrameFadeIn,
	UIFrameFadeOut = ns.UIFrameFadeOut,
	CreateBorder = ns.CreateBorder,
}

---------------------------------------------------------------------------
--							Stuff       								 --
---------------------------------------------------------------------------
		
	local function StuffGreeting()
		if not StuffDB["Greeting"] then return end
			DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Welcome back|r|cFFFF0000 "..CharName.."", 1.0, 1.0, 1.0, nil, true);
		end
		
	
	--local function StuffLoaded()
   --ns:UnregisterEvent("PLAYER_LOGIN")
   --StuffGreeting()
  --end
  	
	--ns.RegisterEvent("PLAYER_LOGIN", StuffLoaded)

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