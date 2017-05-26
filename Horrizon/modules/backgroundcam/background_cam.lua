local pos = 1
local bgpositions = {
	[1] = {x=0, y=0, z=6, lx=0, ly=0, lz=0}
}

local function setBackcam()
	if pos >= #bgpositions then
		pos = 0
	end
	pos = pos + 1
	setCameraMatrix(bgpositions[pos].x, bgpositions[pos].y, bgpositions[pos].z, bgpositions[pos].lx, bgpositions[pos].ly, bgpositions[pos].lz)
end

addEvent("server:setbackground", true)
addEventHandler("server:setbackground", localPlayer, function()
	setTimer(setBackcam, 2000, 0)
	fadeCamera(true)
end)
