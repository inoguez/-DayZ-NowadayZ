
--Verde fuerte #354242 rgb(53, 66, 66)
--Verde claro #588c8c rgb(88, 140, 140)
-- Arreglos para resolución de pantalla
local name = getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x", "")

local Visible = false

function DayZ.Monitor()
    if getElementData( getLocalPlayer(), "MostrarHUD" ) then return end
    if getElementData( getLocalPlayer(), "OcultarMonitor" ) then return end
	local Jug = localPlayer
	
	-------------
	-- Monitor --
	-------------
	
	local Inf1 = getElementData(Jug, "murders") or 0
	local Inf2 = getElementData(Jug, "zombieskilled") or 0
	local Inf3 = getElementData(Jug, "banditskilled") or 0
	local Inf4 = getElementData(Jug, "headshots") or 0
	local Inf5 = getElementData(Jug, "humanity") or 2500
	local Inf6 = getElementData(localPlayer, "blood") or 12000
	local Inf7 = getElementData(Jug, "alivetime") or 0 
	
	if Inf6 < 1 then
		Inf6 = 0
	end
		dxDrawRectangle(sW*1125, sH*239, sW*239, sH*105, tocolor(53, 66, 66, 255), false)
        dxDrawRectangle(sW*1125, sH*215, sW*239, sH*24, colorPrincipal, false)
        --dxDrawText(name, sW*1240 - 1, sH*215 - 1, sW*1265 - 1, sH*239 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "center", "center", false, false, false, true, false)
        --dxDrawText(name, sW*1240 + 1, sH*215 - 1, sW*1265 + 1, sH*239 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "center", "center", false, false, false, true, false)
        --dxDrawText(name, sW*1240 - 1, sH*215 + 1, sW*1265 - 1, sH*239 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "center", "center", false, false, false, true, false)
        dxDrawText(name, sW*1240 + 1, sH*215 + 1, sW*1265 + 1, sH*239 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "center", "center", false, false, false, true, false)
        dxDrawText(name, sW*1240, sH*215, sW*1265, sH*239, colorBlanco, 1.00, dxfont, "center", "center", false, false, false, true, false)
        --dxDrawText("Asesinatos:", sW*1135 - 1, sH*245 - 1, sW*1158 - 1, sH*267 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        --dxDrawText("Asesinatos:", sW*1135 + 1, sH*245 - 1, sW*1158 + 1, sH*267 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        --dxDrawText("Asesinatos:", sW*1135 - 1, sH*245 + 1, sW*1158 - 1, sH*267 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        dxDrawText("Asesinatos:", sW*1135 + 1, sH*245 + 1, sW*1158 + 1, sH*267 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        dxDrawText("Asesinatos:", sW*1135, sH*245, sW*1158, sH*267, colorBlanco, 1.00, dxfont, "left", "top", false, false, false, false, false)
        --dxDrawText("Zombies Asesinados:", sW*1135 - 1, sH*260 - 1, sW*1158 - 1, sH*287 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        --dxDrawText("Zombies Asesinados:", sW*1135 + 1, sH*260 - 1, sW*1158 + 1, sH*287 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        --dxDrawText("Zombies Asesinados:", sW*1135 - 1, sH*260 + 1, sW*1158 - 1, sH*287 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        dxDrawText("Zombies Asesinados:", sW*1135 + 1, sH*260 + 1, sW*1158 + 1, sH*287 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        dxDrawText("Zombies Asesinados:", sW*1135, sH*260, sW*1158, sH*287, colorBlanco, 1.00, dxfont, "left", "top", false, false, false, false, false)
        --dxDrawText("Headshots:", sW*1135 - 1, sH*275 - 1, sW*1158 - 1, sH*307 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        --dxDrawText("Headshots:", sW*1135 + 1, sH*275 - 1, sW*1158 + 1, sH*307 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        --dxDrawText("Headshots:", sW*1135 - 1, sH*275 + 1, sW*1158 - 1, sH*307 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        dxDrawText("Headshots:", sW*1135 + 1, sH*275 + 1, sW*1158 + 1, sH*307 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        dxDrawText("Headshots:", sW*1135, sH*275, sW*1158, sH*307, colorBlanco, 1.00, dxfont, "left", "top", false, false, false, false, false)
        --dxDrawText("Tiempo Vivo:", sW*1135 - 1, sH*290 - 1, sW*1158 - 1, sH*327 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        --dxDrawText("Tiempo Vivo:", sW*1135 + 1, sH*290 - 1, sW*1158 + 1, sH*327 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        --dxDrawText("Tiempo Vivo:", sW*1135 - 1, sH*290 + 1, sW*1158 - 1, sH*327 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        dxDrawText("Tiempo Vivo:", sW*1135 + 1, sH*290 + 1, sW*1158 + 1, sH*327 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        dxDrawText("Tiempo Vivo:", sW*1135, sH*290, sW*1158, sH*327, colorBlanco, 1.00, dxfont, "left", "top", false, false, false, false, false)
        --dxDrawText("Humanidad", sW*1135 - 1, sH*305 - 1, sW*1158 - 1, sH*347 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        --dxDrawText("Humanidad", sW*1135 + 1, sH*305 - 1, sW*1158 + 1, sH*347 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        --dxDrawText("Humanidad", sW*1135 - 1, sH*305 + 1, sW*1158 - 1, sH*347 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        dxDrawText("Humanidad", sW*1135 + 1, sH*305 + 1, sW*1158 + 1, sH*347 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        dxDrawText("Humanidad", sW*1135, sH*305, sW*1158, sH*347, colorBlanco, 1.00, dxfont, "left", "top", false, false, false, false, false)
        --dxDrawText("Sangre:", sW*1135 - 1, sH*320 - 1, sW*1158 - 1, sH*367 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        --dxDrawText("Sangre:", sW*1135 + 1, sH*320 - 1, sW*1158 + 1, sH*367 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        --dxDrawText("Sangre:", sW*1135 - 1, sH*320 + 1, sW*1158 - 1, sH*367 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        dxDrawText("Sangre:", sW*1135 + 1, sH*320 + 1, sW*1158 + 1, sH*367 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "top", false, false, false, false, false)
        dxDrawText("Sangre:", sW*1135, sH*320, sW*1158, sH*367, colorBlanco, 1.00, dxfont, "left", "top", false, false, false, false, false)
        --dxDrawText(Inf1, sW*1354 - 1, sH*245 - 1, sW*1354 - 1, sH*267 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        --dxDrawText(Inf1, sW*1354 + 1, sH*245 - 1, sW*1354 + 1, sH*267 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        --dxDrawText(Inf1, sW*1354 - 1, sH*245 + 1, sW*1354 - 1, sH*267 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        dxDrawText(Inf1, sW*1354 + 1, sH*245 + 1, sW*1354 + 1, sH*267 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        dxDrawText(Inf1, sW*1354, sH*245, sW*1354, sH*267, colorBlanco, 1.00, dxfont, "right", "top", false, false, false, false, false)
        --dxDrawText(Inf2, sW*1354 - 1, sH*260 - 1, sW*1354 - 1, sH*287 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        --dxDrawText(Inf2, sW*1354 + 1, sH*260 - 1, sW*1354 + 1, sH*287 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        --dxDrawText(Inf2, sW*1354 - 1, sH*260 + 1, sW*1354 - 1, sH*287 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        dxDrawText(Inf2, sW*1354 + 1, sH*260 + 1, sW*1354 + 1, sH*287 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        dxDrawText(Inf2, sW*1354, sH*260, sW*1354, sH*287, colorBlanco, 1.00, dxfont, "right", "top", false, false, false, false, false)
        --dxDrawText(Inf4, sW*1354 - 1, sH*275 - 1, sW*1354 - 1, sH*307 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        --dxDrawText(Inf4, sW*1354 + 1, sH*275 - 1, sW*1354 + 1, sH*307 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        --dxDrawText(Inf4, sW*1354 - 1, sH*275 + 1, sW*1354 - 1, sH*307 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        dxDrawText(Inf4, sW*1354 + 1, sH*275 + 1, sW*1354 + 1, sH*307 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        dxDrawText(Inf4, sW*1354, sH*275, sW*1354, sH*307, colorBlanco, 1.00, dxfont, "right", "top", false, false, false, false, false)
        --dxDrawText(tostring(formatTimeFromMinutess(Inf7).." min"), sW*1354 - 1, sH*290 - 1, sW*1354 - 1, sH*327 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        --dxDrawText(tostring(formatTimeFromMinutess(Inf7).." min"), sW*1354 + 1, sH*290 - 1, sW*1354 + 1, sH*327 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        --dxDrawText(tostring(formatTimeFromMinutess(Inf7).." min"), sW*1354 - 1, sH*290 + 1, sW*1354 - 1, sH*327 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        dxDrawText(tostring(formatTimeFromMinutess(Inf7).." min"), sW*1354 + 1, sH*290 + 1, sW*1354 + 1, sH*327 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        dxDrawText(tostring(formatTimeFromMinutess(Inf7).." min"), sW*1354, sH*290, sW*1354, sH*327, colorBlanco, 1.00, dxfont, "right", "top", false, false, false, false, false)
        --dxDrawText(Inf5, sW*1354 - 1, sH*305 - 1, sW*1354 - 1, sH*347 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        --dxDrawText(Inf5, sW*1354 + 1, sH*305 - 1, sW*1354 + 1, sH*347 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        --dxDrawText(Inf5, sW*1354 - 1, sH*305 + 1, sW*1354 - 1, sH*347 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        dxDrawText(Inf5, sW*1354 + 1, sH*305 + 1, sW*1354 + 1, sH*347 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        dxDrawText(Inf5, sW*1354, sH*305, sW*1354, sH*347, colorBlanco, 1.00, dxfont, "right", "top", false, false, false, false, false)
        --dxDrawText(math.floor(Inf6), sW*1354 - 1, sH*320 - 1, sW*1354 - 1, sH*367 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        --dxDrawText(math.floor(Inf6), sW*1354 + 1, sH*320 - 1, sW*1354 + 1, sH*367 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        --dxDrawText(math.floor(Inf6), sW*1354 - 1, sH*320 + 1, sW*1354 - 1, sH*367 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        dxDrawText(math.floor(Inf6), sW*1354 + 1, sH*320 + 1, sW*1354 + 1, sH*367 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "top", false, false, false, false, false)
        dxDrawText(math.floor(Inf6), sW*1354, sH*320, sW*1354, sH*367, colorBlanco, 1.00, dxfont, "right", "top", false, false, false, false, false)
	
	-----------
	-- Reloj --
	-----------
	local Reloj = getElementData(Jug, "Reloj")
	if Reloj and Reloj >= 1 then
		--Se obtiene el horario
		local Hora, Minutos = getTime()
		
		--Se dibuja el horario
		--dxDrawText(Hora..":"..(((Minutos < 10) and "0"..Minutos) or Minutos), sW*1223 - 1, sH*215 - 1, sW*1261 - 1, sH*239 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "center", false, false, false, false, false)
        --dxDrawText(Hora..":"..(((Minutos < 10) and "0"..Minutos) or Minutos), sW*1223 + 1, sH*215 - 1, sW*1261 + 1, sH*239 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "center", false, false, false, false, false)
        --dxDrawText(Hora..":"..(((Minutos < 10) and "0"..Minutos) or Minutos), sW*1223 - 1, sH*215 + 1, sW*1261 - 1, sH*239 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "center", false, false, false, false, false)
        dxDrawText(Hora..":"..(((Minutos < 10) and "0"..Minutos) or Minutos), sW*1223 + 1, sH*490 + 1, sW*1261 + 1, sH*239 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "right", "center", false, false, false, false, false)
        dxDrawText(Hora..":"..(((Minutos < 10) and "0"..Minutos) or Minutos), sW*1223, sH*490, sW*1261, sH*239, colorBlanco, 1.00, dxfont, "right", "center", false, false, false, false, false)
	end
end

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
     if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
          local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
          if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
               for i, v in ipairs( aAttachedFunctions ) do
                    if v == func then
                     return true
                end
           end
      end
     end
     return false
end

-- Funcion para cambiar el estado del monitor (Encender/Apagar)
function EstadoMonitorToggle()
    if not isEventHandlerAdded( 'onClientRender', root, DayZ.Monitor) then
        addEventHandler("onClientRender", root, DayZ.Monitor)
    else
        removeEventHandler("onClientRender", root, DayZ.Monitor)
    end
end
addEvent( "EstadoMonitorToggle", true)
addEventHandler( "EstadoMonitorToggle", root, EstadoMonitorToggle)

function DayZ.EstadoMonitor()
	-- Se chequea la visibilidad del monitor
	if not Visible then
		addEventHandler("onClientRender", root, DayZ.Monitor)
		Visible = true
	else
		removeEventHandler("onClientRender", root, DayZ.Monitor)
		Visible = false
	end
end

function DayZ.ActivarMonitor()
	addEventHandler("onClientRender", root, DayZ.Monitor)
	bindKey("F5", "down", DayZ.EstadoMonitor)
	Visible = true
end
addEvent("onClientPlayerDayZLogin", true)
addEventHandler("onClientPlayerDayZLogin", root, DayZ.ActivarMonitor)

function mapaactivar()
	addEventHandler("onClientRender", root, DayZ.Monitor)
	Visible = true
end
addEvent("mapaactivar", true)
addEventHandler("mapaactivar", root, mapaactivar)

function mapadesactivar()
	removeEventHandler("onClientRender", root, DayZ.Monitor)
	Visible = false
end
addEvent("mapadesactivar", true)
addEventHandler("mapadesactivar", root, mapadesactivar)

function formatTimeFromMinutess(value)
  if value then
   -- local weekday = math.floor(value / 6)
    local hours = math.floor(value / 60)
  --  local minutes = math.round((value / 60 - math.floor(value / 60)) * 100 / 1.6666666666666667)
    local minutes = math.floor(value-60*hours)
   if hours < 10 then
      hours = "0" .. hours
    end
   if minutes < 10 then
      minutes = "0" .. minutes
    end
    value = hours .. ":" .. minutes
    return value
  end
  return false
end