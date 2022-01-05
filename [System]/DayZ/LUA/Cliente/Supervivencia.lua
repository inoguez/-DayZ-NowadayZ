--// Proposito: Sistema de supervivencia del jugador


Supervivencia = {}

local Muerto = false


	local hpMin = 0 
    local hpMax = 360 
    local hpRate = hpMin-hpMax 

function Supervivencia.Inicio()
	setTimer(Supervivencia.Chequeo, 2000, 0)
	addEventHandler('onClientRender', root, Supervivencia.Iconos)
	addEventHandler('onClientRender', root, Supervivencia.ChequeoSangre)

	bindKey('x', 'down', 'chatbox', 'Global')
	outputChatBox("#008080* #008080| #9B4444x #F0FFF0, para usar el Chat Global #008080|", 255, 255, 255, true)

	-- Se crea un temporizador para aumentar el tiempo vivo cada 1 minuto
	Supervivencia.Temporizador = setTimer(Supervivencia.AumentarTiempo, 60000, 0)

	setTrafficLightState(9)

	Menu.Crear()
end
addEvent('DayZ:IniciarSupervivencia', true)
addEventHandler('DayZ:IniciarSupervivencia', getLocalPlayer(), Supervivencia.Inicio)



function Supervivencia.Iconos()
	if getElementData( getLocalPlayer(), "MostrarHUD" ) then return end
	if getElementData(getLocalPlayer(), "OcultarIconos") then return end
	if Supervivencia.Muerto then return end 
	local sizeIcons = 40 * sH
	local currentTickWarning = getTickCount()/440
	local colorWarning = tocolor( 155, 68, 68, math.abs(math.sin(currentTickWarning)*220))

	if localPlayer:getData('blood') >= 3000 then
		ColorBlood = colorPrincipal
	else
		ColorBlood = colorWarning
	end

	if localPlayer:getData('thirst') >= 15  then
		ColorDrink = colorPrincipal
	else
		ColorDrink = colorWarning
	end


	if localPlayer:getData('food') >= 15  then
		ColorFood = colorPrincipal
	else
		ColorFood = colorWarning
	end

        if localPlayer:getData('food') >= 100 then
            dxDrawImage(sW * 1318, sH * 688, sizeIcons, sizeIcons, "Imagenes/Icons/food/100.png", 0, 0, 0, ColorFood)
        elseif localPlayer:getData('food') >= 85 then
            dxDrawImage(sW * 1318, sH * 688, sizeIcons, sizeIcons, "Imagenes/Icons/food/85.png", 0, 0, 0, ColorFood)
        elseif localPlayer:getData('food') >= 60 then
            dxDrawImage(sW * 1318, sH * 688, sizeIcons, sizeIcons, "Imagenes/Icons/food/60.png", 0, 0, 0, ColorFood)
        elseif localPlayer:getData('food') >= 50 then
            dxDrawImage(sW * 1318, sH * 688, sizeIcons, sizeIcons, "Imagenes/Icons/food/50.png", 0, 0, 0, ColorFood)
        elseif localPlayer:getData('food') >= 30 then
            dxDrawImage(sW * 1318, sH * 688, sizeIcons, sizeIcons, "Imagenes/Icons/food/30.png", 0, 0, 0, ColorFood)
        elseif localPlayer:getData('food') >= 20 then
            dxDrawImage(sW * 1318, sH * 688, sizeIcons, sizeIcons, "Imagenes/Icons/food/20.png", 0, 0, 0, ColorFood)			
        elseif localPlayer:getData('food') >= 0 then
            dxDrawImage(sW * 1318, sH * 688, sizeIcons, sizeIcons, "Imagenes/Icons/food/0.png", 0, 0, 0, ColorFood)
        end

        if localPlayer:getData('thirst') >= 100 then
			dxDrawImage(sW * 1318, sH * 638, sizeIcons, sizeIcons, "Imagenes/Icons/water/100.png", 0, 0, 0,ColorDrink)
		elseif localPlayer:getData('thirst') >= 85 then
			dxDrawImage(sW * 1318, sH * 638, sizeIcons, sizeIcons, "Imagenes/Icons/water/85.png", 0, 0, 0, ColorDrink)
        elseif localPlayer:getData('thirst') >= 70 then
			dxDrawImage(sW * 1318, sH * 638, sizeIcons, sizeIcons, "Imagenes/Icons/water/70.png", 0, 0, 0, ColorDrink)
        elseif localPlayer:getData('thirst') >= 60 then
			dxDrawImage(sW * 1318, sH * 638, sizeIcons, sizeIcons, "Imagenes/Icons/water/60.png", 0, 0, 0, ColorDrink)
        elseif localPlayer:getData('thirst') >= 50 then
			dxDrawImage(sW * 1318, sH * 638, sizeIcons, sizeIcons, "Imagenes/Icons/water/50.png", 0, 0, 0, ColorDrink)
        elseif localPlayer:getData('thirst') >= 15 then
			dxDrawImage(sW * 1318, sH * 638, sizeIcons, sizeIcons, "Imagenes/Icons/water/15.png", 0, 0, 0, ColorDrink)
        elseif localPlayer:getData('thirst') >= 0 then
        	dxDrawImage(sW * 1318, sH * 638, sizeIcons, sizeIcons, "Imagenes/Icons/water/0.png", 0, 0, 0, ColorDrink)
        end

        if localPlayer:getData('blood') >= 12000 then
			dxDrawImage(sW * 1318, sH * 588, sizeIcons, sizeIcons, "Imagenes/Icons/blood/100.png", 0, 0, 0, ColorBlood)
        elseif localPlayer:getData('blood') >= 9600 then
			dxDrawImage(sW * 1318, sH * 588, sizeIcons, sizeIcons, "Imagenes/Icons/blood/85.png", 0, 0, 0, ColorBlood)
        elseif localPlayer:getData('blood') >= 6000 then
            dxDrawImage(sW * 1318, sH * 588, sizeIcons, sizeIcons, "Imagenes/Icons/blood/50.png", 0, 0, 0, ColorBlood)
        elseif localPlayer:getData('blood') >= 3600 then
            dxDrawImage(sW * 1318, sH * 588, sizeIcons, sizeIcons, "Imagenes/Icons/blood/30.png", 0, 0, 0, ColorBlood)
        elseif localPlayer:getData('blood') >= 1200 then
            dxDrawImage(sW * 1318, sH * 588, sizeIcons, sizeIcons, "Imagenes/Icons/blood/15.png", 0, 0, 0, ColorBlood)
        elseif localPlayer:getData('blood') >= 0 then
            dxDrawImage(sW * 1318, sH * 588, sizeIcons, sizeIcons, "Imagenes/Icons/blood/0.png", 0, 0, 0, ColorBlood)
        end

        if localPlayer:getData('bleeding') > 0 then
			dxDrawImage(sW * 1318, sH * 588, sizeIcons, sizeIcons, "Imagenes/Icons/blood/bleeding.png", 0, 0, 0, colorWarning)
		end


        if localPlayer:getData('temperature') >= 38 then
            dxDrawImage(sW * 1318, sH * 538, sizeIcons, sizeIcons, "Imagenes/Icons/temperature/38.png", 0, 0, 0)
        elseif localPlayer:getData('temperature') >= 37 then
            dxDrawImage(sW * 1318, sH * 538, sizeIcons, sizeIcons, "Imagenes/Icons/temperature/37.png", 0, 0, 0)
        elseif localPlayer:getData('temperature') >= 36 then
            dxDrawImage(sW * 1318, sH * 538, sizeIcons, sizeIcons, "Imagenes/Icons/temperature/36.png", 0, 0, 0)
        elseif localPlayer:getData('temperature') >= 35 then
            dxDrawImage(sW * 1318, sH * 538, sizeIcons, sizeIcons, "Imagenes/Icons/temperature/35.png", 0, 0, 0)
        elseif localPlayer:getData('temperature') >= 33.5 then
            dxDrawImage(sW * 1318, sH * 538, sizeIcons, sizeIcons, "Imagenes/Icons/temperature/34.png", 0, 0, 0)
        elseif localPlayer:getData('temperature') >= 0 then
            dxDrawImage(sW * 1318, sH * 538, sizeIcons, sizeIcons, "Imagenes/Icons/temperature/35.png", 0, 0, 0, colorPrincipal)
        end


	if localPlayer:getData('humanity') >= 5000 then
            dxDrawImage(sW * 1318, sH * 488, sizeIcons, sizeIcons, "Imagenes/Icons/bandit/5000.png", 0, 0, 0, colorPrincipal)
        elseif localPlayer:getData('humanity') >= 3500 then
            dxDrawImage(sW * 1318, sH * 488, sizeIcons, sizeIcons, "Imagenes/Icons/bandit/3500.png", 0, 0, 0, colorPrincipal)
        elseif localPlayer:getData('humanity') >= 2500 then
            dxDrawImage(sW * 1318, sH * 488, sizeIcons, sizeIcons, "Imagenes/Icons/bandit/2500.png", 0, 0, 0, colorPrincipal)
        elseif localPlayer:getData('humanity') >= 0 then
            dxDrawImage(sW * 1318, sH * 488, sizeIcons, sizeIcons, "Imagenes/Icons/bandit/0.png", 0, 0, 0, colorPrincipal)
        elseif localPlayer:getData('humanity') >= -1000 then
            dxDrawImage(sW * 1318, sH * 488, sizeIcons, sizeIcons, "Imagenes/Icons/bandit/-1000.png", 0, 0, 0, colorPrincipal)
        elseif localPlayer:getData('humanity') >= -2500 then
            dxDrawImage(sW * 1318, sH * 488, sizeIcons, sizeIcons, "Imagenes/Icons/bandit/-2500.png", 0, 0, 0, colorPrincipal)
    end

        

		-- // Hueso roto
		if localPlayer:getData('brokenbone') == 1 then
			dxDrawImage(sW *1318, sH *344, sizeIcons, sizeIcons, 'Imagenes/Icons/brokenbone.png', 0, 0, 0, colorWarning)
		end

	-- // Casco
	dxDrawRectangle( sW * 1318, sH * 388, sizeIcons, sizeIcons, colorPrincipal, false )
	if localPlayer:getData('Casco') then
		dxDrawImage(sW * 1318, sH * 388, sizeIcons, sizeIcons, 'Imagenes/Icons/Casco.png', 0, 0, 0, colorSecundario)
	end

	-- // Chaleco
	dxDrawRectangle( sW * 1318, sH * 438, sizeIcons, sizeIcons, colorPrincipal, false )
	if localPlayer:getData('Chaleco') then
		dxDrawImage(sW * 1318,sH * 438, sizeIcons, sizeIcons, 'Imagenes/Icons/Chaleco.png', 0, 0, 0, colorSecundario)
	end

	-- // Texto en la esquina inferior derecha    1261, 724, 1366, 741     1279, 742, 1366, 754
	dxDrawText('Nowadayz', sW * 1261, sH * 727, sW * 1363, sH * 741, tocolor(0, 100, 180, 255), 1, dxfont, 'right', 'top', false, false, false, true)
	local playerX, playerY, playerZ = getElementPosition ( localPlayer )       -- Get our player's coordinates.
    local playerZoneName = getZoneName ( playerX, playerY, playerZ )          -- Get name of the zone the player is in.

    -- Draw zone name text.
    dxDrawText ( playerZoneName, sW * 1279, sH * 739, sW * 1363, sH * 754, tocolor ( 255, 0, 0, 170 ), 1, dxfont, 'right', 'top', false, false, false, true ) 
