--// Creador: Hades
--// Proposito: Conexion y funcionamiento de la base de datos
DB = {}
delete_onrestart = true
-- // Modulos del modo
Modulos = {'Armas', 'Items', 'Vehiculos'}

-- // Inicio del recurso
function DB.Inicio()
	DB.Con = dbConnect("sqlite", ":/DayZ.DB")

	if DB.Con then
		outputDebugString( "[DayZ] Cargando DB..." )
	else
		outputDebugString('[DayZ] No se pudo conectar a la base de datos.')
		cancelEvent()
		return
	end

	if not DB.Con then
		-- Si es que falla apagar el recurso.
		
	end

	-- Crear tablas necesarias si no existen
	Jug = DB.Con:exec("CREATE TABLE IF NOT EXISTS Jugadores (Cuenta TEXT, PosX INTEGER, PosY INTEGER, PosZ INTEGER, Armas TEXT, Espacios TEXT, Casco TEXT, Chaleco TEXT, Items TEXT, Estadisticas TEXT)")
	if Jug then
		outputDebugString( "[DayZ] Conexion exitosa a la base de Datos[Jugadores]." )
	else
		outputDebugString('[DayZ] No se pudo conectar a la base de datos.')
		cancelEvent()
		return
	end
	Tent = DB.Con:exec("CREATE TABLE IF NOT EXISTS Tiendas (ID INTEGER, Nombre TEXT, Oculta TEXT, PosX INTEGER, PosY INTEGER, PosZ INTEGER, Rotacion INTEGER, Items TEXT)" )
	if Tent then
		outputDebugString( "[DayZ] Conexion exitosa a la base de Datos[Tiendas]." )
	else
		outputDebugString('[DayZ] No se pudo conectar a la base de datos.')
		cancelEvent()
		return
	end
	--executeSQLQuery("DROP TABLE TiendasBases" )
	TentBase = DB.Con:exec("CREATE TABLE IF NOT EXISTS TiendasBases (ID INTEGER, Nombre TEXT, Oculta TEXT, PosX INTEGER, PosY INTEGER, PosZ INTEGER, Rotacion INTEGER, Items TEXT, Gang TEXT)" )
	if TentBase then
		outputDebugString( "[DayZ] Conexion exitosa a la base de Datos[Tiendas Bases]." )
	else
		outputDebugString('[DayZ] No se pudo conectar a la base de datos.')
		cancelEvent()
		return
	end

	setGameType('NowadayZ:v'..resource:getInfo('version'))
end
addEventHandler('onResourceStart', resourceRoot, DB.Inicio)


-- // Apagado del recurso
function DB.Apagado()
	if delete_onrestart then
		local qh = DB.Con:query( "DROP TABLE Jugadores" )
		dbFree( qh )
		outputServerLog( "[TOP] Se borro la tabla de Jugadores" )
		return
	end

	for k, v in ipairs(getElementsByType('player')) do
		DB.GuardarDatos(v)
	end
end
addEventHandler('onResourceStop', resourceRoot, DB.Apagado)



addEventHandler('onPlayerQuit', getRootElement(), function()
	if isElement(Ped[source]) then
		destroyElement(Ped[source])
	end

end)

