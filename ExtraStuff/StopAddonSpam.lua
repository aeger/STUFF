local name, ns = ...
local Stuff = LibStub("AceAddon-3.0"):GetAddon("Stuff")
local StopAddonSpam = Stuff:NewModule("StopAddonSpam", "AceEvent-3.0", "AceHook-3.0")

local ALLOW = 1
local DENY  = 0

-- Filter
StopAddonSpam.ruleset = {
	order = {
		-- Allowed addons.
		"bugsack",
		-- Global deny.
		-- Denied addons.
		-- Late loading denied addons.
		-- Uncommon denies.
		"bagsync",
		"portable",
				
		-- Default fallthrough.
		"default"
	},
	-- The order of the rules here does not matter.
	rules = {
		["bugsack"] = {
			test = function (msg, id, frame) return BugSack and frame == BugSack end,
			invalidate = true,
			action = ALLOW
		},
		["bagsync"] = {
			test = function (msg, id, frame) return string.find(string.lower(msg), string.lower("bagsync")) end,
			action = DENY
		},
		["portable"] = {
			test = function (msg, id, frame) return string.find(string.lower(msg), string.lower("version")) end,
			action = DENY
		},
		["default"] = {
			action = ALLOW
		}
	}
}

function StopAddonSpam:Release()
	self:Unhook(ChatFrame1, "AddMessage")
	self:Unhook(ChatFrame2, "AddMessage")
	self.ruleset = nil
end

function StopAddonSpam:End(event)
	self:UnregisterEvent(event)
	self:Release()
end

-- Determine if message is spam
function StopAddonSpam:IsMessageSpam(msg, id, frame)
	local ruleset = self.ruleset
	
	if not msg then return end
	
	for i, name in ipairs(ruleset.order) do
		local rule = ruleset.rules[name]
		-- If the rule tests true then there is a match. The absence of a test implies a positive match.
		local match = not rule.test or rule.test(msg, id, frame)
		
		-- The rule matches but it may not actually be spam.
		if match then
			-- Update the expiration count and handle expired rules if necessary.
			if rule.expire then
				if rule.expire <= 1 then
					table.remove(ruleset.order, i)
				else
					rule.expire = rule.expire - 1
				end
			end
			
			-- If this is a deny rule, then this message is spam.
			return rule.action == DENY
		-- If the rule returned nil, then it is invalid.
		elseif match == nil then -- Must explicitly test for nil!
			-- If the rule is set to invalidate then it should be removed from further tests.
			if rule.invalidate then
				table.remove(ruleset.order, i)
				i = i - 1
			end
		end
	end
end

-- Filter out messages
function StopAddonSpam:AddMessage(obj, msg, r, g, b, id)
	if not self:IsMessageSpam(msg, id, this) then
		-- Let the message pass through.
		self.hooks[obj].AddMessage(obj, msg, r, g, b, id)
	end
end

-- Basic Filter
local function ChatFilter(self, ...)
	local event, arg1 = ...
	if strfind(arg1, strsub(ERR_SPELL_UNLEARNED_S, 1, strlen(ERR_SPELL_UNLEARNED_S) - 3)) or strfind(arg1, strsub(ERR_LEARN_SPELL_S, 1, strlen(ERR_LEARN_SPELL_S) - 3)) or strfind(arg1, strsub(ERR_LEARN_ABILITY_S, 1, strlen(ERR_LEARN_ABILITY_S) - 3)) or strfind(arg1, strsub(ERR_PET_SPELL_UNLEARNED_S, 1, strlen(ERR_PET_SPELL_UNLEARNED_S) - 3)) then
		return true
	end
end

-- Hook Chat and register End event
function StopAddonSpam:Start()
	-- Hook the default chat frame's AddMessage method.
	self:RawHook(ChatFrame1, "AddMessage", true)
	
	-- Hook the combat log frame's AddMessage method to catch Gatherer.
	self:RawHook(ChatFrame2, "AddMessage", true)
	
	-- Register for a late-firing event that happens on startup or reload.
	self:RegisterEvent("UPDATE_PENDING_MAIL", "End")
	
	-- Set up basic chat filter
	ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", ChatFilter)
end

StopAddonSpam:Start()