end

function Supervivencia.ChequeoSangre()
	-- Sistema de sangre --
	if localPlayer:getData('blood') <= 0 then
		Supervivencia.Muerte()
	end
end

function Supervivencia.Chequeo()
	-- Hambre del jugador --
	local Valor = localPlayer:getData('food')

	if Valor - 0.04 <= 0 then
		localPlayer:setData('food', 0)
		localPlayer:setData('blood', (localPlayer:getData('blood') > 0) and localPlayer:getData('blood') - 20 or 0)
	else
		localPlayer:setData('food', Valor - 0.04)
	end

	-- Sed del jugador --
	local Valor = localPlayer:getData('thirst')

	if Valor - 0.04 <= 0 then
		localPlayer:setData('thirst', 0)

		localPlayer:setData('blood', (localPlayer:getData('blood') > 0) and localPlayer:getData('blood') - 15 or 0)
	else
		if getPedControlState('sprint') then
			localPlayer:setData('thirst', Valor - 0.08)
		else
			localPlayer:setData('thirst', Valor - 0.04)
		end
	end
	
	
	-- Efectos de dolor y frio --
	if localPlayer:getData('pain') >= 1 then
		setCameraShakeLevel(100)
	else
		setCameraShakeLevel(0)
	end
	
	if localPlayer:getData('bleeding') > 0 then
		localPlayer:setData('blood', (localPlayer:getData('blood') > 0) and localPlayer:getData('blood') - math.floor(localPlayer:getData('bleeding')) or 0)
	end

	for k, v in ipairs(getElementsByType('player')) do
		if v:getData('bleeding') and v:getData('bleeding') > 0 then
			local X, Y, Z = getElementPosition(v)
			fxAddBlood(X, Y, Z, 0, 0, 0, 100, 1)
		end
	end
	
	-- Efectos de lesión al jugador --
	if localPlayer:getData('brokenbone') == 1 then
		if isControlEnabled ('jump') then
			toggleControl('jump', false)
			toggleControl('sprint', false)
		end
    else
		if not isControlEnabled ('jump') then
			toggleControl('jump', true)
			toggleControl('sprint', true)
		end
	end
	
	-- Humanidad
	if localPlayer:getData('humanity') < 0 and not localPlayer:getData('bandit') then
		localPlayer:setData('bandit', true)
	end
	
