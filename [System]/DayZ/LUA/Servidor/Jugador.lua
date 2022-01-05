--// Creador: TheCrazy
--// Fecha: 17/07/2016
--// Proposito: Funcionamiento vario de los jugadores

Jugador = {}

-- Muerte de un jugador
function Jugador.Muerte(Info)
	-- Se cierra el inventario del jugador muerto
	triggerClientEvent(source, "hideInventoryManual", source)
	-- Se asigna la variable 'Asesino'
	if Info.Atacante and isElement(Info.Atacante) then
		Asesino = Info.Atacante
	end
	if Info.Muerto then
		removePedFromVehicle(source)
	end

	if source:getData('Attached') then
        triggerEvent("ungluePlayer", source)
    end

	spawnPlayer(source, math.random(-3000, 3000), math.random(-3000, 3000), 950)
	setElementFrozen(source, true)
 
    setTimer(function(Jug) if isElement(Jug) then setElementFrozen(Jug, false) end end, 6000, 1)

	local blip = createBlip(Info.X, Info.Y, Info.Z, 0, 1, 255, 0, 0, 255, 0, 150)
	setTimer(function(blip) if isElement(blip) then destroyElement(blip) end end, 300000, 1, blip)

	source:setData('murders', 0)
 
    if source:getData('headshot') and isElement(Asesino) then
        Asesino:setData('headshots', (Asesino:getData('headshots') or 0) + 1)
    end

	if Info.Tiempo >= 5 then
		local Ped = createPed(Info.Modelo, Info.X, Info.Y, Info.Z, Info.rZ)
		setElementHealth(Ped, 0)

		if source:getData('headshot') then
			setPedHeadless(Ped, true)
		end

		if Info.Modelo == 0 then
			for i, v in ipairs ( itemsPacks ) do
				if getElementModel ( Ped ) == 0 then
					local cur_cloth = getElementData ( source, "cloth"..v[2]) or v[3]
			        setPedClothes ( Ped, v[2], cur_cloth )
			    end
        	end 
		end

		local Col = createColSphere(Info.X, Info.Y, Info.Z, 1.5)
		attachElements(Col, Ped, 0, 0, 0)
		Col:setData('parent', Ped)
		Col:setData('playername', source.name)
		Col:setData('deadman', true)
		Col:setData('MAX_Slots', 20)

		-- Se obtiene el tiempo real de muerte
		local Tiempo = getRealTime()
		local Horas = Tiempo.hour
		local Minutos = Tiempo.minute

		-- Se le asigna la causa de muerte
		if Asesino then
			Causa = Asesino.name
		else
			Causa = 'Desconocido'
		end

		Col:setData('deadreason', 'Fue asesinado por '..Causa:gsub("#%x%x%x%x%x%x", "")..' a las '..Horas..':'..Minutos..' horas, ten cuidado podría estar cerca.')

		local Items = split(Info.Items, ";")

		for k, v in ipairs(Items) do
			local Item = split(v, ":")
			Col:setData(Item[1], tonumber(Item[2]))
		end

		setTimer(destroyElement, 600000, 1, Ped)
		setTimer(destroyElement, 600000, 1, Col)

	end

	triggerEvent('ActualizarMochila', source, false, 8)

	takeAllWeapons(source)

	for i = 1, 3 do
		source:setData('currentweapon_'..i, false)
	end

	

	for k, v in ipairs(getElementsByType('player')) do
		if v:getData('Iniciado') then
			triggerClientEvent(v, 'Armas:Quitar', source)

			if Asesino then
				triggerClientEvent(v, 'DayZ:MostrarMensaje', v, Asesino.name..' #f0fff0asesinó a '.. source.name)
			else
				triggerClientEvent(v, 'DayZ:MostrarMensaje', v, source.name.." #f0fff0murió.")
			end
		end
	end

	-- Se chequea si hay un asesino
	if Asesino then
		if Asesino:getData('alivetime') > 1 then
			-- Se le suma un asesinato al mismo
			Asesino:setData('murders', Asesino:getData('murders') + 1)
			-- Si el jugador era un bandido, se le suma humanidad, en caso contrario se le resta
			if Info.Humanidad <= 0 then
				Asesino:setData('humanity', Asesino:getData('humanity') + math.random(500, 1500))
				Asesino:setData('banditskilled', Asesino:getData('banditskilled') + 1)
			else
				Asesino:setData('humanity', Asesino:getData('humanity') - math.random(500, 1500))
			end
		end
	end

	triggerEvent("Casco:Quitar", source, source)
	triggerEvent("Chaleco:Quitar", source, source)
	source:setData('Casco', false)
	source:setData('Chaleco', false)
	
	
	if isElement(Chaleco[source]) then
        exports.bone_attach:detachElementFromBone(Chaleco[source])
        destroyElement(Chaleco[source])
        source:setData('Chaleco', false)
    end
   
    if isElement(Casco[source]) then
        exports.bone_attach:detachElementFromBone(Casco[source])
        destroyElement(Casco[source])
        source:setData('Casco', false)
    end

    Asesino = false

	-- Entrega del paracaidas
	giveWeapon(source, 46, 1, true)
    source:setData('currentweapon_3', 'Paracaidas')
    fadeCamera ( source, false, 0.5 ) 
