local db = dbConnect( "sqlite", ":/dbData.db" )
delete_onrestart = false
addEvent("requestTOPList", true )
addEvent("requestPlayer", true )

function onStart( )
	local qh = db:query( "CREATE TABLE IF NOT EXISTS TOP ( accountn STRING, nick STRING, totalk INTEGER, totald INTEGER, kdr INTEGER, grupo STRING ) ")
	dbFree( qh ) 
	local qh1 = db:query( "CREATE TABLE IF NOT EXISTS TOPGP ( accountn STRING, grupo STRING, totalkGP INTEGER, totaldGP INTEGER, kdrg INTEGER ) ")
	dbFree( qh1 ) 
	outputServerLog( "[TOP] Se creo la tabla LEADERBOARD")
end
addEventHandler("onResourceStart", getResourceRootElement( getThisResource()), onStart)

function onStop( )
	if delete_onrestart then
		local qh = db:query( "DROP TABLE TOP" )
		dbFree( qh )
		local qh2 = db:query( "DROP TABLE TOPGP" )
		dbFree( qh2 )
		outputServerLog( "[TOP] Se borro la tabla de LEADERBOARD" )
	end
end
addEventHandler("onResourceStop", getResourceRootElement( getThisResource()), onStop)

function getList( )
	local i1 = 0
	local qh = db:query( "SELECT * FROM TOP ORDER BY totalk DESC LIMIT 20")
	for i, columna in ipairs( dbPoll( qh, - 1 ) ) do
		local nick, tk, td, kdr, g = columna["nick"],columna["totalk"],columna["totald"], columna["kdr"],columna["grupo"]
		i1 = i1 + 1
		triggerClientEvent( source, "sendTOPList", source, i1, nick, tk, td, kdr, g )
	end
	local i2 = 0
	local qh = db:query( "SELECT * FROM TOPGP ORDER BY totalkGP DESC LIMIT 20")
	for i, columna in ipairs( dbPoll( qh, - 1 ) ) do
		local groupGP, tkGP, tdGP, kdrg = columna["grupo"],columna["totalkGP"],columna["totaldGP"],columna["kdrg"]
		i2 = i2 + 1
		triggerClientEvent(source, "sendTOPList2", source, i2, groupGP, tkGP, tdGP, kdrg )
	end
end
addEventHandler( "requestTOPList", root, getList )

function gePls( )
	local account = source:getAccount()
	local accountName = account:getName()
	local qh = db:query( "SELECT * FROM TOP WHERE accountn=?", accountName)
	for i, columna in ipairs( dbPoll( qh, - 1 ) ) do
		local tk,td = columna["totalk"],columna["totald"]
		triggerClientEvent( source, "sendPlayerStat", source, tk,td )
	end
end
addEventHandler( "requestPlayer", root, gePls )

function addPlayerKill( player, ammount )
	--assert ( player:getType() == "player", "Error bad argument @player [ Expected at argument 1 got "..tostring( player ).." ]")
	--assert ( type ( ammount ) == "number", "Error bad argument @ammount [ Expected at argument 1 got "..tostring( ammount ).." ]")
	local account = player:getAccount();
	local accountName = account:getName();
	if not account:isGuest() then

		local qh = db:query( "SELECT * FROM TOP WHERE accountn=?",accountName)
		for _, col in pairs( dbPoll( qh, -1 ) ) do
			local actualKills = col["totalk"];
			local newKills = tonumber( actualKills ) + ammount 
			db:exec("UPDATE TOP SET totalk=? WHERE accountn=?", newKills, accountName )
        end
    end
end

function addPlayerDeath( player, ammount )

	--assert ( player:getType() == "player", "Error bad argument @player [ Expected at argument 1 got "..tostring( player ).." ]")
	--assert ( type ( ammount ) == "number", "Error bad argument @ammount [ Expected at argument 1 got "..tostring( ammount ).." ]")

	local account = player:getAccount();
	local accountName = account:getName();
	if not account:isGuest() then
		local qH = db:query( "SELECT totald FROM TOP WHERE accountn=?",accountName)
		for _, col in pairs( dbPoll( qH, -1 ) ) do
			actualDeaths= col["totald"];
			local newKills = tonumber( actualDeaths ) + ammount 
			db:exec("UPDATE TOP SET totald=? WHERE accountn=?", newKills, accountName )
		end
	end
