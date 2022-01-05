--// Proposito: Funcionamiento del menú izquierdo

Menu = {}
Menu.Opciones = {}
Menu.Actual = 1

function Menu.Render()
	-- Se cancela si no hay opciones en el menu
	if #Menu.Opciones == 0 then return end
 
	-- Rectangulo de seleccion
	--dxDrawRectangle(0*sW, (327 + (19 * Menu.Actual))*sH, 219*sW, 19*sH, tocolor(155, 68, 68, 255), false)
	dxDrawRectangle ( 12*sW, (327 + (19 * Menu.Actual))*sH, 180*sW, 19*sH, colorPrincipal)
	--dxDrawText(">", 0*sW - 1, (653 + (38 * Menu.Actual))*sH - 1, 28*sW - 1, 19*sH - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "center", false, false, false, false, false)
	--dxDrawText(">", 0*sW + 1, (653 + (38 * Menu.Actual))*sH - 1, 28*sW + 1, 19*sH - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "center", false, false, false, false, false)
	--dxDrawText(">", 0*sW - 1, (653 + (38 * Menu.Actual))*sH + 1, 28*sW - 1, 19*sH + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "center", false, false, false, false, false)
	dxDrawText(">", 0*sW + 1, (653 + (38 * Menu.Actual))*sH + 1, 28*sW + 1, 19*sH + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "center", false, false, false, false, false)
	dxDrawText(">", 0*sW, (653 + (38 * Menu.Actual))*sH, 28*sW, 19*sH, colorBlanco, 1.00, dxfont, "left", "center", false, false, false, false, false)

	for k, v in ipairs(Menu.Opciones) do
		if k == Menu.Actual then
			--dxDrawText(v[2]:gsub('#%x%x%x%x%x%x', ''), 15*sW - 1, (327 + (19 * k))*sH - 1, 219*sW - 1, (346 + (19 *k))*sH - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "center", false, false, false, false)
			--dxDrawText(v[2]:gsub('#%x%x%x%x%x%x', ''), 15*sW + 1, (327 + (19 * k))*sH - 1, 219*sW + 1, (346 + (19 *k))*sH - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "center", false, false, false, false)
			--dxDrawText(v[2]:gsub('#%x%x%x%x%x%x', ''), 15*sW - 1, (327 + (19 * k))*sH + 1, 219*sW - 1, (346 + (19 *k))*sH + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "center", false, false, false, false)
			dxDrawText(v[2]:gsub('#%x%x%x%x%x%x', ''), 15*sW + 1, (327 + (19 * k))*sH + 1, 219*sW + 1, (346 + (19 *k))*sH + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "center", false, false, false, false)
			dxDrawText(v[2], 15*sW, (327 + (19 * k))*sH, 219*sW, (346 + (19 *k))*sH, ColorBlanco, 1.00, dxfont, "left", "center", false, false, false, true)
		else
			--dxDrawText(v[2]:gsub('#%x%x%x%x%x%x', ''), 15*sW - 1, (327 + (19 * k))*sH - 1, 219*sW - 1, (346 + (19 *k))*sH - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "center", false, false, false, false)
			--dxDrawText(v[2]:gsub('#%x%x%x%x%x%x', ''), 15*sW + 1, (327 + (19 * k))*sH - 1, 219*sW + 1, (346 + (19 *k))*sH - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "center", false, false, false, false)
			--dxDrawText(v[2]:gsub('#%x%x%x%x%x%x', ''), 15*sW - 1, (327 + (19 * k))*sH + 1, 219*sW - 1, (346 + (19 *k))*sH + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "center", false, false, false, false)
			dxDrawText(v[2]:gsub('#%x%x%x%x%x%x', ''), 15*sW + 1, (327 + (19 * k))*sH + 1, 219*sW + 1, (346 + (19 *k))*sH + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "left", "center", false, false, false, false)
			dxDrawText(v[2], 15*sW, (327 + (19 * k))*sH, 219*sW, (346 + (19 *k))*sH, colorBlanco, 1.00, dxfont, "left", "center", false, false, false, true)
		end
	end 
