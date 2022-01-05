------------------------REALOAD ACL----------------------------------------------------
function reloadACL ( source, command )
    local reload = aclReload()
    if ( reload ) then
      outputChatBox ( "ACL was successfully reloaded.", source, 0, 255, 0 ) 
    else 
      outputChatBox ( "An unknown error occured. Please check the ACL file exists.", source, 255, 0, 0 )
    end
end
addCommandHandler ( "reloadACL", reloadACL )

------------------------LIMPIAR CHAT BY /)ssasin#~---< --------------------------------
function clear(player)
    if hasObjectPermissionTo(player, "function.setPlayerMuted", false) then 
    for i=1,15 do 
        outputChatBox(" ") 
    end 
        outputChatBox("#008B8B Global Purificado: "..getPlayerName(player),root, 240, 255, 240, true) 
     else 
        outputChatBox ("#F0FFF0 Tienes que ser admin para usar este comando", player, 193, 13, 13) 
     end
end
addCommandHandler("limpiarchat", clear)
-------------------------------------------------------------------------------------------
-----------------------JOINQUIT BY /)ssasin#~> -----------------------------------------------
------------------------------INGRESO--------------------------------------------------------
addEventHandler("onPlayerJoin", root, function( ) 
    local ip = getPlayerIP( source ) 
    fetchRemote( 'http://ip-api.com/json/'..ip, outputJoin, '', false, source ) 
end) 
function outputJoin(response, errno, thePlayer) 
local country = 'Desconocida' 
local city = 'Desconocida' 
        if response ~= 'Error' and errno == 0 then 
            local joinData = fromJSON( response ) 
            if joinData and type(joinData) == 'table' then 
                if not joinData or joinData.status ~= 'fail' then 
                    country = joinData.country 
                    city = joinData.city 
                end 
            end 
        end 
    setElementData(thePlayer,"Country", country) 
    outputChatBox("#9B4444* #008B8B|Iniciando| "..getPlayerName(thePlayer).."#F0FFF0 ha entrado al servidor |"..country..', '..city.."|",root,240, 255, 240, true) 
end
--------------------------------------SALIDA----------------------------------------------------------
addEventHandler('onPlayerQuit', root,
    function(reason)
    if (reason == "Quit") then
        outputChatBox("#9B4444* #008B8B|Salida| "..getPlayerName(source)..' #F0FFF0Salio del servidor.', root, 240, 255, 240, true)
    elseif (reason == "Timed out") then
        outputChatBox("#9B4444* #008B8B|Tiempo Agotado| "..getPlayerName(source)..' #F0FFF0Salio del servidor.', root, 240, 255, 240, true)
	elseif (reason == "Banned") then
        outputChatBox("#9B4444* #008B8B|Baneado| "..getPlayerName(source)..' #F0FFF0Salio del servidor.', root, 240, 255, 240, true)
	elseif (reason == "Kicked") then
        outputChatBox("#9B4444* #008B8B|Expulsado| "..getPlayerName(source)..' #F0FFF0Salio del servidor.', root, 240, 255, 240, true)
    end
end
)

function nick (old, new) 
     outputChatBox("#9B4444* "..old.." #F0FFF0cambio de username a: "..new.." ", root, 108, 165, 63, true) 
end 
addEventHandler("onPlayerChangeNick", root, nick) 

-----------------------------------------------------------------------------------------------------
-----------------------INFORMACION BY /)ssasin#~> -----------------------------------------------
Anuncios = {
	--"[Información] Visitanos en nuestra pagina de facebook:",
	--"[informacion] Si tienes sugerencias o descubriste algun error o bug reportalo con /report",
}

function Anunciar()
	local Anuncio = math.random(1, #Anuncios)
	outputChatBox(Anuncios[Anuncio], root, 108, 165, 63, true)
end
--setTimer(Anunciar, 300000 , 0)
---------------------------------------------------------------------------------------------------
-----------------------PING KICKER BY /)ssasin#~> -----------------------------------------------
function kickPlayerOnHighPing()
  outputChatBox("#9B4444* #008B8B|DayZ| "..getPlayerName(source).." #F0FFF0 Ha sido expulsado por su ping alto!", root, 255, 0, 0, true)
  kickPlayer(source, "Fuiste kickeado por tu ping alto!")
end
addEvent("kickPlayerOnHighPing", true)
addEventHandler("kickPlayerOnHighPing", root, kickPlayerOnHighPing)
-----------------------------------------------------------------------------------------------------

function onQuitCheckForCombatLog(quitType)
		local time = getRealTime()
		local timeLeft = getElementData (source,"combattime")
		if timeLeft then
			if time.timestamp-timeLeft < 30 then
				local playerAccount = getPlayerAccount(source)
				if (playerAccount) then
					setAccountData(playerAccount,"blood",-5) -- Kill the player for combat logging
				end
			end
		end
end
addEventHandler ("onPlayerQuit",root,onQuitCheckForCombatLog)
----------------------------------SUPERMAN------------------------------------------------------------

local Superman = {}
local rootElement = getRootElement()
local thisResource = getThisResource()
addEvent("superman:start", true)
addEvent("superman:stop", true)
function Superman.Start()
  local self = Superman
  addEventHandler("superman:start", rootElement, self.clientStart)
  addEventHandler("superman:stop", rootElement, self.clientStop)
end
addEventHandler("onResourceStart", getResourceRootElement(thisResource), Superman.Start, false)
function Superman.clientStart()
  setElementData(client, "superman:flying", true)
end
function Superman.clientStop()
  setElementData(client, "superman:flying", false)
end
function useSuperman(thePlayer)
  if isObjectInACLGroup ( "user." .. getAccountName(getPlayerAccount(thePlayer)), aclGetGroup ( "Admin" ) ) then
  if getElementData(thePlayer, 'Inmortal') then
    triggerClientEvent (thePlayer, "startSuperman", thePlayer)
  else         
    outputChatBox( "Usa /adminmode antes de usar volar", thePlayer,255,0,0, true)     
    
  end
  end
end
addCommandHandler("volar", useSuperman)
------------------------------------WEATHER

function resourceStart()
    local realtime = getRealTime()

    setTime(realtime.hour, realtime.minute)
    setMinuteDuration(60000)

end
addEventHandler("onResourceStart", getResourceRootElement(), resourceStart)

