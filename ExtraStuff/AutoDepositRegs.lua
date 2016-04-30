local name, ns = ...

local function autodeposit()
	if (ns.Config.AutoDepositRegs) then 
		if IsModifierKeyDown() then	
			return
		else
	if not BankFrameItemButton_Update_ORI then -- Copy the function and re-write it
		BankFrameItemButton_Update_ORI = BankFrameItemButton_Update 
		
		BankFrameItemButton_Update = function(button)
				BankFrameItemButton_Update_ORI(button)
		end		
	end

	DepositReagentBank()
		ns.Print("Reagents deposited in the bank.")
	end
	end
end

ns.RegisterEvent("BANKFRAME_OPENED", autodeposit)