end

function Menu.Crear()
	addEventHandler('onClientRender', root, Menu.Render)
end

function Menu.Scroll (key,keyState,arg)
    if keyState ~= 'down' or #Menu.Opciones == 0 then return end
        if ( keyState == "down" ) then
            if arg == "up" then
                Menu.Actual = Menu.Actual-1
                if Menu.Actual < 1 then
                    Menu.Actual = #Menu.Opciones
                end
            elseif arg == "down" then
                Menu.Actual = Menu.Actual+1
                if Menu.Actual > #Menu.Opciones then
                    Menu.Actual = 1
                end
            end
        end
end
bindKey ( "mouse_wheel_up", "down", Menu.Scroll, "up" )
bindKey ( "mouse_wheel_down", "down", Menu.Scroll, "down" )
bindKey ( "1", "down", Menu.Scroll, "up" )
bindKey ( "2", "down", Menu.Scroll, "down" )

function Menu.Limpiar()
	Menu.Opciones = {}
	Menu.Actual = 1

	setNewbieInfo (false,"","")
end

currentCol = nil
currentVeh = false

function Menu.IngresoCol(Elemento)
	if Elemento ~= localPlayer then return end
	if source:getData('parent') == localPlayer then return end
	if getPedOccupiedVehicle(localPlayer) then return end

	Menu.Opciones = {}
	Menu.Actual = 1

	if source:getData('parent') and source:getData('parent').type == 'player' then
		local Jugador = source:getData('parent')
		
		if Jugador:getData('bleeding') and Jugador:getData('bleeding') > 0 then
			if localPlayer:getData('Vendaje') and localPlayer:getData('Vendaje') > 0 then
				table.insert(Menu.Opciones, {'Vendaje', 'Vendar a '..Jugador.name})
			end
		end

		if Jugador:getData('brokenbone') and Jugador:getData('brokenbone') > 0 then
			if localPlayer:getData('Morfina') and localPlayer:getData('Morfina') > 0 then
				table.insert(Menu.Opciones, {'Morfina', 'Inyectar morfina a '..Jugador.name})
			end
		end
		
		if Jugador:getData('pain') and Jugador:getData('pain') > 0 then
			if localPlayer:getData('Analgésicos') and localPlayer:getData('Analgésicos') > 0 then
				table.insert(Menu.Opciones, {'Analgésicos', 'Curar a '..Jugador.name})
			end
		end
		
		if Jugador:getData('blood') < 12000 then
			if localPlayer:getData('Bolsa de sangre') and localPlayer:getData('Bolsa de sangre') > 0 then
				table.insert(Menu.Opciones, {'Bolsa de sangre', 'Aplicar bolsa de sangre'})
			end
		end

		setElementData(getLocalPlayer(),"currentCol",source)
		setElementData(getLocalPlayer(),"loot",false)
		return
	end

	if getElementData(source,"patrolstation") then
		table.insert(Menu.Opciones, {'Recargar', 'Rellenar bidón vacio'})
		setElementData(getLocalPlayer(),"currentCol",source)
		setElementData(getLocalPlayer(),"loot",false)
		setNewbieInfo (true,"Combustible","Pulsa '-' para rellenar un bidón!\n REQUIERE: Bidón vacio",source)
		return
	end
		
	if getElementData(source,"wirefence") then
		table.insert(Menu.Opciones, {'Quitar valla', 'Desarmar valla de alambre'})
		setElementData(getLocalPlayer(),"currentCol",source)
		setElementData(getLocalPlayer(),"loot",false)
		setNewbieInfo (true,"Valla de alambre","Pulsa '-' para desarmarla!",source)
		return
	end
	
	if getElementData(source,"carmine") then
		table.insert(Menu.Opciones, {'Desarmar mina explosiva', 'Desarmar mina explosiva'})
		setElementData(getLocalPlayer(),"currentCol",source)
		setElementData(getLocalPlayer(),"loot",false)
		setNewbieInfo (true,"Mina explosiva","Pulsa '-' para desarmarla!",source)
		return
	end
	
	if getElementData(source,"nearShapeLink") then
		table.insert(Menu.Opciones, {'Desarmar trampa para oso', 'Desarmar trampa para oso'})
		setElementData(getLocalPlayer(),"currentCol",source)
		setElementData(getLocalPlayer(),"loot",false)
		setNewbieInfo (true,"Trampa de oso","Pulsa '-' para desarmarla!",source)
		return
	end

	if getElementData(source,"deadman") then
		table.insert(Menu.Opciones, {'Cadaver', 'Cadaver de '..getElementData(source,"playername")})
		table.insert(Menu.Opciones, {'deadreason', 'Información del cadaver'})
		setElementData(getLocalPlayer(),"currentCol",source)
		setElementData(getLocalPlayer(),"loot",true)
		setElementData(getLocalPlayer(),"lootname","Cadaver ("..string.gsub(getElementData(source,"playername"), '#%x%x%x%x%x%x', '' )..")")
		setNewbieInfo (true,"Cadaver ("..string.gsub(getElementData(source,"playername"), '#%x%x%x%x%x%x', '' )..")","Pulsa J para acceder al inventario!",source)
		return
	end

	if source:getData('item') then
		table.insert(Menu.Opciones, {'Tomar', 'Recoger: '..source:getData('item')})
		setElementData(getLocalPlayer(),"currentCol",source)
		setElementData(getLocalPlayer(),"loot",false)
		setNewbieInfo (true,getElementData(source,"item"),"Pulsa '-' para tomar este item!",source)
		return
	end

	if getElementData(source,"helicrash") then
		table.insert(Menu.Opciones, {'Helicrash', 'Revisar choque de helicoptero'})
		setElementData(getLocalPlayer(),"currentCol",source)
		setElementData(getLocalPlayer(),"loot",true)
		setElementData(getLocalPlayer(),"lootname","Gear (Helicrash)")
		setNewbieInfo (true,"Choque de helicoptero","Pulsa J para acceder al inventario!",source)
		return
	end

	if getElementData(source,"airdrop") then
		table.insert(Menu.Opciones, {'Caja de recursos', 'Revisar caja de recursos'})
		setElementData(getLocalPlayer(),"currentCol",source)
		setElementData(getLocalPlayer(),"loot",true)
		setElementData(getLocalPlayer(),"lootname","Gear (Airdrop)")
		setNewbieInfo (true,"Caja de Recursos","Pulsa J para acceder al inventario!",source)
		return
	end	

	if getElementData(source,"hospitalbox") then
		table.insert(Menu.Opciones, {'Caja medica', 'Revisar caja medica'})
		setElementData(getLocalPlayer(),"currentCol",source)
		setElementData(getLocalPlayer(),"loot",true)
		setElementData(getLocalPlayer(),"lootname","Gear (Hospitalbox)")
		setNewbieInfo (true,"Caja de hospital","Pulsa J para acceder al inventario!",source)
		return
	end
		
	if getElementData(source, 'tent') then
		table.insert(Menu.Opciones, {'Tienda', 'Revisar tienda'})
		table.insert(Menu.Opciones, {'RemoverTienda', 'Remover tienda'})
		setElementData(getLocalPlayer(),"currentCol",source)
		setElementData(getLocalPlayer(),"loot",true)
		localPlayer:setData('lootname', 'Tienda')
		setNewbieInfo (true, source:getData('Nombre'), 'Pulsa J para acceder al inventario!', source)
		return
	end

	if getElementData(source, 'tentADM') then
		table.insert(Menu.Opciones, {'TiendaADM', 'Revisar tienda Full'})
		setElementData(getLocalPlayer(),"currentCol",source)
		setElementData(getLocalPlayer(),"loot",true)
		localPlayer:setData('lootname', 'TiendaADM')
		setNewbieInfo (true, source:getData('Nombre'), 'Pulsa J para acceder al inventario!', source)
		if getElementData(localPlayer,"Inmortal") then
		table.insert(Menu.Opciones, {'RemoverTiendaADM', 'Remover tienda'})
		end
		return
	end

	if getElementData(source, 'tentB') then
		table.insert(Menu.Opciones, {'TiendaBase', 'Revisar Caja'})
		setElementData(getLocalPlayer(),"currentCol",source)
		setElementData(getLocalPlayer(),"loot",true)
		localPlayer:setData('lootname', 'TiendaBase')
		setNewbieInfo (true, source:getData('Nombre'), 'Pulsa J para acceder al inventario!', source)
		if getElementData(localPlayer,"Inmortal") then
		table.insert(Menu.Opciones, {'RemoverTiendaBase', 'Remover Caja'})
		end
		return
	end

	if source:getData('Zona') then
		table.insert(Menu.Opciones, {'Items', 'Zona de items ('..source:getData('Zona')..')'})
		localPlayer:setData('loot',true)
		localPlayer:setData('lootname', 'Zona de items')
		localPlayer:setData('currentCol', source)
		setNewbieInfo (true,"Zona de items","Pulsa J para acceder al inventario!",source)
		return
	end
	
	if source:getData('parent') and source:getData('parent').type == 'vehicle' then

		currentVeh = getElementData(source, 'parent')
		Veh = source:getData('parent')

		if isVehicleBlown( currentVeh ) then return end

		if Veh.health < 1000 then
			table.insert(Menu.Opciones, {'Reparar', 'Reparar vehiculo'})
		end
		
		if tonumber(Veh:getData('Combustible')) < tonumber(Veh:getData('Combustible_Max')) then
			table.insert(Menu.Opciones, {'Rellenar', 'Recargar combustible'})
		end

		if tonumber(Veh:getData('Motor')) < tonumber(Veh:getData('Motor_Max')) then
			table.insert(Menu.Opciones, {'Motor', 'Colocar motor ('..Veh:getData('Motor')..'/'..Veh:getData('Motor_Max')..')'})
		end

		if tonumber(Veh:getData('Neumatico')) < tonumber(Veh:getData('Neumatico_Max')) then
			table.insert(Menu.Opciones, {'Neumatico', 'Colocar neumatico ('..Veh:getData('Neumatico')..'/'..Veh:getData('Neumatico_Max')..')'})
		end

		if tonumber(Veh:getData('Motor')) > 0 then
			table.insert(Menu.Opciones, {'QMotor', 'Remover motor ('..Veh:getData('Motor')..'/'..Veh:getData('Motor_Max')..')'})
		end

		if tonumber(Veh:getData('Neumatico')) > 0 then
			table.insert(Menu.Opciones, {'QRueda', 'Remover neumatico ('..Veh:getData('Neumatico')..'/'..Veh:getData('Neumatico_Max')..')'})
		end

		localPlayer:setData('loot', true)
		localPlayer:setData('lootname', 'Vehiculo ('..Veh.name..')')
		localPlayer:setData('currentCol', source)
		localPlayer:setData('currentVeh', Veh)
		currentCol = source
		return
	end
