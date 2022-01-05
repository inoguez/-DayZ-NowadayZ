--// Creador: TheCrazy
--// Fecha: 15/07/2016
--// Proposito: Funcionamiento de las mochilas

-- Se actualiza la mochila para un jugador
local elementBackpack = {} 
function Mochilas.Actualizar(Nombre, Espacios)
	-- En caso de que la mochila ya exista, se destruye
	if isElement(Mochila[source]) then
		destroyElement(Mochila[source])
	end
	
	if Espacios then
		source:setData('MAX_Slots', Espacios)
	end

	-- Se crea la mochila, se pega al jugador y se le asigna sus respectivos espacios
	for k, v in ipairs(Mochilas) do
		if v[1] == Nombre or v[2] == tonumber(Espacios) then

			X, Y, Z = getElementPosition(source)
			Mochila[source] = createObject(v[3], X, Y, Z)
			exports.bone_attach:attachElementToBone(Mochila[source], source, 3, v[4], v[5], v[6], v[7], v[8], v[9])

      setElementData(source, 'Mochila', v[1])
			setElementData(source, 'MAX_Slots', v[2])

			break
		end
	end
end
addEvent("ActualizarMochila", true)
addEventHandler("ActualizarMochila", getRootElement(), Mochilas.Actualizar)

local elementBackpack = {} 
function backPackBack (dataName,oldValue) 
---------------------------------------CASCO MILITAR-----------------------------------------------------------------------
    if getElementType(source) == "player" and dataName == "helmetOn1" then 
     if getElementData ( source, dataName ) then 
      local x, y, z = getElementPosition(source) 
      local helmet1 = createObject(3243, x, y, z) 
      setElementData ( source, "helmetObject1", helmet1 ) 
	  triggerClientEvent("DayZ:MostrarMensaje", source, "Te has puesto el casco militar",255, 255, 255) 
      local skin = getElementModel ( source ) 
      if skin == 0 then 
       exports.bone_attach:attachElementToBone(helmet1, source, 1, 0,-0.05, -0.55, 0, 10, 90)
      else 
       exports.bone_attach:attachElementToBone(helmet1, source, 1, 0, 0.015, -115, 0, 90) 
      end 
     else 
     if isElement ( getElementData ( source, "helmetObject1" ) )  then 
       exports.bone_attach:detachElementFromBone( getElementData ( source, "helmetObject1" ) ) 
       destroyElement ( getElementData ( source, "helmetObject1" ) ) 
       setElementData ( source, "helmetObject1", false ) 
	   triggerClientEvent("DayZ:MostrarMensaje", source, "Te has quitado el casco  militar",255, 255, 255) 
    end 
    end
	end
	---------------------------------------------CHALECO--------------------------------------------------------------
	 if getElementType(source) == "player" and dataName == "helmetOn" then 
     if getElementData ( source, dataName ) then 
      local x, y, z = getElementPosition(source) 
      local helmet = createObject(2324, x, y, z) 
      setElementData ( source, "helmetObject", helmet ) 
	  triggerClientEvent("DayZ:MostrarMensaje", source, "Te has puesto el chaleco militar",255, 255, 255)
      local skin = getElementModel ( source ) 
      if skin == 0 then 
       exports.bone_attach:attachElementToBone(helmet, source, 3, 0, 0.01, -0.560, 0, 0, 90)
      else 
       exports.bone_attach:attachElementToBone(helmet, source, 3, 0, 0.01, -0.560, 0, 0, 90)
      end 
     else 
      if isElement ( getElementData ( source, "helmetObject" ) )  then 
       exports.bone_attach:detachElementFromBone( getElementData ( source, "helmetObject" ) ) 
       destroyElement ( getElementData ( source, "helmetObject" ) ) 
       setElementData ( source, "helmetObject", false ) 
       triggerClientEvent("DayZ:MostrarMensaje", source, "Te has quitado el chaleco militar",255, 255, 255) 
      end 
     end 
    end
	--------------------------------------CHALECO SWAT -----------------------------------------------
	 if getElementType(source) == "player" and dataName == "helmetOn3" then 
     if getElementData ( source, dataName ) then 
      local x, y, z = getElementPosition(source) 
      local helmet3 = createObject(2326, x, y, z) 
      setElementData ( source, "helmetObject3", helmet3 ) 
	  triggerClientEvent("DayZ:MostrarMensaje", source, "Te has puesto el chaleco SWAT",255, 255, 255)
      local skin = getElementModel ( source ) 
      if skin == 0 then 
       exports.bone_attach:attachElementToBone(helmet3, source, 1, 0.05, 0.011, -0.3, 0, -100, 0)
      else 
       exports.bone_attach:attachElementToBone(helmet3, source, 1, 0.05, 0.011, -0.3, 0, -100, 0)
      end 
     else 
      if isElement ( getElementData ( source, "helmetObject3" ) )  then 
       exports.bone_attach:detachElementFromBone( getElementData ( source, "helmetObject3" ) ) 
       destroyElement ( getElementData ( source, "helmetObject3" ) ) 
       setElementData ( source, "helmetObject3", false ) 
       triggerClientEvent("DayZ:MostrarMensaje", source, "Te has quitado el chaleco SWAT",255, 255, 255) 
      end 
     end 
    end
	----------------------------------------- CASCO SWAT ----------------------------------------------------
    if getElementType(source) == "player" and dataName == "helmetOn2" then 
     if getElementData ( source, dataName ) then 
      local x, y, z = getElementPosition(source) 
      local helmet2 = createObject(983, x, y, z) 
      setElementData ( source, "helmetObject2", helmet2 ) 
	  triggerClientEvent("DayZ:MostrarMensaje", source, "Te has puesto el casco SWAT",255, 255, 255) 
      local skin = getElementModel ( source ) 
      if skin == 0 then 
       exports.bone_attach:attachElementToBone(helmet2, source, 1, 0,-0.05, -0.55, 0, 10, 90)
      else 
       exports.bone_attach:attachElementToBone(helmet2, source, 1, 0, 0.015, -115, 0, 90) 
      end 
     else 
     if isElement ( getElementData ( source, "helmetObject2" ) )  then 
       exports.bone_attach:detachElementFromBone( getElementData ( source, "helmetObject2" ) ) 
       destroyElement ( getElementData ( source, "helmetObject2" ) ) 
       setElementData ( source, "helmetObject2", false ) 
	   triggerClientEvent("DayZ:MostrarMensaje", source, "Te has quitado el casco  SWAT",255, 255, 255) 
    end 
    end
	end
