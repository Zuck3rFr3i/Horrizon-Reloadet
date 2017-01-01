--[[
	Author: Zuck3rFr3i
]]
local str_gtype = getGameType()
local str_spasswd = getServerPassword()
local int_maxplayer = getMaxPlayers()
local int_maxfps = getFPSLimit()

outputServerLog("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
outputServerLog("Horrizon: Standartvariables Generated, setting up Mysql Connection.")

if mysqlCon then
	outputServerLog("Horrizon: Mysql Connection Success, Setting up Settings.")
	if str_gtype ~= "Horrizon_reallife" then
		setGameType("Horrizon_reallife")
		outputServerLog("Horrizon: Gametype Set!")
	else
		outputServerLog("Horrizon: Didnt need to reset GameType!")
	end
	if str_spasswd ~= server_password then
		setServerPassword(server_password)
		outputServerLog("Horrizon: Password Set!")
	else
		outputServerLog("Horrizon: Didnt need to reset Password!")
	end
	if int_maxplayer ~= server_maxplayer then
		setMaxPlayers(server_maxplayer)
		outputServerLog("Horrizon: MaxPlayers Set!")
	else
		outputServerLog("Horrizon: Didnt need to reset max Players!")
	end
	if int_maxfps ~= server_maxfps then
		setFPSLimit(server_maxfps)
		outputServerLog("Horrizon: MaxFPS Set!")
	else
		outputServerLog("Didnt need to reset max FPS!")
	end
	outputServerLog("Horrizon: Settings Finished, deleting vehicles.")
	for i, vehic in pairs(getElementsByType("vehicle")) do
		local owner = getElementData(vehic, "owner")
		if owner == nil or owner == "" then
			local float_x, float_y, float_z = getElementPosition(vehic)
			local int_id = getElementModel(vehic)
			local del_vehic = destroyElement(vehic)
			if del_vehic then
				outputDebugString("Deleted Vehicle with ID: "..int_id.." on psition x: "..float_x.." y: "..float_y.." z: "..float_z)
			end
		end
	end
	outputServerLog("Horrizon: All vehicles without Owner Deleted! setting up player vehicles")
	local player_vehicletbl, int_rows = msql_gettbl("SELECT * FROM player_vehicles")
	if player_vehicletbl then
		for i, p_vehic in pairs(player_vehicletbl) do
			local float_x, float_y, float_z = player_vehicletbl.posx, player_vehicletbl.posy, player_vehicletbl.posz
			local int_rot = player_vehicletbl.rot
			local str_owner = player_vehicletbl.owner
			local int_vehicid = player_vehicletbl.modelid
			if float_x and str_owner then
				local p_vehicle = createVehicle(int_vehicid, float_x, float_y, float_z, 0, 0, int_rot)
				if p_vehicle then
					setElementData(p_vehicle, "owner", str_owner)
					outputServerLog("Horrizon: Spawned vehicle from Player: "..str_owner.." at position: "..float_x..","..float_y..","..float_z)
					setVehicleLocked(p_vehicle, true)
				end
			end
		end
	end
	outputServerLog("Horrizon: "..int_rows.." Vehicles where spawned! Spawning ATM,s")
	local server_atms, int_rows = msql_gettbl("SELECT * FROM server_atm")
	if server_atms then
		for i, atm in pairs(server_atms) do
			local elem_atm = createObject(2942, atm.posx, atm.posy, atm.posz, 0, 0, atm.rot)
			if elem_atm then
				setElementData(elem_atm, "destructable", atm.destructable)
				createBlip(atm.posx, atm.posy, atm.posz, 52)
			end
		end
	end
	outputServerLog("Horrizon: "..int_rows.." ATM,s where spawned! Spawning Trader")
	local server_trader, int_rows = msql_gettbl("SELECT * FROM server_trader")
	if server_trader then
		for i, trader in pairs(server_trader) do
			local elem_trader = createPed(trader.skinid, trader.posx, trader.posy, trader.posz, trader.rot)
			setElementFrozen(elem_trader, true)
			createBlip(trader.posx, trader.posy, trader.posz, trader.blipid)
			setElementData(elem_trader, "type", trader.typ)
			setElementData(elem_trader, "identifyer", trader.identifyer)
		end
	end
	outputServerLog("Horrizon: "..int_rows.." Trader where spawned! Serversetup Finished!")
	outputServerLog("Horrizon: Server is Ready to accept connections!")
else
	outputServerLog("Horrizon: Mysql Connection failed, stopping Resource!")
	stopResource(getThisResource())
end
