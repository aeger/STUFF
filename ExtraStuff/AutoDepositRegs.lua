local _, aStuff = ...

local function autodeposit()
	if StuffCDB["AutoDepositRegs"] then 
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
		aStuff.Print("Reagents deposited in the bank.")
	end
	end
end

aStuff.RegisterEvent("BANKFRAME_OPENED", autodeposit)