end 
addEvent("onElementDataChange", true)
addEventHandler ( "onElementDataChange", getRootElement(), backPackBack )



--Salida del servidor de un jugador
function Mochilas.Quitar()
	--Se remueve la mochila del jugador
	if isElement(Mochila[source]) then
		destroyElement(Mochila[source])
	end
  if getElementData ( source, "helmetObject" ) then 
    local helmet = getElementData ( source, "helmetObject" ) 
     if isElement ( helmet ) then 
       destroyElement ( helmet ) 
     end 
  end
  if getElementData ( source, "helmetObject1" ) then 
     local helmet1 = getElementData ( source, "helmetObject1" ) 
     if isElement ( helmet1 ) then 
       destroyElement ( helmet1 ) 
     end 
  end
   if getElementData ( source, "helmetObject3" ) then 
    local helmet3 = getElementData ( source, "helmetObject3" ) 
     if isElement ( helmet3 ) then 
       destroyElement ( helmet3 ) 
     end 
  end
  if getElementData ( source, "helmetObject2" ) then 
     local helmet2 = getElementData ( source, "helmetObject2" ) 
     if isElement ( helmet2 ) then 
       destroyElement ( helmet2 ) 
     end 
  end
end
addEventHandler("onPlayerQuit", getRootElement(), Mochilas.Quitar)


