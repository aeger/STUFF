local name, ns = ...

local function MoveBuffs()
	BuffFrame:ClearAllPoints()
	BuffFrame:SetParent(UIParent)
	BuffFrame:SetScale(1.2)
	BuffFrame:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -200, -1)
end

 ns:RegisterEvent("PLAYER_ENTERING_WORLD", MoveBuffs)