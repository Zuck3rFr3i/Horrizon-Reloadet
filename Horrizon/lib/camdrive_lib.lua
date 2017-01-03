local moov = 0
local object1, object2
function smoothMoveCamera ( x1, y1, z1, x1t, y1t, z1t, x2, y2, z2, x2t, y2t, z2t, time )
	if(moov == 1) then error("Zu wenig Frames") return end
	object1 = createObject ( 1337, x1, y1, z1 )
	object2 = createObject ( 1337, x1t, y1t, z1t )
	setElementAlpha ( object1, 0 )
	setElementAlpha ( object2, 0 )
	setObjectScale( object1, 0 )
	setObjectScale( object2, 0 )
	moveObject ( object1, time, x2, y2, z2, 0, 0, 0, "InOutQuad" )
	moveObject ( object2, time, x2t, y2t, z2t, 0, 0, 0, "InOutQuad" )
	
	addEventHandler ( "onClientRender", getRootElement(), camRender )
	moov = 1
	setTimer ( removeCamHandler, time, 1 )
	setTimer ( destroyElement, time, 1, object1 )
	setTimer ( destroyElement, time, 1, object2 )
end
function removeCamHandler ()
	moov = 0
	removeEventHandler ( "onClientRender", getRootElement(), camRender )
end
function camRender ()
	local x1, y1, z1 = getElementPosition ( object1 )
	local x2, y2, z2 = getElementPosition ( object2 )
	setCameraMatrix ( x1, y1, z1, x2, y2, z2 )
end