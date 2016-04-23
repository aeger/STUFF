local name, aStuff = ...

---------------------------------------------------------------------------
--							Event Handler								 --
---------------------------------------------------------------------------
local eventframe = CreateFrame("Frame")
eventframe:SetScript("OnEvent", function(self, event, ...)
	if self[event] then
		for _, func in pairs(self[event]) do
			func(event, ...)
		end
	end
end)

function aStuff.RegisterEvent(event, func)
	assert(type(event) == "string")
	if not eventframe[event] then
		eventframe[event] = {}
	end
	table.insert(eventframe[event], func)
	return eventframe:RegisterEvent(event)
end

function aStuff.UnregisterEvent(event, func) 
	if not eventframe[event] then return; end
	if func and eventframe[event][func]  then
		eventframe[event][func] = nil
	end
	if #eventframe[event] == 0 then
		eventframe:UnregisterEvent(event)
	end
end


---------------------------------------------------------------------------
--							Print										 --
---------------------------------------------------------------------------
function aStuff.Print(...)
	if (not ...) then return; end
	local s = ""
	local t = {...}
	for i = 1, #t do
		s = s .. " " .. t[i]
	end
	return print("|cffffcf00Stuff:|r"..s)
end