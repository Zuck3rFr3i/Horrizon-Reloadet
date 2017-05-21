addEventHandler("onClientResourceStart", getRootElement(), function()
	outputChatBox("#FF4000[Horrizon]: #FFAF00Willkommen #0066FF"..getPlayerName(localPlayer)..", #FFAF00Wir werden dem Server nun sagen das dein Client bereit ist.", 0, 0, 0, true)
	triggerServerEvent("server:initplayer", localPlayer)
end)