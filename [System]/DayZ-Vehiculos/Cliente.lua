-----------------------
-- Autor: TheCrazy17 --
-- Fecha: 02/12/2015 --
-----------------------

screenW, screenH = guiGetScreenSize()
sx, sy = guiGetScreenSize()
resW, resH = 1024,768
sW, sH = (screenW/resW), (screenH/resH)
local roboto = dxCreateFont( "Fuentes/WorkSans.ttf", 10 ) 


function getElementSpeed(theElement, unit)
    -- Check arguments for errors
    assert(isElement(theElement), "Bad argument 1 @ getElementSpeed (element expected, got " .. type(theElement) .. ")")
    local elementType = getElementType(theElement)
    assert(elementType == "player" or elementType == "ped" or elementType == "object" or elementType == "vehicle" or elementType == "projectile", "Invalid element type @ getElementSpeed (player/ped/object/vehicle/projectile expected, got " .. elementType .. ")")
    assert((unit == nil or type(unit) == "string" or type(unit) == "number") and (unit == nil or (tonumber(unit) and (tonumber(unit) == 0 or tonumber(unit) == 1 or tonumber(unit) == 2)) or unit == "m/s" or unit == "km/h" or unit == "mph"), "Bad argument 2 @ getElementSpeed (invalid speed unit)")
    -- Default to m/s if no unit specified and 'ignore' argument type if the string contains a number
    unit = unit == nil and 0 or ((not tonumber(unit)) and unit or tonumber(unit))
    -- Setup our multiplier to convert the velocity to the specified unit
    local mult = (unit == 0 or unit == "m/s") and 50 or ((unit == 1 or unit == "km/h") and 180 or 111.84681456)
    -- Return the speed by calculating the length of the velocity vector, after converting the velocity to the specified unit
    return (Vector3(getElementVelocity(theElement)) * mult).length
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end



