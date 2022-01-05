--[[
	*----------------------------------------------------------*
	Script: DayZ Airdrop 2.0
	Author: Enargy
	Type: Server
	*----------------------------------------------------------*
]]
-- Caja con paracaidas > 2903
-- Caja sin paracaidas > 2919

----------------------------------
--- VARIABLES
----------------------------------

local airplane = {}
local droppedBox = {}
local airplaneRadius = 500 -- this radius is used to spawn the plane off 2D points
local airplaneHeight = 100 
local planeObjectTimer = 30000
local resetTimer = 1800000

local dropPositions = {
	{1847.487793, -1380.360107, 12.390625},
	{541.633423, -1716.642822, 11.853773},
	{1338.235352, 931.985291, 16.919411},
	{2606.617676, 2522.058838, 5.012202},
	{1802.612183, 1647.060547, 5.734375},
	{164.303040, 2559.996582, 15.367188},
	{152.860428, 1125.209595, 13.205570},
	{-2487.026611, 2361.521484, 9.267405},
	{-2263.317871, 1018.792419, 82.643494},
	{-2257.076172, 20.568623, 34.171875},
	{-2427.782227, -612.265564, 131.562500},
	{-2120.560059, -2444.657715, 29.468750},
	{-565.654236, -1584.964844, 8.666681},
	{-783.436523, -446.727905, 15.754713},
	{670.375671, 150.017548, 14.976886},
	{2652.475342, 40.181274, 25.184450},
}

local lootTable = {
	{"PKM"},
	{"M240"},
	{"AS50"},
	{"Analgesicos"},
	{"Botiquin"},
	{"Vendaje"},
	{"Cargador de PKM"},
	{"Cargador de M240"},
	{"Cargador de AS50"},
	{"MP5A5"},
	{"Cargador de MP5A5"},
	{"Mochila Coyote"},
}

----------------------------------
--- CODE
----------------------------------

function airdropCall(x, y, z, autodestroy)
	local key = #airplane + 1
	local angle = math.random(0, 360) -- get a random angle from 0º to 360º
	local startx = x + airplaneRadius * math.cos(math.rad(90 - angle))
	local starty = y + airplaneRadius * math.sin(math.rad(90 - angle))
	local endx = x - (airplaneRadius*2) * math.cos(math.rad(90 - angle))
	local endy = y - (airplaneRadius*2) * math.sin(math.rad(90 - angle))
	local findangle = 360 - math.deg(math.atan2((startx - x), (starty - y))) % 360

	airplane[key] = createObject(14553, startx, starty, z + airplaneHeight)
	setElementRotation(airplane[key], 15, 0, findangle)	
	setElementDoubleSided(airplane[key], true)

	moveObject(airplane[key], planeObjectTimer, endx, endy, z + airplaneHeight, 0, 0, 0)
	triggerClientEvent("onAirPlaneSound", root, {x, y, z}, airplaneRadius)
	
	setTimer(function(id, x, y, z, autodestroy)
		dropAirBox(id, x, y, z, autodestroy)
		destroyElement(airplane[id])
		airplane[id] = nil
	end, (planeObjectTimer / 2), 1, key, x, y, z, autodestroy)
end

function dropAirBox(id, x, y, z, autodestroy)
	local col = createColSphere(x, y, z, 3)
	droppedBox[id] = createObject(2903, x, y, z + (airplaneHeight-10))

	attachElements(col, droppedBox[id], 0, 0, 0)
	setElementData(droppedBox[id], "parent", col)
	setElementData(col, "hospitalbox", true)
	setElementData(col, "lootname", "Air drop")
	setElementData(col, "MAX_Slots", 20)
	
	for _, v in ipairs(lootTable) do
		local itemPlus = 1
		if v[1] == "12 Gauge" then
			itemPlus = 12
		elseif v[1] == "5.45x39mm" then
			itemPlus = 39
		elseif v[1] == "5.56x45mm" then
			itemPlus = 45
		elseif v[1] == "7.62x51mm" then
			itemPlus = 100
		elseif v[1] == "7.62x54mm" then
			itemPlus = 54
		elseif v[1] == "11.43x23mm" then
			itemPlus = 23
		elseif v[1] == "1866 Slug" then
			itemPlus = 10
		elseif v[1] == "9x18mm" then
			itemPlus = 18
		elseif v[1] == "9x19mm" then
			itemPlus = 19
		elseif v[1] == ".308 Winchester" then
			itemPlus = 14
		end
		setElementData(col, v[1], itemPlus*math.random(1,3))
	end
	
	setElementDoubleSided(droppedBox[id], true)
	setElementFrozen(droppedBox[id], true)

	setTimer(function(id, autodestroy)
		setElementModel(droppedBox[id], 2919)
		if autodestroy then
			setTimer(resetAirdrop, resetTimer, 1, id)
		end
	end, 8000, 1, id, autodestroy)
	
	moveObject(droppedBox[id], 8000, x, y, z+0.5)
end

function resetAirdrop(id)
	if isElement(getElementData(droppedBox[id], "parent")) then
		destroyElement(getElementData(droppedBox[id], "parent"))
	end	
	if isElement(droppedBox[id]) then
		destroyElement(droppedBox[id])
		droppedBox[id] = nil
	end
	if isElement(droppingBlip) then
		destroyElement(droppingBlip)
		droppingBlip = nil
	end
	initAirdrop()
end

function initAirdrop()
	local x, y, z = unpack(dropPositions[math.random(1, #dropPositions)])
	outputChatBox("[Air-Drop] AIRDROP en la zona [ "..getZoneName(x, y, z, false)..", "..getZoneName(x, y, z, true).." ]", root, 255, 50, 50, false)
	
	droppingBlip = createBlip(x, y, z, 56, 3)
	
	setTimer(airdropCall, 30000, 1, x, y, z, true)
end
initAirdrop()
--airdropCall(2494.33862, -1667.62671, 12.34375)
--airdropCall(2494.33862, -1669.62671, 12.34375)