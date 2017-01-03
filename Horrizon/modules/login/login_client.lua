function function_reggui_show()
	local int_width, int_height = 800, 500
	local x = (sx/2)-(int_width/2)
	local y = (sy/2)-(int_height/2)
	guielem_regmainFrame = guiCreateWindow(x, y, int_width, int_height, "Horrizon Registration", false)
	
	
	guiWindowSetMovable(guielem_regmainFrame, false)
	guiWindowSetSizable(guielem_regmainFrame, false)
end

function checkcamdrivePos()
	local x, y, z, vx, vy, vz = getCameraMatrix(player)
	setCameraMatrix(x-0.03, y+0.03, z+0.01)
	--[[
		Todo: Implement extendet Camera Drive for Fancy looks :P
	]]
end

function function_initcamDrive()
	setCameraMatrix(2118.4626464844, -1634.2255859375, 56.316715240479, 2018.7856445313, -1626.1950683594, 56.316715240479)
	fadeCamera(true)
	setPlayerHudComponentVisible("all", false)
	showChat(false)
	addEventHandler("onClientRender", root, checkcamdrivePos)
end

ae("System_Player:login", true)
aeh("System_Player:login", player, function(userdata, rows)
	function_initcamDrive()
	local int_width, int_height = 600, 300
	local x = (sx/2)-(int_width/2)
	local y = (sy/2)-(int_height/2)
	guielem_loginmainFrame = guiCreateWindow(x, y, int_width, int_height, "Horrizon Login", false)
	local guielem_accountgrid = guiCreateGridList(0.52, 0.07, 0.45, 0.90, true, guielem_loginmainFrame)
	local col_username = guiGridListAddColumn( guielem_accountgrid, "Accounts", 0.26 )
	local col_lastlogout = guiGridListAddColumn( guielem_accountgrid, "Letzer Logout", 0.35 )
	local col_status = guiGridListAddColumn( guielem_accountgrid, "Status", 0.22 )
	for id, tbl_userdata in ipairs(userdata) do 
		local row = guiGridListAddRow ( guielem_accountgrid )
		guiGridListSetItemText ( guielem_accountgrid, row, col_username, tbl_userdata.user, false, false )
		guiGridListSetItemText ( guielem_accountgrid, row, col_lastlogout, tbl_userdata.lastlogout, false, false )
		if tbl_userdata.status == 1 then
			guiGridListSetItemText ( guielem_accountgrid, row, col_status, "Gebannt", false, false )
		elseif tbl_userdata.status == 0 then
			guiGridListSetItemText ( guielem_accountgrid, row, col_status, "Offen", false, false )
		else
			guiGridListSetItemText ( guielem_accountgrid, row, col_status, "N/A", false, false )
		end
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
	aeh("onClientGUIClick", guielem_btnlogin, function()
		local str_pass = guiGetText(guielem_editpass)
		local str_user = guiGetText(guielem_edituser)
		if str_pass then
			for i, v in ipairs(userdata) do
				local str_userreg = v.user
				if str_userreg then
					if str_userreg == str_user then
						if string.len(str_pass) >= 6 then
							local str_hashedpw = hash("sha512", str_pass)
							if str_hashedpw then
								triggerServerEvent("System_Player:checklogin", player, str_hashedpw, str_user)
								return
							end
						else
							showMessage("Das angegebene Passwort ist zu kurz!", 5000, "typewarning")
						end
					else
						guiGridListSetItemColor ( guielem_accountgrid, i-1, 1, 255, 0, 0, 255 )
						setTimer( function()
							guiGridListSetItemColor ( guielem_accountgrid, i-1, 1, 255, 255, 255, 255 )
						end, 1200, 1)
					end
				end
			end
		end
	end, false)
	aeh("onClientGUIClick", guielem_btnregis, function()
		destroyElement(guielem_loginmainFrame)
		function_reggui_show()
	end, false)
	aeh("onClientGUIClick", guielem_accountgrid, function()
		if guiGridListGetSelectedCount ( guielem_accountgrid) ~= 0 then
			local str_user = guiGridListGetItemText( guielem_accountgrid, guiGridListGetSelectedItem ( guielem_accountgrid ), 1 )
			if str_user ~= nil and str_user ~= "" and  str_user ~= "N/A" then
				guiSetText(guielem_edituser, str_user)
			end
		end
	end, false)
	guiEditSetMasked(guielem_editpass, true)
	showCursor(true)
	guiWindowSetMovable(guielem_loginmainFrame, false)
	guiWindowSetSizable(guielem_loginmainFrame, false)
end)