end
addEvent( "Chequeo:JUG", true)
addEventHandler( "Chequeo:Jug", root, Supervivencia.Chequeo)


-- Evento que se ejecuta cuando un jugador recibe daño
function Supervivencia.Herida(Atacante, Arma, Parte, Loss)
	-- Se cancela el daño al jugador
	cancelEvent()

	if Muerto or localPlayer:getData('Inmortal') then return end

	if localPlayer:getData('Atacante') and Atacante == localPlayer then
		localPlayer:setData('Atacante', false)
	end
	
      if bodypart == 9 then
        damage = damage * 5.5
        headshot = true
        if getElementData ( getLocalPlayer(), "helmetOn1" ) == 1 then
          damage = damage*0.3
        else
          damage = damage*0.8
        end
      end
      if bodypart == 3 then
        if getElementData ( getLocalPlayer(), "helmetOn" ) == 1 then
          damage = damage*0.3
        else
          damage = damage*0.8
        end
      end
	  
	  if bodypart == 9 then
        damage = damage * 5.5
        headshot = true
        if getElementData ( getLocalPlayer(), "helmetOn2" ) == 1 then
          damage = damage*0.3
        else
          damage = damage*0.8
        end
      end
      if bodypart == 3 then
        if getElementData ( getLocalPlayer(), "helmetOn3" ) == 1 then
          damage = damage*0.3
        else
          damage = damage*0.8
        end
      end

	-- Daño inicial
	local Sangre = 150
	
	-- Se chequea si es un zombie y se le resta vida
	if Atacante and Atacante.type == 'ped' then
		Sangre = math.random(600, 1000)

		if math.random(1, 7) == 4 then
			localPlayer:setData('bleeding', localPlayer:getData('bleeding') + math.floor(Loss))
		end
	end


	-- Se chequea si es un vehiculo
	if Arma == 49 or Arma == 54 then
		Sangre = Loss * 10

		if Loss >= 20 then
			playSound("sounds/brokenbone.mp3")
			localPlayer:setData('brokenbone', 1)
		end
		
		if Loss >= 50 then
			localPlayer:setData('blood', 0)
			return
		end
	end

	if Arma == 51 then
		Sangre = 12000
	end

	localPlayer:setData('blood', (localPlayer:getData('blood') > 0) and localPlayer:getData('blood') - Sangre or 0)
