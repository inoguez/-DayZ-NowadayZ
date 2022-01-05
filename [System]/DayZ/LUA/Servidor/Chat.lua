-------------------------------------------------->>
-- Autor: Federico Romero (TheCrazy)
-- Fecha: 02 de Diciembre de 2015
-- Recurso: DayZ/LUA/Servidor/Chat.lua
-- Version: 1.0
-------------------------------------------------->>

Chat =  {}

-- Funcion para que los mensajes de chat solo se vean a cierta distancia
function Chat.Local(Mensaje, Tipo)
	-- Se cancela el evento original
	cancelEvent()

	--Chequea si el jugador esta silenciado
	if isPlayerMuted(source) or not source:getData('Iniciado') or Chat[source] then
		return
	end

	-- Se chequea el tipo de chat
	if Tipo == 0 then
		-- Se obtiene la posicion del jugador
		local X, Y, Z = getElementPosition(source)
		
		for i, Jugador in ipairs(getElementsByType("player")) do
			-- Se chequea si el jugador está a una distancia de 15
			if getDistanceBetweenPoints3D(X, Y, Z, getElementPosition(Jugador)) <= 15 then
				-- Se muestra el mensaje
				outputChatBox("#F0FFF0[LOCAL]"..getPlayerName(source) .. ": #F0FFF0"..Mensaje, Jugador, 211, 211, 211, true)
			end
		end
	end

	outputServerLog("[LOCAL]" .. getPlayerName ( source ) .. ": " .. Mensaje)

	Chat[source] = true
	setTimer(Chat.LimpiarJugador, 3000, 1, source)
end
addEventHandler("onPlayerChat", getRootElement(), Chat.Local)

function Chat.Global(Jugador, _, ...)
	--Chequea si el jugador esta silenciado
	if isPlayerMuted(Jugador) or not Jugador:getData('Iniciado') or Chat[Jugador] then
		return
	end

	Chat[Jugador] = true
	setTimer(Chat.LimpiarJugador, 3000, 1, Jugador)

	local Mensaje = table.concat({...} , " ")

	if Mensaje:find("%w+%.%w+%.%w+%.%w+:%w+") or Mensaje:find("%w+%.%w+%.%w+%.%w+") then
		return
	end

	if getElementData(Jugador, "Tag") then
		outputChatBox("#008B8B[GLOBAL]".." #F0FFF0"..getElementData(Jugador, "Tag").."#F0FFF0" ..Jugador.name.. ": #F0FFF0".. Mensaje, getRootElement(), 255, 255, 255, true)
		outputServerLog('008B8B[GLOBAL] '..Jugador.name..': '..Mensaje)
		return
	end

	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(Jugador)), aclGetGroup ( "YT" ) ) then
		outputChatBox("#008B8B[GLOBAL] #008B8B[#ffffffYOU#ff0000TUBER #008B8B] #F0FFF0" ..Jugador.name.. ": #F0FFF0".. Mensaje, getRootElement(), 255, 255, 255, true)
		outputServerLog('[GLOBAL] '..Jugador.name..': '..Mensaje)
		return
	end

	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(Jugador)), aclGetGroup ( "Console" ) ) then
       outputChatBox("#6495ED[Owner] #F0FFF0" ..Jugador.name.. ": #F0FFF0".. Mensaje, getRootElement(), 255, 255, 255, true) 
        outputServerLog('[GLOBAL] [Owner] '..Jugador.name..': '..Mensaje)
    return
    end
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(Jugador)), aclGetGroup ( "Admin" ) ) then
       outputChatBox("#008B8B[GLOBAL] #DC143C[Admin] #F0FFF0" ..Jugador.name.. ": #F0FFF0".. Mensaje, getRootElement(), 255, 255, 255, true) 
       outputServerLog('[GLOBAL] [Admin] '..Jugador.name..': '..Mensaje)
    return
    end
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(Jugador)), aclGetGroup ( "SuperModerator" ) ) then
       outputChatBox("#008B8B[GLOBAL] #4169E1[SuperModerator] #F0FFF0" ..Jugador.name.. ": #F0FFF0".. Mensaje, getRootElement(), 255, 255, 255, true) 
       outputServerLog('[GLOBAL] [S.Mod] '..Jugador.name..': '..Mensaje)
    return
    end
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(Jugador)), aclGetGroup ( "Moderator" ) ) then
       outputChatBox("#008B8B[GLOBAL] #00FFFF[Moderador] #F0FFF0" ..Jugador.name.. ": #F0FFF0".. Mensaje, getRootElement(), 255, 255, 255, true) 
       outputServerLog('[GLOBAL] [Mod] '..Jugador.name..': '..Mensaje)
    return
    end

    if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(Jugador)), aclGetGroup ( "VIP" ) ) then
	   outputChatBox("#008B8B[GLOBAL] #F4A460[VIP] #F0FFF0" ..Jugador.name.. ": #F0FFF0".. Mensaje, v, 255, 255, 255, true) 
           outputServerLog('[GLOBAL][VIP] '..Jugador.name..': '..Mensaje)
	return
	end

	for k, v in ipairs(getElementsByType("player")) do
		if v:getData('Iniciado') then
			outputChatBox("#008B8B[GLOBAL] #F0FFF0" ..Jugador.name.. ": #F0FFF0" .. Mensaje, v, 0, 255, 255, true)
            outputServerLog('[GLOBAL] '..Jugador.name..': '..Mensaje)
	    end
	end
	--[[
    if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(Jugador)), aclGetGroup ( "UNLIMITED" ) ) then
       outputChatBox("#FFF700[UNLIMITED] #FFFFFF" ..Jugador.name.. ": #FFFFFF".. Mensaje, getRootElement(), 255, 255, 255, true) 
          outputServerLog('[GLOBAL] [UNL] '..Jugador.name..': '..Mensaje)
    return
    end]]
end
addCommandHandler("Global", Chat.Global)


function Chat.LimpiarJugador(Jugador)
	if isElement(Jugador) then
		Chat[Jugador] = false
	end
end