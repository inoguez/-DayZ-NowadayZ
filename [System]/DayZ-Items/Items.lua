debug.sethook()
Tipos = {
	"Granja",
	"Industrial",
	"Militar",
	"Residencial",
	"Supermercado"
}

----------------------------
-- Definiciones de zonas --
----------------------------

Zonas = {}

Zonas["Granja"] = {
	-- {"Item", Porcentaje de aparicion}
    {"Madera", 30},
	{"Vendaje", 25},
	{"Botella de agua", 60},
	{"Pasta enlatada", 30},
	{"Frijoles enlatados", 20},
	{"Bidón vacio", 35},
	{"Cuchillo", 15},
	{"Caja de cerillas", 10},
	{"Revolver", 25},
	{"Tienda", 40},
	{"Neumatico", 40},
	{"Mapa", 45},
	{"Mochila Alice", 20},
	{"Mochila militar", 40},
	{"SVD Camo", 40},
	{"ACR", 10},
	{"M1911", 100},
	{"M9", 40}
}

Zonas["Industrial"] = {
	{"AA-12", 20},
	{"Valla de alambre", 40},
	{"Caja de herramientas", 20},
	{"Neumatico", 30},
	{"Motor", 15},
	{"Botella de agua", 30},
	{"Pasta enlatada", 10},
	{"Bidón vacio", 40},
	{"Bidón con gasolina", 40},
	{"Mapa", 30},
	{"Reloj", 35},
	{"Caja de cerillas", 30},
	{"Bengala", 60},
	{"Mochila de asalto", 45},
	{"Mochila Coyote", 20},
	{"Lentes de visión nocturna", 10},
	{"AK-74", 30},
	{"AK-107", 30},
	{"G36", 10},
	{"G36C", 10},
	{"G36C SD", 10},
	{"Mochila Gamespot", 30},
	{"Tienda", 10},
	{"Mochila militar", 20},
	{"KSVK", 5},
	{"M9", 60}
}

Zonas["Militar"] = {
	{"AK-47 ASIIMOV", 20},
	{"AK-74", 50},
	{"AK-74 GP-25", 50},
	{"AA-12", 50},
	{"ACR", 50},
	{"AKS Gold", 5},
	{"M4A1", 80},
	{"M4A1 CCO", 40},
	{"M4A1 CCO SD", 40},
	{"M4A3 CCO", 40},
	{"AS50", 10},
	{"M249 Saw", 30},
	{"Mk48", 20},
	{"Caja de cerillas", 40},
	{"G17", 35},
	{"M9 SD", 55},
	{"Bengala", 60},
	{"Analgésicos", 20},
	{"Granada", 10},
	{"MP5A5", 55},
	{"MP5SD6", 20},
	{"Reloj", 60},
	{"Valla de alambre", 30},
	{"Mochila Alice", 50},
	{"Lentes de visión nocturna", 20},
	{"Binoculares", 30},
	{"Neumatico", 20},
	{"GPS", 40},
	{"Mapa", 30},
	{"Caja de herramientas", 40},
	{"Tienda", 20},
	{"DMR", 50},
	{"Lentes infrarrojos", 10},
	{"Mochila Czech", 50},
	{"Mochila Coyote", 40},
	{"Tienda", 60},
	{"Botella de agua", 40},
	{"Mochila militar", 90},
	{"SVD Camo", 40},
	{"KSVK", 20},
	{"M1911", 100},
	{"M9", 100}
}

Zonas["Residencial"] = {
	{"Caja de cerillas", 60},
	{"Madera", 30},
	{"G17", 10},
	{"M9 SD", 20},
	{"Cuchillo", 40},
	{"Hacha", 40},
	{"Bidón vacio", 60},
	{"Bengala", 40},
	{"Mochila de asalto", 60},
	{"Analgésicos", 50},
	{"Reloj", 30},
	{"Bolsa termica", 65},
	{"Mochila Alice", 50},
	{"Neumatico", 50},
	{"Morfina", 40},
	{"Mapa", 50},
	{"GPS", 10},
	{"Pasta enlatada", 70},
	{"Frijoles enlatados", 70},
	{"Machete", 30},
	{"Tienda", 20},
	{"Botella de agua", 70},
	{"M1911", 30}
}

Zonas["Supermercado"] = {
	{"Caja de cerillas", 70},
	{"Bidón vacio", 40},
	{"Mochila de asalto", 70},
	{"Pasta enlatada", 100},
	{"Frijoles enlatados", 100},
	{"Analgésicos", 60},
	{"Reloj", 40},
	{"Mochila Alice", 40},
	{"Mapa", 80},
	{"GPS", 40},
	{"Botella de agua", 100},
}

----------------------
-- Funciones utiles --
----------------------

function Porcentaje(Val)
	local Num = math.random(0, 100)

	if Num <= Val then
		return 1
	end

	return 0
end

function destroyItem(Col)
	if isElement(Col) then
		killTimer(Col:getData('Timer'))
		destroyElement(Col:getData('parent'))
		destroyElement(Col)
	end
