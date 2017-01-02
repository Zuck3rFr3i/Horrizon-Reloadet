-------------------------------------------------------------------------------
-- Author: Zuck3rFr3i
-- Message System
-------------------------------------------------------------------------------
-- Message System Setup
--------------------------------------------------------------------------
local types = {
	["typeinfo"] = {["color"] = tocolor(10,151,245,255)},
	["typewarning"] = {["color"] = tocolor(245,147,10,255)},
	["typeok"] = {["color"] = tocolor(0,255,0,255)},
	["typeerror"] = {["color"] = tocolor(255,0,0,255)}
}
addEvent("TriggerMessage",true)
local messages = {}
function showMessage(text, timetoshow, typ)
	if string.len(text) > 50 then
		outputChatBox("Nachricht ist zu lang!")
		return
	end
    if types[typ] == nil then typ = "info" end

	if(#messages ~= 0 and messages[#messages]["text"] == text) then
		return
	end
	table.insert(messages, {["text"] = text, ["timetoshow"] = timetoshow, ["typ"] = types[typ]})
end
addEventHandler("TriggerMessage", root, showMessage)

addEventHandler("onClientRender", root, function()
	if(#messages == 0) then -- No Messages
		return
	end
	if(messages[1]["started"] == nil)then -- get Start Time for Message
		messages[1]["started"] = getTickCount()
	end
	if(messages[1]["started"] + messages[1]["timetoshow"] < getTickCount())then
		table.remove(messages, 1) -- Remove Message after Time is Over
		return
	end
	-- Draw the Message
	dxDrawRectangle((sx/2)-350, 5, 700, 100, tocolor(70, 70, 70, 190) )
	dxDrawText(messages[1]["text"], (sx/2)-dxGetTextWidth(messages[1]["text"], 1, "default")/2, 25, 700, 100, messages[1]["typ"]["color"], 1, "default")
end)

--------------------------------------------------------------------------
-- Debug Stuff
addCommandHandler("msgtest", function(cdm, text, timetoshow, typ)
	triggerEvent("TriggerMessage", localPlayer, text, timetoshow, typ )
end)
--------------------------------------------------------------------------