end
addEvent('DayZ:Muerte', true)
addEventHandler('DayZ:Muerte', getRootElement(), Jugador.Muerte)



function checkBuggedAccount()
    for i,player in ipairs(getElementsByType("player")) do
        local account = getPlayerAccount(player)
        if not account then return end
        if getElementData(player,"Iniciado") then
            if getElementHealth(player) == 0 then
              triggerEvent("DayZ:Muerte", player)
            end
        end
    end 
end
setTimer(checkBuggedAccount,10000,0)

function rearmPlayerWeapon(Arma, Slot)
	--Se toman todas las armas del jugador
	takeAllWeapons(source)

	local Dato = getWeaponData(Arma)
	
	if not Dato then
		outputChatBox("[DayZ/Servidor/Jugador.lua] ERROR! No se encontro los datos del arma "..Arma, root, 255, 0, 0)
		return
	end

	local Municion = source:getData(Dato[3])

	--Si no tiene municion para su arma, se da el aviso
	if Municion and Municion < 1 then
		triggerClientEvent(source, 'DayZ:MostrarMensaje', source, 'No tienes municion para esta arma! ('..Dato[3]..')')
		return
	end

	-- Se asigna el nuevo dato
	source:setData('currentweapon_'..Slot, Arma)

	for i = 1, 3 do
		local Arma = source:getData('currentweapon_'..i)
		
		if Arma then
			local Dato = getWeaponData(Arma)
			local Municion = source:getData(Dato[3])

			if Municion and Municion > 0 then
                if i == Slot then
                    giveWeapon(source, Dato[1], Municion, true)
                else
                    giveWeapon(source, Dato[1], Municion, false)
                end
            end
		end
	end
end
addEvent("onPlayerRearmWeapon", true)
addEventHandler("onPlayerRearmWeapon", getRootElement(), rearmPlayerWeapon)

function TirarItem()
    takeAllWeapons(source)
 
    for i = 1, 3 do
        local Arma = source:getData('currentweapon_'..i)
        if Arma and source:getData(Arma) and source:getData(Arma) >= 1 then
            local Dato = getWeaponData(Arma)
            if Dato then
                local Municion = source:getData(Dato[3])
 
                if Municion and Municion > 0 then
                    giveWeapon(source, Dato[1], Municion, false)
                end
            end
        else
            source:setData('currentweapon_'..i, false)
        end
    end
end
addEvent("Jugador:TirarItem", true)
addEventHandler("Jugador:TirarItem", getRootElement(), TirarItem)

function onPlayerTakeItem(Item, Valor)
    for i = 1, 3 do
        local Arma = source:getData('currentweapon_'..i)
 
        if Arma then
            if source:getData(tostring(Arma)) or 0 >= 1 then
                local Datos = getWeaponData(Arma)
 
                if Datos[3] == Item then
                    giveWeapon(source, Datos[1], source:getData(Item))
                end
            end
        end
    end
end
addEvent("Jugador:TakeItem", true)
addEventHandler("Jugador:TakeItem", getRootElement(), onPlayerTakeItem)

--/Animaciones GESTOS
local handsUp = false
local sitting = false
local lying = false
local saluting = false
 
function funcBindSit ( player, key, keyState )
    if sitting then
        setPedAnimation (player,false)
        sitting = false
    else
        if isPedInVehicle (player) then return end
        setPedAnimation (player,"BEACH","ParkSit_M_loop",-1,false)
        sitting = true
    end
