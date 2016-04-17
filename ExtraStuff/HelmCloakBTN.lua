-- Helm & Cloak Buttons --
	local helmButton = CreateFrame('CheckButton', 'helmButton', CharacterModelFrame, 'OptionsCheckButtonTemplate')
	helmButtonText:SetText('Helm')
	helmButton:SetSize(22, 22)
	helmButton:SetPoint('BOTTOMLEFT', 4, -2)
	helmButton:SetHitRectInsets(0, -32, 0, 0)

	helmButton:SetScript('OnClick', function(self)
		ShowHelm(not ShowingHelm())
	end)

	local cloakButton = CreateFrame('CheckButton', 'cloakButton', CharacterModelFrame, 'OptionsCheckButtonTemplate')
	cloakButtonText:SetText('Cloak')
	cloakButton:SetSize(22, 22)
	cloakButton:SetPoint('BOTTOMRIGHT', -42, -2)
	cloakButton:SetHitRectInsets(0, -32, 0, 0)

	cloakButton:SetScript('OnClick', function(self)
		ShowCloak(not ShowingCloak())
	end)

	local timer = 0
	cloakButton:SetScript('OnUpdate', function(_, elapsed)
		timer = timer + elapsed
		while (timer > 0.05) do
			if UnitIsDeadOrGhost('player') then
				helmButton:Disable()
				helmButton:SetAlpha(0.5)
				cloakButton:Disable()
				cloakButton:SetAlpha(0.5)
				return
			else
				helmButton:Enable()
				helmButton:SetAlpha(1.0)
				cloakButton:Enable()
				cloakButton:SetAlpha(1.0)
			end

			helmButton:SetChecked(ShowingHelm())
			cloakButton:SetChecked(ShowingCloak())

			timer = 0
		end
	end)

-- Tabard Buttons --
	local tabardButton1 = CreateFrame('Button', 'tabardButton1', DressUpFrame, 'UIPanelButtonTemplate')
	tabardButton1Text:SetText(TABARDSLOT)
	tabardButton1:SetSize(80, 22)
	tabardButton1:SetPoint('RIGHT', 'DressUpFrameResetButton', 'LEFT')
	tabardButton1:SetFrameStrata('HIGH')

	tabardButton1:SetScript('OnClick', function()
		DressUpModel:UndressSlot(19)
		PlaySound('gsTitleOptionOK')
	end)

	local tabardButton2 = CreateFrame('Button', 'tabardButton2', SideDressUpFrame, 'UIPanelButtonTemplate')
	tabardButton2Text:SetText(TABARDSLOT)
	tabardButton2:SetSize(80, 22)
	tabardButton2:SetPoint('TOP', 'SideDressUpModelResetButton', 'BOTTOM')
	tabardButton2:SetFrameStrata('HIGH')

	tabardButton2:SetScript('OnClick', function()
		SideDressUpModel:UndressSlot(19)
		PlaySound('gsTitleOptionOK')
	end)