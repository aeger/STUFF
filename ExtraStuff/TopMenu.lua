	local name, ns = ...
	
	local MEDIA_PATH = "Interface\\AddOns\\Stuff\\Textures\\"
	local classcolor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[(select(2, UnitClass("player")))] 
	
	
--  Top Menu frame  --------------------------------------------------------------

	
	

	local function flip(texture, horizontal)
	  local ULx, ULy, LLx, LLy, URx, URy, LRx, LRy = texture:GetTexCoord()
	    if horizontal then
		  texture:SetTexCoord(URx, URy, LRx, LRy, ULx, ULy, LLx, LLy)
	    else
		  texture:SetTexCoord(LLx, LLy, ULx, ULy, LRx, LRy, URx, URy)
	   end
	end
	
	

	local function ShowBazookaBar1()
    Bazooka.db:SetProfile("BazBar1")
	  if (StuffDB.SetUpDone) then
	  	BazookaBar_3:Show()
	  	BazookaBar_1:Hide()
		end
	end
	
	local function ShowBazookaBar2()
    Bazooka.db:SetProfile("BazBar2")
	  BazookaBar_3:Show()
	  BazookaBar_1:Hide()
	end
	
	local function ShowBazookaBar3()
    Bazooka.db:SetProfile("BazBar3")
	  BazookaBar_3:Show()
	  BazookaBar_1:Hide()
	end
	
	local function ShowBazookaBar4()
    Bazooka.db:SetProfile("BazBar4")
	  BazookaBar_3:Show()
	  BazookaBar_1:Hide()
	end
		 
	local function HideBazookaBars()
    BazookaBar_3:Hide()
	  BazookaBar_1:Hide()
	end

	local function TMCombatColorOn()
	  TMMenuFrame.TMMenuBorder:SetVertexColor(1, 0, 0)
	end

	local function TMCombatColorOff()
	   TMMenuFrame.TMMenuBorder:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
	end
	
	local function InitTMMenuFrame()
  	TMMenuFrame = CreateFrame('Frame', nil, UIParent)
		TMMenuFrame:SetPoint("TOP", UIParent, "TOP", 0, 10)
		TMMenuFrame:SetPoint("CENTER", UIParent, "CENTER")
		TMMenuFrame:SetSize(502, 46)
		 
		local TMMenuTexture = TMMenuFrame:CreateTexture(nil, "BACKGROUND")
			TMMenuTexture:SetPoint("TOP", UIParent, "TOP", 0, 10)
		  TMMenuTexture:SetPoint("CENTER", UIParent, "CENTER")
		  TMMenuTexture:SetSize(500, 36)
		  TMMenuTexture:SetTexture(MEDIA_PATH .. "TopMenu\\topmenu")
		  TMMenuTexture:SetVertexColor(0, 0, 0, .5)
		  TMMenuFrame.TMMenuTexture = TMMenuTexture
		  flip(TMMenuTexture, false)
		 
		local TMMenuBorder = TMMenuFrame:CreateTexture(nil, "BORDER")
			TMMenuBorder:SetPoint("TOP", UIParent, "TOP", 0, 17)
		 	TMMenuBorder:SetPoint("CENTER", UIParent, "CENTER")
		 	TMMenuBorder:SetSize(502, 46)
		 	TMMenuBorder:SetTexture(MEDIA_PATH .. "TopMenu\\topmenuborder")
		 	TMMenuBorder:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		 	TMMenuFrame.TMMenuBorder = TMMenuBorder
		 	flip(TMMenuBorder, false)
	
		 local TMMenuPageR = CreateFrame("Button", nil, TMMenuFrame)
		 	TMMenuPageR:SetPoint("TOP", UIParent, "TOP", 2, -1)
	    TMMenuPageR:SetPoint("LEFT", TMMenuTexture, "RIGHT")
		 	TMMenuPageR:SetSize(22, 22)
		 	TMMenuPageR:SetNormalTexture(MEDIA_PATH .. "TopMenu\\arrow")
		 	TMMenuPageR:GetNormalTexture():SetVertexColor(0, 0, 0, 0)
		 	TMMenuPageR:RegisterForClicks('AnyUp')
		 	TMMenuPageR:SetScript("OnEnter", function(self)
				if InCombatLockdown() then return end
					TMMenuPageR:GetNormalTexture():SetVertexColor(0, 1, 0, 1)
				end)
			TMMenuPageR:SetScript("OnLeave", function(self)
				if InCombatLockdown() then return end
					TMMenuPageR:GetNormalTexture():SetVertexColor(0, 0, 0, 0)
			end)
			TMMenuPageR:SetScript("OnClick", function(self, button)
				if button == "LeftButton" then
				if InCombatLockdown() then
					print("Cannot toggle TopMenu during combat.")
					return
				end
			if (StuffDBPC.ShowBazBar == 1) then
				ShowBazookaBar2()
				StuffDBPC.ShowBazBar = 2
				PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
			elseif
				(StuffDBPC.ShowBazBar == 2) then
				ShowBazookaBar3()
				StuffDBPC.ShowBazBar = 3
				PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
			elseif
				(StuffDBPC.ShowBazBar == 3) then
				ShowBazookaBar4()
				StuffDBPC.ShowBazBar = 4
				PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
			elseif
				(StuffDBPC.ShowBazBar == 4) then
				ShowBazookaBar1()
				StuffDBPC.ShowBazBar = 1
				PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
				end
			end
		end)		  
		TMMenuFrame.TMMenuPageR = TMMenuPageR
		
		 local TMMenuPageL = CreateFrame("Button", nil, TMMenuFrame)
		 	TMMenuPageL:SetPoint("TOP", UIParent, "TOP", -2, -1)
	    TMMenuPageL:SetPoint("RIGHT", TMMenuTexture, "LEFT")
		 	TMMenuPageL:SetSize(22, 22)
		 	TMMenuPageL:SetNormalTexture(MEDIA_PATH .. "TopMenu\\arrowf")
		 	TMMenuPageL:GetNormalTexture():SetVertexColor(0, 0, 0, 0)
		 	TMMenuPageL:RegisterForClicks('AnyUp')
		 	TMMenuPageL:SetScript("OnEnter", function(self)
				if InCombatLockdown() then return end
					TMMenuPageL:GetNormalTexture():SetVertexColor(0, 1, 0, 1)
				end)
			TMMenuPageL:SetScript("OnLeave", function(self)
				if InCombatLockdown() then return end
					TMMenuPageL:GetNormalTexture():SetVertexColor(0, 0, 0, 0)
			end)
			TMMenuPageL:SetScript("OnClick", function(self, button)
				if button == "LeftButton" then
				if InCombatLockdown() then
					print("Cannot toggle TopMenu during combat.")
					return
				end
				if (StuffDBPC.ShowBazBar == 1) then
					ShowBazookaBar4()
					StuffDBPC.ShowBazBar = 4
					PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
				elseif
					(StuffDBPC.ShowBazBar == 4) then
					ShowBazookaBar3()
					StuffDBPC.ShowBazBar = 3
					PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
				elseif
					(StuffDBPC.ShowBazBar == 3) then
					ShowBazookaBar2()
					StuffDBPC.ShowBazBar = 2
					PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
				elseif
					(StuffDBPC.ShowBazBar == 2) then
					ShowBazookaBar1()
					StuffDBPC.ShowBazBar = 1
					PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
					end
				end
			end)		  
		TMMenuFrame.TMMenuPageL = TMMenuPageL
	end
	
	local function TMMenuDisplay()
      if not TMMenuFrame then
	    InitTMMenuFrame()
	  end
	  TMMenuFrame:Show()
	end

	local function TMMenuHide()
      if not TMMenuFrame then
	    InitTMMenuFrame()
	  end
	  TMMenuFrame:Hide()
	end
	
	local function TopMenuLoad()
  	if StuffDB.TopMenu then
		 if (StuffDBPC.ShowBazBar == 1) then
			TMMenuDisplay()
			ShowBazookaBar1()
		elseif
		  (StuffDBPC.ShowBazBar == 2) then
			TMMenuDisplay()
			ShowBazookaBar2()
		elseif
		 (StuffDBPC.ShowBazBar == 3) then
			TMMenuDisplay()
			ShowBazookaBar3()
		elseif
		 (StuffDBPC.ShowBazBar == 4) then
			TMMenuDisplay()
			ShowBazookaBar4()
		end
		else
			TMMenuHide()
			HideBazookaBars()
		end
	end	
	
	ns:RegisterEvent("PLAYER_LOGIN", TopMenuLoad)
	ns:RegisterEvent("PLAYER_REGEN_ENABLED", TMCombatColorOff)
	ns:RegisterEvent("PLAYER_REGEN_DISABLED", TMCombatColorOn)
	ns:RegisterEvent("PET_BATTLE_OPENING_START", TMMenuHide)
	ns:RegisterEvent("PET_BATTLE_CLOSE", TMMenuDisplay)