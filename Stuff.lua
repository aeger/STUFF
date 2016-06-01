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
  
  -- eAlign:

SLASH_EA1 = "/align"

local f

SlashCmdList["EA"] = function()
	if f then
		f:Hide()
		f = nil		
	else
		f = CreateFrame('Frame', nil, UIParent) 
		f:SetAllPoints(UIParent)
		local w = GetScreenWidth() / 64
		local h = GetScreenHeight() / 36
		for i = 0, 64 do
			local t = f:CreateTexture(nil, 'BACKGROUND')
			if i == 32 then
				t:SetTexture(1, 0, 0, 0.5)
			else
				t:SetTexture(0, 0, 0, 0.5)
			end
			t:SetPoint('TOPLEFT', f, 'TOPLEFT', i * w - 1, 0)
			t:SetPoint('BOTTOMRIGHT', f, 'BOTTOMLEFT', i * w + 1, 0)
		end
		for i = 0, 36 do
			local t = f:CreateTexture(nil, 'BACKGROUND')
			if i == 18 then
				t:SetTexture(1, 0, 0, 0.5)
			else
				t:SetTexture(0, 0, 0, 0.5)
			end
			t:SetPoint('TOPLEFT', f, 'TOPLEFT', 0, -i * h + 1)
			t:SetPoint('BOTTOMRIGHT', f, 'TOPRIGHT', 0, -i * h - 1)
		end	
	end
end