end
addEventHandler("onClientColShapeHit",getRootElement(), Menu.IngresoCol)

function Menu.SalidaCol(Elemento)
	if Elemento ~= getLocalPlayer() then return end

	Menu.Limpiar()

	localPlayer:setData('loot', false)
	localPlayer:setData('currentCol', false)
end
addEventHandler('onClientColShapeLeave', getRootElement(), Menu.SalidaCol)

function Menu.IngresoVeh(Vehiculo, Asiento)
	Menu.Limpiar()

	if Vehiculo:getData('parent') then
		if Asiento ~= 0 then return end


		localPlayer:setData('loot', true)
		localPlayer:setData('currentCol', Vehiculo:getData('parent'))
		localPlayer:setData('lootname', 'Vehiculo ('..Vehiculo.name..')')
	end
end
addEventHandler('onClientPlayerVehicleEnter', localPlayer, Menu.IngresoVeh)

function Menu.SalidaVeh(Vehiculo, Asiento)
	if Asiento ~= 0 then return end

	if Vehiculo.parent then
		localPlayer:setData('loot', false)
		localPlayer:setData('currentCol', false)
	end
end
addEventHandler('onClientPlayerVehicleExit', localPlayer, Menu.SalidaVeh)

--Newbie Infos
local screenWidth, screenHeight = guiGetScreenSize()
local newbieShow = false
local newbieHead = "-"
local newbieText = "-"
local newbiePosition = 0,0,0

