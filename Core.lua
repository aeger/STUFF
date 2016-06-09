local name, ns = ...
Stuff = LibStub("AceAddon-3.0"):NewAddon("Stuff", "AceConsole-3.0")
local versionNumber  = "1.0";
local Stuff_Beta = false;
local CharName = UnitName("player")
Stuff:SetDefaultModuleState(false)

-- Bindings
BINDING_HEADER_Stuff = "Stuff"
BINDING_NAME_ToggleTopMenu = "Toggle TopMenu Frame"

-- Modules
Stuff_ActionBars = Stuff:NewModule("ActionBars");
Stuff_MailMod = Stuff:NewModule("MailMod");
Stuff_Minimap = Stuff:NewModule("Minimap");
Stuff_SetupUI = Stuff:NewModule("SetupUI");

--Broker Plugins
Stuff_AutoLoot = Stuff:NewModule("AutoLoot");
Stuff_BDurability = Stuff:NewModule("BDurability");
Stuff_StuffLDB = Stuff:NewModule("StuffLDB");
Stuff_TinyDPS = Stuff:NewModule("TinyDPS");
Stuff_Zygors = Stuff:NewModule("Zygors");

-- DB default values
local defaults = {
	global = {
 		ActionBars = true,
 		AutoLootSolo = true,
 		AutoLootGroup = false,
 		AutoLootRaid = false,
 		ClassColorChat = true,
 		DisableChatFade = true,
 		Greeting = true,
 		MailMod = true,
 		Minimap = true,
 		NoChatButtons = true,
 		Ralert = true,
 		addonProfileVersion = {},
 		Automation = {
 			AutoDepositRegs = true,
			AutoRepair = true,
			AutoSell = true,
			BuyEssentials = true,
			HideErrors = true,
			ShowErrorsFlag = 1,
			ShowQuestUpdates = true,
		},
 		BrokerPlugins = {
			AutoLoot = true,
			BDurability = true,
			StuffLDB = true,
			TinyDPS = true,
			Zygors = true,
 		},
 	},
	profile = {
  	Chain = 0,
  	SetUpDone = false,
  	TopMenu = true,
  	ShowBazBar = 1,
  	addonProfileVersionPC = {},
  	Automation = {
			BlockDuel = false,
			BlockPetDuel = false,
			AcceptRez = false,
			AcceptRezCombat = false,
			AcceptSummon = false,
  	},
	},
}

-- Handle Chat commands	
function Stuff:ChatCommands(input)
	if InCombatLockdown() then
		self:Print("Cannot access options during combat.")
	return end
	if not input or input:trim() == "" then
		LibStub("AceConfigDialog-3.0"):Open("Stuff")
	else
 		LibStub("AceConfigCmd-3.0").HandleCommand(Stuff, "stuff", "Stuff", input)
	end
end

function Stuff:OnInitialize() 
	self.db = LibStub("AceDB-3.0"):New("StuffDB", defaults)
	local version = _G.GetAddOnMetadata("Stuff", "Version")
	self.version = version
	self:SetupOptions()
	Stuff:RegisterChatCommand( "stuff", "ChatCommands")
	Stuff:RegisterChatCommand( "Stuff", "ChatCommands")
end

local function BrokerPluginCheck()
	if Stuff.db.global.BrokerPlugins.AutoLoot then
		Stuff:EnableModule("AutoLoot")
	end
	if Stuff.db.global.BrokerPlugins.BDurability then
		Stuff:EnableModule("BDurability")
	end
	if Stuff.db.global.BrokerPlugins.TinyDPS then
		Stuff:EnableModule("TinyDPS")
	end
	if Stuff.db.global.BrokerPlugins.StuffLDB then
		Stuff:EnableModule("StuffLDB")
	end
	if Stuff.db.global.BrokerPlugins.Zygors then
		Stuff:EnableModule("Zygors")
	end
end

local function ModuleChecks()
	if Stuff.db.global.ActionBars then
		Stuff:EnableModule("ActionBars")
	end
	if Stuff.db.global.MailMod then
		Stuff:EnableModule("MailMod")
	end
	if Stuff.db.global.Minimap then
		Stuff:EnableModule("Minimap")
	end
end

local function StartupMsg()
	if Stuff.db.global.Greeting then
		DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Welcome back|r|cFFFF0000 "..CharName.."|r|cFF00FF00 type |r/stuff |cFF00FF00for Stuff options", 1.0, 1.0, 1.0, nil, true);
	end
end

-- Determine if Install is needed.
local function SetVersion( version )
	if Stuff_Beta then return version.." (Beta)";
		else
	return version.." (Release)";
	end
end
Stuff_Version = SetVersion( versionNumber );

local function SetupCheck()
	if Stuff.db.profile.SetUpDone == false then
		Stuff:EnableModule("SetupUI")
		Stuff:DoSetup()
  end
	if Stuff.db.profile.versionnumber ~= Stuff_Version then
		Stuff:EnableModule("SetupUI")
		Stuff:DoSetup()
	end
	BrokerPluginCheck()
	ModuleChecks()
	StartupMsg()
end
ns:RegisterEvent("PLAYER_LOGIN", SetupCheck)