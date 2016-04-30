local name, ns = ...

ns.Config = {
	
	EnableMailModule = true, -- Enable take all mail button
	AutoDepositRegs = true,
	DisableChatFade = true,
	Ralert = true,
	Greeting = true,

	Vendor = { -- THings to do when visiting a vendor, hold shift to ignore all.
		AutoRepair = true,		-- Repair automagically when visiting a vendor, 
		SellGreyCrap = true,	-- Sells ALL grey stuff
		BuyEssentials = true,	-- Restock a set items for your character, like Tome of clear mind
	},

}