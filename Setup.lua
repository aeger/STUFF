	local name, ns = ...
	local version = 2 --If version update need to update version in ApplySetup() too
	local MEDIA_PATH = "Interface\\AddOns\\Stuff\\Textures\\"
  local FONT = "Fonts\\FRIZQT__.ttf"
	local CharName = UnitName("player")
	
	--SavedVariablesPerCharacter
	local function PerCharDB()
		StuffDBPC = {
      AutoDepositRegs = true,
      ShowBazBar = 1,
   };
	end
	
	--SavedVariables
	local function SetupDB()
		StuffDB = {
			AutoRepair = true,
			BuyEssentials = true,
			Chain = 2,
			DisableChatFade = true,
			EnableMailModule = true,
			Greeting = true,
			Ralert = true,
			SellGreyCrap = true,
			TopMenu = true,
			versionnumber = 1,
			addonProfileVersion = {
				Bazooka = 0.5,
			};
		};
	end
	
	--Called in SetupCheck()
	local function Greeting()
		if (StuffDB.Greeting == true) then
			DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Welcome back|r|cFFFF0000 "..CharName.."", 1.0, 1.0, 1.0, nil, true);
		end
	end
	
	--Currently not used	
  local function MoveChatFrame()
  	FCF_SetLocked(ChatFrame1, 1)
		ChatFrame1:ClearAllPoints()
    ChatFrame1:SetHeight(160)	
    ChatFrame1:SetWidth(380)
    ChatFrame1:SetPoint('BOTTOMLEFT',UIParent,'BOTTOMLEFT',30,37)
    ChatFrame1:SetUserPlaced(true);
		FCF_SavePositionAndDimensions(ChatFrame1)
  end
	
	--Global function to inject Bazooka SavedVariables see STUFF\Install\addons\Bazooka.lua
	local function InstallAddonOptions()
			StuffInstallBazooka()
	end
	
	--Currently not used
	local function SetScaleSmallOnInstall()
		local index = GetCurrentResolution();
		local resolution = select(index, GetScreenResolutions());
			if resolution ~= "1920x1080" then
				UIParent:SetScale(0.64);
				SetCVar("uiscale", "0.64");
				SetCVar("useUiScale", 1)
			end
	end
	
	--Currently not used
	local function SetScaleSmall()
		UIParent:SetScale(0.64);
		SetCVar("uiscale", "0.64");
		SetCVar("useUiScale", 1);
	end
	
	--Currently not used
	local function SetScaleNormal()
		UIParent:SetScale(1.0);
		SetCVar("uiscale", "1.0");
		SetCVar("useUiScale", 0);
	end
	
	--Currently not used			
	local function SetCVARSINSTALL()
		SetCVar("enableCombatText", 0)
		SetCVar("CombatDamage", 0)
		SetCVar("CombatHealing", 0)
		SetCVar("deselectOnClick", 1)
	end
	
	--Called by Install button in InitSetupFrame	
	local function ApplySetup()
    --SetScaleSmallOnInstall()
		InstallAddonOptions()
		StuffDB.SetUpDone = true
		StuffDB.versionnumber = 2
			--SetCVARSINSTALL()
			print('Setup complete. Please reload UI to finish via "/rl".')
    end
  
  --Frame display for initial install
  local function InitSetupFrame()
   SetupFrame = CreateFrame('Frame', nil, UIParent)
   SetupFrame:SetPoint("CENTER", UIParent, "CENTER")
   SetupFrame:SetSize(453, 194)
   SetupFrame:SetFrameStrata("TOOLTIP")
   SetupFrame:SetFrameLevel("18")
     
   local Backdrop = SetupFrame:CreateTexture(nil, "BACKGROUND")             --Backdrop is not working
   	Backdrop:SetAllPoints(UIParent)
   	Backdrop:SetTexture(0, 0, 0, 0.9)
    SetupFrame.Backdrop = Backdrop
     
   local StuffLogo = SetupFrame:CreateTexture(nil, "BORDER")
   	StuffLogo:SetPoint("CENTER", SetupFrame, "CENTER")
    StuffLogo:SetSize(453, 194)
    StuffLogo:SetTexture(MEDIA_PATH .. "Setup\\aegerUIlogo")

	local ReloadButton = CreateFrame("Button", nil, SetupFrame)
		ReloadButton:SetPoint("TOP", SetupFrame, "BOTTOM")
    ReloadButton:SetPoint("LEFT", SetupFrame, "LEFT")
    ReloadButton:SetSize(153, 56)
    ReloadButton:SetNormalTexture(MEDIA_PATH .. "Setup\\reloadbtn")
		ReloadButton:SetScript("OnEnter", BigButton_OnEnter)
    ReloadButton:SetScript("OnLeave", Button_OnLeave)
    ReloadButton:SetScript("OnClick", function(self)
    	ReloadUI()
    end)
    SetupFrame.ReloadButton = ReloadButton
		ReloadButton:Hide()
     
    local ReloadText = ReloadButton:CreateFontString(nil, "OVERLAY")
    ReloadText:SetPoint("LEFT")
    ReloadText:SetPoint("RIGHT")
    ReloadText:SetFont(FONT, 32, "OUTLINE")
    ReloadText:SetAlpha(0.8)
    ReloadText:SetText("Reload")
    ReloadButton:SetFontString(ReloadText)
     
  --------------------
  -- INSTALL Button  --
  --------------------
           
   local function BigButton_OnEnter(self)
   	self:GetNormalTexture():SetVertexColor(1, 0, 0)
   end
     
   local function Button_OnLeave(self)
   	self:GetNormalTexture():SetVertexColor(1, 1, 1)
   end
     
  local SetupButton = CreateFrame("Button", nil, SetupFrame)
  SetupButton:SetPoint("TOP", SetupFrame, "BOTTOM")
  SetupButton:SetPoint("LEFT", SetupFrame, "LEFT")
  SetupButton:SetSize(153, 56)
  SetupButton:SetNormalTexture(MEDIA_PATH .. "Setup\\setupButton")
  SetupButton:SetScript("OnEnter", BigButton_OnEnter)
  SetupButton:SetScript("OnLeave", Button_OnLeave)
  	SetupButton:SetScript("OnClick", function(self)
    	ApplySetup()
      self:Hide()
			ReloadButton:Show()
    end)
  SetupFrame.SetupButton = SetupButton
     
  local SetupText = SetupButton:CreateFontString(nil, "OVERLAY")
  SetupText:SetPoint("LEFT")
  SetupText:SetPoint("RIGHT")
  SetupText:SetFont(FONT, 32, "OUTLINE")
  SetupText:SetAlpha(0.8)
  SetupText:SetText("Install")
  SetupButton:SetFontString(SetupText)
     
  --------------------
  -- CANCEL Button  --
  --------------------
     
  local CancelButton = CreateFrame("Button", nil, SetupFrame)
  CancelButton:SetPoint("TOP", SetupFrame, "BOTTOM")
  CancelButton:SetPoint("RIGHT", SetupFrame, "RIGHT")
  CancelButton:SetSize(153, 56)
  CancelButton:SetNormalTexture(MEDIA_PATH .. "Setup\\setupButton")
  CancelButton:SetScript("OnEnter", BigButton_OnEnter)
  CancelButton:SetScript("OnLeave", Button_OnLeave)
  CancelButton:SetScript("OnClick", function(this)
  	PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
    SetupFrame:Hide()
  end)
     
  SetupFrame.CancelButton = CancelButton
  local CancelText = CancelButton:CreateFontString(nil, "OVERLAY")
  CancelText:SetPoint("LEFT")
  CancelText:SetPoint("RIGHT")
  CancelText:SetFont(FONT, 32, "OUTLINE")
  CancelText:SetAlpha(0.8)
  CancelText:SetText("Cancel")
  CancelButton:SetFontString(CancelText)
	end
	
	--Opens Install Frame
	local function DoSetup()
		PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
    if not SetupFrame then
  	  InitSetupFrame()
    end
  	SetupFrame:Show()
  end
  
  --Determines if SavedVariables and install needs to be done    
  local function SetupCheck()
  	ns:UnregisterEvent("PLAYER_LOGIN")
  	if (StuffDBPC == nil) then
      PerCharDB();
    end
    if (StuffDB == nil) then
    	SetupDB()
    end
  	if (StuffDB.SetUpDone == nil) or (StuffDB.versionnumber ~= version) then
  	  DoSetup()
    end
		Greeting()
	end
        
  ns:RegisterEvent("PLAYER_LOGIN", SetupCheck)