end
addEventHandler('onClientPlayerDamage', localPlayer, Supervivencia.Herida)

Headshot = {}

addEventHandler('onClientPlayerDamage', root, function(Atacante, Arma, Parte, Loss)
	if source == localPlayer or source:getData('Inmortal') then return end

		fadeCamera(false,1,255,0,0)
		function cam()
			fadeCamera(true,1)
		end
		setTimer(cam,150,1)

	if Atacante == localPlayer and not source:getData('Muerto') then
		--playSound("Sonidos/Hit.wav")

		source:setData('Atacante', localPlayer)
		
		if Parte == 9 then
			if source:getData('Casco') then
				triggerServerEvent("Casco:Quitar", localPlayer, source)
				source:setData('Casco', false)
				return
			end

			if not Headshot[source] then
				Headshot[source] = true
				Atacante:setData('headshots', Atacante:getData('headshots') + 1)
				setTimer(function(Jug) Headshot[Jug] = false end, 5000, 1, source) 
			end
			
			source:setData('headshot', true)
			source:setData('blood', 0)

			return
		end

		local Slot = getPedWeaponSlot(Atacante)

		if Slot == 3 or Slot == 5 or Slot == 6 then
			Arma = 'currentweapon_1'
		elseif Slot == 1 or Slot == 2 or Slot == 4 then
			Arma = 'currentweapon_2'
		elseif Slot == 8 then
			Arma = 'currentweapon_3'
		else
			Arma = false
		end

		if Arma then
			Data = getWeaponData(Atacante:getData(Arma))
			
			if Parte == 3 and source:getData('Chaleco') then
                setElementData(source, 'blood', source:getData('blood') - (Data[5] * 0.8))
            else
                setElementData(source, 'blood', source:getData('blood') - Data[5])
                setElementData(source, 'bleeding', getElementData(source, 'bleeding') + math.floor(Loss))
            end
			
			if math.random(1,7) == 4 then
				source:setData('pain', 1)
			end
			
			
			
			-- Se chequea si fue un disparo a las piernas
			if Parte == 7 or Parte == 8 then
				playSound("sounds/brokenbone.mp3")
				source:setData('brokenbone', 1)
			end
		end
	end
end)


