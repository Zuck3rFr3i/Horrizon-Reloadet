local width, height = 600, 700
local x, y = (sx/2) - (width/2), (sy/2) - (height/2)

addEvent("system:newPlayer", true)
addEventHandler("system:newPlayer", localPlayer, function()
	showChat(false)
	showPlayerHudComponent("all", false)
	showCursor(true)
	local regmainwin = guiCreateWindow(x, y, width, height, "Horrizon Registration", false)
	
	guiSetAlpha(regmainwin, 1)
	guiWindowSetSizable(regmainwin, false)
	guiWindowSetMovable(regmainwin, false)
end)