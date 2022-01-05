--// Creador: TheCrazy
--// Fecha: 09/08/2016
--// Proposito: Funcionamiento de los items

Items = {}
local h1, h2, h3 = debug.gethook () 
debug.sethook ()

function onPlayerRequestChangingStats(itemName, itemInfo, data)
	if source:getData(itemName) <= 0 then return end

	source:setData(itemName, source:getData(itemName) - 1)

	if data == "food" then
		if itemName == "Carne cocida" then
			blood = 10
		elseif itemName == "Frijoles enlatados" then
			blood = 10
		elseif itemName == "Pasta enlatada" then
			blood = 10
		end
		setPedAnimation(source, "FOOD", "EAT_Burger", -1, false, false, nil, false)
		source:setData('blood', source:getData('blood') + blood)
		if source:getData('blood') > 12000 then
			source:setData('blood', 12000)
		end
		source:setData(data, 100)
	elseif data == "thirst" then
		source:setData(data, 100)
		setPedAnimation(source, "VENDING", "VEND_Drink2_P", -1, false, false, nil, false)
		if itemName == "Botella de agua" then
			setElementData(source, "Botella vacia", (getElementData(source, "Botella vacia") or 0) + 1)
		end
	end
	triggerClientEvent(source, 'DayZ:MostrarMensaje', source, "Has consumido: " .. itemName)
	triggerClientEvent(source, "refreshInventoryManual", source)
end
addEvent("onPlayerRequestChangingStats", true)
addEventHandler("onPlayerRequestChangingStats", getRootElement(), onPlayerRequestChangingStats)

function useMedicObject(Item, localPlayer)
	-- Se chequea si el jugador posee el item
	if source:getData(Item) <= 0 then return end

	source:setAnimation('BOMBER', 'BOM_Plant', -1, false, false, nil, false)
	source:setData(Item, source:getData(Item) - 1)

	setTimer(function(source)
		if Item == 'Vendaje' then
			source:setData('bleeding', 0)
		elseif Item == 'Botiquin' then
			source:setData('blood', source:getData('blood') + 8500)
			source:setData('bleeding', 0)
			
			if source:getData('blood') > 12000 then
				source:setData('blood', 12000)
			end
		elseif Item == 'Bolsa termica' then
			source:setData('cold', false)
			source:setData('temperature', 37)
		elseif Item == 'Analgésicos' then
			source:setData('pain', 0)		
		elseif Item == 'Morfina' then
			source:setData('brokenbone', 0)
		elseif Item == 'Bolsa de sangre' then
			addPlayerStats(source, 'blood', 12000)
		end
	end, 1500, 1, source)

	triggerClientEvent(source, 'refreshInventoryManual', source)
end
addEvent('onPlayerUseMedicObject', true)
addEventHandler('onPlayerUseMedicObject', getRootElement(), useMedicObject)

function Items.AplicarMedicina(Item, Jugador)
	-- Se chequea si el jugador posee el item
	if source:getData(Item) == 0 then return end

	source:setAnimation('BOMBER', 'BOM_Plant', -1, false, false, nil, false)
	source:setData(Item, source:getData(Item) - 1)
	
	setTimer(function(source)
		if Item == 'Vendaje' then
			Jugador:setData('bleeding', 0)
			source:setData('humanity', source:getData('humanity') + 40)
		elseif Item == 'Bolsa de sangre' then
			Jugador:setData('blood', 12000)
			source:setData('humanity', source:getData('humanity') + 100)
	    elseif Item == 'Morfina' then
			Jugador:setData('brokenbone', 0)
	    elseif Item == 'Analgésicos' then
			Jugador:setData('pain', 0)
			triggerEvent( "Chequeo:Jug", source)
		end
	end, 1500, 1, source)
end
addEvent('Items:AplicarMedicina', true)
addEventHandler('Items:AplicarMedicina', getRootElement(), Items.AplicarMedicina)

function onPlayerRefillWaterBottle()
	if not isElementInWater(source) then
		triggerClientEvent(source, 'DayZ:MostrarMensaje', source, 'Debes estar en el agua para llenar una botella!')
		return
	end
    
	source:setData('Botella de agua', (source:getData('Botella de agua') or 0) + 1)
    source:setData('Botella vacia', source:getData('Botella vacia') - 1)
    triggerClientEvent(source, "refreshInventoryManual", source)
    triggerClientEvent(source, 'DayZ:MostrarMensaje', source, "Has rellenado tu botella con agua!")
end
addEvent("onPlayerRefillWaterBottle", true)
addEventHandler("onPlayerRefillWaterBottle", getRootElement(), onPlayerRefillWaterBottle)