-- // Efecto que se muestra cuando muere un jugador
Tiempo = 5
Asesino = false
Texto = ''

local screenW, screenH  = guiGetScreenSize()

function Supervivencia.Pantalla()
		dxDrawRectangle(0, 0, screenW, screenH, tocolor(0, 0, 0, 180))
		dxDrawText(Texto:gsub('#%x%x%x%x%x%x', ''), 0 - 1, screenH/2-40 - 1, screenW - 1, screenH/2 - 1, tocolor(0, 0, 0, 255), 2, 'default-bold', 'center', 'center', false, false, false, true)
		dxDrawText(Texto:gsub('#%x%x%x%x%x%x', ''), 0 + 1, screenH/2-40 - 1, screenW + 1, screenH/2 - 1, tocolor(0, 0, 0, 255), 2, 'default-bold', 'center', 'center', false, false, false, true)
		dxDrawText(Texto:gsub('#%x%x%x%x%x%x', ''), 0 - 1, screenH/2-40 + 1, screenW - 1, screenH/2 + 1, tocolor(0, 0, 0, 255), 2, 'default-bold', 'center', 'center', false, false, false, true)
		dxDrawText(Texto:gsub('#%x%x%x%x%x%x', ''), 0 + 1, screenH/2-40 + 1, screenW + 1, screenH/2 + 1, tocolor(0, 0, 0, 255), 2, 'default-bold', 'center', 'center', false, false, false, true)
		dxDrawText(Texto, 0, screenH/2-40, screenW, screenH/2, tocolor(240, 255, 240, 230), 2, 'default-bold', 'center', 'center', false, false, false, true)

		dxDrawText('Apareceras en...'..Tiempo, (screenW - 230) / 2 - 1, (screenH - 44) / 2 - 1, ((screenW - 506) / 2) + 230 - 1, ( (screenH - 44) / 2) + 44 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "center", "center", false, false, false, false, false)
		dxDrawText('Apareceras en...'..Tiempo, (screenW - 230) / 2 - 1, (screenH - 44) / 2 + 1, ((screenW - 230) / 2) + 230 - 1, ( (screenH - 44) / 2) + 44 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "center", "center", false, false, false, false, false)
		dxDrawText('Apareceras en...'..Tiempo, (screenW - 230) / 2 + 1, (screenH - 44) / 2 - 1, ((screenW - 230) / 2) + 230 + 1, ( (screenH - 44) / 2) + 44 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "center", "center", false, false, false, false, false)
		dxDrawText('Apareceras en...'..Tiempo, (screenW - 230) / 2 + 1, (screenH - 44) / 2 + 1, ((screenW - 230) / 2) + 230 + 1, ( (screenH - 44) / 2) + 44 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont, "center", "center", false, false, false, false, false)
    	dxDrawText('Apareceras en...'..Tiempo, (screenW - 230) / 2, (screenH - 44) / 2, ((screenW - 230) / 2) + 230, ( (screenH - 44) / 2) + 44, tocolor(240, 255, 240, 230), 1.00, dxfont, "center", "center", false, false, false, false, false)
end

