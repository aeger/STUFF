local name, ns = ...
local Stuff = LibStub("AceAddon-3.0"):GetAddon("Stuff")

local function SetChainStyle()
	local chain = Stuff.db.profile.Chain
		-- Set chain style according to value
		if chain == 1 then -- Rare
			PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare.blp");
		elseif chain == 2 then -- Elite
			PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite.blp");
		elseif chain == 3 then -- Rare Elite
			PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare-Elite.blp");
		end
end	

ns:RegisterEvent("PLAYER_LOGIN", SetChainStyle)