end
 
 
function funcBindHandsup ( player, key, keyState )
    if handsUp then
        setPedAnimation (player,false)
        handsUp = false
    else
        if isPedInVehicle (player) then return end
        setPedAnimation (player,"SHOP","SHP_Rob_HandsUp",-1,false)
        handsUp = true
    end
end
 
function funcBindLie ( player, key, keyState )
    if lying then
        setPedAnimation(player,"ped","getup_front",-1,false)
        setElementData(player,"lying",false)
        setTimer(function() setPedAnimation (player,false) end,1000,1)
        lying = false
    else
        if isPedInVehicle(player) then return end
        setPedAnimation (player,"ped","FLOOR_hit_f", -1,false)
        setElementData(player,"lying",true)
        lying = true
    end
end
 
function funcBindSalute ( player, key, keyState )
    if saluting then
        setPedAnimation (player,false)
        saluting = false
    else
        if isPedInVehicle(player) then return end
        setPedAnimation(player,"GHANDS","gsign5LH",-1,false)
        setTimer(function() setPedAnimation (player,false) end,2100,1)
        saluting = true
    end
end
 
function bindTheKeys()
    bindKey(source,"1","down",funcBindSalute)
    bindKey(source,".","down",funcBindHandsup)
    bindKey(source,",","down",funcBindSit)
    bindKey(source,"l","down",funcBindLie)
end
addEventHandler("onPlayerLogin", root, bindTheKeys)
 
addEventHandler("onResourceStart",resourceRoot,
function()
    for k,v in ipairs(getElementsByType("player")) do
        if not isGuestAccount(getPlayerAccount(v)) then
            bindKey(v,"1","down",funcBindSalute)
            bindKey(v,".","down",funcBindHandsup)
            bindKey(v,",","down",funcBindSit)
            bindKey(v,"l","down",funcBindLie)
        end
    end
end)
 
function unbindFuncKeys()
    unbindKey(source,"1","down",funcBindSalute)
    unbindKey(source,".","down",funcBindHandsup)
    unbindKey(source,",","down",funcBindSit)
    unbindKey(source,"l","down",funcBindLie)
end
addEvent("unbindFuncKeys",true)
addEventHandler("unbindFuncKeys",root,unbindFuncKeys)
 
function bindFuncKeys()
    bindKey(source,"1","down",funcBindSalute)
    bindKey(source,".","down",funcBindHandsup)
    bindKey(source,",","down",funcBindSit)
    bindKey(source,"l","down",funcBindLie)
    handsUp = false
    sitting = false
    lying = false
    saluting = false
end
addEvent("bindFuncKeys",true)
addEventHandler("bindFuncKeys",root,bindFuncKeys)
 





function Suicidio(thePlayer) 
    setElementData ( thePlayer, "blood", -50 )
  --triggerClientEvent("DayZ:MostrarMensaje", thePlayer, "Moriras en 5 Segundos!",255,255,255)
end
addCommandHandler("kill", Suicidio)

addCommandHandler('adminmode', function(Jugador)
	if not getPlayerAccount(Jugador) then return end
	local Cuenta = getAccountName(getPlayerAccount(Jugador))
	
	if isObjectInACLGroup('user.'..Cuenta, aclGetGroup('Admin')) then
		if getElementData(Jugador, 'Inmortal') then
			setElementData(Jugador, 'Inmortal', false)
			--outputChatBox('#008B8B* #ff0000|Admin| '..Jugador.name..'#ff0000 ~Ocupado!', root, 255, 255, 255, true)
			Jugador:setData('Admin', false)

		else
			setElementData(Jugador, 'Inmortal', true)
			Jugador:setData('Admin', true)
			--outputChatBox('#008B8B* #ff0000|Admin| '..Jugador.name..'#00ff00 ~Disponible!', root, 255, 255, 255, true)
		end
	end
end)

function setPedClothes(thePed, clothingSlot, clothingID)
	if not isElement(thePed) or type(clothingSlot) ~= "number" then
		error("Invalid arguments to setPedClothes()!", 2)
	end

	
	if not clothingID then
		return removePedClothes(thePed, clothingSlot)
	end
	
	local hasClothes = getPedClothes(thePed, clothingSlot) 
	if hasClothes then
		removePedClothes(thePed, clothingSlot)
	end
	
	local texture, model = getClothesByTypeIndex(clothingSlot, clothingID)
	return addPedClothes(thePed, texture, model, clothingSlot)
end