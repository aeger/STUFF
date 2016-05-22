  local name, ns = ...
    
---------------------------------------------------------------------------
--							Stuff       								 --
---------------------------------------------------------------------------

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