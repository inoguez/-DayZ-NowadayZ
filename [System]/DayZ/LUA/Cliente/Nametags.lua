Nametags = {}

local DisMax = 3.5
local Size = 1

function Nametags.Render()
	local X, Y, Z = getElementPosition(localPlayer)
	
	for i, v in ipairs(getElementsByType("player")) do
		if isPlayerNametagShowing(v) then
			v:setNametagShowing(false)
		end

		if v ~= localPlayer and v:getData('Iniciado') then
			local DisX, DisY, DisZ = getElementPosition(v)
			local Distancia = getDistanceBetweenPoints3D(X, Y, Z, DisX, DisY, DisZ)

			if Distancia <= DisMax then
				if getElementData( v, "lying")then return end
				local SX, SY = getScreenFromWorldPosition(DisX, DisY, DisZ + 0.95,  0.06)

				local Nick =  string.gsub(v.name, '#%x%x%x%x%x%x', '' )


				if v:getData('gang') then
					Nick ="|"..v:getData('gang').."|\n"..Nick
				end

				if v:getData('lvl') then
					Nick = Nick.." (Nivel: "..v:getData('lvl')..")"
				end

				if v:getData("Admin") then
					Nick = "|Administrador|\n"..Nick
				end

				if SX and SY then
					--dxDrawText(Nick, SX-1, SY+1.5, SX, SY, tocolor(0, 0, 0, 180), Size, dxfont, 'center', 'top')
					dxDrawText(Nick, SX + 1, SY + 1, SX + 1, SY + 1, tocolor(0, 0, 0, 255), Size, dxfont, 'center', 'top')
					dxDrawText(Nick, SX + 1, SY - 1, SX + 1, SY - 1, tocolor(0, 0, 0, 255), Size, dxfont, 'center', 'top')
					dxDrawText(Nick, SX - 1, SY + 1, SX - 1, SY + 1, tocolor(0, 0, 0, 255), Size, dxfont, 'center', 'top')
					dxDrawText(Nick, SX - 1, SY - 1, SX - 1, SY - 1, tocolor(0, 0, 0, 255), Size, dxfont, 'center', 'top')
					dxDrawText(Nick, SX, SY, SX, SY, colorPrincipal, Size, dxfont, 'center', 'top')
				end
			end
		end
	end

	if isElement(Objetivo) then
		local DisX, DisY, DisZ = getElementPosition(Objetivo)
		local Distancia = getDistanceBetweenPoints3D(X, Y, Z, DisX, DisY, DisZ)

		if Distancia > DisMax then
			if getElementData( Objetivo, "lying") then return end
			local SX, SY = getScreenFromWorldPosition(DisX, DisY, DisZ + 0.95,  0.06)
			local Nick =  string.gsub(Objetivo.name, '#%x%x%x%x%x%x', '')
		
			if Objetivo:getData('gang') then
				Nick ="|"..Objetivo:getData('gang').."|\n"..Nick
			end

			if Objetivo:getData("lvl") then
				Nick = Nick.." (Nivel: "..Objetivo:getData("lvl")..")"
			end

			if Objetivo:getData("Admin") then
				Nick = "|Administrador|\n"..Nick
			end
	
			if SX and SY then
				--dxDrawText (Nick, SX-1, SY+1.5, SX, SY, tocolor(0, 0, 0, 180), 1, dxfont, 'center', 'top')
				dxDrawText(Nick, SX + 1, SY + 1, SX + 1, SY + 1, tocolor(0, 0, 0, 255), Size, dxfont, 'center', 'top')
				dxDrawText(Nick, SX + 1, SY - 1, SX + 1, SY - 1, tocolor(0, 0, 0, 255), Size, dxfont, 'center', 'top')
				dxDrawText(Nick, SX - 1, SY + 1, SX - 1, SY + 1, tocolor(0, 0, 0, 255), Size, dxfont, 'center', 'top')
				dxDrawText(Nick, SX - 1, SY - 1, SX - 1, SY - 1, tocolor(0, 0, 0, 255), Size, dxfont, 'center', 'top')
				dxDrawText(Nick, SX, SY, SX, SY, colorPrincipal, Size, dxfont, 'center', 'top')
			end
		end
	end
end
addEventHandler("onClientRender", root, Nametags.Render)

Objetivo = false
function Nametags.Objetivo(Elemento)
	if isElement(Elemento) and Elemento.type == "player" then
		Objetivo = Elemento
	else
		Objetivo = false
	end
end
addEventHandler("onClientPlayerTarget", getRootElement(), Nametags.Objetivo)

function TeamIcon()
	local x,y,z = getElementPosition (getLocalPlayer())
	local gangname = getElementData(getLocalPlayer(),"gang")
	if gangname == "N/A" then return end	

	if getElementData( getLocalPlayer(  ), "Iniciado" ) then
		for i, player in ipairs(getElementsByType("player")) do
			local px, py, pz = getPedBonePosition( player, 8 )
			local sx, sy = getScreenFromWorldPosition(px, py, pz + 0.95,  0.06)
			local pdistance = getDistanceBetweenPoints3D(x, y, z, px, py, pz)
			if pdistance <= 500 then
				if x and y and px and py and sx and sy then
					--if isLineOfSightClear( px, py, pz, x, y, z, true, false, false, false ) then
						if getElementData(player,"gang") ~= "N/A" then
							if gangname == getElementData(player,"gang") then
								if  player ~= getLocalPlayer() then
									name = removeHex(getPlayerName(player))
									dxDrawText ( name, sx + 1, sy + 1, sx + 1, sy + 1, tocolor(0, 0, 0, 255), Size, dxfont,'center', 'center' )
									dxDrawText ( name, sx, sy, sx, sy, tocolor(124,252,0, 255), Size, dxfont,'center', 'center' )
								end	
							end
						end
					--end
				end
			end
		end
	end
end
addEventHandler("onClientRender", root, TeamIcon)