local _, ns = ...
local buttons, charName, Update = {}
local list = {
	Smekket = {
		["Frostweed"] = true, 
		["Fireweed"] = true,
		["Gorgrond Flytrap"] = true,
		["Starflower"] = true,
		["Nagrand Arrowbloom"] = true,
		["Fireweed"] = true,
	},
	Drmowinckel = {
		['Sumptuous Fur'] = true,
		['Fractured Temporal Crystal'] = true,
		['Temporal Crystal'] = true,
		['Temporal Crystal'] = true,
	},
	Abdhulla = {
		['Raw Beast Hide'] = true,

	}
}
local maxItems = ATTACHMENTS_MAX_SEND

local function button_onClick(self)

	local itemsPlaced = 0
	local name = self.character
	local items = list[name]
	SendMailNameEditBox:SetText(name)
	for bag = 0, 4 do
		for slot = 0, GetContainerNumSlots(bag) do
			local link = GetContainerItemLink(bag, slot)

			if link then
				local itemname = GetItemInfo(link)
				if items[itemname] then
					itemsPlaced = itemsPlaced + 1
					UseContainerItem(bag, slot)
				end

				if itemsPlaced >= maxItems then
					break;
				end
			end
		end
	end
	Update()
end

local function createButton(name)
	if charName == name then return; end
	local button = CreateFrame("Button", "SendMailButton"..name, SendMailFrame, "UIPanelButtonTemplate")
	button:SetWidth(120)
	button:SetHeight(25)
	if #buttons > 0 then
		button:SetPoint("TOPLEFT", buttons[#buttons], "BOTTOMLEFT", 0, -5)
	else
		button:SetPoint("TOPLEFT", SendMailFrame, "TOPRIGHT", -35, -0)
	end
	button:SetText(name)
	button:SetScript("OnClick", button_onClick)

	button.character = name
	buttons[#buttons+1] = button
end

function Update()
	if SendMailFrame:IsVisible() then
		charName = GetUnitName("player")
		if #buttons == 0 then
			for k, v in pairs(list) do
				createButton(k)
			end
		end

		for i = 1, #buttons do
			local button = buttons[i]
			local enable
			for k, _ in pairs(list[button.character]) do
				if GetItemCount(k) > 0 then
					enable = true
					break;
				end
			end
			if enable then
				button:Enable()
			else
				button:Disable()
			end
			button:Show()
		end
	else
		for i = 1, #buttons do
			buttons[i]:Hide()
		end
	end
end

hooksecurefunc('MailFrameTab_OnClick', Update)