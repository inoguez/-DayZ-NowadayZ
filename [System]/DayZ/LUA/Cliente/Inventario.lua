inventoryItems = {
	["Weapons"] = {
		["Primary Weapon"] = {
			-- Escopetas--
			{"AA-12", 3, "Escopeta de Combate", 3000,"Munición (AA-12)"},

			-- Rifles de asalto --
			{"AR-15", 3, "Rifle de Asalto", 3000,"Munición (AR-15)"},
			{"ACR", 3, "Rifle de Asalto", 2500,"Munición (ACR)"},
			{"AK-74", 3, "Fusil de Asalto Soviético", 2000,"Munición (AK)"},
			{"AK-74 GP-25", 3, "Fusil de Asalto Soviético", 2000,"Munición (AK)"},
			{"AK-47 Vulcan", 3, "Fusil de Asalto Soviético", 2700,"Munición (AK)"},
			{"AK-107", 3, "Fusil de Asalto Soviético", 2000,"Munición (AK)"},
			{"AK-107 GL", 3, "Fusil de Asalto Soviético", 2000,"Munición (AK)"},
			{"AK-107 GL PSO", 3, "Fusil de Asalto Soviético", 2000,"Munición (AK)"},
			{"AK-107 PSO", 3, "Fusil de Asalto Soviético", 2000,"Munición (AK)"},
			{"AKM", 3, "Fusil de Asalto Soviético", 3000,"Munición (AK)"},
			{"AKS", 3, "Fusil de Asalto Soviético", 2000,"Munición (AK)"},
			{"AKS-74 Kobra", 3, "Fusil de Asalto Soviético", 2000,"Munición (AK)"},
			{"AKS Gold", 3, "Fusil de Asalto Soviético", 3000,"Munición (AK)"},
			{"G36", 3, "Fusil de Asalto Aleman", 2500,"Munición (G36)"},
			{"G36A", 3, "Fusil de Asalto Aleman", 2500,"Munición (G36)"},
			{"G36C", 3, "Fusil de Asalto Aleman", 2500,"Munición (G36)"},
			{"G36C SD", 3, "Fusil de Asalto Aleman", 2500,"Munición (G36)"},
			{"G36K", 3, "Fusil de Asalto Aleman", 2500,"Munición (G36)"},
			{"M4A1", 3, "Fusil de Asalto Americano", 2500,"Munición (STANAG)"},
			{"M4A1 CCO", 3, "Fusil de Asalto Americano", 2500,"Munición (STANAG)"},
			{"M4A1 CCO SD", 3, "Fusil de Asalto Americano (Silenciado)", 2000,"Munición (STANAG)"},
			{"M4A3 CCO", 3, "Fusil de Asalto Americano", 3000,"Munición (STANAG)"},
			{"RPK", 3, "Fusil de Asalto Soviético", 3000,"Munición (RPK)"},

			-- Rifles --
			{"AS50", 3, "Fusil de Asalto Soviético", 20000,"Munición (AS50)"},
			{"AWP", 3, "Fusil de Asalto Soviético", 20000,"Munición (AWP)"},
			{"DMR", 3, "Fusil de Asalto Soviético", 5000,"Munición (DMR)"},
			{"PGM Hecate II", 3, "Fusil de Asalto Soviético", 30400,"Munición (Hecate)"},
			{"KSVK", 3, "Fusil de Asalto Soviético", 34000,"Munición (KSVK)"},
			{"M107", 3, "Fusil de Asalto Soviético", 8000,"Munición (M107)"},
			{"SVD Camo", 3, "Fusil de Asalto Soviético", 3400,"Munición (SVD)"},

			-- Light Machine Guns --
			{"M240", 4, "Ametralladora ligera Americana", 4500,"Munición (M240)"},
			{"M249 Saw", 4, "Ametralladora ligera Belga", 3400,"Munición (M249)"},
			{"Mk48", 4, "Ametralladora ligera Belga", 3400,"Munición (Mk48)"},
			{"PKM", 4, "Ametralladora ligera Soviética", 3400,"Munición (PKM)"},
			{"PKP", 4, "Ametralladora ligera Rusa", 3400,"Munición (PKP)"},
			{"RPD", 3, "Ametralladora ligera Soviética", 3100,"Munición (RPD)"},
		},
		
		["Secondary Weapon"] = {
			-- Cuerpo a cuerpo
			{"Cuchillo", 1, "Arma blanca", 500},
			{"Hacha", 2, "Arma blanca", 800},
			{"Machete", 2, "Arma blanca", 1000},
			{"Palanca", 2, "Arma blanca", 600},

			-- Pistolas
			{"Desert Eagle", 2, "Pistola semiautomática Americana", 2500, "Munición (Desert)"},
			{"G17", 2, "Pistola semiautomática Australiana", 889, "Munición (G17)"},
			{"M9", 2, "Pistola semiautomática Italiana", 889, "Munición (M9)"},
			{"M9 SD", 2, "Pistola semiautomática Italiana (Silenciado)", 889, "Munición (M9)"},
			{"M1911", 2, "Pistola semiautomática Americana", 500, "Munición (M1911)"},

			-- SMG
			{"MP5A5", 2, "Sub-Fusil automatico Aleman", 3100, "Munición (MP5A5)"},
			{"MP5SD6", 2, "Sub-Fusil automatico Aleman (Silenciado)", 3100, "Munición (MP5SD6)"},
			{"Bizon PP-19 SD", 2, "Sub-Fusil automatico Ruso (Silenciado)", 3100, "Munición (Bizon)"},
			{"P90", 2, "Sub-Fusil automatico Belga", 3100, "Munición (P90)"},
		},

		["Specially Weapon"] = {
			{"Paracaidas", 1, "Frena caidas", 0 },
			{"Gas lacrimogeno", 1, "Arma quimica", 50},
			{"Granada", 1, "Proyectil explsivo", 34000},
			{"Binoculares", 1, "Instrumento optico", 0},
		}
	},

	["Ammo"] = {
		-- Municion de pistolas y SMG
		{"Munición (Desert)", 0.14},
		{"Munición (G17)", 0.085},
		{"Munición (M9)", 0.085},
		{"Munición (M1911)", 0.085},
		{"Munición (MP5A5)", 0.033},
		{"Munición (MP5SD6)", 0.033},
		{"Munición (Bizon)", 0.033},
		{"Munición (P90)", 0.033},
		
		-- Municion de escopetas
		{"Munición (AA-12)", 0.05},
		
		-- Municion de rifles de asalto
		{"Munición (AR-15)", 0.033},
		{"Munición (ACR)", 0.033},
		{"Munición (AK)", 0.033},
		{"Munición (AKM)", 0.033},
		{"Munición (G36)", 0.033},
		{"Munición (STANAG)", 0.033},
        {"Munición (RPK)", 0.033},
		
		-- Municion de rifles
		{"Munición (AS50)", 0.2},
		{"Munición (DMR)", 0.2},
		{"Munición (Hecate)", 0.2},
		{"Munición (KSVK)", 0.2},
		{"Munición (M107)", 0.2},
		{"Munición (SVD)", 0.2},
		{"Munición (AWP)", 0.2},

		-- Municion de armas pesadas
		{"Munición (M240)", 0.01},
		{"Munición (M249)", 0.01},
		{"Munición (Mk48)", 0.01},
		{"Munición (PKM)", 0.01},
		{"Munición (RPD)", 0.01},
	},

	["Food"] = {
		{"Botella de agua",1,"Recipiente con agua"},
		{"Pasta enlatada", 1,"Recipiente con pasta"},
		{"Frijoles enlatados", 1,"Recipiente con frijoles"},
		{"Carne cocida", 1,"Recipiente con Carne"},
	},

	["Items"] = {
		{"Madera", 2, "Encender una fogata","Pila de Madera (Fogata)"},
		{"Vendaje", 1, "Usar vendaje","Cura el sangrado"},
		{"Bengala", 1, "Colocar bengala","Artefacto luminoso"},
		{"Bidón vacio",2,nil,"Recipiente para gasolina (Rellenable)"},
		{"Bidón con gasolina",2,nil,"Recipiente con gasolina"},
		{"Botiquin",2,"Usar","Te da 12000 de vida"},
		{"Bolsa termica",1,"Usar","Mantiene tu temperatura"},
		{"Analgésicos",1,"Curar dolor","Calmante para el dolor"},
		{"Morfina",1,"Usar","Droga (Hueso roto)"},
		{"Bolsa de sangre",1,"Usar","Sangre para administrar"},
		{"Valla de alambre", 2, "Colocar","Objeto Colocable"},
		{"Carne cruda", 1, nil,"Carne en mal estado"},
		{"Botella vacia",1,"Llenar botella","Recipiente (Rellenable)"},
		
		-- Vehiculos
		{"Neumatico", 2, nil,"Neumatico (Vehiculo)"},
		{"Motor", 5, nil,"Motor (Vehiculo)"},
		
		-- Tiendas
		{"Tienda", 3, "Montar tienda","Tienda de campaña"},

		-- Mochilas
		{"Alice (Mochila)", 1, "Equipar mochila","Mochila (16 Espacios)"},
		{"Asalto (Mochila)", 1, "Equipar mochila","Mochila (12 Espacios)"},
		{"Coyote (Mochila)", 1, "Equipar mochila","Mochila (60 Espacios)"},
		{"Czech (Mochila)", 1, "Equipar mochila","Mochila (36 Espacios)"},
		{"Campamento (Mochila)", 1, "Equipar mochila","Mochila (20 Espacios)"},
		{"Armada (Mochila)", 1, "Equipar mochila","Mochila (30 Espacios)"},
		
		-- Proteccion
        {"Casco militar",2,"Equipar casco", "(Proteccion contra Headshot)"},
		{"Chaleco militar",3,"Equipar chaleco", "(Protege el 15% del daño)"},

		--Trampas
		{"Mina explosiva",2,"Colocar mina explosiva", "Mina (Colision)"},
		{"Trampa de oso",3,"Colocar trampa de oso", "Trampa (Colision)"},
		
	},

	["Toolbelt"] = {
		{"Lentes de visión nocturna", 1, "Permite ver en la noche ('N')"},
		{"Lentes infrarrojos",1, "Permite detectar calor ('I')"},
		{"Mapa",1, "Muestra tu Ubicacion (F12)"},
		{"Caja de cerillas",1, "Iniciador de fogata (necesita Pila de Madera)"},
		{"Reloj",1, "Marca la hora real"},
		{"GPS", 1, "Localizacion mediante satélite"},
		{"Caja de herramientas",1, "Contenedor de Herrameintas (Vehiculo)"},
	},
}

