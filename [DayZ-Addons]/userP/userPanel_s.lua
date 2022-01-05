
function accname(localPlayer)
	local account = getPlayerAccount(localPlayer) -- get account element from player element 
    local accname = getAccountName(account) -- get account name from account element 
	triggerClientEvent( localPlayer, "accountName", localPlayer, accname)
end
addEvent( "accname", true )
addEventHandler( "accname", getRootElement(), accname)


function ChangePlayerPassword(player, oldpass, newpass)
	--get the account the player is currently logged into
	local account = getPlayerAccount(player)
	if (account) then
		-- check chat the old password is correct
		local password_check = getAccount(getAccountName(account), oldpass)
		if (password_check) then
			-- check the length of the new password
			if (string.len(newpass)>=5) then
				--print(1)
				setAccountPassword(account,newpass)
				outputChatBox("Tu contraseña actualizada: ".. "de : ".. oldpass .. " a ".. newpass, player)
			else
				outputChatBox("Tu contraseña debe tener por lo menos 5 caracteres.", player)
			end
		else
			--print(2)
			outputChatBox("Contraseña actual invalida.", player)
		end
	end
end

addEvent( "accpass", true )
addEventHandler( "accpass", getRootElement(), ChangePlayerPassword)