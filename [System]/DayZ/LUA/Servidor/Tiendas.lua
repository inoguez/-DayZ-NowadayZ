-- ****************************************************************************
--
-- RECURSO: DayZ
-- ARCHIVO: Funciones/Servidor/Tiendas.lua
-- PROPOSITO: Funcionamiento general de las tiendas
-- CREADORES: Federico Romero < TheCrazy >
--
-- ****************************************************************************

Tiendas.Contador = 0

function Tiendas.Inicio()
	Consulta = dbQuery(DB.Con, "SELECT * FROM Tiendas")
	local Resultado =  dbPoll(Consulta, -1)

	if Resultado and Resultado[1] then
		Tiendas.Contador = Resultado[#Resultado].ID
		
		for k, v in ipairs(Resultado) do
			local Datos = {}

			Datos.Numero = v["ID"]
			Datos.Nombre = v["Nombre"]
			Datos.X = v["PosX"]
			Datos.Y = v["PosY"]
			Datos.Z = v["PosZ"]
			Datos.Rot = v["Rotacion"]
			Datos.Items = v["Items"]

			Tiendas.Crear(Datos, false, Datos.Items)
		end
	end
end
addEventHandler('onResourceStart', resourceRoot, Tiendas.Inicio)

function Tiendas.Crear(Datos, Numero, Items)
	local Tienda = createObject(Tiendas[Datos.Nombre][1], Datos.X, Datos.Y, Datos.Z, 0, 0, Datos.Rot)
	local Col = createColSphere(Datos.X, Datos.Y, Datos.Z, 4)
	setElementCollisionsEnabled(Tienda, false)
	attachElements(Col, Tienda, 0, 0, 0)
	Col:setData('parent', Tienda)
	Tienda:setData('parent', Col)
	Tienda:setData('Tienda', true)
	Col:setData('tent', true)
	Col:setData('MAX_Slots', Tiendas[Datos.Nombre][2])
	Col:setData('Nombre', Datos.Nombre)
	
	if Numero then
		Col:setData('Numero', Tiendas.Contador)
	else
		Col:setData('Numero', Datos.Numero)
	end
	
	if Items then
		local Info = split(Items, ";")
		for k, v in ipairs(Info) do
			local Item = split(v, ":")
			Col:setData(Item[1], tonumber(Item[2]))
		end
	end
end

function Tiendas.Construir(Datos)
	if source:getData(Datos.Nombre) <= 0 then return end

	source:setData(Datos.Nombre, source:getData(Datos.Nombre) - 1)
	setPedAnimation(source, 'BOMBER', 'BOM_Plant', false, false, false, false)
	Tiendas.Contador = Tiendas.Contador + 1

    setTimer(function(Datos)
		Tiendas.Crear(Datos, Tiendas.Contador)

		DB.Con:exec("INSERT INTO Tiendas (ID, Nombre, PosX, PosY, PosZ, Rotacion) VALUES (?, ?, ?, ?, ?, ?)", Tiendas.Contador, Datos.Nombre, Datos.X, Datos.Y, Datos.Z, Datos.Rot)
    end, 1500, 1, Datos)            
end
addEvent('Tiendas:Construir', true)
addEventHandler('Tiendas:Construir', getRootElement(), Tiendas.Construir)

function quitarTienda(object, Colision)
	if not isElement(Colision) then return end

	Numero = getElementData(Colision, "Numero")
	DB.Con:exec("DELETE FROM Tiendas WHERE ID=?", Numero)
	
	local X, Y, Z = getElementPosition(source)

	Info = {}
	
	Info.X = X
	Info.Y = Y
	Info.Z = Z - 0.875
	Info.Item = Colision:getData('Nombre')

	triggerEvent("Items:Crear", root, Info)

	destroyElement(Colision)
	destroyElement(object)
end
addEvent("removerTienda", true)
addEventHandler("removerTienda", getRootElement(), quitarTienda)

-----------------------
-----TentFull----------
-------------------

function quitarTiendaFull(Col)
  destroyElement(getElementData(Col, "parent"))
  destroyElement(Col)
--[[
	local X, Y, Z = getElementPosition(source)

	Info = {}
	
	Info.X = X
	Info.Y = Y
	Info.Z = Z - 0.875
	Info.Item = 'Tienda'

	--triggerEvent("Items:Crear", root, Info)]]
end
addEvent("removerTiendaFull", true)
addEventHandler("removerTiendaFull", getRootElement(), quitarTiendaFull)

function Tiendas.Guardar()
	for i, Col in ipairs(getElementsByType("colshape")) do
		if Col:getData('tent') then
			local Items = ""
			
			for k, v in ipairs(LItems) do
				local Item = Col:getData(v)
				if Item and Item > 0 then
					Items = Items..""..v..":"..Item..";"
				end
			end

			DB.Con:exec("UPDATE Tiendas SET Items=? WHERE ID=? ", Items, Col:getData('Numero'))
		end
	end
end
setTimer(Tiendas.Guardar, 600000, 0)
addCommandHandler("guardartiendas", Tiendas.Guardar, true)
addEventHandler("onResourceStop",getResourceRootElement(getThisResource()),Tiendas.Guardar)



----------------------------------------------------------------
-----------------TIENDA FULL-------------------------------------
-------------------------------------------------------------------

function tentdayz(thePlayer)  
    if isObjectInACLGroup ( "user." .. getAccountName(getPlayerAccount(thePlayer)), aclGetGroup ( "Admin" ) ) then
            local x,y,z = getElementPosition(thePlayer)
            local xr,yr,zr = getElementRotation(thePlayer)
            px, py, pz = getElementPosition(thePlayer)
            prot = getPedRotation(thePlayer)
            local offsetRot = math.rad(prot+90)
            local vx = px + 5 * math.cos(offsetRot)
            local vy = py + 5 * math.sin(offsetRot)
            local vz = pz + 2
            local vrot = prot+180
            tent = createObject(2263,vx,vy,z-1,0,0,vrot)                     
            tentCol = createColSphere(x,y,z,4)
            attachElements ( tentCol, tent, 0, 0, 0 )
            setElementData(tentCol,"parent",tent)
            setElementData(tent,"parent",tentCol)
            setElementData(tentCol, "MAX_Slots", 0)
            setElementCollisionsEnabled(tent, false)
            tentCol:setData('parent', tent)
			tent:setData('parent', tentCol)
			tent:setData('TiendaADM', true)
            tentCol:setData('tentADM', true)
            tentCol:setData('MAX_Slots', 14000000)
            tentCol:setData('Nombre', "Tienda Full")       

            triggerClientEvent("DayZ:MostrarMensaje", thePlayer, "Has Puesto La Tienda Full",22, 255, 0 )
 local items = {
 	"AR-15",                                            
	"AA-12",
	"Remington",
	"ACR",
	"AK-47 ASIIMOV",
	"AK-74",
	"AK-74 GP-25",
	"AK-107",
	"AK-107 GL",
	"AK-107 GL PSO",
	"AK-107 PSO",
	"AKM",
	"AKS",
	"AKS-74 Kobra",
	"AKS Gold",
	"G36",
	"G36A",
	"G36C",
	"G36C SD",
	"G36K",
	"M4A1",
	"M4A1 CCO",
	"M4A1 CCO SD",
	"M4A3 CCO",
	"RPK",
	"AS50",
	"DMR",
	"PGM Hecate II",
	"KSVK",
	"M107",
	"SVD Camo",
	"Ballesta",
	"Winchester",
	"M240",
	"M249 Saw",
	"Mk48",
	"PKM",
	"PKP",
	"Cuchillo",
	"Hacha",
	"Machete",
	"Palanca",
	"G17",
	"M9",
	"M9 SD",
	"M1911",
	"Desert Eagle",
	"MP5A5",
	"MP5SD6",
	"Bizon PP-19 SD",
	"Paracaidas",
	"Gas lacrimogeno",
	"Granada",
	"Binoculares", 
	"Botella de agua",
	"Pasta enlatada",
	"Frijoles enlatados",
	"Carne cocida",
	"Madera",
	"Vendaje",
	"Bengala",
	"Bidón vacio",
	"Bidón con gasolina",
	"Botiquin",
	"Bolsa termica",
	"Analgésicos",
	"Morfina",
	"Bolsa de sangre",
	"Valla de alambre",
	"Carne cruda",
	"Botella vacia",
	"Neumatico",
	"Motor",
	"Tienda",
	'Traje de superviviente',
	'Traje de Ghillie [F]',
	'Traje de Ghillie [M]',
	'Traje de Policia',
	"Traje de Bandido [F]",
	'Traje de Bandido [M]',
	'Traje de Militar [M]',
	"Traje de Militar [F]",
	"Traje de Swat",
	"Casco militar",
	"Chaleco militar",
	"Mina explosiva",
	"Trampa de oso",
	"Alice (Mochila)",
	"Asalto (Mochila)",
	"Coyote (Mochila)",
	"Czech (Mochila)",
	"Campamento (Mochila)",
	"Armada (Mochila)",
	"Lentes de visión nocturna",
	"Lentes infrarrojos",
	"Mapa",
	"Caja de cerillas",
	"Reloj",
	"GPS",
	"Caja de herramientas"
 }

 local ammos = {   
 	"Munición (G17)",
	"Munición (M9)",
	"Munición (M1911)",
	"Munición (MP5A5)",
	"Munición (MP5SD6)",
	"Munición (Bizon)",
	"Munición (P90)",
	"Munición (Desert)",

	"Munición (AA-12)",

	"Munición (AR-15)",
	"Munición (ACR)",
	"Munición (AK)",
	"Munición (RPK)",
	"Munición (AKM)",
	"Munición (G36)",
	"Munición (STANAG)",
	
	"Munición (AS50)",
	"Munición (AWP)",
	"Munición (DMR)",
	"Munición (Hecate)",
	"Munición (KSVK)",
	"Munición (M107)",
	"Munición (SVD)",

	"Munición (M240)",
	"Munición (M249)",
	"Munición (Mk48)",
	"Munición (PKM)",
	"Munición (RPD)",
 }
  for _, item in ipairs(items) do
    setElementData(tentCol,item,9999)                  
  end

  for _, ammo in ipairs(ammos) do
    setElementData(tentCol,ammo,99999)                      
  end
 else
 triggerClientEvent("DayZ:MostrarMensaje", thePlayer, "Debes ser [Admin] para sacar la tienda full!", 255,22,0)
 end
end
addCommandHandler("Tent", tentdayz)  
