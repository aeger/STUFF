local name, ns = ...
local Stuff = LibStub("AceAddon-3.0"):GetAddon("Stuff")
local microMenu = CreateFrame("Frame", "RightClickMenu", UIParent, "UIDropDownMenuTemplate");
local MinimapButton = CreateFrame("Frame","StuffMinimapButton", Minimap)
	
function Stuff_Minimap:OnEnable()
	MiniMapWorldMapButton:Hide()
  MiniMapVoiceChatFrame:Hide()
  MinimapZoomIn:Hide()
  MinimapZoomOut:Hide()
  MiniMapTracking:Hide()
   
  local newScale = 1.2
         
  MinimapCluster:SetScale(newScale);
  local tmpScale = Minimap:GetScale();
  Minimap:SetScale(tmpScale + 0.1);
  Minimap:SetScale(tmpScale)
     
  -- Mousewheel Scrolling.
  Minimap:EnableMouseWheel(true)
  Minimap:SetScript("OnMouseWheel", function(self, direction)
  	if direction > 0 then
   	_G.MinimapZoomIn:Click()
   elseif direction < 0 then
   	_G.MinimapZoomOut:Click()
   end
  end)

  --Click-handling for tracking dropdown
  Minimap:SetScript("OnMouseUp", function(self, button)
  	if (button == "RightButton") then
   	ToggleDropDownMenu(1,nil,MiniMapTrackingDropDown,"cursor")
   elseif (button == "LeftButton") then
   	Minimap_OnClick(self)
   end
  end)
      
	local microMenuList = {
		{text = "|cffFFFFFF".."Character", func = function() ToggleCharacter( "PaperDollFrame" ) end, notCheckable = true, fontObject = menuFont, icon = 'Interface\\PaperDollInfoFrame\\UI-EquipmentManager-Toggle' },
		{text = "|cffFFFFFF".."Spellbook", func = function() ToggleFrame(SpellBookFrame) end, notCheckable = true, fontObject = menuFont, icon = 'Interface\\MINIMAP\\TRACKING\\Class' },
		{text = "|cffFFFFFF".."Talents", func = function() ToggleTalentFrame() end, notCheckable = true, fontObject = menuFont, icon = 'Interface\\MINIMAP\\TRACKING\\Profession' },
		{text = "|cffFFFFFF".."Achievements", func = function() ToggleAchievementFrame() end, notCheckable = true, fontObject = menuFont, icon = 'Interface\\MINIMAP\\Minimap_shield_elite', },
	  {text = "|cffFFFFFF".."Quest Log", func = function() ToggleFrame( WorldMapFrame )end, notCheckable = true, fontObject = menuFont, icon = 'Interface\\GossipFrame\\ActiveQuestIcon' },
	  {text = "|cffFFFFFF".."Guild", func = function() ToggleGuildFrame( 1 ) end, notCheckable = true, fontObject = menuFont, icon = 'Interface\\GossipFrame\\TabardGossipIcon' },
	  {text = "|cffFFFFFF".."Group Finder", func = function() PVEFrame_ToggleFrame() end, notCheckable = true, fontObject = menuFont, icon = 'Interface\\LFGFRAME\\BattlenetWorking0' },
	  {text = "|cffFFFFFF".."Collections", func = function() ToggleCollectionsJournal() end, notCheckable = true, fontObject = menuFont, icon = 'Interface\\MINIMAP\\TRACKING\\StableMaster' },
	  {text = "|cffFFFFFF".."Adventure Guide", func = function() ToggleEncounterJournal() end, notCheckable = true, fontObject = menuFont, icon = 'Interface\\MINIMAP\\TRACKING\\BattleMaster' },
	  {text = "|cffFFFFFF".."Friends", func = function() ToggleFriendsFrame() end, notCheckable = true, fontObject = menuFont, icon = 'Interface\\FriendsFrame\\PlusManz-BattleNet' },
	  {text = "|cffFFFFFF".."HELP", func = function() ToggleHelpFrame() end, notCheckable = true, fontObject = menuFont, icon = 'Interface\\CHATFRAME\\UI-ChatIcon-Blizz' },
	  {text = "|cffFFFF00".."Log Out", func = function() Logout() end, notCheckable = true, fontObject = menuFont },
	  {text = "|cffFE2E2E".."Force Exit", func = function() ForceQuit() end, notCheckable = true, fontObject = menuFont },
	}
		
	MinimapButton:SetHeight(32)
	MinimapButton:SetWidth(32)
	MinimapButton:SetMovable(1)
	MinimapButton:SetUserPlaced(1)
	MinimapButton:EnableMouse(1)
	MinimapButton:RegisterForDrag('LeftButton')
	MinimapButton:SetFrameStrata('MEDIUM')
	MinimapButton:SetPoint('TOPRIGHT', -131, -22);
	MinimapButton:CreateTexture('MinimapButtonTexture', 'BACKGROUND')
	MinimapButton:SetClampedToScreen(true)
	
	MinimapButtonTexture:SetTexture('Interface\\AddOns\\Stuff\\Textures\\Minimap\\minimap.blp')
	MinimapButtonTexture:SetWidth(32)
	MinimapButtonTexture:SetHeight(32)
	MinimapButtonTexture:SetPoint('CENTER')
	
	MinimapButton:SetScript('OnMouseUp', function(self, button)
		if button == 'LeftButton' then
			EasyMenu(microMenuList, microMenu, "cursor", 0, 0, "MENU", 3);
		elseif button == 'RightButton' then
			if InCombatLockdown() then
			print("Cannot toggle TopMenu during combat.")
			return
		end
		if TMMenuFrame:IsVisible() then
    	TMMenuHide()
      HideBazookaBars()
      Stuff.db.profile.TopMenu = false
      PlaySoundFile("Interface\\AddOns\\Stuff\\Textures\\sound\\click.mp3")
      else
      TMMenuDisplay()
      if Stuff.db.profile.ShowBazBar == 1 then
				ShowBazookaBar1()
			elseif
				Stuff.db.profile.ShowBazBar == 2 then
					ShowBazookaBar2()
			elseif
				Stuff.db.profile.ShowBazBar == 3 then
					ShowBazookaBar3()
			elseif
				Stuff.db.profile.ShowBazBar == 4 then
					ShowBazookaBar4()
			end
      Stuff.db.profile.TopMenu = true
      PlaySoundFile("Interface\\AddOns\\Stuff\\Textures\\sound\\click.mp3")
    end
   end
  end)
	
	MinimapButton:SetScript('OnDragStart', function(self, button)
		if IsShiftKeyDown() then
			MinimapButton:SetScript('OnUpdate', function(self, elapsed)
				local x, y = Minimap:GetCenter()
				local cx, cy = GetCursorPosition()
				x, y = cx / self:GetEffectiveScale() - x, cy / self:GetEffectiveScale() - y
				if x > Minimap:GetWidth()/2+MinimapButton:GetWidth()/2 then x = Minimap:GetWidth()/2+MinimapButton:GetWidth()/2 end
				if x < Minimap:GetWidth()/2*-1-MinimapButton:GetWidth()/2 then x = Minimap:GetWidth()/2*-1-MinimapButton:GetWidth()/2 end
				if y > Minimap:GetHeight()/2+MinimapButton:GetHeight()/2 then y = Minimap:GetHeight()/2+MinimapButton:GetHeight()/2 end
				if y < Minimap:GetHeight()/2*-1-MinimapButton:GetHeight()/2 then y = Minimap:GetHeight()/2*-1-MinimapButton:GetHeight()/2 end
				MinimapButton:ClearAllPoints()
				MinimapButton:SetPoint('CENTER', x, y)
			end)
		end
	end)

	MinimapButton:SetScript('OnDragStop', function(self, button)
		MinimapButton:SetScript('OnUpdate', nil)
	end)

	MinimapButton:SetScript('OnEnter', function(self)
		GameTooltip:SetOwner(self, "ANCHOR_LEFT")
		GameTooltip:AddLine("Micro Menu")
		GameTooltip:AddLine("Left Click opens the Micro Menu")
		GameTooltip:AddLine("Right Click Toggles the TopMenu")
		GameTooltip:Show()
	end)

	MinimapButton:SetScript('OnLeave', function(self)
		GameTooltip:Hide()
	end)	
end