addEvent('DayZ:Login', true)
addEventHandler("DayZ:Login", getRootElement(), function(Usuario, Clave)
	local Cuenta = getAccount(Usuario)
	local account = getAccount(Usuario, Clave)
	if account then
		accountName = getAccountName(Cuenta)
	end

	if not Cuenta then
		triggerClientEvent( "DayZ:MostrarMensaje", client, "#008B8B* #F0FFF0 La cuenta no existe")
		--outputChatBox("#008B8B* #F0FFF0 La cuenta no existe", client, 255,255,255,true)
		return
	end
	if not account then
		triggerClientEvent( "DayZ:MostrarMensaje", client, "#008B8B* #F0FFF0 La clave es incorrecta")
		--outputChatBox("#008B8B* #F0FFF0 La clave es incorrecta", client, 255,255,255,true)
		return
	end
	
	if getAccountPlayer(getAccount(Usuario)) then
		triggerClientEvent( "DayZ:MostrarMensaje", client, "#008B8B* #F0FFF0 La cuenta ya esta en uso")
		--outputChatBox("#008B8B* #F0FFF0 La cuenta ya esta en uso", client, 255,255,255,true)
		--return
	end

	triggerClientEvent( "DayZ:MostrarMensaje", client, "#008B8B* #F0FFF0 Iniciado correctamente!")
    logIn(source, getAccount(Usuario), Clave)
    triggerClientEvent(source, "onPlayerDoneLogin", source, accountName, Clave)-- cierra el login


	if not getPlayerAccount(source) then
		kickPlayer(source, "Servidor", "Ocurrió un error inesperado!")
		return
	end
	local QH = dbQuery(DB.Con, 'SELECT * FROM Jugadores WHERE Cuenta=?', Cuenta)
	local Resultado = dbPoll(QH, -1)

	if #Resultado == 0 then
		-- Se agregan los datos a la tabla 'Jugadores'
		local Tabla = DayZ.Posiciones[math.random(1, #DayZ.Posiciones)]
		local X, Y, Z = Tabla[1], Tabla[2], Tabla[3]
		local Estadisticas = ''

		for k, v in ipairs(Datos.Jugador) do
			if v == 'blood' then
				Valor = 12000
			elseif v == 'food' or v == 'thirst' then
				Valor = 100
			elseif v == 'humanity' then
				Valor = 2500
			else
				Valor = 0
			end

			Estadisticas = Estadisticas..""..v..":"..Valor..";"
		end
		DB.Con:exec("INSERT INTO Jugadores (Cuenta, PosX, PosY, PosZ, Espacios, Items, Estadisticas) VALUES(?,?,?,?,?,?,?)", Usuario, X, Y, Z, 8, 'Analgésicos:1;Vendaje:2;GPS:1;', Estadisticas) 
	end

DB.AparecerJugador()

end)
function LoginJoin()
  fadeCamera (source,true)
  setCameraMatrix(source,1846.0262451172,-3516.1354980469,3.9251999855042,1846.9736328125,-3516.4282226563,3.7952947616577)
end
addEventHandler("onPlayerJoin",getRootElement(),LoginJoin)



addEvent('DayZ:Registro', true)
addEventHandler("DayZ:Registro", getRootElement(), function(Usuario, Clave)
	local Cuenta = getAccount(Usuario)
	if Cuenta then
		triggerClientEvent( "DayZ:MostrarMensaje", client, "#008B8B* #F0FFF0 La cuenta ya existe")
		--outputChatBox("#008B8B* #F0FFF0 La cuenta ya existe", client, 255,255,255,true)
		return
	end

	local Cuenta = addAccount(Usuario, Clave)

	if Cuenta then
		triggerClientEvent( "DayZ:MostrarMensaje", client, "#008B8B* #F0FFF0 Usted se registro".."'" .. Usuario .. "'' Nombre de Jugador '" .. getPlayerName(source) .. "'#FFFFFF Su Contraseña '" .. Clave .. "'!")
		--outputChatBox("#008B8B* #F0FFF0 Usted se registro".."'" .. Usuario .. "'' Nombre de Jugador '" .. getPlayerName(source) .. "'#FFFFFF Su Contraseña '" .. Clave .. "'!", client, 255, 255, 255, true)
	else
		triggerClientEvent( "DayZ:MostrarMensaje", client, "#008B8B* #F0FFF0 Error, la cuenta no fue creada")
		--outputChatBox("#008B8B* #F0FFF0 Error, la cuenta no fue creada", client, 255,255,255,true)
	end
end)

-- // Se guardan todos los datos de un determinado jugador
function DB.GuardarDatos(Jugador)
	if Jugador then
		source = Jugador
	end

	if not source:getData('Iniciado') then return end

	local X, Y, Z = getElementPosition(source)
	local Espacios = source:getData('MAX_Slots')
	local Items = ""
	local Armas = ""
	local Estadisticas = ""
	local Casco = source:getData('Casco')
	local Chaleco = source:getData('Chaleco')

	for k, v in ipairs(LItems) do
		local Item = source:getData(v)
		if Item and Item > 0 then
			Items = Items..""..v..":"..Item..";"
		end
	end
	
	for i = 1, 3 do
		local Arma = source:getData('currentweapon_'..i)
		
		if Arma then
			Armas = Armas..'currentweapon_'..i..':'..Arma..';'
		end
	end

	for k, v in ipairs(Datos.Jugador) do
		local Dato = source:getData(v)
		if Dato then
			Estadisticas = Estadisticas..""..v..":"..tostring(Dato)..";"
		end
	end

	DB.Con:exec("UPDATE Jugadores SET PosX=?, PosY=?, PosZ=?, Espacios=?, Items=?, Armas=?, Estadisticas=?, Casco=?, Chaleco=? WHERE Cuenta=?", X, Y, Z, Espacios, Items, Armas, Estadisticas, Casco, Chaleco, getAccountName(getPlayerAccount(source)))
end

function DB.SalidaJugador()
	if source:getData('parent') and isElement(source:getData('parent')) then
		destroyElement(source:getData('parent'))
	end
	if isElement(Casco[source]) then
		destroyElement(Casco[source])
	end
	if isElement(Chaleco[source]) then
		destroyElement(Chaleco[source])
	end

	DB.GuardarDatos(source)
end
addEventHandler('onPlayerQuit', getRootElement(), DB.SalidaJugador)

-- // Se chequea si un jugador está en la base de datos
function DB.AparecerJugador()
	if isElement(Ped[source]) then
		destroyElement(Ped[source])
	end

	local Cuenta = getAccountName(getPlayerAccount(source))
    local QH = dbQuery(DB.Con, 'SELECT * FROM Jugadores WHERE Cuenta=?', Cuenta)
	local Resultado = dbPoll(QH, -1)
	if #Resultado == 0 then
		source:kick('[DayZ] Error al obtener los datos!')
	else
		source:spawn(Resultado[1].PosX, Resultado[1].PosY, Resultado[1].PosZ, 0, Skins[0])

		local Col = createColTube(Resultado[1].PosX, Resultado[1].PosY, Resultado[1].PosZ, 1.5, 2)
		source:setData('parent', Col)
		Col:setData('parent', source)
		attachElements(Col, source, 0, 0, -1)

		-- Se centra la camara al jugador y se vuelve visible
		source:setCameraTarget(source)
		fadeCamera(source, true, 3)

		if Resultado[1].Items then
			local Items = split(Resultado[1].Items, ";")
			for k, v in ipairs(Items) do
				local Item = split(v, ":")
				source:setData(Item[1], tonumber(Item[2]))
			end
		end
		
		if Resultado[1].Armas then
			local Armas = split(Resultado[1].Armas, ";")
			for k, v in ipairs(Armas) do
				local Item = split(v, ":")
				source:setData(tostring(Item[1]), tostring(Item[2]))
			end
		end

		for i = 1, 3 do
			local Arma = source:getData('currentweapon_'..i)
		
			if Arma then
				local Dato = getWeaponData(Arma)

				if Dato then
					local Municion = source:getData(Dato[3])

					if Municion and Municion > 0 then
						giveWeapon(source, Dato[1], Municion, false)
					end
				end
			end
		end

		local Estadisticas = split(Resultado[1].Estadisticas, ";")
		for k, v in ipairs(Estadisticas) do
			local Dato = split(v, ":")
			source:setData(Dato[1], tonumber(Dato[2]))
		end

		if Resultado[1].Casco and string.len(Resultado[1].Casco) > 1 then
			triggerEvent("Casco:Colocar", source, Resultado[1].Casco, true)
		end

		if Resultado[1].Chaleco and string.len(Resultado[1].Chaleco) > 1 then
			triggerEvent("Chaleco:Colocar", source, Resultado[1].Chaleco, true)
		end

		triggerEvent('ActualizarMochila', source, false, Resultado[1].Espacios)
		triggerClientEvent(source, "onClientPlayerDayZLogin", source)
		triggerClientEvent(source, 'DayZ:IniciarSupervivencia', source)

		source:setData('Iniciado', true)

		for k, v in ipairs(getElementsByType('player')) do
			if v:getData('Iniciado') then
				triggerClientEvent(v, 'DayZ:MostrarMensaje', v, source.name:gsub("#%x%x%x%x%x%x", "").. ' inicio sesión.')
			end
		end
	end
end
