ae("System_Player:login", true)
aeh("System_Player:login", player, function(userdata, rows)
	local int_width, int_height = 600, 300
	local x = (sx/2)-(int_width/2)
	local y = (sy/2)-(int_height/2)
	guielem_loginmainFrame = guiCreateWindow(x, y, int_width, int_height, "Horrizon Login", false)
	local guielem_accountgrid = guiCreateGridList(0.52, 0.07, 0.45, 0.90, true, guielem_loginmainFrame)
	local col_username = guiGridListAddColumn( guielem_accountgrid, "Deine Accounts", 0.50 )
	local col_lastlogout = guiGridListAddColumn( guielem_accountgrid, "Letzer Logout", 0.42 )
	for id, tbl_userdata in ipairs(userdata) do 
		local row = guiGridListAddRow ( guielem_accountgrid )
		guiGridListSetItemText ( guielem_accountgrid, row, col_username, tbl_userdata.user, false, false )
		guiGridListSetItemText ( guielem_accountgrid, row, col_lastlogout, tbl_userdata.lastlogout, false, false )
	end
	local guielem_labeluser = guiCreateLabel(0.02, 0.10, 0.20, 0.10, "Account-Name:", true, guielem_loginmainFrame)
	local guielem_edituser = guiCreateEdit(0.02, 0.16, 0.40, 0.10, "", true, guielem_loginmainFrame)
	local guielem_labelpass = guiCreateLabel(0.02, 0.30, 0.20, 0.10, "Account-Passwort:", true, guielem_loginmainFrame)
	local guielem_editpass = guiCreateEdit(0.02, 0.36, 0.40, 0.10, "", true, guielem_loginmainFrame)
	local guielem_btnlogin = guiCreateButton(0.02, 0.60, 0.48, 0.10, "Einloggen", true, guielem_loginmainFrame)
	local guielem_btnregis = guiCreateButton(0.02, 0.73, 0.48, 0.10, "Registrieren", true, guielem_loginmainFrame)
	local guielem_btnprob = guiCreateButton(0.02, 0.86, 0.48, 0.10, "Problem melden", true, guielem_loginmainFrame)
	if rows == 3 then
		guiSetEnabled(guielem_btnregis, false)
		guiSetText(guielem_btnregis, "Registrieren - Du hast bereits 3 Accounts!")
	end
	if rows == 0 then
		guiSetEnabled(guielem_btnlogin, false)
		guiSetText(guielem_btnlogin, "Einloggen - Du besitzt keinen Account!")
	end
	showCursor(true)
	guiWindowSetMovable(guielem_loginmainFrame, false)
	guiWindowSetSizable(guielem_loginmainFrame, false)
end)
