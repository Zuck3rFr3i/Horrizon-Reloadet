--[[
	Author: Zuck3rFr3i
]]
aeh("onElementDataChange", getRootElement(), function(theName, theOldValue)
	if client ~= nil then
		setElementData(source, theName, theOldValue)
		local name = getPlayerName(client)
		-- log the Playername
	end
end)