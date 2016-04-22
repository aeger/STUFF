local name, aStuff = ...

local function ChatFade()
	BazookaBar_1:Hide()
		if DisableChatFade then
			for i = 1, NUM_CHAT_WINDOWS do
				_G[("ChatFrame" .. i)]:SetFading(false)
			end
			-- Process temporary frames
			hooksecurefunc("FCF_OpenTemporaryWindow", function()
				local cf = FCF_GetCurrentChatFrame():GetName() or nil
				if cf then
					_G[cf]:SetFading(false)
				end
			end)
		end	
	end

aStuff.RegisterEvent("PLAYER_LOGIN", ChatFade)