-- // Muerte del jugador local
function Supervivencia.Muerte(Vehiculo)
	if Supervivencia.Muerto then return end
	triggerEvent('Muerte', localPlayer)

	Supervivencia.Muerto = true
	-- Desactivar iconos al morir
	localPlayer:setData('MuertoALV', true)
	showChat(false)
	setPlayerHudComponentVisible( "radar", false )
	removeEventHandler('onClientRender', root, Supervivencia.Iconos) 
	triggerEvent( "EstadoMonitorToggle", getLocalPlayer())
	
	-- Se envian los datos al servidor
	local Info = {}

	Info.Items = ""
	for k, v in ipairs(LItems) do
		local Item = localPlayer:getData(v)
		if Item and Item > 0 then
			Info.Items = Info.Items..""..v..":"..Item..";"
		end
	end

	if Vehiculo then
        Info.Muerto = true
    end

	Info.X, Info.Y, Info.Z =  getElementPosition(localPlayer)
	_, _, Info.rZ = getElementRotation(localPlayer)
	Info.Modelo = getElementModel(localPlayer)
	Info.Atacante = localPlayer:getData('Atacante')
	Info.Humanidad = localPlayer:getData('humanity')
	Info.Tiempo = tonumber(localPlayer:getData('alivetime'))

	triggerServerEvent('DayZ:Muerte', localPlayer, Info)

	for k, v in ipairs(LItems) do
		localPlayer:setData(v, 0)
	end

	for k, v in ipairs(Datos.Jugador) do
		localPlayer:setData(v, 0)
	end

	localPlayer:setData('blood', 12000)
	localPlayer:setData('food', 100)
	localPlayer:setData('thirst', 100)
	localPlayer:setData('humanity', 2500)
	localPlayer:setData('Atacante', false)
	localPlayer:setData('Analgésicos', 1)
	localPlayer:setData('Vendaje', 2)
	localPlayer:setData('Paracaidas', 1)
    localPlayer:setData('Mapa', 1)
    localPlayer:setData('GPS', 1)

	

	if localPlayer:getData('Admin') then
		for i,v in ipairs(LItems) do
			localPlayer:setData(v, 100)
		end
	end

	setElementFrozen(localPlayer, true)
	killTimer(Supervivencia.Temporizador)

	if Info.Atacante then
		setCameraTarget( Info.Atacante )
 	else
    	Camera.setMatrix(localPlayer.position, localPlayer.position + localPlayer.matrix.up)
	end

	fadeCamera( true, 5)

	    if Info.Atacante then
	        Texto = "Moriste a manos de: "..getPlayerName(Info.Atacante)
	    else
            Texto = "Muerto"
        end
       

	    Tiempo = 5

			
	addEventHandler('onClientRender', root, Supervivencia.Pantalla)
	setTimer(function()
		Tiempo = Tiempo - 1

		if Tiempo == 0 then
			removeEventHandler('onClientRender', root, Supervivencia.Pantalla)
			setCameraTarget(localPlayer) 
			setElementFrozen(localPlayer, false) 
			addEventHandler('onClientRender', root, Supervivencia.Iconos) 
			triggerEvent( "EstadoMonitorToggle", getLocalPlayer())
			showChat(true)

			Supervivencia.Temporizador = setTimer(Supervivencia.AumentarTiempo, 60000, 0)

			localPlayer:setData('brokenbone', 0)
			localPlayer:setData('humanity', 2500)
			localPlayer:setData('pain', 0)
			localPlayer:setData('bleeding', 0)
			localPlayer:setData('blood', 12000)
			localPlayer:setData('headshot', false)
			localPlayer:setData('Atacante', false)
			localPlayer:setData('MuertoALV', false)

			Supervivencia.Muerto = false

			fadeCamera( true, 4)
		end
	end, 1000, 5)
end

function Supervivencia.AumentarTiempo()
	localPlayer:setData('alivetime', localPlayer:getData('alivetime') + 1)
end

function Supervivencia.StealthKill()
	cancelEvent()
end
addEventHandler('onClientPlayerStealthKill', getLocalPlayer(), Supervivencia.StealthKill)

addEventHandler('onClientVehicleExplode', getRootElement(), function()
    if localPlayer.vehicle and localPlayer.vehicle == source then
        Supervivencia.Muerte(true)
    end
end)


----------------------------
-- PROVISORIO --------------
----------------------------
-- EN GTAVRADAR/MAXIMAP
function playerStatsClientSite()
	if getElementData(getLocalPlayer(), "Iniciado") then
		toggleControl("radar", false)
		setPlayerHudComponentVisible("radar", false)

		--if localPlayer:getData('Mapa') and getElementData(getLocalPlayer(), "Mapa") >= 1 then
			--toggleControl("radar", true)
		--end
		if getElementData( getLocalPlayer(), "MostrarHUD" ) then return end
		if getElementData( getLocalPlayer(), "OcultarGPS" ) then return end
		if localPlayer:getData('MuertoALV') then return end
		if getElementData(getLocalPlayer(), "MapaActivado") then return end

			if getElementData(getLocalPlayer(), "GPS") and localPlayer:getData('GPS') >= 1 then
				setPlayerHudComponentVisible("radar", true)
			end
	end