function onPlayerBuildAWireFence(Datos)
	source:setData('Valla de alambre', source:getData('Valla de alambre') - 1)
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false)

  setTimer(function(Datos)
    tent = createObject(2411, Datos.X, Datos.Y, Datos.Z, 0, 0, Datos.Rot)
	setElementDoubleSided(tent, true)
    tentCol = createColSphere(Datos.X, Datos.Y, Datos.Z, 2)
    attachElements(tentCol, tent, 0, 0, 0)
    setElementData(tentCol, "parent", tent)
    setElementData(tent, "parent", tentCol)
    setElementData(tentCol, "wirefence", true)
  end, 1500, 1, Datos)
end
addEvent("Objetos:Construir", true)
addEventHandler("Objetos:Construir", getRootElement(), onPlayerBuildAWireFence)

function removeWirefence(Col)
  destroyElement(getElementData(Col, "parent"))
  destroyElement(Col)

	local X, Y, Z = getElementPosition(source)

	Info = {}
	
	Info.X = X
	Info.Y = Y
	Info.Z = Z - 0.875
	Info.Item = 'Valla de alambre'

	triggerEvent("Items:Crear", root, Info)
end
addEvent("removeWirefence", true)
addEventHandler("removeWirefence", getRootElement(), removeWirefence)

-----------------------
-----TentFull----------
-------------------
--[[
function removeWirefence(Col)
  destroyElement(getElementData(Col, "parent"))
  destroyElement(Col)

	local X, Y, Z = getElementPosition(source)

	Info = {}
	
	Info.X = X
	Info.Y = Y
	Info.Z = Z - 0.875
	Info.Item = 'Valla de alambre'

	triggerEvent("Items:Crear", root, Info)
end
addEvent("removeWirefence", true)
addEventHandler("removeWirefence", getRootElement(), removeWirefence)]]

-----------------------
-----MINA----------
-------------------

function onPlayerBuildAMiNe(Datos) 
	source:setData('Mina explosiva', source:getData('Mina explosiva') - 1)
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false)
	
	setTimer(function(Datos)
    local carmine = createObject(1510, Datos.X, Datos.Y, Datos.Z, 0, 0, Datos.Rot)
	setElementDoubleSided(carmine, true)
    carmineCol = createColSphere(Datos.X, Datos.Y, Datos.Z, 2.5)
    attachElements(carmineCol, carmine, 0, 0, 0)
	setElementData(carmineCol,"type","pedhit")
    setElementData(carmineCol, "carmine", carmine)
    setElementData(carmineCol, "terror", source)
  end, 1500, 1, Datos)
end
addEvent("Objetos:ConstruirMina", true)
addEventHandler("Objetos:ConstruirMina", getRootElement(), onPlayerBuildAMiNe)

function boomCarmine(player)
   if (getElementData (source, "type") == "pedhit") then
      local carmine = getElementData(source, "carmine")
      local terror = getElementData (source, "terror")
      local x,y,z = getElementPosition (source)
      setTimer(function(carmine_destroy)
         if not isElement ( carmine_destroy ) then return true end
         local mx,my,mz = getElementPosition(carmine_destroy)
         local px,py,pz = getElementPosition(player)
         local distance = getDistanceBetweenPoints3D(px,py,pz,mx,my,mz) or 0
         if distance <= 1.7 then
            setElementData(player,"blood",getElementData(player,"blood")-12000)
			createExplosion(x,y,z,4,terror)
			
            destroyElement(carmine_destroy)
			destroyElement(carmineCol)
         end
      end,300,1, carmine)
   end
end
addEventHandler("onColShapeHit", getRootElement(), boomCarmine)

function removeMina(Col)
  destroyElement(getElementData(Col, "carmine"))
  destroyElement(Col)


	local X, Y, Z = getElementPosition(source)

	Info = {}
	
	Info.X = X
	Info.Y = Y
	Info.Z = Z - 0.875
	Info.Item = 'Mina explosiva'

	triggerEvent("Items:Crear", root, Info)
end
addEvent("removeMina", true)
addEventHandler("removeMina", getRootElement(), removeMina)

-------------------TRAMPA DE OSO--------------
----------------------------------------------
----------------------------------------------

traps = {}

createBearTrap = function(Datos)
    source:setData('Trampa de oso', source:getData('Trampa de oso') - 1)
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false)
	
	setTimer(function(Datos)
    local trap = createObject(1923, Datos.X, Datos.Y, Datos.Z, 0, 0, Datos.Rot)
	setElementDoubleSided(trap, true)
    table.insert ( traps, trap )
	local shapeFar = createColSphere(Datos.X, Datos.Y, Datos.Z, 2)
	attachElements(shapeFar, trap, 0, 0, 0)
    local shapeFar = createColSphere ( Datos.X, Datos.Y, Datos.Z, 1 )
    setElementData ( shapeFar, "trap", true )
    setElementData ( shapeFar, "objectLink", trap )
    setElementData ( shapeFar, "farShapeLink", shapeFar )
    setElementData ( shapeFar, "nearShapeLink", shapeFar )
    setElementData ( shapeFar, "objectLink", trap )
    setElementData ( shapeFar, "trapFar", true )
  end, 1500, 1, Datos)
