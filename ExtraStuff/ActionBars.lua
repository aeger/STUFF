	local name, ns = ...
	local classcolor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[(select(2, UnitClass("player")))] 
	  
	MainMenuBarLeftEndCap:SetTexture("Interface\\Addons\\Stuff\\Textures\\Actionbar\\actionbarleft"); 
	MainMenuBarLeftEndCap:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
	MainMenuBarRightEndCap:SetTexture("Interface\\Addons\\Stuff\\Textures\\Actionbar\\actionbarleft");
	MainMenuBarRightEndCap:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
			
	local function CombatColorOn()
		MainMenuBarLeftEndCap:SetVertexColor(1, 0, 0)
		MainMenuBarRightEndCap:SetVertexColor(1, 0, 0)
	end

  local function CombatColorOff()
		 MainMenuBarLeftEndCap:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		 MainMenuBarRightEndCap:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
  end
    
  ns:RegisterEvent("PLAYER_REGEN_ENABLED", CombatColorOff)
	ns:RegisterEvent("PLAYER_REGEN_DISABLED", CombatColorOn)