function updateIcons()	
	local Vehiculo = localPlayer.vehicle

	if Vehiculo and Vehiculo:getData('Combustible') and not Vehiculo:getData('VIP') and not isBike(Vehiculo.model) then
		if math.floor(Vehiculo:getData('Combustible')) == 0 and Vehiculo.engineState then
			setVehicleEngineState(Vehiculo, false)
		end

		local speedkmh = getElementSpeed(Vehiculo,1)
    	local roundedSpeedkmh = math.floor(speedkmh) == speedkmh and speedkmh or string.format(speedkmh, "%.1f")


		local Heatlh = math.floor( getElementHealth( Vehiculo )*10/100)
		local Gas = math.floor(Vehiculo:getData('Combustible') *100)/Vehiculo:getData('Combustible_Max')
		local currentTick = getTickCount()/440


		if tonumber(Vehiculo:getData('Motor')) == tonumber(Vehiculo:getData('Motor_Max')) then
			ColorEngine = tocolor(240, 255, 240, 170)
		else
			ColorEngine = tocolor(155, 68, 68, math.abs(math.sin(currentTick)*220))
		end

		if tonumber(Vehiculo:getData('Neumatico')) == tonumber(Vehiculo:getData('Neumatico_Max')) then
			ColorTires = tocolor(240, 255, 240, 170)
		else
			ColorTires = tocolor(155, 68, 68, math.abs(math.sin(currentTick)*220))
		end

		if tonumber(Gas) >= 15  then
			ColorGas = tocolor(240, 255, 240, 170)
		else
			ColorGas = tocolor(155, 68, 68, math.abs(math.sin(currentTick)*220))
		end

		if tonumber(Heatlh) >= 35  then
			ColorHealth = tocolor(240, 255, 240, 170)
		else
			ColorHealth = tocolor(155, 68, 68, math.abs(math.sin(currentTick)*220))
		end

		dxDrawRectangle(10*sW, 396*sH, 42*sW, 42*sH, tocolor(0, 0, 0, 170), false)
        dxDrawRectangle(10*sW, 302*sH, 42*sW, 42*sH, tocolor(0, 0, 0, 170), false)
        dxDrawRectangle(10*sW, 255*sH, 42*sW, 42*sH, tocolor(0, 0, 0, 170), false)
        dxDrawRectangle(10*sW, 208*sH, 42*sW, 42*sH, tocolor(0, 0, 0, 170), false)
        dxDrawRectangle(10*sW, 349*sH, 42*sW, 42*sH, tocolor(0, 0, 0, 170), false)
        dxDrawImage(14*sW, 307*sH, 32*sW, 32*sH, "images/engine.png", 0, 0, 0, ColorEngine, false)
	        dxDrawText(Vehiculo:getData('Motor').."/"..Vehiculo:getData('Motor_Max'), 56*sW - 1, 312*sH - 1, 105*sW - 1, 331*sH - 1, tocolor(0, 0, 0, 170), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText(Vehiculo:getData('Motor').."/"..Vehiculo:getData('Motor_Max'), 56*sW + 1, 312*sH - 1, 105*sW + 1, 331*sH - 1, tocolor(0, 0, 0, 170), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText(Vehiculo:getData('Motor').."/"..Vehiculo:getData('Motor_Max'), 56*sW - 1, 312*sH + 1, 105*sW - 1, 331*sH + 1, tocolor(0, 0, 0, 170), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText(Vehiculo:getData('Motor').."/"..Vehiculo:getData('Motor_Max'), 56*sW + 1, 312*sH + 1, 105*sW + 1, 331*sH + 1, tocolor(0, 0, 0, 170), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText(Vehiculo:getData('Motor').."/"..Vehiculo:getData('Motor_Max'), 56*sW, 312*sH, 105*sW, 331*sH, tocolor(240, 255, 240, 170), 1.00, roboto, "center", "top", false, false, false, false, false)
        dxDrawImage(15*sW, 260*sH, 32*sW, 32*sH, "images/fuel.png", 0, 0, 0, ColorGas, false)
	        dxDrawText(math.round(Gas, 0).."%", 58*sW - 1, 268*sH - 1, 107*sW - 1, 287*sH - 1, tocolor(0, 0, 0, 255), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText(math.round(Gas, 0).."%", 58*sW + 1, 268*sH - 1, 107*sW + 1, 287*sH - 1, tocolor(0, 0, 0, 255), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText(math.round(Gas, 0).."%", 58*sW - 1, 268*sH + 1, 107*sW - 1, 287*sH + 1, tocolor(0, 0, 0, 255), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText(math.round(Gas, 0).."%", 58*sW + 1, 268*sH + 1, 107*sW + 1, 287*sH + 1, tocolor(0, 0, 0, 255), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText(math.round(Gas, 0).."%", 58*sW, 268*sH, 107*sW, 287*sH, tocolor(240, 255, 240, 170), 1.00, roboto, "center", "top", false, false, false, false, false)
        dxDrawImage(16*sW, 213*sH, 32*sW, 32*sH, "images/speed.png", 0, 0, 0, tocolor(240, 255, 240, 170), false)
	        dxDrawText(math.round(roundedSpeedkmh, 0).." km/h", 58*sW - 1, 221*sH - 1, 107*sW - 1, 240*sH - 1, tocolor(0, 0, 0, 255), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText(math.round(roundedSpeedkmh, 0).." km/h", 58*sW + 1, 221*sH - 1, 107*sW + 1, 240*sH - 1, tocolor(0, 0, 0, 255), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText(math.round(roundedSpeedkmh, 0).." km/h", 58*sW - 1, 221*sH + 1, 107*sW - 1, 240*sH + 1, tocolor(0, 0, 0, 255), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText(math.round(roundedSpeedkmh, 0).." km/h", 58*sW + 1, 221*sH + 1, 107*sW + 1, 240*sH + 1, tocolor(0, 0, 0, 255), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText(math.round(roundedSpeedkmh, 0).." km/h", 58*sW, 221*sH, 107*sW, 240*sH, tocolor(240, 255, 240, 170), 1.00, roboto, "center", "top", false, false, false, false, false)
        dxDrawImage(14*sW, 401*sH, 32*sW, 32*sH, "images/health.png", 0, 0, 0, ColorHealth, false)
	        dxDrawText((Heatlh).."%", 56*sW - 1, 409*sH - 1, 105*sW - 1, 428*sH - 1, tocolor(0, 0, 0, 170), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText((Heatlh).."%", 56*sW + 1, 409*sH - 1, 105*sW + 1, 428*sH - 1, tocolor(0, 0, 0, 170), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText((Heatlh).."%", 56*sW - 1, 409*sH + 1, 105*sW - 1, 428*sH + 1, tocolor(0, 0, 0, 170), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText((Heatlh).."%", 56*sW + 1, 409*sH + 1, 105*sW + 1, 428*sH + 1, tocolor(0, 0, 0, 170), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText((Heatlh).."%", 56*sW, 409*sH, 105*sW, 428*sH, tocolor(240, 255, 240, 170), 1.00, roboto, "center", "top", false, false, false, false, false)
        dxDrawImage(14*sW, 354*sH, 32*sW, 32*sH, "images/tire.png", 0, 0, 0, ColorTires, false)
	        dxDrawText(Vehiculo:getData('Neumatico').."/"..Vehiculo:getData('Neumatico_Max'), 56*sW - 1, 359*sH - 1, 105*sW - 1, 378*sH - 1, tocolor(0, 0, 0, 170), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText(Vehiculo:getData('Neumatico').."/"..Vehiculo:getData('Neumatico_Max'), 56*sW + 1, 359*sH - 1, 105*sW + 1, 378*sH - 1, tocolor(0, 0, 0, 170), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText(Vehiculo:getData('Neumatico').."/"..Vehiculo:getData('Neumatico_Max'), 56*sW - 1, 359*sH + 1, 105*sW - 1, 378*sH + 1, tocolor(0, 0, 0, 170), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText(Vehiculo:getData('Neumatico').."/"..Vehiculo:getData('Neumatico_Max'), 56*sW + 1, 359*sH + 1, 105*sW + 1, 378*sH + 1, tocolor(0, 0, 0, 170), 1.00, roboto, "center", "top", false, false, false, false, false)
	        dxDrawText(Vehiculo:getData('Neumatico').."/"..Vehiculo:getData('Neumatico_Max'), 56*sW, 359*sH, 105*sW, 378*sH, tocolor(240, 255, 240, 170), 1.00, roboto, "center", "top", false, false, false, false, false)
	end
end
addEventHandler("onClientRender", getRootElement(), updateIcons)

function Vehiculos.Gasolina()
	Vehiculo = localPlayer.vehicle

	if Vehiculo and Vehiculo.engineState then
		if Vehiculo:getData('VIP') or isBike(Vehiculo.model) then return end

		Combustible = Vehiculo:getData('Combustible')
		Vehiculo:setData("Combustible", Combustible - 0.3)
	end
end
setTimer(Vehiculos.Gasolina, 30000, 0)

function onPlayerEnterDayzVehicle(veh, seat)
	if not seat == 1 then return end
	if veh:getData('VIP') or isBike(veh.model) then return end

	setVehicleEngineState(veh, false)

	local Combustible = tonumber(veh:getData('Combustible'))
	local Motor = tonumber(veh:getData('Motor'))
	local Neumatico = tonumber(veh:getData('Neumatico'))

	
	if tonumber(Combustible) > 0 and Motor == tonumber(veh:getData('Motor_Max')) and Neumatico == tonumber(veh:getData('Neumatico_Max')) then
		setVehicleEngineState(veh, true)
	end
	
end
addEventHandler("onClientPlayerVehicleEnter", localPlayer, onPlayerEnterDayzVehicle)

-----NOMBRE DE VEHICULOS---------
function vehicletag()
    local x,y,z = getElementPosition(getLocalPlayer())
    for i,veh in ipairs(getElementsByType("vehicle", getRootElement(), true)) do
        local px,py,pz = getElementPosition (veh)
        local vehID = getElementModel(veh)
        local vehicle = getPedOccupiedVehicle(getLocalPlayer())
        if veh ~= vehicle then
            if vehID ~= 548 then
            	local pdistance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
	            if pdistance <= 6 then
	                local sx,sy = getScreenFromWorldPosition ( px, py, pz+0.95, 0.06 )
	                if sx and sy then
		                local w = dxGetTextWidth(getVehicleName(veh),1.02,roboto)
		                --dxDrawText ( getVehicleName(veh), sx-(w/2) - 1, sy - 1, sx-(w/2) - 1, sy - 1, tocolor ( 0, 0, 0, 255 ), 1.00, roboto )
		                --dxDrawText ( getVehicleName(veh), sx-(w/2) - 1, sy + 1, sx-(w/2) - 1, sy + 1, tocolor ( 0, 0, 0, 255 ), 1.00, roboto )
		                --dxDrawText ( getVehicleName(veh), sx-(w/2) + 1, sy - 1, sx-(w/2) + 1, sy - 1, tocolor ( 0, 0, 0, 255 ), 1.00, roboto )
		                dxDrawText ( getVehicleName(veh), sx-(w/2) + 1, sy + 1, sx-(w/2) + 1, sy + 1, tocolor ( 0, 0, 0, 255 ), 1.00, roboto )
		                dxDrawText ( getVehicleName(veh), sx-(w/2), sy, sx-(w/2), sy, tocolor ( 255, 255, 255, 255 ), 1.00, roboto )    
		            end
	            end
            end
        end
    end
end
addEventHandler("onClientRender", getRootElement(), vehicletag)

bindKey('k', 'down', function()	
	local veh = getPedOccupiedVehicle(localPlayer)
	if not veh then return end

	local Combustible = tonumber(veh:getData('Combustible'))
	local Motor = tonumber(veh:getData('Motor'))
	local Neumatico = tonumber(veh:getData('Neumatico'))
	
	if Combustible >= 1 and Motor == tonumber(veh:getData('Motor_Max')) and Neumatico == tonumber(veh:getData('Neumatico_Max') or 0) then
		setVehicleEngineState(veh, not getVehicleEngineState(veh))
	end
end)