end

-------------------------
-- Funciones de items --
-------------------------

-- Crea un item en el suelo, que puede ser tomado
function Items.Crear(Datos)
	local Info = getItemData(Datos.Item)

	if not Info then
		outputChatBox("Error, no se encontró la información de "..Datos.Item)
		return
	end
	
	local Item = createObject(Info[1], Datos.X, Datos.Y, Datos.Z, Info[3] or 0, 0, math.random(0, 360))
	if not isElement(Item) then
		outputChatBox("Modelo invalido para "..Datos.Item, root, 255, 0, 0)
	end

	local Col = createColSphere(Datos.X, Datos.Y, Datos.Z + 0.8, 0.75)
	setObjectScale(Item, Info[2] or 1)
	setElementCollisionsEnabled(Item, false)
	setElementFrozen(Item, true)

	Col:setData('item', Datos.Item)
	Col:setData('parent', Item)
	Col:setData('value', Datos.Valor or 1)

	Col:setData('Timer', setTimer(destroyItem, 900000, 1, Col))
end
addEvent("Items:Crear", true)
addEventHandler("Items:Crear", getRootElement(), Items.Crear)

function createItem(Item, Value)
	if source:getData(Item) <= 0 then return end

	local X, Y, Z = getElementPosition(source)

	Datos = {}

	Datos.X = X + math.random(-1.1, 1.1)
	Datos.Y = Y + math.random(-1.1, 1.1)
	Datos.Z = Z - 0.875
	Datos.Item = Item

	if Value then
		Datos.Valor = Value
	else
		Datos.Valor = 1
	end

	Items.Crear(Datos)

	source:setData(Item, source:getData(Item) - Datos.Valor)

	triggerEvent('Jugador:TirarItem', source, Item)
end
addEvent("onPlayerDropItem", true)
addEventHandler("onPlayerDropItem", getRootElement(), createItem)

function onPlayerTakeItem(Col)
	if not isElement(Col) then return end

	local Item = Col:getData('item')

	source:setData(Item, (source:getData(Item) or 0) + Col:getData('value'))

	triggerEvent('Jugador:TakeItem', source, Item, Col:getData('value'))

	killTimer(Col:getData('Timer'))
	destroyElement(Col:getData('parent'))
	destroyElement(Col)
end
addEvent("onPlayerTakeItem", true)
addEventHandler("onPlayerTakeItem", getRootElement(), onPlayerTakeItem)

-----------------------------------
-- Funcionamiento del recurso --
-----------------------------------

PosRepetidas = {}

function createPickupsOnServerStart()
	outputChatBox("[Loot]Advertencia lag por actualizacion de objetos")
    for i, pos in ipairs(pickupPositions["Residencial"]) do
        if not PosRepetidas[pos] then
			PosRepetidas[pos] = true
		else
			outputDebugString("POSICION REPETIDA !! ".."Residencial"..": "..pos)
		end
		if pos[1] and pos[2] and pos[3] then 
			local Col = createColSphere(pos[1], pos[2], pos[3], 1.25)
			setElementData(Col,"isTimerToRefresh",false)
			Col:setData('Zona', "Residencial")
			Col:setData('MAX_Slots', 20)

			refrescarLoot(Col, true)
		else
			outputDebugString("Error "..pos..":"..i)
		end
    end
    setTimer(createPickupsOnServerStart2,25000,1)
end

function createPickupsOnServerStart2()
    for i, pos in ipairs(pickupPositions["Industrial"]) do
       if not PosRepetidas[pos] then
			PosRepetidas[pos] = true
		else
			outputDebugString("POSICION REPETIDA !! ".."Industrial"..": "..pos)
		end
		if pos[1] and pos[2] and pos[3] then 
			local Col = createColSphere(pos[1], pos[2], pos[3], 1.25)
			setElementData(Col,"isTimerToRefresh",false)
			Col:setData('Zona', "Industrial")
			Col:setData('MAX_Slots', 20)

			refrescarLoot(Col, true)
		else
			outputDebugString("Error "..pos..":"..i)
		end
    end
    setTimer(createPickupsOnServerStart3,25000,1)
end

function createPickupsOnServerStart3()
    for i, pos in ipairs(pickupPositions["Granja"]) do
        if not PosRepetidas[pos] then
			PosRepetidas[pos] = true
		else
			outputDebugString("POSICION REPETIDA !! ".."Granja"..": "..pos)
		end
		if pos[1] and pos[2] and pos[3] then 
			local Col = createColSphere(pos[1], pos[2], pos[3], 1.25)
			setElementData(Col,"isTimerToRefresh",false)
			Col:setData('Zona', "Granja")
			Col:setData('MAX_Slots', 20)

			refrescarLoot(Col, true)
		else
			outputDebugString("Error "..pos..":"..i)
		end
    end
    setTimer(createPickupsOnServerStart4,25000,1)
end

