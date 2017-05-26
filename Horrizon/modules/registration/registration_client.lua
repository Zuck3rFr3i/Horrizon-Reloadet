local width, height = 600, 400
local x, y = (sx/2) - (width/2), (sy/2) - (height/2)

addEvent("testoutput", true)
addEventHandler("testoutput", root, function(username, password, email, securitycode)
	if string.len(username) >= 4 then
		if string.len(password) >= 6 then
			if string.len(email) >= 6 then
				if string.len(securitycode) >= 6 then
					local hashedpw = hash("sha512", password)
					triggerServerEvent("system:setupPlayerData", localPlayer, username, hashedpw, email, securitycode)
				else
					outputChatBox("#FF4000[Horrizon]: #FFAF00Der #FF0000Securitycode #FFAF00muss mindestens #FF00006 Zeichen #FFAF00lang sein!", 0, 0, 0, true)
				end
			else
					outputChatBox("#FF4000[Horrizon]: #FFAF00Die #FF0000Email #FFAF00muss im #FF0000Korrekten #FFAF00Format sein!", 0, 0, 0, true)
			end
		else
			outputChatBox("#FF4000[Horrizon]: #FFAF00Das #FF0000Passwort #FFAF00muss mindestens #FF00006 Zeichen #FFAF00lang sein!", 0, 0, 0, true)
		end
	else
			outputChatBox("#FF4000[Horrizon]: #FFAF00Der #FF0000Username #FFAF00muss mindestens #FF00004 Zeichen #FFAF00lang sein!", 0, 0, 0, true)
	end
end)

addEvent("system:newPlayer", true)
addEventHandler("system:newPlayer", localPlayer, function()
	showCursor(true)
	local browser = guiCreateBrowser ( 0, 0, sx, sy, true, true, false)
	local theBrowser = guiGetBrowser( browser )
	addEventHandler( "onClientBrowserCreated", theBrowser, function( )
		loadBrowserURL( source, "http://mta/Horrizon/modules/registration/html/registration_gui.html" )
	end)
end)
