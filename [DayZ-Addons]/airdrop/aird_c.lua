--[[
	*----------------------------------------------------------*
	Script: DayZ Airdrop 2.0
	Author: Enargy
	Type: Client
	*----------------------------------------------------------*
]]

----------------------------------
--- CODE
----------------------------------
function onAirPlaneSound(pos, radius)
	local x, y, z = unpack(pos)
	local x1, y1, z1 = getElementPosition(localPlayer)
	if getDistanceBetweenPoints3D(x, y, z, x1, y1, z1) < radius then
		playSound("plane.mp3")
	end
end
addEvent("onAirPlaneSound", true)
addEventHandler("onAirPlaneSound", root, onAirPlaneSound)