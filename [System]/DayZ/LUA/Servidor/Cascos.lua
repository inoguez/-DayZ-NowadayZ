--// Creador: TheCrazy17
--// Fecha: 14/05/2017
--// Proposito: Funcionamiento de los cascos

Casco = {
	["Casco militar"] = {1518, 0, -0.02, -0.56, 0, 10, 90, 1}
}

function Casco.Colocar(Item)
	if isElement(Casco[source]) then
		outputChatBox("Ya tienes un Casco equipado!", source, 200, 0, 0)
		return
	end

	if not Casco[Item] then
		outputDebugString("Vaya, al parecer alguien intentó equiparse: "..Item.." como casco!")
		return
	end

	source:setData('Casco', Item)

	local Info = Casco[Item]
	Casco[source] = createObject(Info[1], 0, 0, 0)
	exports.bone_attach:attachElementToBone(Casco[source], source, 1, Info[2], Info[3], Info[4], Info[5], Info[6], Info[7])
	setObjectScale(Casco[source], Info[8])
end
addEvent("Casco:Colocar", true)
addEventHandler("Casco:Colocar", getRootElement(), Casco.Colocar)

function Casco.Quitar(Jugador)
	if isElement(Casco[Jugador]) then
		destroyElement(Casco[Jugador])
		setElementData(Jugador, "Casco", false)
		return
	end
	--
	if isElement(Casco[source]) then
		destroyElement(Casco[source])
		setElementData(source, "Casco", false)
	end
end
addEvent("Casco:Quitar", true)
addEventHandler("Casco:Quitar", getRootElement(), Casco.Quitar)

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