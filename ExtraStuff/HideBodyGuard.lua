local name, ns = ...

local function BodyGuardHide()
			-- Do nothing if shift is being held
			if IsShiftKeyDown() then return end
			-- Traverse faction IDs for known bodyguards (wowhead.com/factions=1444.1735)
			local id = GetFriendshipReputation();
			if id then
				if id == 1733 -- Delvar Ironfist
				or id == 1736 -- Tormmok
				or id == 1737 -- Talonpriest Ishaal
				or id == 1738 -- Defender Illona
				or id == 1739 -- Vivianne
				or id == 1740 -- Aeda Brightdawn
				or id == 1741 -- Leorajh
				then
					-- Close gossip window if it's for a cooperating (active) bodyguard
					if UnitCanCooperate("target", "player") then
						CloseGossip()
					end
				end
			end
end

ns.RegisterEvent("GOSSIP_SHOW", BodyGuardHide)