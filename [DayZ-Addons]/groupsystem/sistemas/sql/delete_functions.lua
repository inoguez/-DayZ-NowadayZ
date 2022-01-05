--[[
 *	*******************************************	*
 * Developed by:	-Rex-						*
 * Last modified:	26/01/2018					*
 * Description:									*
 *	*******************************************	*
 ]]--

function delete_member( account, group )
	database:exec( "DELETE FROM groupmembers WHERE memberacc=? AND name=?", account, group );
end