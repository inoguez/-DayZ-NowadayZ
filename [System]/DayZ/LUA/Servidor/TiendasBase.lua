
ItemsFull = {
 	"AR-15",                                            
	"AA-12",
	"AK-47 ASIIMOV",
	"AK-74",
	"AK-74 GP-25",
	"AK-107",
	"AK-107 GL",
	"AK-107 GL PSO",
	"AK-107 PSO",
	"AKS",
	"AKS-74 Kobra",
	"AKS Gold",
	"M4A1",
	"M4A1 CCO",
	"M4A1 CCO SD",
	"M4A3 CCO",
	"RPK",
	"AS50",
	"DMR",
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
	"Caja de herramientas",
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
	"Munición (AK)",
	"Munición (STANAG)",
	"Munición (AS50)",
	"Munición (AWP)"

 }

Tiendas.Contador = 0

function Tiendas.Inicio()
	Consulta = dbQuery(DB.Con, "SELECT * FROM TiendasBases")
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
			Datos.Grupo = v["Grupo"]

			Crear(Datos, false, Datos.Items)
		end
	end
end
addEventHandler('onResourceStart', resourceRoot, Tiendas.Inicio)

function Crear(Datos, Numero, Items)
	local TiendaB = createObject(1515, Datos.X, Datos.Y, Datos.Z, 0, 0, Datos.Rot)
	local Col = createColSphere(Datos.X, Datos.Y, Datos.Z, 4)
	setElementCollisionsEnabled(TiendaB, true)
	attachElements(Col, TiendaB, 0, 0, 0)
	Col:setData('parent', TiendaB)
	TiendaB:setData('parent', Col)
	TiendaB:setData('TiendaBase', true)
	Col:setData('tentB', true)
	Col:setData('MAX_Slots', 14000000)
	Col:setData('Nombre', Datos.Nombre)
	Col:setData('Grupo', Datos.Grupo)
	
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
	else
		for _, item in ipairs(ItemsFull) do
			setElementData(Col,item,99999)                  
		end
	end

end

function quitarTienda(object, Colision)
	if not isElement(Colision) then return end

	Numero = getElementData(Colision, "Numero")
	DB.Con:exec("DELETE FROM TiendasBases WHERE ID=?", Numero)

	destroyElement(Colision)
	destroyElement(object)
end
addEvent("removerTiendaBase", true)
addEventHandler("removerTiendaBase", getRootElement(), quitarTienda)

function Tiendas.Guardar()
	for i, Col in ipairs(getElementsByType("colshape")) do
		if Col:getData('tentB') then
			local Items = ""
			
			for k, v in ipairs(LItems) do
				local Item = Col:getData(v)
				if Item and Item > 0 then
					Items = Items..""..v..":"..Item..";"
				end
			end

			DB.Con:exec("UPDATE TiendasBases SET Items=? WHERE ID=? ", Items, Col:getData('Numero'))
		end
	end
end
setTimer(Tiendas.Guardar, 600000, 0)
addCommandHandler("guardartiendas", Tiendas.Guardar, true)
addEventHandler("onResourceStop",getResourceRootElement(getThisResource()),Tiendas.Guardar)

function showGui(thePlayer)
	if isObjectInACLGroup ( "user." .. getAccountName(getPlayerAccount(thePlayer)), aclGetGroup ( "Admin" ) ) then
		triggerClientEvent("showGUITent", thePlayer)
	else
 		triggerClientEvent("DayZ:MostrarMensaje", thePlayer, "Debes ser [Admin] para sacar la tienda full!", 255,22,0)
 	end
end

addCommandHandler("TentBase", showGui)  



function tentdayz(Grupo, thePlayer)  
    
            local x,y,z = getElementPosition(thePlayer)
            local xr,yr,zr = getElementRotation(thePlayer)
            px, py, pz = getElementPosition(thePlayer)
            prot = getPedRotation(thePlayer)
            local offsetRot = math.rad(prot+90)
            local vx = px + 5 * math.cos(offsetRot)
            local vy = py + 5 * math.sin(offsetRot)
            local vz = pz + 2
            local vrot = prot+180


            local Datos = {}

			Datos.X = vx
			Datos.Y = vy
			Datos.Z = z-1
			Datos.Rot = vrot
			Datos.Nombre = "TentB"
			Datos.Grupo = Grupo


			setPedAnimation(source, 'BOMBER', 'BOM_Plant', false, false, false, false)
			Tiendas.Contador = Tiendas.Contador + 1

		    setTimer(function(Datos)
				Crear(Datos, Tiendas.Contador)

				DB.Con:exec("INSERT INTO TiendasBases (ID, Nombre, PosX, PosY, PosZ, Rotacion, Gang) VALUES (?, ?, ?, ?, ?, ?, ?)", Tiendas.Contador, Datos.Nombre, Datos.X, Datos.Y, Datos.Z, Datos.Rot, Datos.Grupo)
		    end, 1500, 1, Datos)
            
            
            triggerClientEvent("DayZ:MostrarMensaje", thePlayer, "#00ff00Has Puesto La Tienda para base!",22, 255, 0 )
 


end

addEvent( "Info.Grupo", true)
addEventHandler( "Info.Grupo", getRootElement(), tentdayz)
