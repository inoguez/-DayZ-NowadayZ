-----------------------
-- Autor: TheCrazy17 --
-- Fecha: 07/04/2015 --
-----------------------
delete_onrestart = false
function Vehiculos.Inicio()
	-- Se conecta a la base de datos
	Vehiculos.DB = dbConnect("sqlite", ":/Vehiculos.db")
	if Vehiculos.DB then
		outputDebugString( "[Vehiculos] Cragando Vehiculos..." )
	else
		outputDebugString( "[Vehiculos] Creando base de datos de Vehiculos..." )
	end

	-- En caso de que no existan las columnas, se procede a crearlas
	Vehiculos.DB:exec("CREATE TABLE IF NOT EXISTS Vehiculos (Matricula TEXT, PosX TEXT, PosY TEXT, PosZ TEXT, RotX TEXT, RotY TEXT, RotZ TEXT, Salud TEXT, Datos TEXT, Items TEXT)")

	Vehiculos.Cargar()
end
addEventHandler('onResourceStart', resourceRoot, Vehiculos.Inicio)

function Vehiculos.Fin()
	for k, v in ipairs(getElementsByType("vehicle", resourceRoot)) do
		local X, Y, Z = getElementPosition(v)
		local RX, RY, RZ = getElementRotation(v)
		local Matricula = getVehiclePlateText(v)

		local Info = ''

		for i, Dato in ipairs(Vehiculos.Info) do
			Valor = v:getData(Dato)
			Info = Info..""..Dato..":"..Valor..";"
		end

		Vehiculos.DB:exec("UPDATE Vehiculos SET PosX=?, PosY=?, PosZ=?, RotX=?, RotY=?, RotZ=?, Salud=?, Datos=? WHERE Matricula=? ", X, Y, Z, RX, RY, RZ, v.health, Info, Matricula)
	end

	if delete_onrestart then
		local qh = Vehiculos.DB:query( "DROP TABLE Vehiculos" )
		dbFree( qh )
		outputServerLog( "[Veh] Se borro la tabla de Vehiculos" )
	end
end
addEventHandler('onResourceStop', resourceRoot, Vehiculos.Fin, true)

function SaveVeh( )
	Vehiculos.Fin()
	outputDebugString("[Vehiculos] Guardando en DB...")
end
setTimer(SaveVeh, 600000, 0)
addCommandHandler("saveCars", SaveVeh, true)

function Vehiculos.Cargar()
	local QH = dbQuery(Vehiculos.DB, 'SELECT * FROM Vehiculos')
	local Resultado = dbPoll(QH, -1)

	
	-- Se guardan los resultados obtenidos
	if #Resultado == 0 then
		outputDebugString("[Vehiculos] No hay vehiculos en la base de datos")
	else
		for k, v in ipairs(Resultado) do
			local Matricula = v['Matricula']
			local Info = split(v['Datos'], ";")

			Vehiculos[Matricula] = {}
			
			Vehiculos[Matricula].Posiciones = {v['PosX'], v['PosY'], v['PosZ']}
			Vehiculos[Matricula].Rotaciones = {v['RotX'], v['RotY'], v['RotZ']}
			Vehiculos[Matricula].Salud = v['Salud']

			for i, Inf in ipairs(Info) do
				local Dato = split(Inf, ":")
				Vehiculos[Matricula][Dato[1]] = Dato[2]
			end
			
		end
	end
	
	for k, v in ipairs(getElementsByType("vehicle", resourceRoot)) do
		local Matricula = getVehiclePlateText(v)
		local Datos = ObtenerDatos(v.model)
		local X, Y, Z = getElementPosition(v)
		local RX, RY, RZ = getElementRotation(v)

		Col = createColSphere(X, Y, Z, 4)
		attachElements(Col, v)

		Col:setData('parent', v)
		--v:setData('parent', Col)

		Col:setData('MAX_Slots', Datos[5])

		if not Datos then
			outputChatBox("[DayZ-Vehiculos] No se encontraron los datos del modelo "..v.model)
		else

		setVehicleRespawnPosition(v, X, Y, Z, RX, RY, RZ)
		addEventHandler('onVehicleExplode', v, Vehiculos.Reaparecer)

		v:setData('Combustible_Max', tonumber(Datos[3]))
		v:setData('Motor_Max', Datos[2])
		v:setData('Neumatico_Max', tonumber(Datos[4]))

		if not Vehiculos[Matricula] then
			local Info = ''

			for i, Dato in ipairs(Vehiculos.Info) do
				Valor = math.random(0, v:getData(Dato.."_Max"))

				Info = Info..""..Dato..":"..Valor..";"

				v:setData(Dato, Valor)
			end

			Vehiculos.DB:exec("INSERT INTO Vehiculos (Matricula, PosX, PosY, PosZ, RotX, RotY, RotZ, Datos) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", Matricula, X, Y, Z, RX, RY, RZ, Info)
		else
			local Pos = Vehiculos[Matricula].Posiciones
			local Rot = Vehiculos[Matricula].Rotaciones
			local Salud = Vehiculos[Matricula].Salud
			local Combustible = tonumber(Vehiculos[Matricula].Combustible)
			local Motor = tonumber(Vehiculos[Matricula].Motor)
			local Neumatico = tonumber(Vehiculos[Matricula].Neumatico)

			setElementPosition(v, Pos[1], Pos[2], Pos[3])
			setElementRotation(v, Rot[1], Rot[2], Rot[3])
			setElementHealth(v, Salud)
			
			setElementData(v, "Combustible", Combustible)
			setElementData(v, "Motor", Motor)
			setElementData(v, "Neumatico", Neumatico)
		end
		end
	end
end

function Vehiculos.Reaparecer(Elemento)

	setTimer(function(source)
	respawnVehicle(source)
	
	for i, Dato in ipairs(Vehiculos.Info) do
		Valor = math.random(0, source:getData(Dato.."_Max"))
		source:setData(Dato, Valor)
	end
	end, 10000, 1, source)
end

function Vehiculos.Chequear()
	for k, v in ipairs(getElementsByType("vehicle"), resourceRoot) do
		if isElementInWater(v) and v.vehicleType ~= "Boat" then
			Vehiculos.Reaparecer(v)
		end
	end
end
setTimer(Vehiculos.Chequear, 600000, 0)

function Vehiculos.Reparar(Vehiculo)
	Vehiculo:fix()
end
addEvent('Vehiculos:Reparar', true)
addEventHandler('Vehiculos:Reparar', getRootElement(), Vehiculos.Reparar)


-------------------------APAGAR LUCES CON K---------------------
local root = getRootElement ()
local thisResourceRoot = getResourceRootElement(getThisResource())

function thisResourceStart ()
	local players = getElementsByType ( "player" )
	for k,v in ipairs(players) do
	    bindKey ( v, "l", "down", toggleVehicleLights, "Lights on/off" )
	end
end

function playerJoin ()
    bindKey ( source, "l", "down", toggleVehicleLights, "Lights on/off" )
end

addEventHandler ( "onResourceStart", thisResourceRoot, thisResourceStart )
addEventHandler ( "onPlayerJoin", root, playerJoin )

function toggleVehicleLights ( player, key, state )
	if ( getPedOccupiedVehicleSeat ( player ) == 0 ) then
		local veh = getPedOccupiedVehicle ( player )
		if ( getVehicleOverrideLights ( veh ) ~= 2 ) then
			setVehicleOverrideLights ( veh, 2 )
		else
			setVehicleOverrideLights ( veh, 1 )
		end
	end
end