local screenW, screenH = guiGetScreenSize()
local sacks = {
	["Asalto (Mochila)"] = { slots = 12},
	["Alice (Mochila)"] = { slots = 16},
	["Campamento (Mochila)"] = { slots = 20},
	["Armada (Mochila)"] = { slots = 30},
	["Czech (Mochila)"] = { slots = 36},
	["Coyote (Mochila)"] = { slots = 60},
	["NowadayZ (Mochila)"] = { slots = 150},
}

function centerWindow (center_window)
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (screenW - windowW) /2,(screenH - windowH) /2
    return guiSetPosition(center_window, x, y, false)
end

local screenW, screenH = guiGetScreenSize()
--Verde fuerte #354242 rgb(53, 66, 66)
--Verde claro #588c8c rgb(88, 140, 140)
--blanco
local r, g, b = 240, 255, 240
--color botin
local rg, gg, bg = 140, 186, 81
--naranja(Inventario)
local ro, go, bo = 245, 185, 113
--naranja objeto selecionado
local ros, gos, bos = 80, 216, 144

local localPlayer = getLocalPlayer()
local headline = {}
local gridlistItems = {}
local buttonItems = {}
local Inventario = {}
local guifont0_Roboto = guiCreateFont("Fuentes/WorkSans.ttf", 9)

NombreItem = ""
InfoItem = ""
DamageItem = "" 
CargadorItem = "" 

local sWidth,sHeight = guiGetScreenSize() 
inventoryWindows = guiCreateWindow((173/1280)*sWidth, (154/1024)*sHeight, (934/1280)*sWidth, (645/1024)*sHeight, "Inventario", false)
centerWindow(inventoryWindows)
guiWindowSetSizable( inventoryWindows, false )
guiWindowSetMovable( inventoryWindows, false )
inventoryImage = guiCreateStaticImage((9/1280)*sWidth, (18/1024)*sHeight, (921/1280)*sWidth, (617/1024)*sHeight, "Imagenes/Inventario/INV.png", false, inventoryWindows, false)  
		
headline.loot = guiCreateLabel(0.04, 0.05, 0.34, 0.09, "Botín", true, inventoryImage)--rg, gg, bg
guiLabelSetHorizontalAlign(headline.loot, "center")
guiSetFont(headline.loot, guifont0_Roboto)
guiLabelSetColor ( headline.loot, r, g, b )

headline.inventory = guiCreateLabel(0.62, 0.05, 0.34, 0.09, "Inventario", true, inventoryImage)--ro, go, bo
guiLabelSetHorizontalAlign(headline.inventory, "center")
guiSetFont(headline.inventory, guifont0_Roboto)
guiLabelSetColor ( headline.inventory, r, g, b )

gridlistItems.loot = guiCreateGridList(0.02, 0.10, 0.38, 0.83, true, inventoryImage)
gridlistItems.loot_colum = guiGridListAddColumn(gridlistItems.loot, "Objetos", 0.7)
gridlistItems.loot_colum_amount = guiGridListAddColumn(gridlistItems.loot, "", 0.2)
guiSetFont ( gridlistItems.loot, guifont0_Roboto )

gridlistItems.inventory = guiCreateGridList(0.60, 0.10, 0.38, 0.83, true, inventoryImage)
gridlistItems.inventory_colum = guiGridListAddColumn(gridlistItems.inventory, "Inventario", 0.7)
gridlistItems.inventory_colum_amount = guiGridListAddColumn(gridlistItems.inventory, "", 0.2)
guiSetFont ( gridlistItems.inventory, guifont0_Roboto )

buttonItems.loot = guiCreateButton(0.41, 0.10, 0.04, 0.60, "->", true, inventoryImage)
buttonItems.inventory = guiCreateButton(0.55, 0.10, 0.04, 0.60, "<-", true, inventoryImage)
buttonItems.takeAmmo = guiCreateButton(0.34, 0.03, 0.06, 0.05, "Tomar Munición", true,inventoryImage)
guiSetFont(buttonItems.takeAmmo, guifont0_Roboto)
buttonItems.outloot = guiCreateButton(0.41, 0.71, 0.04, 0.07, ">>", true, inventoryImage)
buttonItems.outinventory = guiCreateButton(0.55, 0.71, 0.04, 0.07, "<<", true, inventoryImage)  

headline.slots = guiCreateLabel(0.63, 0.94, 0.29, 0.04, "Espacio total:", true, inventoryImage)
guiLabelSetHorizontalAlign(headline.slots, "center")
guiLabelSetVerticalAlign(headline.slots, "center")
guiSetFont(headline.slots, guifont0_Roboto)

headline.slots_loot = guiCreateLabel(0.03, 0.94, 0.29, 0.04, "Espacio total:", true, inventoryImage)
guiLabelSetHorizontalAlign(headline.slots_loot, "center")
guiLabelSetVerticalAlign(headline.slots_loot, "center")
guiSetFont(headline.slots_loot, guifont0_Roboto)

guiSetVisible(inventoryWindows, false)


function showInventory(key, keyState)
	if not localPlayer:getData('Iniciado') or isElement(Marker) then return end

	if keyState == "down" then
		Menu.Limpiar()
		guiSetVisible(inventoryWindows, not guiGetVisible(inventoryWindows))
		showCursor(not isCursorShowing())
		refreshInventory()
		if guiGetVisible(inventoryWindows) then
			guiSetVisible( inventoryWindows, true )
			refreshLoot()
			triggerEvent("hideGPSOnInventoryOpen",localPlayer)
		else
			if isElement( infoWindow ) then
        		destroyElement( infoWindow )
        	end
			guiSetVisible( inventoryWindows, false )
			hideRightClickInventoryMenu()
			triggerEvent("showGPSOnInventoryClose",localPlayer)
		end
		

		if isPlayerInLoot() then
			local col = getElementData(getLocalPlayer(), "currentCol")
			local gearName = getElementData(getLocalPlayer(), "lootname")
			refreshLoot(col, gearName)
		end
	end