end

function addPlayerKDR( player )

	--assert ( player:getType() == "player", "Error bad argument @player [ Expected at argument 1 got "..tostring( player ).." ]")
	--assert ( type ( ammount ) == "number", "Error bad argument @ammount [ Expected at argument 1 got "..tostring( ammount ).." ]")

	local account = player:getAccount();
	local accountName = account:getName();
	if not account:isGuest() then
		local qh = db:query( "SELECT * FROM TOP WHERE accountn=?",accountName)
		for _, col in pairs( dbPoll( qh, -1 ) ) do
			local totaldeaths = col["totald"];
			local totkills = col["totalk"];

			if totkills >= 1 and totaldeaths == 0 then
				 KDR = totkills
			elseif totaldeaths >= 1 and totkills == 0 then
				 KDR = totaldeaths * -1
			else
				killdeathratio = totkills/totaldeaths
				 KDR = tostring(round(killdeathratio,2))
			end

			db:exec("UPDATE TOP SET kdr=? WHERE accountn=?", KDR, accountName )
		end
	end
end


function addGroupKDR( gangName )

	--assert ( player:getType() == "player", "Error bad argument @player [ Expected at argument 1 got "..tostring( player ).." ]")
	--assert ( type ( ammount ) == "number", "Error bad argument @ammount [ Expected at argument 1 got "..tostring( ammount ).." ]")

		local qh = db:query( "SELECT * FROM TOPGP WHERE grupo=?",gangName)
		for _, col in pairs( dbPoll( qh, -1 ) ) do
			local totaldeathsg = col["totaldGP"];
			local totkillsg = col["totalkGP"];
			local KDR = tostring(round(totkillsg/totaldeathsg,2))
			db:exec("UPDATE TOPGP SET kdrg=? WHERE grupo=?", KDR, gangName )
		end
end


function addGroupKill( gangName, ammount )

	--assert ( type ( ammount ) == "number", "Error bad argument @ammount [ Expected at argument 1 got "..tostring( ammount ).." ]")
	
	local qH = db:query( "SELECT totalkGP FROM TOPGP WHERE grupo=?",gangName)
	for _, col in pairs( dbPoll( qH, -1 ) ) do
		local actualK= col["totalkGP"];
		local newKk= tonumber( actualK ) + ammount 
		db:exec("UPDATE TOPGP SET totalkGP=? WHERE grupo=?", newKk, gangName )
	end
end

function addGroupDeath( gangName, ammount )

	--assert ( type ( ammount ) == "number", "Error bad argument @ammount [ Expected at argument 1 got "..tostring( ammount ).." ]")

	local qH = db:query( "SELECT totaldGP FROM TOPGP WHERE grupo=?",gangName)
	for _, col in pairs( dbPoll( qH, -1 ) ) do
		actualD= col["totaldGP"];
		local newKd = tonumber( actualD ) + ammount 
		db:exec("UPDATE TOPGP SET totaldGP=? WHERE grupo=?", newKd, gangName )
	end
end

function onWats ( Info )
	if Info.Atacante and isElement(Info.Atacante) then
		Asesino = Info.Atacante
		local account = source:getAccount();
		if not account:isGuest() then
			addPlayerDeath( source, 1 )
			local playerGang = exports.groupsystem:getPlayerGroup( source )
			if playerGang then
				addGroupDeath( playerGang, 1 )
				addGroupKDR(playerGang)
			end
		end
		addPlayerKill( Asesino, 1 )

		local playerGang2 = getElementData( Asesino, "Group" )
		addGroupKill( playerGang2, 1 )
		addGroupKDR(playerGang2)

		addPlayerKDR(Asesino)
		addPlayerKDR(source)
	end
end

addEvent("DayZ:Muerte",true)
addEventHandler("DayZ:Muerte",getRootElement(),onWats)

function misStats( player )
	local account = player:getAccount();
	local accountName = account:getName();
	if not account:isGuest() then
		local qh = db:query( "SELECT * FROM TOP WHERE accountn=?",accountName)
		for _, col in pairs( dbPoll( qh, -1 ) ) do
			outputChatBox("Asesinatos: "..col["totalk"].."Muertes: "..col["totald"], player, 225, 225, 225, true )
		end
	end