function setNewbieInfo (show,head,text,element)
newbieShow = show
newbieHead = head
newbieText = text
newbiePosition = element
end

addEventHandler("onClientRender", getRootElement(), 
function()
	if not newbieShow or not isElement(newbiePosition) then return end

	local x, y, z = getElementPosition(newbiePosition)
	local x, y = getScreenFromWorldPosition(x,y,z)
	local length = dxGetTextWidth(newbieText,1,"default-bold")
	--if type(x) == "number" and type(y) == "number" then
		--dxDrawText(newbieHead, x-13, y+2, x, y, tocolor(0, 0, 0, 200), 1, "default-bold", "center", "center")
		--dxDrawText(newbieHead, x-15, y, x, y, tocolor(155, 68, 68, 255), 1, "default-bold", "center", "center")

		--dxDrawText(newbieText, x, y+50, x, y, tocolor(255,255,255, 255), 1, "default-bold", "center", "center")
	--end
	if x then
		dxDrawImage ( x-length/3-screenWidth*-0.02,y, screenWidth*0.05, screenHeight*0.08, "Imagenes/items.png",0,0,0, colorPrincipal)
	end
end
)

function onPlayerPressMiddleMouse(key,keyState)
	if keyState ~= 'down' then return end
	if #Menu.Opciones == 0 then return end

	local Opcion = Menu.Opciones[Menu.Actual][1]
	local Col = localPlayer:getData('currentCol')
	
	if Col and isElement(Col) then
		local Obj = Col:getData('parent')
	end

	if Opcion == 'Tomar' then
		local Item = Col:getData('item')
		
		if isToolbeltItem(Item) then
			triggerServerEvent('onPlayerTakeItem', localPlayer, Col)
		else
			if tonumber(getPlayerCurrentSlots() + getItemSlots(Item)) <= tonumber(localPlayer:getData('MAX_Slots')) then
				triggerServerEvent('onPlayerTakeItem', localPlayer, Col)
			else
				triggerEvent('DayZ:MostrarMensaje', localPlayer, 'Inventario lleno!')
			end
		end
		Menu.Limpiar()
		return
	end
	if Opcion == 'Items' then
		refreshLoot(Col, 'Zona de items')
		showInventoryManual()
		Menu.Limpiar()
		return
	end
	if Opcion == 'Tienda' then --tentCol
		refreshLoot(Col, 'Tienda')
		showInventoryManual()
		Menu.Limpiar()
		return
	end
	if Opcion == 'TiendaADM' then --tentCol
		refreshLoot(Col, 'TiendaADM')
		showInventoryManual()
		Menu.Limpiar()
		return
	end
	--if Opcion == 'Revisar' then
		--refreshLoot(Col, 'Revisar')
		--showInventoryManual()
		--Menu.Limpiar()
		--return
	--end
	if Opcion == 'RemoverTienda' then
		triggerServerEvent('removerTienda', localPlayer, getElementData(Col,"parent"), Col)
		Menu.Limpiar()
		return
	end
	if Opcion == 'RemoverTiendaADM' then
		triggerServerEvent('removerTiendaFull', localPlayer, getElementData(Col,"parent"), Col)
		Menu.Limpiar()
		return
	end
	if Opcion == 'RemoverTiendaBase' then
		triggerServerEvent('removerTiendaBase', localPlayer, getElementData(Col,"parent"), Col)
		Menu.Limpiar()
		return
	end
	if Opcion == 'Quitar valla' then
		triggerServerEvent('removeWirefence', localPlayer, Col)
		Menu.Limpiar()
		return
	end
	if Opcion == 'Reparar' then
		if localPlayer:getData('Caja de herramientas') and localPlayer:getData('Caja de herramientas') > 0 then
			triggerServerEvent('Vehiculos:Reparar', localPlayer, currentVeh)
		else
			outputChatBox('Necesitas una caja de herramientas para esto!', 255, 0, 0)
		end
		Menu.Limpiar()
		return
	end
	if Opcion == 'Rellenar' then
		if localPlayer:getData('Bidón con gasolina') and localPlayer:getData('Bidón con gasolina') > 0 then
			currentVeh:setData('Combustible', currentVeh:getData('Combustible') + 20)
			if currentVeh:getData('Combustible') > currentVeh:getData('Combustible_Max') then
				currentVeh:setData('Combustible', currentVeh:getData('Combustible_Max'))
			end
			localPlayer:setData('Bidón con gasolina', localPlayer:getData('Bidón con gasolina') - 1)
			localPlayer:setData('Bidón vacio', (localPlayer:getData('Bidón vacio') or 0) + 1)
			outputChatBox('Rellenaste combustible!', 0, 255, 0)
		else
			outputChatBox('No tienes combustible!', 255, 0, 0)
		end
		Menu.Limpiar()
		return
	end
	if Opcion == 'Motor' then
		if localPlayer:getData('Motor') and localPlayer:getData('Motor') > 0 then
			currentVeh:setData('Motor', currentVeh:getData('Motor') + 1)
			localPlayer:setData('Motor', localPlayer:getData('Motor') - 1)
			outputChatBox('Motor colocado!', 0, 255, 0)
		else
			outputChatBox('No tienes motores!', 255, 0, 0)
		end
		Menu.Limpiar()
		return
	end
	if Opcion == 'deadreason' then
	    local col = getElementData(getLocalPlayer(),"currentCol")
            outputChatBox(getElementData(col,"deadreason"),255,0,0,true)
        return
        Menu.Limpiar()
    end
	if Opcion == 'Neumatico' then
		if localPlayer:getData('Neumatico') and tonumber(localPlayer:getData('Neumatico')) > 0 then
			setElementData(currentVeh, 'Neumatico', tonumber(getElementData(currentVeh, 'Neumatico') or 0) + 1)
			localPlayer:setData('Neumatico', localPlayer:getData('Neumatico') - 1)
			outputChatBox('Neumatico colocado!', 0, 255, 0)
		else
			outputChatBox('No tienes neumaticos!', 255, 0, 0)
		end
		Menu.Limpiar()
		return
	end
	if Opcion == 'QMotor' then
		if not localPlayer:getData('Caja de herramientas') or localPlayer:getData('Caja de herramientas') <= 0 then
			outputChatBox('Necesitas una caja de herramientas para esto!', 255, 0, 0)
			return
		end

		if tonumber( currentVeh:getData('Motor') ) and tonumber( currentVeh:getData('Motor') ) > 0 then
			currentVeh:setData('Motor', (currentVeh:getData('Motor') or 0 ) - 1)
			localPlayer:setData('Motor', localPlayer:getData('Motor') + 1)
			outputChatBox('Removiste una pieza del vehiculo!', 0, 255, 0)
		else
			outputChatBox('No hay motores en el vehículo', 255, 0, 0)
		end
		Menu.Limpiar()
		return
	end
	if Opcion == 'QRueda' then
		if not localPlayer:getData('Caja de herramientas') or localPlayer:getData('Caja de herramientas') <= 0 then
			outputChatBox('Necesitas una caja de herramientas para esto!', 255, 0, 0)
			return
		end

		if tonumber( currentVeh:getData('Neumatico') ) and tonumber( currentVeh:getData('Neumatico') ) > 0 then
			currentVeh:setData('Neumatico', currentVeh:getData('Neumatico') - 1)
			localPlayer:setData('Neumatico', localPlayer:getData('Neumatico') + 1)
			outputChatBox('Removiste una pieza del vehiculo!', 0, 255, 0)
		else
			outputChatBox('No hay Ruedas en el vehículo', 255, 0, 0)
		end
		Menu.Limpiar()
		return
	end
	-- Enviar medicionas
	if Opcion == 'Vendaje' or Opcion == 'Bolsa de sangre' or Opcion == 'Morfina' or Opcion == 'Analgésicos' then
		triggerServerEvent('Items:AplicarMedicina', localPlayer, Opcion, Col:getData('parent'))
		return
		Menu.Limpiar()
	end
	
	-- Combustible
	if Opcion == 'Recargar' then
		if localPlayer:getData('Bidón vacio') and localPlayer:getData('Bidón vacio') > 0 then
			localPlayer:setData('Bidón vacio', localPlayer:getData('Bidón vacio') - 1)
			localPlayer:setData('Bidón con gasolina', (localPlayer:getData('Bidón con gasolina') or 0) + 1)
			outputChatBox('Bidón rellenado con exito!', 0, 255, 0)
		else
			outputChatBox('No tienes bidones vacios!', 255, 0, 0)
		end
		Menu.Limpiar()
		return

	end
