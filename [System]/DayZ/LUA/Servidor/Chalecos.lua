--// Creador: TheCrazy17
--// Fecha: 14/05/2017
--// Proposito: Funcionamiento de los chalecos de protección

Proteccion = {}

Chaleco = {
	["Chaleco militar"] = {1517, 0.01, 0.01, 0.040, -180, -180, -90, 0.95},
}

function Chaleco.Colocar(Item)
	if isElement(Chaleco[source]) then
		outputChatBox("Ya tienes un chaleco equipado!", source, 200, 0, 0)
		return
	end

	if not Chaleco[Item] then
		outputDebugString("Vaya, al parecer alguien intentó equiparse: "..Item.." como chaleco!")
		return
	end

	source:setData('Chaleco', Item)

	local Info = Chaleco[Item]
	Chaleco[source] = createObject(Info[1], 0, 0, 0)
	exports.bone_attach:attachElementToBone(Chaleco[source], source, 3, Info[2], Info[3], Info[4], Info[5], Info[6], Info[7])
	setObjectScale(Chaleco[source], Info[8])
end
addEvent("Chaleco:Colocar", true)
addEventHandler("Chaleco:Colocar", getRootElement(), Chaleco.Colocar)

function Chaleco.Quitar(Jugador)
	if isElement(Chaleco[Jugador]) then
		destroyElement(Chaleco[Jugador])
		setElementData(Jugador, "Chaleco", false)
		return
	end
	if isElement(Chaleco[source]) then
		destroyElement(Chaleco[source])
		setElementData(source, "Chaleco", false)
	end
end
addEvent("Chaleco:Quitar", true)
addEventHandler("Chaleco:Quitar", getRootElement(), Chaleco.Quitar)

function informPlayerOnModelChange(oldModel)
    if ( getElementType(source) == "player" ) then -- Make sure the element is a player
		if getElementModel(source) == 201 or getElementModel(source) == 205 then
			if isElement(Chaleco[source]) then
				exports.bone_attach:attachElementToBone(Chaleco[source], source, 3, 0, 0.04, 0.12, 0, -90, 0)
				setObjectScale(Chaleco[source], 0.5)
			end
			
			if isElement(Casco[source]) then
				exports.bone_attach:attachElementToBone(Casco[source], source, 1, 0, 0.21, -0.55, 0, -20, 90)
				setObjectScale(Casco[source], 1.1)
			end
		end
    end
end
addEventHandler("onElementModelChange", root, informPlayerOnModelChange)




