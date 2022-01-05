--// Proposito: Interfaz grafica del servidor

local HUD = {}
local sx,sy=guiGetScreenSize() 
local ax,ay = 1280,1024  

function getPlayerWeaponName(Slot)
	if Slot == 1 or Slot == 2 or Slot == 4 then
		return localPlayer:getData('currentweapon_2')
	elseif Slot == 3 or Slot == 5 or Slot == 6 then
		return localPlayer:getData('currentweapon_1')
	elseif Slot == 8 or Slot == 9 or Slot == 1 then
		return localPlayer:getData('currentweapon_3')
	elseif Slot == 11 then
		return 'Paracaidas'
	else
		return 'Puño'
	end
end

function HUD.Render(weapName )
if getElementData( getLocalPlayer(), "MostrarHUD" ) then return end
if getElementData(getLocalPlayer(), "OcultarArmaActual") then return end
if getElementData( getLocalPlayer(), "Iniciado") then
	local Vehiculo = localPlayer.vehicle

	local Slot = getPedWeaponSlot(localPlayer)

	local Weapon = getPlayerWeaponName(Slot)
	local Clip = getPedAmmoInClip(getLocalPlayer())
	local Bullets = getPedTotalAmmo(getLocalPlayer())

		dxDrawText(Weapon, sx*(1130/ax) + 1, sy*(10/ay) + 1, sx*(1270/ax) + 1, sy*(27/ay) + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "center", false, false, false, false, false)
        dxDrawText(Weapon, sx*(1130/ax), sy*(10/ay), sx*(1270/ax) , sy*(27/ay), tocolor(240, 255, 240, 255), 1.00, dxfont, "right", "center", false, false, false, false, false)

        dxDrawText(Clip.." | "..Bullets - Clip, sx*(1201/ax) + 1, sy*(27/ay) + 1, sx*(1270/ax) + 1, sy*(44/ay) + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "center", false, false, false, false, false)
        dxDrawText(Clip.." | "..Bullets - Clip, sx*(1201/ax), sy*(27/ay), sx*(1270/ax), sy*(44/ay), tocolor(240, 255, 240, 255), 1.00, dxfont, "right", "center", false, false, false, false, false)
end
end
addEventHandler("onClientRender", getRootElement(), HUD.Render)