end
addEvent("Objetos:ConstruirTrampa", true)
addEventHandler("Objetos:ConstruirTrampa", getRootElement(), createBearTrap)

function checkTrapPlace( theElement, matchingDimension )
    if ( getElementType ( theElement ) == 'player' ) and matchingDimension then
        if getElementData ( source, "trapFar" ) then
            setElementData ( theElement, "nearTrap", true )
        elseif getElementData ( source, "trap" ) then 
            if not getElementData ( source, "closed" ) and not getPedOccupiedVehicle ( theElement ) then
                local object = getElementData ( source, "objectLink" )
                if isElement ( object ) then
                    setElementData ( source, "closed", true )
                    setElementModel ( object, 1918 )
                    setElementData(theElement, "brokenbone",1)
					setElementData(theElement,"blood",getElementData(theElement,"blood")-2500)
                    setElementData(theElement, "bleeding", getElementData(theElement, "bleeding") + 10)
                    triggerClientEvent ( theElement, "playTrapSound", source )
                end
            end
        end
    end
end
addEventHandler("onColShapeHit",getRootElement(),checkTrapPlace)

function removeTrampa(Col)
  destroyElement(getElementData(Col, "objectLink"))
  destroyElement(Col)


	local X, Y, Z = getElementPosition(source)

	Info = {}
	
	Info.X = X
	Info.Y = Y
	Info.Z = Z - 0.875
	Info.Item = 'Trampa de oso'

	triggerEvent("Items:Crear", root, Info)
end
addEvent("removeTrampa", true)
addEventHandler("removeTrampa", getRootElement(), removeTrampa)

openTrap = function( )
    setElementData ( source, "inUse", false )
    setElementData ( source, "closed", false )
    setElementModel ( getElementData ( source, "objectLink" ), 1923 )
end

addEvent("openTrapC", true)
addEventHandler("openTrapC", getRootElement(), openTrap)

-------------------------------------
-------------FOGATA--------------------
-----------------------------------------

function onPlayerMakeAFire(itemName)
  fogo = "Caja de cerillas"
  setElementData(source, "Madera", getElementData(source, "Madera") - 1)
  if source:getData(fogo) == 0 then return end
  source:setAnimation('BOMBER', 'BOM_Plant', -1, false, false, nil, false)
  source:setData(fogo, source:getData(fogo) - 1)
  local x, y, z = getElementPosition(source)
  local xr, yr, zr = getElementRotation(source)
  px, py, pz = getElementPosition(source)
  prot = getPedRotation(source)
  local offsetRot = math.rad(prot + 90)
  local vx = px + 1 * math.cos(offsetRot)
  local vy = py + 1 * math.sin(offsetRot)
  local vz = pz + 2
  local vrot = prot + 90
  local wood = createObject(2684, vx, vy, pz - 0.75, xr, yr, vrot)
  setObjectScale(wood, 0.5)
  local fire = createObject(3525, vx, vy, pz - 0.75, xr, yr, vrot)
  setObjectScale(fire, 0)
  local fireCol = createColSphere(x, y, z, 2)
  setElementData(fireCol, "parent", wood)
  setElementData(fire, "parent", fireCol)
  setElementData(fireCol, "fireplace", true)
  setTimer(function()
    destroyElement(fireCol)
    destroyElement(fire)
    destroyElement(wood)
  end, 200000, 1)
end
addEvent("onPlayerMakeAFire",true) 
addEventHandler("onPlayerMakeAFire",getRootElement(),onPlayerMakeAFire)

function onPlayerPlaceRoadflare (itemName) 
setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false) 
setElementData(source,itemName,getElementData(source,itemName)-1)
  local x, y, z = getElementPosition(source)
  local xr, yr, zr = getElementRotation(source)
  px, py, pz = getElementPosition(source)
  prot = getPedRotation(source)
  local offsetRot = math.rad(prot + 90)
  local vx = px + 1 * math.cos(offsetRot)
  local vy = py + 1 * math.sin(offsetRot)
  local vz = pz + 2
  local vrot = prot + 90
  local bengala = createObject(2573, vx, vy, pz - 0.75, xr, yr, vrot)
  setTimer(function()
    destroyElement(bengala)
  end, 200000, 1)
end 
addEvent("onPlayerPlaceRoadflare",true) 
addEventHandler("onPlayerPlaceRoadflare",getRootElement(),onPlayerPlaceRoadflare)
