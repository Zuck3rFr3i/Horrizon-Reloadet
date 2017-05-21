local bgpositions = {
	[1] = {x=0, y=0, z=6, r=0}
}

addEvent("server:setbackground", true)
addEventHandler("server:setbackground", localPlayer, function()
	fadeCamera(true)
	setCameraMatrix(bgpositions[1].x, bgpositions[1].y, bgpositions[1].z)
end)