end
bindKey("mouse3", "down", onPlayerPressMiddleMouse)
bindKey("-", "down", onPlayerPressMiddleMouse)
--//GUI TENT BASE


function centerWindow (center_window)
    local screenW, screenH = guiGetScreenSize()
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (screenW - windowW) /2,(screenH - windowH) /2
    return guiSetPosition(center_window, x, y, false)
end

local localPlayer = getLocalPlayer()

		TentConfirm = guiCreateWindow(424, 276, 349, 104, "Crear Tienda de Base (NowadayZ)", false)
        guiWindowSetSizable(TentConfirm, false)
        guiSetProperty(TentConfirm, "CaptionColour", "FFFE0000")


        EditGrupo = guiCreateEdit(136, 29, 199, 29, "", false, TentConfirm)
        ButtonCreate = guiCreateButton(20, 68, 131, 26, "Crear tienda base", false, TentConfirm)
        guiSetProperty(ButtonCreate, "NormalTextColour", "FF7DF706")
        ButtonClose = guiCreateButton(194, 68, 131, 26, "Cerrar", false, TentConfirm)
        guiSetProperty(ButtonClose, "NormalTextColour", "FFF48208")
        LabelClan = guiCreateLabel(30, 33, 110, 25, "Nombre del Grupo: ", false, TentConfirm)
        guiLabelSetHorizontalAlign(LabelClan, "center", false)   

        guiSetVisible( TentConfirm, false )
        centerWindow(TentConfirm)


        

        addEventHandler( "onClientGUIClick", ButtonCreate, function()
        	Grupo = guiGetText(EditGrupo)
        	if Grupo ~= "" then
        		triggerServerEvent( "Info.Grupo", localPlayer, Grupo, localPlayer )
        		guiSetVisible( TentConfirm, false )
        		showCursor( false )

        	else
        		outputChatBox("#008B8B* #F0FFF0 Por favor ingrese Grupo para crear tienda!",255,255,255,true)
        	end

        end, false)

        addEventHandler( "onClientGUIClick", ButtonClose, function() 
        	if guiGetVisible( TentConfirm ) then
        		guiSetVisible( TentConfirm, false )
        		showCursor( false )
        	end
        end, false)

        function openGUISpawnTent()
        	if not guiGetVisible( TentConfirm ) then
        		guiSetVisible( TentConfirm, true )
        		showCursor( true )
        	end
        end
        addEvent("showGUITent", true)
        addEventHandler( "showGUITent", getLocalPlayer(), openGUISpawnTent)
