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
	return aStuff[event] and aStuff[event](event, ...)
end)

function aStuff:RegisterEvent(event, func)

	assert(type(event) == "string")

	eventframe[event] = eventframe[event] or {}

	table.insert(eventframe[event], func)
	return eventframe:RegisterEvent(event)
end

function aStuff:UnregisterEvent(event, func)
	if not eventframe[event] then return; end
	if func then
		local tbl = eventframe[event]
		for i = #tbl, 1, -1 do
			if (tbl[i] == func) then
				table.remove(tbl, i)
				break;
			end
		end
		if #tbl == 0 then
			eventframe:UnregisterEvent(event)
		end
	else
		eventframe:UnregisterEvent(event)
	end
end

function aStuff:UnregisterAllEvents()
	return eventframe:UnregisterAllEvents()
end

function aStuff:IsEventRegistered(event)
	return eventframe:IsEventRegistered(event)
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