end
bindKey("j", "down", showInventory)

function refreshButtonLoot()
	if isPlayerInLoot() then
		local gearName = guiGetText(headline.loot)
		local col = getElementData(getLocalPlayer(),"currentCol")
		setTimer(refreshInventory,200,2)
		setTimer(refreshLoot,200,2,col,gearName)
	end
end

 function isThereSomeoneInLoot ()
    local loot = isPlayerInLoot()
    local playersTable = getElementsWithinColShape ( loot, 'player' )
    for i, player in ipairs ( playersTable ) do
        if player ~= localPlayer then
            return true
        end
    end
    if not playersTable then
        return true
    end
    return false
end

addEventHandler("onClientGUIClick",buttonItems["takeAmmo"],function()
	if isPlayerInLoot() and gridlistItems["loot_colum"] then
		if isThereSomeoneInLoot () then
			return true 
		end
		local countItem = guiGridListGetRowCount(gridlistItems["loot"])
		for i = 0, countItem do
			local itemName = guiGridListGetItemText(gridlistItems["loot"],i,1)
			for id, item in ipairs(inventoryItems["Ammo"]) do
				if itemName == item[1] and getElementData(isPlayerInLoot(),itemName) > 0 and not isToolbeltItem(itemName) then
					if getPlayerCurrentSlots() + getItemSlots(itemName) <= getPlayerMaxAviableSlots() then
						local numbers = getElementData(isPlayerInLoot(),itemName)
						for i = 1, numbers do
							if getPlayerCurrentSlots() + getItemSlots(itemName) <= getPlayerMaxAviableSlots() then
								triggerEvent("onPlayerMoveItemInInventory",getLocalPlayer(),itemName,isPlayerInLoot())
							else
								triggerEvent('DayZ:MostrarMensaje', localPlayer, 'Inventario lleno!')
								return
							end	
						end
						refreshButtonLoot()
					else
						triggerEvent('DayZ:MostrarMensaje', localPlayer, 'Inventario lleno!')
						return
					end
				end	
			end
		end	
	end
	refreshButtonLoot()
end,false)

function showInventoryManual()
	guiSetVisible(inventoryWindows, not guiGetVisible(inventoryWindows))
	showCursor(not isCursorShowing())
	refreshInventory()
end

function hideInventoryManual()
  guiSetVisible(inventoryWindows, false)
  showCursor(false)
  hideRightClickInventoryMenu()
end
addEvent("hideInventoryManual", true)
addEventHandler("hideInventoryManual", getLocalPlayer(), hideInventoryManual)

function refreshInventoryManual()
  refreshInventory()
end
addEvent("refreshInventoryManual", true)
addEventHandler("refreshInventoryManual", getLocalPlayer(), refreshInventoryManual)

function refreshLootManual(loot)
  refreshLoot(loot)
end
addEvent("refreshLootManual", true)
addEventHandler("refreshLootManual", getLocalPlayer(), refreshLootManual)