end
addCommandHandler( "stats", misStats )



function checKAccount()
	local Cuenta = getPlayerAccount(source)
	if not Cuenta then return end

	accountName = getAccountName(Cuenta)
	local player = source

	local qh2 = db:query( "SELECT accountn FROM TOP WHERE accountn=?", accountName )
	local result2 = dbPoll( qh2, - 1 )
	if #result2 == 0 then
		local playerGang = exports.groupsystem:getPlayerGroup( player )
		if not playerGang then
			playerGang = "N/A"
		end
		db:exec( "INSERT INTO TOP ( accountn, nick, totalk, totald, kdr, grupo  ) VALUES(?,?,?,?,?,?)", accountName, getPlayerName( player ), 0, 0, 0, playerGang)
	else
		local playerGang = exports.groupsystem:getPlayerGroup( player )
		if not playerGang then
			playerGang = "N/A"
		end
		db:exec( "UPDATE TOP SET nick=?, grupo=? WHERE accountn=?", getPlayerName( player ), playerGang, accountName )
	end
	local playerGang = exports.groupsystem:getPlayerGroup( player )
	if playerGang then
		local qh4 = db:query( "SELECT accountn FROM TOPGP WHERE grupo=?", playerGang )
		local result4 = dbPoll( qh4, - 1 )
		if #result4 == 0 then
			db:exec( "INSERT INTO TOPGP ( accountn, grupo, totalkGP, totaldGP, kdrg  ) VALUES(?,?,?,?,?)",accountName, playerGang, 0, 0, 0 )
		--else
			--local playerGang = exports.groupsystem:getPlayerGroup( player )
			--db:exec( "UPDATE TOPGP SET grupo=?, WHERE accountName=?", playerGang, accountName )
		end
	end
end
addEvent("onPlayerLogin", true)
addEventHandler("onPlayerLogin", getRootElement(), checKAccount) 

function nickChangeHandler(oldNick, newNick)
		local account = source:getAccount();
		local accountName = account:getName();
		if not account:isGuest() then
			local qh2 = db:query( "SELECT accountn FROM TOP WHERE accountn=?", accountName )
			local result2 = dbPoll( qh2, - 1 )
			if #result2 ~= 0 then
				db:exec( "UPDATE TOP SET nick=? WHERE accountn=?", newNick, accountName )
			end
		end
end
addEventHandler("onPlayerChangeNick", getRootElement(), nickChangeHandler)

function getPlayerTOPKills( player )

	assert ( player:getType() == "player", "Error bad argument @player [ Expected at argument 1 got "..tostring( player ).." ]")

	local account = player:getAccount();
	local accountName = account:getName();
	if not account:isGuest() then
		local qh = db:query( "SELECT * FROM TOP WHERE accountn=?",accountName)
		for _, col in pairs( dbPoll( qh, -1 ) ) do
			local actualKills = col["totalk"];
			return actualKills
		end
		return 0
	end
end

function getPlayerTOPDeaths( player )

	assert ( player:getType() == "player", "Error bad argument @player [ Expected at argument 1 got "..tostring( player ).." ]")

	local account = player:getAccount();
	local accountName = account:getName();
	if not account:isGuest() then
		local qH = db:query( "SELECT totald FROM TOP WHERE accountn=?",accountName)
		for _, col in pairs( dbPoll( qH, -1 ) ) do
			local actualDeaths = col["totald"];
			return actualDeaths
		end
		return 0
	end
end

function getAccountTOPKills( accountName )
	local qh = db:query( "SELECT * FROM TOP WHERE accountn=?",accountName)
	for _, col in pairs( dbPoll( qh, -1 ) ) do
		local actualKills = col["totalk"];
		return actualKills
	end
	return 0
end

function getAccountTOPDeaths( accountName )
	local qH = db:query( "SELECT totald FROM TOP WHERE accountn=?",accountName)
	for _, col in pairs( dbPoll( qH, -1 ) ) do
		local actualDeaths = col["totald"];
		return actualDeaths
	end
	return 0
end

--Funcion KDR
function round(number, decimals, method) 
    decimals = decimals or 0 
    local factor = 10 ^ decimals 
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor 
    else return tonumber(("%."..decimals.."f"):format(number)) end 
end 