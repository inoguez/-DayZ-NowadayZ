--[[
 *	*******************************************	*
 * Developed by:	-Rex-						*
 * Last modified:	26/01/2018					*
 * Description:									*
 *	*******************************************	*
 ]]--


function update_join( player )
	database:exec( "UPDATE groupmembers SET membername=?, uactive=? WHERE memberacc=?", player:getName(), getTimes ( ), player:getAccount():getName() )
	-- setElData( false, false, player )
	setGroup ( player, getPlayerGroup( player ) )
	refresh_blips();
end

function update_member_nick( nickname, account )
   	database:exec( "UPDATE groupmembers SET membername=? WHERE memberacc=?", nickname, account )
end

function update_member_datetime( player )
	database:exec( "UPDATE groupmembers SET membername=?, uactive=? WHERE memberacc=?",  player:getName(), getTimes ( ), player:getAccount():getName() )
end

function update_member_rank( player, new_rank )
	dbExec( database, "UPDATE groupmembers SET rang=? WHERE memberacc=?", new_rank, getAccountFromName( player ) )
end

function update_group_name( grupo, newName )

	if tostring( grupo) ~= tostring( newName ) then

		if not isGroupExists ( tostring( newName ) ) then

			local directorio = "logsystem/grupos/";
			local extension  = ".rex";
			local dDirectorio = directorio..grupo..extension;
			local nDirectorio = directorio..newName..extension;

			if( fileExists( nDirectorio ) ) then
				fileDelete( nDirectorio );
			end
			
			if( fileExists( dDirectorio ) ) then
				fileRename( dDirectorio, nDirectorio )
			else
				local file = fileCreate ( nDirectorio )		
				fileClose( file )
			end
			
			database:exec( "UPDATE groupRanks SET grupo=? WHERE grupo=?", newName, grupo )

			database:exec( "UPDATE group_alianzas SET grupo=? WHERE grupo=?", newName, grupo )
			database:exec( "UPDATE group_alianzas SET grupoAliado=? WHERE grupoAliado=?", newName, grupo )
			database:exec( "UPDATE group_alianzas_configs SET grupo=? WHERE grupo=?", newName, grupo )

			database:exec( "UPDATE groupmembers SET name=? WHERE name=?", newName, grupo )
			database:exec( "UPDATE groupsystem SET groupname=? WHERE groupname=?", newName, grupo )
			database:exec( "UPDATE groupinfo SET gpname=? WHERE gpname=?", newName, grupo )
			setTimer( refreshDatas, 250, 1 )
			return true
		else
			return false
		end
		
	end
	return false
end

function update_group_information( group_name, information )
	database:exec( "UPDATE groupinfo SET info=? WHERE gpname=?", information, group_name )
end