end
addEventHandler("onClientRender", root, playerStatsClientSite)

function playerZoom(key, keyState)
	if key == "n" then
		if 0 < (localPlayer:getData("Lentes de visión nocturna") or 0) then 
			if nightvision then
				nightvision = false
				setCameraGoggleEffect("normal")
			else
				nightvision = true
				setCameraGoggleEffect("nightvision")
				setTimer(setPedAnimation, 150, 1,getLocalPlayer(),"goggles","goggles_put_on",650,true,false,false,false)
				setFarClipDistance(1000)
				--playSound("Sonidos/vision.ogg")
			end
		end
	elseif key == "i" and 0 < (localPlayer:getData("Lentes infrarrojos") or 0) then
		if infaredvision then
			infaredvision = false
			setCameraGoggleEffect("normal")
		else
			infaredvision = true
			setTimer(setPedAnimation, 150, 1,getLocalPlayer(),"goggles","goggles_put_on",650,true,false,false,false)
			setCameraGoggleEffect("thermalvision")
			--playSound("Sonidos/vision.ogg")
		end
	end
end
bindKey("n", "down", playerZoom)
bindKey("i", "up", playerZoom)

function pedGetDamageDayZ ( attacker, weapon, bodypart, loss )
	cancelEvent()
	
	if source:getData('Muerto') or ((source:getData('blood') or 0) <= 0) then return end

	if isElement(attacker) and getElementType(attacker) == "vehicle" then
		speedx, speedy, speedz = getElementVelocity ( attacker )
		actualspeed = (speedx^2 + speedy^2 + speedz^2)^(0.5)
		kmh = actualspeed * 180
		if kmh >= 50 then
			local vehkiller = getVehicleOccupant ( attacker )
			setElementData(source,"blood",0)
			if getElementData(source,"blood") <= 0 then
				triggerServerEvent("onZombieGetsKilled",source,vehkiller)
			end
		end
	end
	if attacker and attacker == getLocalPlayer() then
		damage = 100
		if weapon == 37 then
			return
		end
		if weapon == 63 or weapon == 51 or weapon == 19 then
			setElementData(source,"blood",0)
			if getElementData(source,"blood") <= 0 then
				triggerServerEvent("onZombieGetsKilled",source,attacker)
			end
		elseif weapon and weapon > 1 and attacker and getElementType(attacker) == "player" then
			local Slot = getPedWeaponSlot(attacker)
			if Slot == 3 or Slot == 5 or Slot == 6 then
				Arma = 'currentweapon_1'
			elseif Slot == 1 or Slot == 2 or Slot == 4 then
				Arma = 'currentweapon_2'
			elseif Slot == 8 then
				Arma = 'currentweapon_3'
			else
				Arma = false
			end

			if Arma then
				Data = getWeaponData(attacker:getData(Arma))
				damage = Data[5]
				if bodypart == 9 then
					triggerServerEvent("onZombieGetsKilled", source, attacker, true)
					return
				end

				source:setData('blood', source:getData('blood') - damage)

				if getElementData(source,"blood") <= 0 then
					triggerServerEvent("onZombieGetsKilled",source,attacker,false)
				end
			end
		end
	end	
end
addEventHandler ( "onClientPedDamage", getRootElement(), pedGetDamageDayZ )

-----------------------------------------------
-------------HITMARKER-------------------------
-----------------------------------------------
local screenX, screenY
local drawTimer
local isDrawing
local sound

function drawHitMarker()
	dxDrawImage(screenX-16, screenY-16, 32, 32, "Imagenes/hitmarker.png")
	
end

