local name, ns = ...

-- Auto Loot toggle
local currentAL
local AutoLootToggleSolo
local AutoLootToggleGroup
local AutoLootToggleRaid
local AutoLootToggleGroupRoster
local AutoLootToggleLoad
local AutoLootTogglePLogin
local tooltip

local dataobj2 = LibStub("LibDataBroker-1.1"):NewDataObject("AutoLootToggle", {
	icon = "Interface\\Icons\\INV_Misc_Bag_07_Black",
	label = "AutoLoot",
	text = "--",
	type = "launcher",
})

function AutoLootToggleLoad(name)
  if name ~= "AutoLootToggle" then return end
  StuffDB = StuffDB or { AutoLootSolo = true, AutoLootGroup = false, AutoLootRaid = false}
end

function AutoLootTogglePLogin()
	if StuffDB.AutoLootSolo ~= true then
		dataobj2.text = ("AutoLoot: |cffff0000OFF|r")
		dataobj2.icon = ("Interface\\Icons\\INV_Misc_Bag_07_Red")
		_G.SetCVar("autoLootDefault", "0")
		currentAL = false
	elseif StuffDB.AutoLootSolo ~= false then
		dataobj2.text = ("AutoLoot: |cff00ff00ON|r")
		dataobj2.icon = ("Interface\\Icons\\INV_Misc_Bag_07_Green")
		_G.SetCVar("autoLootDefault", "1")
		currentAL = true
	end
end

function AutoLootToggleGroupRoster()
	if IsInRaid() then
		if StuffDB.AutoLootRaid ~= true then
			dataobj2.text = ("AutoLoot: |cffff0000OFF|r")
			dataobj2.icon = ("Interface\\Icons\\INV_Misc_Bag_07_Red")
			_G.SetCVar("autoLootDefault", "0")
			currentAL = false
		elseif StuffDB.AutoLootRaid ~= false then
			dataobj2.text = ("AutoLoot: |cff00ff00ON|r")
			dataobj2.icon = ("Interface\\Icons\\INV_Misc_Bag_07_Green")
			_G.SetCVar("autoLootDefault", "1")
			currentAL = true
		end
	elseif GetNumSubgroupMembers(LE_PARTY_CATEGORY) > 0 then
		if StuffDB.AutoLootGroup ~= true then
			dataobj2.text = ("AutoLoot: |cffff0000OFF|r")
			dataobj2.icon = ("Interface\\Icons\\INV_Misc_Bag_07_Red")
			_G.SetCVar("autoLootDefault", "0")
			currentAL = false
		elseif StuffDB.AutoLootGroup ~= false then
			dataobj2.text = ("AutoLoot: |cff00ff00ON|r")
			dataobj2.icon = ("Interface\\Icons\\INV_Misc_Bag_07_Green")
			_G.SetCVar("autoLootDefault", "1")
			currentAL = true
		end
	else
		if StuffDB.AutoLootSolo ~= true then
			dataobj2.text = ("AutoLoot: |cffff0000OFF|r")
			dataobj2.icon = ("Interface\\Icons\\INV_Misc_Bag_07_Red")
			_G.SetCVar("autoLootDefault", "0")
			currentAL = false
		elseif StuffDB.AutoLootSolo ~= false then
			dataobj2.text = ("AutoLoot: |cff00ff00ON|r")
			dataobj2.icon = ("Interface\\Icons\\INV_Misc_Bag_07_Green")
			_G.SetCVar("autoLootDefault", "1")
			currentAL = true
		end
	end
end

function dataobj2.OnTooltipShow(tip)
	if not tooltip then tooltip = tip end
	tip:ClearLines()
	tip:AddLine("AutoLootToggle")
	tip:AddLine(" ")
	tip:AddDoubleLine("Current AutoLoot Setting:", currentAL and "|cff00ff00ON|r" or "|cffff0000OFF|r")
	tip:AddLine(" ")
	tip:AddDoubleLine("Solo:", StuffDB.AutoLootSolo and "|cff00ff00ON|r" or "|cffff0000OFF|r")
	tip:AddDoubleLine("Party:", StuffDB.AutoLootGroup and "|cff00ff00ON|r" or "|cffff0000OFF|r")
	tip:AddDoubleLine("Raid:", StuffDB.AutoLootRaid and "|cff00ff00ON|r" or "|cffff0000OFF|r")
	tip:AddLine(" ")
	tip:AddLine("|cff69b950Left-Click:|r |cffeeeeeeToggle current AutoLoot setting|r")
	tip:AddLine(" ")
	tip:AddLine("|cff69b950Right-Click:|r |cffeeeeeeToggle default solo setting|r")
	tip:AddLine("|cff69b950Shift-Right-Click:|r |cffeeeeeeToggle default party setting|r")
	tip:AddLine("|cff69b950Alt-Right-Click:|r |cffeeeeeeToggle default raid setting|r")
	tip:Show()
end

function dataobj2.OnClick()
	local button = GetMouseButtonClicked()
	if button == "LeftButton" then
		if _G.GetCVar("autoLootDefault") == "0" then
			_G.SetCVar("autoLootDefault", "1")
			dataobj2.text = ("AutoLoot: |cff00ff00ON|r")
			dataobj2.icon = ("Interface\\Icons\\INV_Misc_Bag_07_Green")
			currentAL = true
		elseif _G.GetCVar("autoLootDefault") == "1" then
			_G.SetCVar("autoLootDefault", "0")
			dataobj2.text = ("AutoLoot: |cffff0000OFF|r")
			dataobj2.icon = ("Interface\\Icons\\INV_Misc_Bag_07_Red")
			currentAL = false
		end
	elseif ( button == "RightButton" ) then
		if IsShiftKeyDown() then
			AutoLootToggleGroup();
		else
			if IsAltKeyDown() then
				AutoLootToggleRaid();
			else
				AutoLootToggleSolo();
			end
		end
	end
	dataobj2.OnTooltipShow(tooltip)
end

function AutoLootToggleSolo()
  StuffDB.AutoLootSolo = not StuffDB.AutoLootSolo
end

function AutoLootToggleGroup()
  StuffDB.AutoLootGroup = not StuffDB.AutoLootGroup
end

function AutoLootToggleRaid()
  StuffDB.AutoLootRaid = not StuffDB.AutoLootRaid
end

ns:RegisterEvent("ADDON_LOADED", AutoLootToggleLoad)
ns:RegisterEvent("PLAYER_LOGIN", AutoLootTogglePLogin)
ns:RegisterEvent("GROUP_ROSTER_UPDATE", AutoLootToggleGroupRoster)
