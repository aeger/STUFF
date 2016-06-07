local name, ns = ...
local Stuff = LibStub("AceAddon-3.0"):GetAddon("Stuff")
local classcolor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[(select(2, UnitClass("player")))] 
	  
function Stuff_ActionBars:OnEnable()
	-- Replaces Action bar caps with custom graphic
	MainMenuBarLeftEndCap:SetTexture("Interface\\Addons\\Stuff\\Textures\\Actionbar\\actionbarleft"); 
	MainMenuBarLeftEndCap:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
	MainMenuBarRightEndCap:SetTexture("Interface\\Addons\\Stuff\\Textures\\Actionbar\\actionbarleft");
	MainMenuBarRightEndCap:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
			
	-- Turns end caps red during combat
	local function CombatColorOn()
		MainMenuBarLeftEndCap:SetVertexColor(1, 0, 0)
		MainMenuBarRightEndCap:SetVertexColor(1, 0, 0)
	end
	
	-- Returns end caps to class colors on combat end
  local function CombatColorOff()
		 MainMenuBarLeftEndCap:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		 MainMenuBarRightEndCap:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
  end
    
  ns:RegisterEvent("PLAYER_REGEN_ENABLED", CombatColorOff)
	ns:RegisterEvent("PLAYER_REGEN_DISABLED", CombatColorOn)
	
	-- make the actionbar background repeat itself --
	function TexStuff()
    MainMenuBarTexture2:SetTexture("Interface\\MainMenuBar\\UI-MainMenuBar-Dwarf")
    MainMenuBarTexture2:SetTexCoord(0, 1, 0.58203125, 0.75);
    MainMenuBarTexture2:SetPoint("CENTER", MainMenuBarArtFrame, 124, 0)
    MainMenuBarTexture3:SetTexture("Interface\\MainMenuBar\\UI-MainMenuBar-Dwarf")
    MainMenuBarTexture3:SetTexCoord(0, 1, 0.58203125, 0.75);
    MainMenuBarTexture3:SetPoint("CENTER", MainMenuBarArtFrame, 376, 0)
    MainMenuBarRightEndCap:SetPoint("CENTER", MainMenuBarArtFrame, 536, 0)
    MainMenuBar:SetPoint("CENTER", 4, 0)
	end

	-- position the actionbars nicely on our new 24 button long bar --
	function MovStuff()
    MultiBarBottomRight:ClearAllPoints()
    MultiBarBottomRight:SetPoint("LEFT", "MultiBarBottomLeft", "RIGHT", 4, 0);
    MultiBarLeft:ClearAllPoints()
    MultiBarLeft:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", sin(180) * 100, 98)
    for i = 1, 12 do
        local b = _G["MultiBarRightButton"..i]
        if (i == 1) then
            b:ClearAllPoints()
            b:SetPoint("LEFT", "ActionButton12", "RIGHT", 6, 0)
        else
            b:ClearAllPoints()
            b:SetPoint("LEFT", _G["MultiBarRightButton"..i-1], "RIGHT", 6, 0)
        end
    end
	end

	-- hide/reposition the stuff we don't want --
	function BarStuff()
    MainMenuBarPageNumber:Hide();
    ActionBarDownButton:Hide();
    ActionBarUpButton:Hide();
    MainMenuBarBackpackButton:SetPoint("BOTTOMRIGHT", UIParent, -1, -300)
    CharacterMicroButton:ClearAllPoints()
    CharacterMicroButton:SetPoint("BOTTOMRIGHT", UIParent, 5000, 0)
	end

	-- micro menu vehiclebar fix --
	hooksecurefunc('MoveMicroButtons', function(self)
		if (not MainMenuBar.busy and not UnitHasVehicleUI("player")) then
			CharacterMicroButton:ClearAllPoints()
			CharacterMicroButton:SetPoint("BOTTOMRIGHT", UIParent, 5000, 0)
    	end
	end)

	-- fix the WatchFrame positioning, stolen from tekkubs tekPopBar :o
	--local o = WatchFrame.SetPoint
	--function WatchFrame:SetPoint(a1, frame, a2, x, y)
	--	if frame == "MinimapCluster" then o(self, a1, frame, a2, x+48, y)
	--	elseif frame == "UIParent" then o(self, "BOTTOM", frame, "BOTTOM", 0, y) end
	--end

	TexStuff()
	MovStuff()
	BarStuff()
end