function refreshInventory()
local max_slots = getElementData ( localPlayer, "MAX_Slots") or 8
if ( gridlistItems["inventory_colum"] ) then
    row1,column1 = guiGridListGetSelectedItem ( gridlistItems["inventory"] )
    guiGridListClear(gridlistItems["inventory"])
           local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"- Armas Primarias", true, false )
        for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
				guiGridListSetItemColor(gridlistItems["inventory"], row, gridlistItems["inventory_colum"], ro, go, bo)
				if getElementData(getLocalPlayer(),"currentweapon_1") and item[1] == getElementData(getLocalPlayer(),"currentweapon_1") then
					guiGridListSetItemColor ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"], ros, gos, bos  )
					guiGridListSetItemColor ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"], ros, gos, bos )
				end
			end
        end
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"- Armas Secundarias", true, false )
        for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
				guiGridListSetItemColor(gridlistItems["inventory"], row, gridlistItems["inventory_colum"], ro, go, bo)
				if getElementData(getLocalPlayer(),"currentweapon_2") and item[1] == getElementData(getLocalPlayer(),"currentweapon_2") then
					guiGridListSetItemColor ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"], ros, gos, bos )
					guiGridListSetItemColor ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"], ros, gos, bos )
				end
			end
        end
            local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"- Armas Especiales", true, false )
        for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
				guiGridListSetItemColor(gridlistItems["inventory"], row, gridlistItems["inventory_colum"], ro, go, bo)
				if getElementData(getLocalPlayer(),"currentweapon_3") and item[1] == getElementData(getLocalPlayer(),"currentweapon_3") then
					guiGridListSetItemColor ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"], ros, gos, bos )
					guiGridListSetItemColor ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"], ros, gos, bos )
				end
			end
        end
            local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"- Municiones", true, false )
        for id, item in ipairs(inventoryItems["Ammo"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
				guiGridListSetItemColor(gridlistItems["inventory"], row, gridlistItems["inventory_colum"], ro, go, bo)

			end
        end
            local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"- Comida y Bebida", true, false )
        for id, item in ipairs(inventoryItems["Food"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
				guiGridListSetItemColor(gridlistItems["inventory"], row, gridlistItems["inventory_colum"], ro, go, bo)
			end
        end
            local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"- Items", true, false )
        for id, item in ipairs(inventoryItems["Items"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
				guiGridListSetItemColor(gridlistItems["inventory"], row, gridlistItems["inventory_colum"], ro, go, bo)
				if getElementData(getLocalPlayer(),"Casco") and item[1] == getElementData(getLocalPlayer(),"Casco") then
					guiGridListSetItemColor ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"], ros, gos, bos )
					guiGridListSetItemColor ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"], ros, gos, bos )
				end
				if getElementData(getLocalPlayer(),"Chaleco") and item[1] == getElementData(getLocalPlayer(),"Chaleco") then
					guiGridListSetItemColor ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"], ros, gos, bos )
					guiGridListSetItemColor ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"], ros, gos, bos )
				end 
				if sacks[item[1]] then
					if sacks[item[1]].slots == max_slots then
						guiGridListSetItemColor ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"], ros, gos, bos )
						guiGridListSetItemColor ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"], ros, gos, bos )
					end
				end
			end
        end
            local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"- Utilidades", true, false )
        for id, item in ipairs(inventoryItems["Toolbelt"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
				guiGridListSetItemColor(gridlistItems["inventory"], row, gridlistItems["inventory_colum"], ro, go, bo)
			end
        end
        if row1 and column1 then
            guiGridListSetSelectedItem ( gridlistItems["inventory"], row1,column1)
        end
        guiSetText(headline["slots"],"Espacio total: "..getPlayerCurrentSlots().." / "..getPlayerMaxAviableSlots())
    end
end

function refreshLoot(loot, gearName)

	if not loot then
		guiGridListClear(gridlistItems["loot"])
		guiSetText(headline["loot"],"Vacio")
		return
	end

	row2, column2 = guiGridListGetSelectedItem(gridlistItems["loot"])

	if gridlistItems["loot_colum"] then
    guiGridListClear(gridlistItems["loot"])
    if gearName then
        guiSetText(headline["loot"],gearName)
    end
	
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"- Armas Primarias", true, false )
        for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
                guiGridListSetItemColor( gridlistItems["loot"], row, gridlistItems["loot_colum"], rg, gg, bg)
            end
        end
                local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"- Armas Secundarias", true, false )
        for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
                guiGridListSetItemColor( gridlistItems["loot"], row, gridlistItems["loot_colum"], rg, gg, bg)
            end
        end
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"- Armas Especiales", true, false )
        for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
                guiGridListSetItemColor( gridlistItems["loot"], row, gridlistItems["loot_colum"], rg, gg, bg)
            end
        end
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"- Municiones", true, false )
        for id, item in ipairs(inventoryItems["Ammo"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
                guiGridListSetItemColor( gridlistItems["loot"], row, gridlistItems["loot_colum"], rg, gg, bg)
            end
        end
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"- Comida y Bebida", true, false )
        for id, item in ipairs(inventoryItems["Food"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
                guiGridListSetItemColor( gridlistItems["loot"], row, gridlistItems["loot_colum"], rg, gg, bg)
            end
        end
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"- Utilidades", true, false )
        for id, item in ipairs(inventoryItems["Toolbelt"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
                guiGridListSetItemColor( gridlistItems["loot"], row, gridlistItems["loot_colum"], rg, gg, bg)
            end
        end
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"- Items", true, false )
        for id, item in ipairs(inventoryItems["Items"]) do
            if getElementData(loot, item[1]) and tonumber(getElementData(loot,item[1])) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
                guiGridListSetItemColor( gridlistItems["loot"], row, gridlistItems["loot_colum"], rg, gg, bg)
            end
        end

        if row2 and column2 then
            guiGridListSetSelectedItem(gridlistItems["loot"], row2,column2)
        end

        guiSetText(headline["slots_loot"],"Espacio total: "..getLootCurrentSlots(loot).." / "..(getLootMaxAviableSlots(loot)or 0))
    end
end


function getPlayerMaxAviableSlots()
return getElementData(getLocalPlayer(),"MAX_Slots") and localPlayer:getData('MAX_Slots')
end

function getLootMaxAviableSlots(loot)
return getElementData(loot,"MAX_Slots")
end

function getPlayerCurrentSlots()
local current_SLOTS = 0
    for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
        if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
            current_SLOTS = current_SLOTS + tonumber(item[2])*tonumber(getElementData(localPlayer,item[1]) or 1)
        end
    end
    for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
        if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
        if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Ammo"]) do
        if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Food"]) do
        if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Items"]) do
        if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
        end
    end
    return math.floor(current_SLOTS)
end


function getLootCurrentSlots(loot)
local current_SLOTS = 0
    for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
        if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
        if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
        if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Ammo"]) do
        if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Food"]) do
        if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Items"]) do
        if getElementData(loot,item[1]) and tonumber(getElementData(loot,item[1])) > 0 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
        end
    end
    return math.floor(current_SLOTS)
end

function getItemSlots(itema)
local current_SLOTS = 0
    for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
        if itema == item[1] then
            return item[2]
        end
    end
    for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
        if itema == item[1] then
            return item[2]
        end
    end
    for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
        if itema == item[1] then
            return item[2]
        end
    end
    for id, item in ipairs(inventoryItems["Ammo"]) do
        if itema == item[1] then
            return item[2]
        end
    end
    for id, item in ipairs(inventoryItems["Food"]) do
        if itema == item[1] then
            return item[2]
        end
    end
    for id, item in ipairs(inventoryItems["Items"]) do
        if itema == item[1] then
            return item[2]
        end
    end
    return false
end

function isToolbeltItem(itema)
local current_SLOTS = 0
    for id, item in ipairs(inventoryItems["Toolbelt"]) do
        if itema == item[1] then
            return true
        end
    end
    return false
end

function onPlayerMoveItemOutOfInventory ()
	local itemName = guiGridListGetItemText ( gridlistItems["inventory"], guiGridListGetSelectedItem ( gridlistItems["inventory"] ), 1 )
    if getElementData(getLocalPlayer(),itemName) and getElementData(getLocalPlayer(),itemName) >= 1 then
        if isPlayerInLoot() then
            local isVehicle = getElementData(isPlayerInLoot(),"vehicle")
            local isTent = getElementData(isPlayerInLoot(),"tent")
            if isVehicle and not isTent then
                local veh = getElementData(isPlayerInLoot(),"parent")
                local tires,engine,parts = getVehicleAddonInfos (getElementModel(veh))
                if itemName == "Tire" and (getElementData(isPlayerInLoot(),"Tire_inVehicle") or 0) < tires  or itemName == "Engine" and (getElementData(isPlayerInLoot(),"Engine_inVehicle") or 0)  < engine or itemName == "Parts" and (getElementData(isPlayerInLoot(),"Parts_inVehicle") or 0)  < parts or itemName == "Tank Parts" and (getElementData(isPlayerInLoot(),"Parts_inVehicle") or 0)  < parts then
                    if itemName == "Tank Parts" then
						itemName = "Parts"
					end
            triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName.."_inVehicle",isPlayerInLoot())
            playerMovedInInventory = true
            setTimer(function()
                        playerMovedInInventory = false
                    end,700,1)
                elseif isToolbeltItem(itemName) then
                    triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
                    playerMovedInInventory = true
                    setTimer(function()
                        playerMovedInInventory = false
                    end,700,1)
                elseif getLootCurrentSlots(getElementData(getLocalPlayer(),"currentCol")) + getItemSlots(itemName) <= getLootMaxAviableSlots(isPlayerInLoot()) then
                    triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
                    playerMovedInInventory = true
                    setTimer(function()
                        playerMovedInInventory = false
                    end,700,1)
                else
                   triggerEvent('DayZ:MostrarMensaje', localPlayer, 'Inventario lleno!')
                    return
                end



                elseif isToolbeltItem(itemName) then
                    triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
                    playerMovedInInventory = true
                    setTimer(function()
                        playerMovedInInventory = false
                    end,700,1)
            elseif getLootCurrentSlots(getElementData(getLocalPlayer(),"currentCol")) + getItemSlots(itemName) <= getLootMaxAviableSlots(isPlayerInLoot()) then
                triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
                playerMovedInInventory = true
                    setTimer(function()
                    playerMovedInInventory = false
                end,700,1)
            else
               triggerEvent('DayZ:MostrarMensaje', localPlayer, 'Inventario lleno!')
                return
            end
        else
            triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
            playerMovedInInventory = true
            setTimer(function()
                playerMovedInInventory = false
            end,700,1)
        end
    end
    local gearName = guiGetText(headline["loot"])
    local col = getElementData(getLocalPlayer(),"currentCol")
    setTimer(refreshInventory,200,2)
    if isPlayerInLoot() then
        setTimer(refreshLoot, 200, 2, col, gearName)
    end
end
addEventHandler ( "onClientGUIClick", buttonItems["inventory"], onPlayerMoveItemOutOfInventory, false)



function onPlayerMoveItemOutOFInventory(itemName, loot)
	if string.find(itemName, "Mochila") then
		for k, v in ipairs(Mochilas) do
			if itemName == v[1] then
				Espacios = getElementData(localPlayer, "MAX_Slots")
				if Espacios == v[2] and getElementData(localPlayer, itemName) == 1 then
					triggerEvent('DayZ:MostrarMensaje', localPlayer, "Tienes equipada esta mochila!")
					return
				end
			end
		end
	end
	
	itemPlus = 1
	

   if itemName == "Chaleco militar" and getElementData ( getLocalPlayer(), "Chaleco" ) and getElementData(getLocalPlayer(),"Chaleco militar") == 1 then
      triggerEvent("DayZ:MostrarMensaje", getLocalPlayer(), "No Puedes Tirarlo ya que lo tienes Equipado!", 18, 18, 18)
      return true
   end
   if itemName == "Casco militar" and getElementData ( getLocalPlayer(), "Casco" ) and getElementData(getLocalPlayer(),"Casco militar") == 1 then
     triggerEvent("DayZ:MostrarMensaje", getLocalPlayer(), "No Puedes Tirarlo ya que lo tienes Equipado!", 18, 18, 18)
     return true
   end



	if itemName:find('Munición') then
		local Municion = getCartridgeSize(itemName)
		
		if localPlayer:getData(itemName) >= Municion then
			itemPlus = Municion
		else
			itemPlus = localPlayer:getData(itemName)
		end
	end

	if loot then
		loot:setData(itemName, (getElementData(loot, itemName) or 0) + itemPlus)
		localPlayer:setData(itemName, localPlayer:getData(itemName) - itemPlus)
		
		triggerServerEvent('Jugador:TirarItem', localPlayer)
	else
		triggerServerEvent('onPlayerDropItem', getLocalPlayer(), itemName, itemPlus)
	end
end
addEvent( "onPlayerMoveItemOutOFInventory", true )
addEventHandler( "onPlayerMoveItemOutOFInventory", getRootElement(), onPlayerMoveItemOutOFInventory )

function onPlayerMoveItemInInventory()
	local itemName = guiGridListGetItemText ( gridlistItems.loot, guiGridListGetSelectedItem ( gridlistItems.loot ), 1 )
	if isPlayerInLoot() then
    if getElementData(isPlayerInLoot(),itemName) and getElementData(isPlayerInLoot(),itemName) >= 1 then
        if not isToolbeltItem(itemName) then
            if tonumber(getPlayerCurrentSlots()) + tonumber(getItemSlots(itemName)) <= tonumber(getPlayerMaxAviableSlots()) then
                triggerEvent("onPlayerMoveItemInInventory",getLocalPlayer(),itemName,isPlayerInLoot())
                playerMovedInInventory = true
            else
				triggerEvent('DayZ:MostrarMensaje', localPlayer, 'Inventario lleno!')
                return
            end
        else
            playerMovedInInventory = true
            setTimer(function()
                playerMovedInInventory = false
            end,700,1)
            triggerEvent("onPlayerMoveItemInInventory",getLocalPlayer(),itemName,isPlayerInLoot())
        end
    end
    if isPlayerInLoot() then
        local gearName = guiGetText(headline.loot)
        local col = getElementData(getLocalPlayer(),"currentCol")
        setTimer(refreshInventory,200,2)
        setTimer(refreshLoot,200,2,col,gearName)

		if getElementData(col, "Tipo") then
			triggerServerEvent("refrescarLoot", localPlayer, col)
		end
    end
end
end
addEventHandler("onClientGUIClick", buttonItems.loot, onPlayerMoveItemInInventory, false)

function onPlayerMoveItemInInventory(itemName, loot)
	local itemPlus = 1

	if itemName:find('Munición') then
		local Municion = getCartridgeSize(itemName)
		
		if loot:getData(itemName) >= Municion then
			itemPlus = Municion
		else
			itemPlus = loot:getData(itemName)
		end
	end

	if loot then
		setElementData(getLocalPlayer(), itemName, (getElementData(getLocalPlayer(), itemName) or 0) + itemPlus)
		setElementData(loot, itemName, getElementData(loot, itemName) - itemPlus)
		triggerServerEvent("Jugador:TakeItem", localPlayer, itemName, itemPlus)
	
		if loot:getData('Zona') then
			triggerServerEvent('refrescarLoot', localPlayer, loot)
		end
	end
end
addEvent("onPlayerMoveItemInInventory", true)
addEventHandler("onPlayerMoveItemInInventory", getRootElement(), onPlayerMoveItemInInventory)

function onPlayerMoveAllItemInInventory ()
	local itemName = guiGridListGetItemText ( gridlistItems.loot, guiGridListGetSelectedItem ( gridlistItems.loot ), 1 )
	if isPlayerInLoot() then
		if getElementData(isPlayerInLoot(),itemName) and getElementData(isPlayerInLoot(),itemName) >= 1 then
			if not isToolbeltItem(itemName) then
				local itemamount = getItemSlots(itemName)*getElementData(isPlayerInLoot(),itemName)
				if tonumber(getPlayerCurrentSlots()) + itemamount <= tonumber(getPlayerMaxAviableSlots()) then
				--if getLootCurrentSlots(getElementData(getLocalPlayer(),"currentCol")) + itemamount <= getLootMaxAviableSlots(isPlayerInLoot()) then
					if not playerMovedInInventory then
						triggerEvent("onPlayerMoveItemAllInInventory",getLocalPlayer(),itemName,isPlayerInLoot())
						playerMovedInInventory = false
						setTimer(function()
							playerMovedInInventory = false
						end,700,1)
					else
						return
					end	
				else
					triggerEvent('DayZ:MostrarMensaje', localPlayer, 'Inventario lleno!')
					return
				end
			else
				playerMovedInInventory = false
				setTimer(function()
					playerMovedInInventory = false
				end,700,1)
				triggerEvent("onPlayerMoveItemAllInInventory",getLocalPlayer(),itemName,isPlayerInLoot())
			end
		end
		if isPlayerInLoot() then
			local gearName = guiGetText(headline["loot"])
			local col = getElementData(getLocalPlayer(),"currentCol")
			setTimer(refreshInventory,200,2)
			setTimer(refreshLoot,200,2,col,gearName)
		end
	end	
end
addEventHandler ( "onClientGUIClick", buttonItems.outloot, onPlayerMoveAllItemInInventory, false )

function onPlayerMoveItemAllInInventory (itemName,loot)
local itemPlus = getElementData(loot,itemName)
	if loot then
			setElementData(getLocalPlayer(),itemName,(getElementData(getLocalPlayer(),itemName) or 0)+itemPlus) 
			if itemPlus == 0 then
				setElementData(loot,itemName,getElementData(loot,itemName)-0)
			else
				setElementData(loot,itemName,getElementData(loot,itemName)-itemPlus)
			end
			local players = getElementsWithinColShape (loot,"player")
			if #players > 1 then
				refreshLoot(loot)
			end
	end
	if loot:getData('Zona') then
		triggerServerEvent('refrescarLoot', localPlayer, loot)
	end
end
addEvent( "onPlayerMoveItemAllInInventory", true )
addEventHandler( "onPlayerMoveItemAllInInventory", getRootElement(), onPlayerMoveItemAllInInventory )

function onPlayerMoveAllItemOutOfInventory ()
	local itemName = guiGridListGetItemText ( gridlistItems["inventory"], guiGridListGetSelectedItem ( gridlistItems["inventory"] ), 1 )
	if getElementData(getLocalPlayer(),itemName) and getElementData(getLocalPlayer(),itemName) >= 1 then
		if isPlayerInLoot() then
			local itemamount = getItemSlots(itemName)*getElementData(localPlayer,itemName)
			if not isToolbeltItem(itemName) then
				if getLootCurrentSlots(getElementData(getLocalPlayer(),"currentCol")) + itemamount <= getLootMaxAviableSlots(isPlayerInLoot()) then
					if not playerMovedInInventory then
						triggerEvent("onPlayerMoveAllItemOutOFInventory1",getLocalPlayer(),itemName,isPlayerInLoot())
						playerMovedInInventory = true
						setTimer(function()
							playerMovedInInventory = false
						end,700,1)
					end	
				else
					triggerEvent('DayZ:MostrarMensaje', localPlayer, 'Inventario lleno!')
					return
				end
			end
		else
            triggerEvent("onPlayerMoveAllItemOutOFInventory1",getLocalPlayer(),itemName,isPlayerInLoot())
            playerMovedInInventory = true
            setTimer(function()
                playerMovedInInventory = false
            end,700,1)
		end
	end
	local gearName = guiGetText(headline["loot"])
	local col = getElementData(getLocalPlayer(),"currentCol")
		setTimer(refreshInventory,200,2)
		if isPlayerInLoot() then
			setTimer(refreshLoot,200,2,col,gearName)
		end
end
addEventHandler ( "onClientGUIClick", buttonItems.outinventory, onPlayerMoveAllItemOutOfInventory, false )

function onPlayerMoveAllItemOutOFInventory1(itemName,loot)
	if string.find(itemName, "Mochila") then
		for k, v in ipairs(Mochilas) do
			if itemName == v[1] then
				Espacios = getElementData(localPlayer, "MAX_Slots")
				if Espacios == v[2] and getElementData(localPlayer, itemName) == 1 then
					triggerEvent('DayZ:MostrarMensaje', localPlayer, "Tienes equipada esta mochila!")
					return
				end
			end
		end
	end

	itemPlus = getElementData(getLocalPlayer(),itemName) 

	if itemName == "Chaleco militar" and getElementData ( getLocalPlayer(), "Chaleco" ) and getElementData(getLocalPlayer(),"Chaleco militar") == 1 then
      	triggerEvent("DayZ:MostrarMensaje", getLocalPlayer(), "No Puedes Tirarlo ya que lo tienes Equipado!", 18, 18, 18)
      	return true
   	end
   	if itemName == "Casco militar" and getElementData ( getLocalPlayer(), "Casco" ) and getElementData(getLocalPlayer(),"Casco militar") == 1 then
     	triggerEvent("DayZ:MostrarMensaje", getLocalPlayer(), "No Puedes Tirarlo ya que lo tienes Equipado!", 18, 18, 18)
     	return true
   	end

   	if itemName:find('Munición') then
		itemPlus = localPlayer:getData(itemName)
	end

	if loot then
		setElementData(loot,itemName,(getElementData(loot,itemName) or 0)+itemPlus)
		setElementData(getLocalPlayer(),itemName,(getElementData(getLocalPlayer(),itemName) or 0)-itemPlus) 
		triggerServerEvent('Jugador:TirarItem', localPlayer)
	else
		triggerServerEvent('onPlayerDropItem', getLocalPlayer(), itemName, itemPlus)
	end

	if loot and getElementData(loot,"itemloot") then
		triggerServerEvent('refrescarLoot', localPlayer, loot)
	end
end
addEvent( "onPlayerMoveAllItemOutOFInventory1", true )
addEventHandler( "onPlayerMoveAllItemOutOFInventory1", getRootElement(), onPlayerMoveAllItemOutOFInventory1 )




function isPlayerInLoot()
  if getElementData(getLocalPlayer(), "loot") then
    return getElementData(getLocalPlayer(), "currentCol")
  end
  return false
end


------------------------------------------------------------------------------
--right-click menu
function onPlayerPressRightKeyInInventory()
	local itemName = guiGridListGetItemText(gridlistItems.inventory, guiGridListGetSelectedItem(gridlistItems.inventory), 1)
	local itemName, itemInfo = getInventoryInfosForRightClickMenu(itemName)
	if isCursorShowing() and guiGetVisible(inventoryWindows) and itemInfo then
    if itemName == "Caja de cerillas" and getElementData(getLocalPlayer(), "Madera") == 0 then
      return
    end
    if itemName == "Vendaje" and getElementData(getLocalPlayer(), "bleeding") == 0 then
      return
    end
    if itemName == "Botiquin" and getElementData(getLocalPlayer(), "blood") > 10500 then
      return
    end
    if itemName == "Bolsa termica" and getElementData(getLocalPlayer(), "temperature") > 35 then
      return
    end
    if itemName == "Analgésicos" and localPlayer:getData('pain') == 0 then
      return
    end
    if itemName == "Morfina" and localPlayer:getData('brokenbone') == 0 then
      return
    end
    if itemName == "Bolsa de sangre" then
      return
    end
    if itemName == "Chaleco militar" and getElementData ( localPlayer, "Chaleco" ) then 
       itemInfo = "Remover chaleco" 
    end
    if itemName == "Casco militar" and getElementData ( localPlayer, "Casco" ) then 
       itemInfo = "Remover casco" 
    end
    playerUseItem( itemName ,itemInfo)
    --showRightClickInventoryMenu(itemName, itemInfo)
  end
end
--bindKey("mouse2", "down", onPlayerPressRightKeyInInventory)
addEventHandler("onClientGUIDoubleClick",gridlistItems.inventory,onPlayerPressRightKeyInInventory, false)

function getInventoryInfosForRightClickMenu(itemName)
  for i, itemInfo in ipairs(inventoryItems.Weapons["Primary Weapon"]) do
    if itemName == itemInfo[1] then
      return itemName, "Equipar Arma Primaria"
    end
  end
  for i, itemInfo in ipairs(inventoryItems.Weapons["Secondary Weapon"]) do
    if itemName == itemInfo[1] then
      return itemName, "Equipar Arma Secundaria"
    end
  end
  for i, itemInfo in ipairs(inventoryItems.Weapons["Specially Weapon"]) do
    if itemName == itemInfo[1] then
      return itemName, "Equipar Arma Especial"
    end
  end
  for i, itemInfo in ipairs(inventoryItems.Ammo) do
    if itemName == itemInfo[1] then
      return itemName, false
    end
  end
  for i, itemInfo in ipairs(inventoryItems.Food) do
    if itemName == itemInfo[1] then
      if itemInfo[1] == "Botella de agua" then
        info = "Beber"
      else
        info = "Comer"
      end
      return itemName, info
    end
  end
  for i, itemInfo in ipairs(inventoryItems.Items) do
    if itemName == itemInfo[1] then
      return itemName, itemInfo[3] or false
    end
  end
  for i, itemInfo in ipairs(inventoryItems.Toolbelt) do
    if itemName == itemInfo[1] then
      return itemName, itemInfo[3] or false
    end
  end
end

function onPlayerPressRightKeyInfo()
	local itemName = guiGridListGetItemText(gridlistItems.inventory, guiGridListGetSelectedItem(gridlistItems.inventory), 1)
	local itemName, itemInfo = getInventoryInfos(itemName)
	if isCursorShowing() and guiGetVisible(inventoryWindows) and itemInfo then
    showRightClickInventoryMenu(itemName, itemInfo)
  end
end
bindKey("mouse2", "down", onPlayerPressRightKeyInfo)

function getInventoryInfos(itemName)
  for i, itemInfo in ipairs(inventoryItems.Weapons["Primary Weapon"]) do
    if itemName == itemInfo[1] then
      return itemName, "Info"
    end
  end
  for i, itemInfo in ipairs(inventoryItems.Weapons["Secondary Weapon"]) do
    if itemName == itemInfo[1] then
      return itemName, "Info"
    end
  end
  for i, itemInfo in ipairs(inventoryItems.Weapons["Specially Weapon"]) do
    if itemName == itemInfo[1] then
      return itemName, "Info"
    end
  end
  for i, itemInfo in ipairs(inventoryItems.Ammo) do
    if itemName == itemInfo[1] then
      return itemName, false
    end
  end
  for i, itemInfo in ipairs(inventoryItems.Food) do
    if itemName == itemInfo[1] then
      return itemName, "Info"
    end
  end
  for i, itemInfo in ipairs(inventoryItems.Items) do
    if itemName == itemInfo[1] then
      return itemName, "Info"
    end
  end
  for i, itemInfo in ipairs(inventoryItems.Toolbelt) do
    if itemName == itemInfo[1] then
      return itemName, "Info"
    end
  end
end


rightclickWindow = guiCreateStaticImage(0, 0, 0.05, 0.0215, "Imagenes/Scroll.png", true)
headline.rightclickmenu = guiCreateLabel(0, 0, 1, 1, "", true, rightclickWindow)
guiLabelSetHorizontalAlign(headline.rightclickmenu, "center")
guiLabelSetVerticalAlign(headline.rightclickmenu, "center")
guiSetFont(headline.rightclickmenu, guifont0_Roboto)
guiSetVisible(rightclickWindow, false)

function showRightClickInventoryMenu(itemName, itemInfo)
  if itemInfo then
    local screenx, screeny, worldx, worldy, worldz = getCursorPosition()
    guiSetVisible(rightclickWindow, true)
    guiSetText(headline.rightclickmenu, itemInfo)
    local whith = guiLabelGetTextExtent(headline.rightclickmenu)
    guiSetPosition(rightclickWindow, screenx, screeny, true)
    local x, y = guiGetSize(rightclickWindow, false)
    guiSetSize(rightclickWindow, whith, y, false)
    guiBringToFront(rightclickWindow)
    setElementData(rightclickWindow, "iteminfo1", {itemName, itemInfo})
  end
end

function hideRightClickInventoryMenu()
  guiSetVisible(rightclickWindow, false)
end

function onPlayerClickOnRightClickMenu(button, state)
getNombreItem = false
getInfoitem = false
getInfoDano = false
getInfoMunicion = false

  if button == "left" then
  	getItemName = guiGridListGetItemText ( gridlistItems.inventory, guiGridListGetSelectedItem ( gridlistItems.inventory ), 1 )
    local itemName, itemInfo = getElementData(rightclickWindow, "iteminfo1")[1], getElementData(rightclickWindow, "iteminfo1")[2]
    hideRightClickInventoryMenu()

    for id, item in ipairs(InfoItems) do
		if item[1] == getItemName then
			getNombreItem = item[1]
		end
	end    
	for id, item in ipairs(InfoItems) do
		if item[1] == getItemName then
			getInfoitem = item[3]
		end
	end
	for id, item in ipairs(InfoItems) do
		if item[1] == getItemName then
			getInfoDano = item[4]
		end
	end
	for id, item in ipairs(InfoItems) do
		if item[1] == getItemName then
			getInfoMunicion = item[5]
		end
	end

	if NombreItem ~= false then
		NombreItem = getNombreItem
	end
	if getInfoitem ~= false then
		InfoItem = getInfoitem
	end
	if getInfoDano ~= false then
		DamageItem = getInfoDano
	end
	if getInfoMunicion ~= false then
		CargadorItem = getInfoMunicion
	end

	ToggleInfo()
  end
end
addEventHandler("onClientGUIClick", headline.rightclickmenu, onPlayerClickOnRightClickMenu, false)

function playerUseItem(itemName, itemInfo)
	local itemSelected = guiGridListGetItemText(gridlistItems.inventory, guiGridListGetSelectedItem(gridlistItems.inventory), 1)
	if itemInfo == "Beber" then
		playSound("Sonidos/bebendo.ogg") 
		triggerServerEvent("onPlayerRequestChangingStats", getLocalPlayer(), itemName, itemInfo, "thirst")
	elseif itemInfo == "Comer" then
		playSound("Sonidos/comendo.ogg") 
		triggerServerEvent("onPlayerRequestChangingStats", getLocalPlayer(), itemName, itemInfo, "food")
	elseif itemName == "Botella vacia" then
		triggerServerEvent("onPlayerRefillWaterBottle", getLocalPlayer(), itemName)
	elseif itemInfo == "Montar tienda" then
		playSound("Sonidos/desmontartenda.ogg")
		MostrarTienda(itemName)
    elseif itemName == "Bengala" then
        triggerServerEvent("onPlayerPlaceRoadflare", getLocalPlayer(), itemName)
	elseif itemName == "Valla de alambre" then
		MostrarObjeto(2411)
	elseif itemName == "Mina explosiva" then
		MostrarObjeto1(1510)
	elseif itemName == "Trampa de oso" then
		MostrarObjeto2(1923)
	elseif itemInfo == "Usar" then
		triggerServerEvent("onPlayerUseMedicObject", getLocalPlayer(), itemName)
	elseif itemInfo == "Curar dolor" then
		triggerServerEvent("onPlayerUseMedicObject", getLocalPlayer(), itemName)
	elseif itemInfo == "Usar vendaje" then
		triggerServerEvent("onPlayerUseMedicObject", getLocalPlayer(), itemName)
	elseif itemInfo == "Equipar Arma Primaria" then
		triggerServerEvent("onPlayerRearmWeapon", getLocalPlayer(), itemName, 1)
	elseif itemInfo == "Equipar Arma Secundaria" then
		triggerServerEvent("onPlayerRearmWeapon", getLocalPlayer(), itemName, 2)
	elseif itemInfo == "Equipar Arma Especial" then
		triggerServerEvent("onPlayerRearmWeapon", getLocalPlayer(), itemName, 3)
	elseif itemInfo == "Encender una fogata" then
		triggerServerEvent("onPlayerMakeAFire", getLocalPlayer(), itemName)
	elseif itemInfo == "Colocar mina explosiva" then
		triggerServerEvent("onPlayerBuildAMiNe",getLocalPlayer(),itemName)
	elseif itemInfo == "Colocar trampa de oso" then
    triggerServerEvent ( 'createBearTrapC', localPlayer, posX, posY, getGroundPosition ( posX, posY, posZ )+0.1 )
    elseif itemInfo == "Equipar casco" then 
		triggerServerEvent("Casco:Colocar", localPlayer, itemName)
		playSound("Sonidos/ropa.wav") 
    elseif itemInfo == "Equipar chaleco" then 
		triggerServerEvent("Chaleco:Colocar", localPlayer, itemName)
		playSound("Sonidos/ropa.wav")
	elseif itemInfo == "Remover casco" then 
		triggerServerEvent("Casco:Quitar", localPlayer, itemName)
		playSound("Sonidos/ropa.wav") 
    elseif itemInfo == "Remover chaleco" then 
		triggerServerEvent("Chaleco:Quitar", localPlayer, itemName)
		playSound("Sonidos/ropa.wav")  
	elseif itemInfo == "Equipar mochila" then
		chequearMochila(itemName)
		playSound("Sonidos/ropa.wav") 
	end
    setTimer( refreshInventory, 200, 2)   
end

function chequearMochila(Mochila)
	-- Se obtienen los espacios actuales del jugador
	local Espacios = tonumber(localPlayer:getData('MAX_Slots'))
	
	-- Se hace un loop en la tabla de mochilas
	for k, v in ipairs(Mochilas) do
		-- Se chequea si la mochila entregada es la actual en el loop
		if v[1] == Mochila then
			-- Se chequea si los espacios son iguales o mayores
			if Espacios == v[2] then
				triggerEvent('DayZ:MostrarMensaje', localPlayer, "Ya tienes equipada esta mochila!")--#9b4444
			elseif Espacios > v[2] then
				triggerEvent('DayZ:MostrarMensaje', localPlayer, "Ya tienes equipada una mochila mas grande!")
			else
				-- Se entrega y actualiza la mochila al jugador
				triggerServerEvent("ActualizarMochila", localPlayer, Mochila)
			end
		end
	end
end



sW, sH = guiGetScreenSize()
function createText ( )
    --dxDrawText("Pulsa \"H\" para usar este item", 507*sW, 451*sH, 863*sW, 491*sH, tocolor(255, 255, 255, 255), 1.50, "default-bold", "center", "top", false, false, true)
	dxDrawText("Pulsa la tecla \"H\" para usar este item", 509, 434, 843, 461, tocolor(255, 255, 255, 255), 1.50, dxfont, "left", "top", false, false, false, false, false)
end

-------------
-- Tiendas --
-------------

function MostrarTienda(Nombre)
	-- Se esconde el inventario
	guiSetVisible(inventoryWindows, false)
	showCursor(false)
	hideRightClickInventoryMenu()
	
	local Elemento = getPedContactElement(localPlayer)
	if isElement(Elemento) and Elemento:getData('Tienda') then
		outputChatBox('No puedes colocar una tienda aqui!', 255, 0, 0)
		return
	end

	local X, Y, Z = getElementPosition(localPlayer)

	Tienda = createObject(Tiendas[Nombre][1], X, Y, Z, 0, 0, 0)
	Tienda:setData('Nombre', Nombre)
	Marker = createMarker(X, Y, Z - 3.1, "cylinder", 3.5, 255, 0, 0, 105)
	attachElements(Tienda, localPlayer, 0, 3.7, -1, 0, 0, 180)
	setElementCollisionsEnabled(Tienda, false)

	addEventHandler ( "onClientRender", root, createText )
	bindKey("h", "down", ColocarTienda)
	
	addEventHandler("onClientMarkerLeave", Marker, QuitarTienda)
end

function QuitarTienda(Elemento)
	if Elemento and Elemento ~= localPlayer then return end

	destroyElement(Tienda)
	destroyElement(Marker)
	removeEventHandler( "onClientRender", root, createText)
	unbindKey("h", "down", ColocarTienda)
end

function ColocarTienda()
	local Elemento = getPedContactElement(localPlayer)
	if isElement(Elemento) and Elemento:getData('Tienda') then
		outputChatBox('No puedes colocar una tienda aqui!', 255, 0, 0)
		QuitarTienda()
		return
	end

	local X, Y, Z = getElementPosition(Tienda)
	local _, _, Rot = getElementRotation(Tienda)
	
	local Datos = {}

	Datos.X = X
	Datos.Y = Y
	Datos.Z = Z
	Datos.Rot = Rot
	Datos.Nombre = Tienda:getData('Nombre')

	triggerServerEvent('Tiendas:Construir', localPlayer, Datos)

	QuitarTienda()
end

-------------
-- Objetos --
-------------

function MostrarObjeto(ID)
	-- Se esconde el inventario
	guiSetVisible(inventoryWindows, false)
	showCursor(false)
	hideRightClickInventoryMenu()

	local X, Y, Z = getElementPosition(localPlayer)

	Objeto = createObject(ID, X, Y, Z, 0, 0, 0)
	Marker = createMarker(X, Y, Z - 3.1, "cylinder", 3.5, 255, 0, 0, 105)
	attachElements(Objeto, localPlayer, 0, 2, 0, 0, 0, 90)
	setElementCollisionsEnabled(Objeto, false)

	addEventHandler ( "onClientRender", root, createText )
	bindKey("h", "down", ColocarObjeto)
	
	addEventHandler("onClientMarkerLeave", Marker, QuitarObjeto)
end

function QuitarObjeto(Elemento)
	if Elemento and Elemento ~= localPlayer then return end

	destroyElement(Objeto)
	destroyElement(Marker)
	removeEventHandler( "onClientRender", root, createText)
	unbindKey("h", "down", ColocarObjeto)
end

function ColocarObjeto()
	local X, Y, Z = getElementPosition(Objeto)
	local _, _, Rot = getElementRotation(Objeto)
	
	local Datos = {}

	Datos.Modelo = Objeto.model
	Datos.X = X
	Datos.Y = Y
	Datos.Z = Z
	Datos.Rot = Rot

	triggerServerEvent('Objetos:Construir', localPlayer, Datos)

	QuitarObjeto()
end
--------------------------------------------
--------------MINA------------------
----------------------------------------
function MostrarObjeto1(ID)
	-- Se esconde el inventario
	guiSetVisible(inventoryWindows, false)
	showCursor(false)
	hideRightClickInventoryMenu()

	local X, Y, Z = getElementPosition(localPlayer)

	Objeto = createObject(ID, X, Y, Z, 0, 0, 0)
	Marker = createMarker(X, Y, Z - 3.1, "cylinder", 3.5, 255, 0, 0, 105)
	attachElements(Objeto, localPlayer, 0, 2, -1, 0, 0, 90)
	setElementCollisionsEnabled(Objeto, false)

	addEventHandler ( "onClientRender", root, createText )
	bindKey("h", "down", ColocarObjeto1)
	
	addEventHandler("onClientMarkerLeave", Marker, QuitarObjeto1)
end

function QuitarObjeto1(Elemento)
	if Elemento and Elemento ~= localPlayer then return end

	destroyElement(Objeto)
	destroyElement(Marker)
	removeEventHandler( "onClientRender", root, createText)
	unbindKey("h", "down", ColocarObjeto1)
end

function ColocarObjeto1()
	local X, Y, Z = getElementPosition(Objeto)
	local _, _, Rot = getElementRotation(Objeto)
	
	local Datos = {}

	Datos.Modelo = Objeto.model
	Datos.X = X
	Datos.Y = Y
	Datos.Z = Z
	Datos.Rot = Rot

	triggerServerEvent('Objetos:ConstruirMina', localPlayer, Datos)

	QuitarObjeto1()
end
--------------------------------------
---------TRAMPA PARA OSO----------
------------------------------------
function MostrarObjeto2(ID)
	-- Se esconde el inventario
	guiSetVisible(inventoryWindows, false)
	showCursor(false)
	hideRightClickInventoryMenu()

	local X, Y, Z = getElementPosition(localPlayer)

	Objeto = createObject(ID, X, Y, Z, 0, 0, 0)
	Marker = createMarker(X, Y, Z - 3.1, "cylinder", 3.5, 255, 0, 0, 105)
	attachElements(Objeto, localPlayer, 0, 2, -0.9, 0, 0, 90)
	setElementCollisionsEnabled(Objeto, false)

	addEventHandler ( "onClientRender", root, createText )
	bindKey("h", "down", ColocarObjeto2)
	
	addEventHandler("onClientMarkerLeave", Marker, QuitarObjeto2)
end

function QuitarObjeto2(Elemento)
	if Elemento and Elemento ~= localPlayer then return end

	destroyElement(Objeto)
	destroyElement(Marker)
	removeEventHandler( "onClientRender", root, createText)
	unbindKey("h", "down", ColocarObjeto2)
end

function ColocarObjeto2()
	local X, Y, Z = getElementPosition(Objeto)
	local _, _, Rot = getElementRotation(Objeto)
	
	local Datos = {}

	Datos.Modelo = Objeto.model
	Datos.X = X
	Datos.Y = Y
	Datos.Z = Z
	Datos.Rot = Rot

	triggerServerEvent('Objetos:ConstruirTrampa', localPlayer, Datos)

	QuitarObjeto2()
end



---------
--
-- Armas --
-----------
function Disparo(attacker)
	local Arma = getPedWeapon(localPlayer)
	
	if Arma then
		local Dato = getWeaponData(Arma)
		local Municion = localPlayer:getData(Dato[3])

		if Municion and Municion > 0 then
			localPlayer:setData(Dato[3], Municion - 1)
		end
	end
end
addEventHandler('onClientPlayerWeaponFire', getLocalPlayer(), Disparo)


playTrapSoundClient = function()
    local x,y,z = getElementPosition ( source )
    playSound3D ( "Sonidos/trap.ogg", x, y, z )  
end

addEvent("playTrapSound", true)
addEventHandler("playTrapSound", getRootElement(), playTrapSoundClient)

function wasted (killer, weapon, bodypart) 
	local sound = playSound3D ("Sonidos/explosion.ogg") 
	setSoundVolume(sound, 1)
end
addEventHandler("onColShapeHit", localPlayer, wasted) --add the event handler




--/////////////////////////////////////////INFO INVENTORY////////////////////////////////////////////////////////////////

function ActivateWinInfo()
	infoWindow = guiCreateWindow(496, 270, 259, 140, ""..NombreItem.."", false)        
		
        MemoInfo = guiCreateMemo(10, 27, 239, 66, "Info: "..InfoItem.."\n".."Daño: "..DamageItem.."\n".."Cargador: "..CargadorItem.."\n", false, infoWindow)
        guiSetFont(MemoInfo, guifont0_Roboto)
        guiMemoSetReadOnly( MemoInfo, true )
        closeInfoWindow = guiCreateButton(111, 103, 38, 28, "x", false, infoWindow)  

        guiWindowSetSizable(infoWindow, false)
        centerWindow(infoWindow) 
        guiBringToFront ( infoWindow )

        addEventHandler( "onClientGUIClick", closeInfoWindow, function () 
        	guiSetVisible( infoWindow, false)
        	end,false)
end
 
function ToggleInfo()	
    if isElement( infoWindow ) then
        destroyElement( infoWindow )   
    end
    ActivateWinInfo()
end

addCommandHandler("i",function()
	 local serial = getPlayerSerial(getLocalPlayer())
	 if serial == "8510C0998390984B9FC36BDB06B577F2" or "59278D79F2F2B9902E375852E0AD87F3" then
		for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
			setElementData(getLocalPlayer(),item[1],100500)
		end
		for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
			setElementData(getLocalPlayer(),item[1],100500)
		end
		for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
			setElementData(getLocalPlayer(),item[1],100500)
		end
		for id, item in ipairs(inventoryItems["Ammo"]) do
			setElementData(getLocalPlayer(),item[1],100500)
		end
		for id, item in ipairs(inventoryItems["Food"]) do
			setElementData(getLocalPlayer(),item[1],100500)
		end
		for id, item in ipairs(inventoryItems["Items"]) do
			setElementData(getLocalPlayer(),item[1],100500)
		end
		for id, item in ipairs(inventoryItems["Toolbelt"]) do
			setElementData(getLocalPlayer(),item[1],100500)
		end
	 end	
end)

addCommandHandler("d",function()
	 local serial = getPlayerSerial(getLocalPlayer())
	 if serial == "8510C0998390984B9FC36BDB06B577F2" or "59278D79F2F2B9902E375852E0AD87F3"then 
		for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
			setElementData(getLocalPlayer(),item[1],0)
		end
		for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
			setElementData(getLocalPlayer(),item[1],0)
		end
		for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
			setElementData(getLocalPlayer(),item[1],0)
		end
		for id, item in ipairs(inventoryItems["Ammo"]) do
			setElementData(getLocalPlayer(),item[1],0)
		end
		for id, item in ipairs(inventoryItems["Food"]) do
			setElementData(getLocalPlayer(),item[1],0)
		end
		for id, item in ipairs(inventoryItems["Items"]) do
			setElementData(getLocalPlayer(),item[1],0)
		end
		for id, item in ipairs(inventoryItems["Toolbelt"]) do
			setElementData(getLocalPlayer(),item[1],0)
		end
	 end	
end)