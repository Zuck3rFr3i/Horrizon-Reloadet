ae("System_Player:Login", true)
aeh("System_Player:Login", player, function()
	local int_width, int_height = 600, 300
	local x = (sx/2)-(int_width/2)
	local y = (sy/2)-(int_height/2)
	
	guielem_loginmainFrame = guiCreateWindow(x, y, int_width, int_height, "Horrizon Login", false)
end)
