local throwInMinute = 30 
local change_fire_button = "G" 

Granada = {}

Granada["AK-74 GP-25"] = "Granada"
Granada["AK-107 GL"] = "Granada"
Granada["AK-107 GL PSO"] = "Granada"


local throwAvail = true

function throwGrenade()
	if not throwAvail or not getPedControlState ( "aim_weapon" ) or not getElementData(localPlayer, "Granada") then return true end
	local weaponID = getPedWeapon(localPlayer)
	local weapon2 = getElementData ( localPlayer, "currentweapon_1")

	if weaponID == 0 then return true end

	if Granada[weapon2] then
		if ( getElementData ( localPlayer, Granada[weapon2] ) or 0 ) > 0 then
			throwAvail = false
			setElementData ( localPlayer, Granada[weapon2], ( getElementData ( localPlayer, Granada[weapon2] ) or 1 ) - 1 )
			local xm, ym, zm = getPedWeaponMuzzlePosition ( localPlayer )
			local infx,infy,infz = getPositionInfrontOfLP ()
			local x, y, z, lx, ly, lz, roll, dof = getCameraMatrix ()
			local velx, vely = (infx-x)*0.2, (infy-y)*0.2
			createProjectile(getLocalPlayer(),16,xm,ym,zm-0.05,0,nil,0,0,0,velx, vely,lz-z+0.1)
			local uSound = playSound3D( 'Sonidos/Lanzagranadas.wav', x, y, z ) 
			setTimer ( function () throwAvail = true end, 60/throwInMinute*1000, 1)
		else
			triggerEvent ("DayZ:MostrarMensaje", getLocalPlayer(),"Usted no tiene granadas en su inventario",255,0,0)
		end
	end
end

function getPositionInfrontOfLP()
    local posX, posY, posZ = getElementPosition(localPlayer)
    local _, _, rotation = getElementRotation(localPlayer)
	rotation = rotation-15
    posX = ( posX - math.sin(math.rad(rotation)) ) 
    posY = ( posY + math.cos(math.rad(rotation)) ) 
    return posX, posY, posZ
end

function playerUsedGrenadeThrower ( player )
	if isElement ( player ) then
		if getElementData ( player, "usingGrenadeThrower" ) and ( getElementData ( player, "usingGrenadeThrower" ) == getElementData ( localPlayer, "currentweapon_1") or getElementData ( player, "usingGrenadeThrower" ) == getElementData ( localPlayer, "currentweapon_2") )then
			return true
		else
			return false
		end
	else
		return false
	end
end

function changeFiringMode ()
	if getPedControlState ( "aim_weapon" ) then
		if getElementData ( localPlayer, "usingGrenadeThrower" ) then
			setElementData ( localPlayer, "usingGrenadeThrower", false )
			unbindKey ( "mouse1", "down", throwGrenade )
			toggleControl ( "fire", true )
			playSound ("Sonidos/Lanzagranadas_Recarga.wav")
			triggerEvent ("DayZ:MostrarMensaje", getLocalPlayer(),"Lanzagranadas Desactivado",255,0,0)
		else
			local weapon = getElementData ( localPlayer, "currentweapon_1")
			if weapon and Granada[weapon] and (getElementData ( localPlayer, Granada[weapon]) or 0) >= 1 then 
				setElementData ( localPlayer, "usingGrenadeThrower", weapon )
				bindKey ( "mouse1", "down", throwGrenade )
				toggleControl ( "fire", false )
				playSound ("Sonidos/Lanzagranadas_Recarga.wav")
				triggerEvent ("DayZ:MostrarMensaje", getLocalPlayer(),"Lanzagranadas Activado",0,255,0)
			else
				triggerEvent ("DayZ:MostrarMensaje", getLocalPlayer(),"Esta arma no cuenta con lanzagranadas",255,0,0)
			end
		end
	end
end

bindKey ( change_fire_button, "up", changeFiringMode )