function fireFunc(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
	if hitElement then
		if getElementType(hitElement)=="player" or getElementType(hitElement)=="ped" or getElementType(hitElement)=="vehicle" then
		screenX, screenY = getScreenFromWorldPosition(hitX, hitY, hitZ)
		if not screenX then return end 
		if isDrawing then return end 
		isDrawing = true
	
		
		addEventHandler("onClientRender", root, drawHitMarker) 
		if drawTimer and isTimer(drawTimer) then
			killTimer(drawTimer)
		end
		
		drawTimer = setTimer(function() 
			isDrawing = false
			removeEventHandler("onClientRender", root, drawHitMarker) 
		end, 500, 1)
	end
	end
end
addEventHandler("onClientPlayerWeaponFire", localPlayer, fireFunc)

itemTXD = engineLoadTXD("Objetos/trap_open.txd")
engineImportTXD(itemTXD, 1918)
itemDFF = engineLoadDFF("Objetos/trap_closed.dff", 1918)
engineReplaceModel(itemDFF, 1918)
itemCOL = engineLoadCOL ( "Objetos/trap_closed.col" )
engineReplaceCOL(itemCOL, 1918)
itemTXD = engineLoadTXD("Objetos/trap_open.txd")
engineImportTXD(itemTXD, 1923)
itemDFF = engineLoadDFF("Objetos/trap_open.dff", 1923)
engineReplaceModel(itemDFF, 1923)
itemCOL = engineLoadCOL ( "Objetos/trap_open.col" )
engineReplaceCOL(itemCOL, 1923)

function DistanciaDibujado()
	for i, v in ipairs(getElementsByType("players")) do
	    local model = getElementModel(v)
	    engineSetModelLODDistance(model, 300)   -- Set maximum draw distance
	end
end

addEventHandler( "onClientResourceStart", root, DistanciaDibujado)

function shakeCamera(weapon)
x,y,z = getPedBonePosition ( getLocalPlayer(), 26 )
if weapon == 22 then
createExplosion ( x,y,z + 10,12,false,0.1,false)
elseif weapon == 24 then
createExplosion ( x,y,z + 10,12,false,0.2,false)
elseif weapon == 25 then
createExplosion ( x,y,z + 10,12,false,0.4,false)
elseif weapon == 26 then
createExplosion ( x,y,z + 10,12,false,0.5,false)
elseif weapon == 27 then
createExplosion ( x,y,z + 10,12,false,0.4,false)
elseif weapon == 28 then
createExplosion ( x,y,z + 10,12,false,0.1,false)
elseif weapon == 29 then
createExplosion ( x,y,z + 10,12,false,0.1,false)
elseif weapon == 30 then
createExplosion ( x,y,z+10,12,false,0.1,false)
elseif weapon == 31 then
createExplosion ( x,y,z + 10,12,false,0.1,false)
elseif weapon == 32 then
createExplosion ( x,y,z + 10,12,false,0.1,false)
elseif weapon == 33 then
createExplosion ( x,y,z + 10,12,false,0.1,false)
elseif weapon == 38 then
createExplosion ( x,y,z + 10,12,false,0.5,false)
end
end
addEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), shakeCamera )

--//ADMIN DEBUG////////////////////////////////////-

local row = {}
local moveDown = 0
local maxMoveDown = 5
local admins = {}

addEventHandler("onClientRender", root,
function()
	--outputDebugString("ClientRender")
	for id, player in ipairs(getElementsByType("player")) do
		if player:getData('Iniciado') then
			dxDrawRectangle(1171 * sW, 41 * sH, 185 * sW, 162 * sH, tocolor(53, 66, 66, 255), false)
			dxDrawRectangle(1171 * sW, 41 * sH, 185 * sW, 20 * sH, colorPrincipal, false)
			dxDrawText("Admins Online", 1170 * sW, 40 * sH, 1356 * sW, 60 * sH, colorBlanco, 1.00, dxfont, "center", "center", false, false, false, false, false)
			if player:getData('Admin') then
				--outputDebugString("Insertando nombres")
				name = getPlayerName(player)
				--outputDebugString(name)
				table.insert( admins, {tostring(name)}) 
			end
			for i,v in ipairs(admins) do
				if i == 1 then
					row[i] = dxDrawText(removeHex(v[1]), 1170 * sW, 60 * sH, 1356 * sW, 80 * sH, tocolor(255, 131, 0, 255), 1.00, dxfont, "center", "center", false, false, false, false, false)
				elseif (i > 1 and i < maxMoveDown) then
					moveDown = moveDown + 25
					row[i] = dxDrawText(removeHex(v[1]), 1170 * sW, 60 + moveDown * sH, 1356 * sW, 80 * sH, tocolor(255, 131, 0, 255), 1.00, dxfont, "center", "center", false, false, false, false, false)
				end
			end
		end
	end
	refreshAdmin()
end
)

function refreshAdmin()
	--outputDebugString("Limpiando tabla de admins")
	for i,v in ipairs(admins) do
		moveDown = 0
		if isElement( row[i] )then
			destroyElement( row[i] )
		end
		admins[i] = nil
	end
end


