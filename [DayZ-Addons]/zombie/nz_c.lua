--By Fanbox 

checkZombies = function()
	for i,ped in ipairs(getElementsByType("ped",root,true)) do
		if getElementData(ped, "zombie") and not getElementData ( ped, "target" ) then
			local x,y,z = getElementPosition ( localPlayer )
			local zx,zy,zz = getElementPosition (ped)
			local zfrontx, zfronty, zfrontz = getPositionInfrontOfElement(ped, 3)
			
			local vect1X, vect1Y =  zx-x, zy-z
			local vect2X, vect2Y = zfrontx-zx, zfronty - zy
			
			local scal = vect2X*vect1X+vect2Y*vect1Y

			local distance = getDistanceBetweenPoints3D ( x,y,z, zx,zy,zz )
			local ready = true
			if ( distance > 20) then -- Відстань через яку він вас побачить і почує (ДАЛЕКО)
				ready = false 
			end
			if ready then
				triggerServerEvent ( "chasedStartAttackC", getLocalPlayer(), ped )
			elseif getElementData(ped, "target") == getLocalPlayer() and not getElementData ( ped, 'running' ) then
				setElementData(ped, "target", nil)
			end
		end
	end
end
setTimer(checkZombies, 2000, 0)
setElementData ( localPlayer, "spawnedzombies", 0 )


checkAnimal = function()
	for i,ped in ipairs(getElementsByType("ped",root,true)) do
		if getElementData(ped, "animal") and not getElementData ( ped, "target" ) then
			local x,y,z = getElementPosition ( localPlayer )
			local zx,zy,zz = getElementPosition (ped)
			local zfrontx, zfronty, zfrontz = getPositionInfrontOfElement(ped, 3)
			
			local vect1X, vect1Y =  zx-x, zy-z
			local vect2X, vect2Y = zfrontx-zx, zfronty - zy
			
			local scal = vect2X*vect1X+vect2Y*vect1Y
			
			local distance = getDistanceBetweenPoints3D ( x,y,z, zx,zy,zz )
			local ready = true
			if ( distance > 20) then -- Відстань через яку він вас побачить і почує (ДАЛЕКО)
				ready = false 
			end
			if ready then
				triggerServerEvent ( "animalStopFollow", getLocalPlayer(), ped )
			elseif getElementData(ped, "target") == getLocalPlayer() and not getElementData ( ped, 'running' ) then
				setElementData(ped, "target", nil)
			end
		end
	end
end
setTimer(checkAnimal, 2000, 0)
setElementData ( localPlayer, "spawnedzombies", 0 )

checkKiller = function()
	for i,ped in ipairs(getElementsByType("ped",root,true)) do
		if getElementData(ped, "killer") and not getElementData ( ped, "target" ) then
			local x,y,z = getElementPosition ( localPlayer )
			local zx,zy,zz = getElementPosition (ped)
			local zfrontx, zfronty, zfrontz = getPositionInfrontOfElement(ped, 3)
			
			local vect1X, vect1Y =  zx-x, zy-z
			local vect2X, vect2Y = zfrontx-zx, zfronty - zy
			
			local scal = vect2X*vect1X+vect2Y*vect1Y
			
			local ready = true
			
			if ready then
				triggerServerEvent ( "chasedStartAttackC", getLocalPlayer(), ped )
			elseif getElementData(ped, "target") == getLocalPlayer() and not getElementData ( ped, 'running' ) then
				setElementData(ped, "target", nil)
			end
		end
	end
end
setTimer(checkKiller, 2000, 0)
setElementData ( localPlayer, "spawnedzombies", 0 )


function zombieJump(ped)
	if (isElement(source)) then
		setPedControlState(source,"jump",true)
		setTimer(function(source) 
			if (isElement(source)) then 
				setPedControlState(source,"jump",false) 
			end 
		end,800,1,source)
	end
end
addEventHandler("bot_Jump",getRootElement(),zombieJump)
addEvent("bot_Jump",true)

function getPositionInfrontOfElement(element, meters)
    if not element or not isElement(element) then
        return false
    end
    if not meters then
        meters = 3
    end
    local posX, posY, posZ = getElementPosition(element)
    local _, _, rotation = getElementRotation(element)
    posX = posX - math.sin(math.rad(rotation)) * meters
    posY = posY + math.cos(math.rad(rotation)) * meters
    return posX, posY, posZ
end

local fires = 0
local shotCheckAvailable = true

function onClientPlayerWeaponFireFunc(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement )
	if getElementData ( localPlayer, "isPlayerZombie" ) then return true end
	if shotCheckAvailable then
		if weapon > 9 and weapon ~= 23 then
			shotCheckAvailable = false
			setTimer ( function () shotCheckAvailable = true end, 4000, 1 )
			local zombs = getElementsByType ( "ped", getRootElement(), true )
			local x,y,z = getElementPosition ( localPlayer )
			for i,zomb in ipairs(zombs) do 
				if not getElementData ( zomb, "target" ) and not getElementData ( zomb, "zHeared" ) then
					local zx,zy,zz = getElementPosition (zomb)
					if getDistanceBetweenPoints3D ( x,y,z, zx,zy,zz ) < 50 then
						triggerServerEvent ("zombieHeared", localPlayer, zomb )
					end
				end
			end
		end
	end
end
addEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), onClientPlayerWeaponFireFunc )

function findRotation(x1,y1,x2,y2)
	local t = -math.deg(math.atan2(x2-x1,y2-y1))
	if t < 0 then t = t + 360 end;
	return t
end
--B