function createPickupsOnServerStart4()
    for i, pos in ipairs(pickupPositions["Supermercado"]) do
        if not PosRepetidas[pos] then
			PosRepetidas[pos] = true
		else
			outputDebugString("POSICION REPETIDA !! ".."Supermercado"..": "..pos)
		end
		if pos[1] and pos[2] and pos[3] then 
			local Col = createColSphere(pos[1], pos[2], pos[3], 1.25)
			setElementData(Col,"isTimerToRefresh",false)
			Col:setData('Zona', "Supermercado")
			Col:setData('MAX_Slots', 20)

			refrescarLoot(Col, true)
		else
			outputDebugString("Error "..pos..":"..i)
		end
    end
    setTimer(createPickupsOnServerStart5,25000,1)
end

function createPickupsOnServerStart5()
    for i, pos in ipairs(pickupPositions["Militar"]) do
        if not PosRepetidas[pos] then
			PosRepetidas[pos] = true
		else
			outputDebugString("POSICION REPETIDA !! ".."Militar"..": "..pos)
		end
		if pos[1] and pos[2] and pos[3] then 
			local Col = createColSphere(pos[1], pos[2], pos[3], 1.25)
			setElementData(Col,"isTimerToRefresh",false)
			Col:setData('Zona', "Militar")
			Col:setData('MAX_Slots', 20)

			refrescarLoot(Col, true)
		else
			outputDebugString("Error "..pos..":"..i)
		end
    end
end
addEventHandler("onResourceStart", resourceRoot, createPickupsOnServerStart)

function refrescarLoot(Col, Refresh)
    local Objetos = Col:getData('Objetos')
	local Zona = Col:getData('Zona')

	-- Se destruyen los objetos que ya existian
    if Objetos then
		for k, v in ipairs(Objetos) do
			if isElement(v) then
				destroyElement(v)
			end
		end
    end

	if Refresh then

		for k, v in ipairs(Items) do
			Col:setData(v, 0)
		end

		for i = 1, 3 do
			local Random = math.random(1, #Zonas[Zona])
			local Value = Porcentaje(Zonas[Zona][Random][2])
			local Dato = exports.DayZ:getWeaponData(Zonas[Zona][Random][1])

			Col:setData(Zonas[Zona][Random][1], Value)
			
			if Value >= 1 and Dato and Dato[3] ~= Zonas[Zona][Random][1] then
				Col:setData(Dato[3], Dato[4] * math.random(1,2))
			end
		end

	end

    local Numero = 0
    local Objetos = {}

    for i, Item in ipairs(Items) do
        if getElementData(Col, Item) and getElementData(Col, Item) > 0 then
			Numero = Numero + 1
			local Info = getItemData(Item)
            local X, Y, Z = getElementPosition(Col)
            Objetos[Numero] = createObject(Info[1], X + math.random(-1, 1), Y + math.random(-1, 1), Z - 0.875, Info[3] or 0)
			setObjectScale(Objetos[Numero], Info[2] or 1)
            setElementCollisionsEnabled(Objetos[Numero], false)
            setElementFrozen(Objetos[Numero], true)
        end
    end

	setElementData(Col, "Objetos", Objetos)
end
addEvent("refrescarLoot", true)
addEventHandler("refrescarLoot", getRootElement(), refrescarLoot)



function refreshPickUps(player, command)
	outputDebugString( "[Loot]Empezando Refresh")
	outputChatBox("[Loot]Advertencia lag por actualizacion de objetos")
	for i, Loot in ipairs(getElementsByType("colshape")) do
		local Zona = Loot:getData("Zona")
		if Zona == "Residencial" then
			refrescarLoot(Loot, true)
		end
	end
	setTimer(refreshPickUps1,25000,1)
end

function refreshPickUps1()
	for i, Loot in ipairs(getElementsByType("colshape")) do
		local Zona = Loot:getData("Zona")
		if Zona == "Industrial" then
			refrescarLoot(Loot, true)
		end
	end
	setTimer(refreshPickUps2,25000,1)
end

function refreshPickUps2()
	for i, Loot in ipairs(getElementsByType("colshape")) do
		local Zona = Loot:getData("Zona")
		if Zona == "Supermercado" then
			refrescarLoot(Loot, true)
		end
	end
	setTimer(refreshPickUps3,25000,1)
end

function refreshPickUps3()
	for i, Loot in ipairs(getElementsByType("colshape")) do
		local Zona = Loot:getData("Zona")
		if Zona == "Militar" then
			refrescarLoot(Loot, true)
		end
	end
	setTimer(refreshPickUps4,25000,1)
end

function refreshPickUps4()
	for i, Loot in ipairs(getElementsByType("colshape")) do
		local Zona = Loot:getData("Zona")
		if Zona == "Granja" then
			refrescarLoot(Loot, true)
		end
	end
	outputDebugString( "[Loot]Refresh Exitoso")
end



setTimer(refreshPickUps, 7200000, 0)
addCommandHandler( "refresh", refreshPickUps)


