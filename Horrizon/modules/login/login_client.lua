local width, height = 600, 400
local x, y = (sx/2) - (width/2), (sy/2) - (height/2)

addEvent("system:sendlogdataa", true)
addEventHandler("system:sendlogdataa", root, function(username, password)
	if string.len(username) >= 4 then
		if string.len(password) >= 6 then
				local hashedpw = hash("sha512", password)
				triggerServerEvent("system:getPlayerLogin", localPlayer, username, hashedpw)
		else
			outputChatBox("#FF4000[Horrizon]: #FFAF00Das #FF0000Passwort #FFAF00muss mindestens #FF00006 Zeichen #FFAF00lang sein!", 0, 0, 0, true)
		end
	else
			outputChatBox("#FF4000[Horrizon]: #FFAF00Der #FF0000Username #FFAF00muss mindestens #FF00004 Zeichen #FFAF00lang sein!", 0, 0, 0, true)
	end
end)

addEvent("system:closelogin", true)
addEventHandler("system:closelogin", localPlayer, function()
	showCursor(false)
	destroyElement(browser)
	killTimer(backgroundtimer)
	backgroundtimer = nil
end)

addEvent("system:resumedPlayer", true)
addEventHandler("system:resumedPlayer", localPlayer, function()
	showCursor(true)
	browser = guiCreateBrowser ( 0, 0, sx, sy, true, true, false)
	local theBrowser = guiGetBrowser( browser )
	addEventHandler( "onClientBrowserCreated", theBrowser, function( )
		loadBrowserURL( source, "http://mta/Horrizon/modules/login/html/login_gui.html" )
	end)
end)
