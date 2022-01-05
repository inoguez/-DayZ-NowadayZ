Armas = {

	-- Pistolas
	{"Machete", 333},
	{"Cuchillo", 335},
	{"Desert Eagle", 348},
	{"G17", 1801},
	{"M9", 1802},
	{"M9 SD", 1803, "M4A1SD"},
	{"M1911", 1804},
	
	-- SMG
	{"MP5A5", 1805},
	{"MP5SD6", 1806, "M4A1SD"},
	{"Bizon PP-19 SD", 1807, "M4A1SD"},
	{"P90", 1809},
	
	{"AR-15", 2238},
	{"ACR", 2589},
	{"AK-47 Vulcan", 2402, "AKVulcan"},
	{"AK-74", 1870},
	{"AK-74 GP-25", 1808, "AK-74"},
	{"AK-107", 2054},
	{"AK-107 GL", 2374, "AK-107"},
	{"AK-107 GL PSO", 2377, "AK-107"},
	{"AK-107 PSO", 2378, "AK-107"},
	{"AKM", 2379},
	{"AKS", 2442, "AKM"},
	{"AKS-74 Kobra", 2441, "AKS"},
	{"AKS Gold", 2440, "AKM"},
	{"G36", 2439},
	{"G36A", 2436, "G36"},
	{"G36C", 2435, "G36"},
	{"G36C SD", 2434, "M4A1SD"},
	{"G36K", 2433, "G36"},
	{"M4A1", 1830},
	{"M4A1 CCO", 2413, "M4A1"},
	{"M4A1 CCO SD", 1869, "M4A1SD"},
	{"M4A3 CCO", 2423, "M4A3"},
	{"RPK", 1917, "M4A3"},
	
	-- Escopetas
	{"AA-12", 2422, "AA12"},

	-- LMG
	{"M240", 2052},
	{"M249 Saw", 2053},
	{"Mk48", 2371},
	{"PKM", 2372},
	{"PKP", 2373},
	{"RPD", 1813},

	{"AS50", 2385},
	{"AWP", 1812},
	{"DMR", 2412},
	{"PGM Hecate II", 2706, "Hecate"},
	{"KSVK", 2387},
	{"M107", 2388},
	{"SVD Camo", 2393, "SVD"}
}

addEventHandler('onClientResourceStart', resourceRoot, function()
	for k, v in ipairs(Armas) do
		local Arma = v[1]

		Armas[Arma] = {}

		if v[3] then
			Armas[Arma].Sonido = v[3]
		else
			Armas[Arma].Sonido = v[1]
		end
	end
end)

function getWeaponModel(WP)
	for k, v in ipairs(Armas) do
		if WP == v[1] then
			return v[2]
		end
	end
end

Primaria = {}
Secundaria = {}
PTrasera = {}
PTrasera2 = {}
sx, sy = guiGetScreenSize()

function Armas.Render()
	for k, v in ipairs(getElementsByType("player")) do
		Armas.Chequear(v)
	end
	
	if getPedWeapon(localPlayer) == 43 or getPedWeapon(localPlayer) == 34 then
		setPlayerHudComponentVisible('crosshair', false)
		
		if getPedWeapon(localPlayer) == 43 and getPedTask(localPlayer, "secondary", 0) == "TASK_SIMPLE_USE_GUN" then
			dxDrawImage(0, 60, sx, sy-120, ':DayZ/Imagenes/Binoculares.png')
			dxDrawRectangle(0, 0, sx, 60, 0xFF000000)
			dxDrawRectangle(0, sy, sx, -60, 0xFF000000)
			toggleControl('fire', false)
			toggleControl('action', false)
		end
	else
		setPlayerHudComponentVisible('crosshair', true)
		toggleControl('fire', true)
		toggleControl('action', true)
	end
end
addEventHandler('onClientRender', root, Armas.Render)

function Armas.Chequear(Jugador)
	local Slot = getPedWeaponSlot(Jugador)

	if Slot == 2 or Slot == 4 then
		if isElement(Primaria[Jugador]) then
			destroyElement(Primaria[Jugador])
		end

		if isElement(PTrasera2[Jugador]) then
			destroyElement(PTrasera2[Jugador])
		end
		
		if not isElement(PTrasera[Jugador]) then
			local WP1 = Jugador:getData('currentweapon_1')
			
			if WP1 and Jugador:getData(WP1) and Jugador:getData(WP1) > 0 then
				local X, Y, Z = getElementPosition(Jugador)
				PTrasera[Jugador] = createObject(getWeaponModel(WP1), X, Y, Z)
				PTrasera[Jugador]:setDoubleSided(true)
				if tonumber(Jugador:getData('MAX_Slots')) == 8 then
					exports.bone_attach:attachElementToBone(PTrasera[Jugador], Jugador, 3,0.19,-0.11,-0.1,0,280,10)
					setObjectScale(PTrasera[Jugador], 0.8)
				else
					exports.bone_attach:attachElementToBone(PTrasera[Jugador], Jugador, 3, 0.23, -0.3,-0.1,0,280,-90)
				end
			else
				if isElement(PTrasera[Jugador]) then
					destroyElement(PTrasera[Jugador])
				end
			end
		end

		if not isElement(Secundaria[Jugador]) then
			local X, Y, Z = getElementPosition(Jugador)
			local WP2 = Jugador:getData('currentweapon_2')
			Secundaria[Jugador] = createObject(getWeaponModel(WP2), X, Y, Z)
			Secundaria[Jugador]:setDoubleSided(true)
			exports.bone_attach:attachElementToBone(Secundaria[Jugador], Jugador,12,0,0,0,180,90,180) 
		end
	elseif Slot == 3 or Slot == 5 or Slot == 6 then

		if isElement(Secundaria[Jugador]) then
			destroyElement(Secundaria[Jugador])
		end

		if isElement(PTrasera[Jugador]) then
			destroyElement(PTrasera[Jugador])
		end

		if not isElement(PTrasera2[Jugador]) then
			local WP2 = Jugador:getData('currentweapon_2')
			
			if WP2 and Jugador:getData(WP2) and Jugador:getData(WP2) > 0 then
				local X, Y, Z = getElementPosition(Jugador)
				PTrasera2[Jugador] = createObject(getWeaponModel(WP2), X, Y, Z)
				PTrasera2[Jugador]:setDoubleSided(true)
				if tonumber(Jugador:getData('MAX_Slots')) == 8 then
					exports.bone_attach:attachElementToBone(PTrasera2[Jugador], Jugador, 3,-0.15,-0.17, 0.10, 11, 90, 10)
					setObjectScale(PTrasera2[Jugador], 0.8)
				else
					exports.bone_attach:attachElementToBone(PTrasera2[Jugador], Jugador, 3, -0.27, -0.30, 0, -7, 280, -90)
				end
			else
				if isElement(PTrasera2[Jugador]) then
					destroyElement(PTrasera2[Jugador])
				end
			end
		end

		if not isElement(Primaria[Jugador]) then
			local X, Y, Z = getElementPosition(Jugador)
			local WP1 = Jugador:getData('currentweapon_1')
			Primaria[Jugador] = createObject(getWeaponModel(WP1), X, Y, Z)
			Primaria[Jugador]:setDoubleSided(true)
			exports.bone_attach:attachElementToBone(Primaria[Jugador], Jugador,12,0,0,0,180,90,180)
		end
		
		if Slot == 6 and getPedTask(Jugador, "secondary", 0) == "TASK_SIMPLE_USE_GUN" and Jugador == localPlayer then
			if getElementAlpha(Primaria[Jugador]) ~= 0 then
				setElementAlpha(Primaria[Jugador], 0)
			end
		else
			if getElementAlpha(Primaria[Jugador]) ~= 255 then
				setElementAlpha(Primaria[Jugador], 255)
			end
		end
	else
		if isElement(Secundaria[Jugador]) then
			destroyElement(Secundaria[Jugador])
		end

		if isElement(Primaria[Jugador]) then
			destroyElement(Primaria[Jugador])
		end
		
		if not isElement(PTrasera[Jugador]) then
			local WP1 = Jugador:getData('currentweapon_1')
			if WP1 and Jugador:getData(WP1) and Jugador:getData(WP1) > 0 then
				local X, Y, Z = getElementPosition(Jugador)
				PTrasera[Jugador] = createObject(getWeaponModel(WP1), X, Y, Z)
				PTrasera[Jugador]:setDoubleSided(true)
				if tonumber(Jugador:getData('MAX_Slots')) == 8 then
					exports.bone_attach:attachElementToBone(PTrasera[Jugador], Jugador, 3,0.19,-0.11,-0.1,0,280,10)
					setObjectScale(PTrasera[Jugador], 0.8)
				else
					exports.bone_attach:attachElementToBone(PTrasera[Jugador], Jugador, 3, 0.23, -0.3,-0.1,0,280,-90)
				end
			else
				if isElement(PTrasera[Jugador]) then
					destroyElement(PTrasera[Jugador])
				end
			end
		end

		if not isElement(PTrasera2[Jugador]) then
		local WP2 = Jugador:getData('currentweapon_2')
			if WP2 and Jugador:getData(WP2) and Jugador:getData(WP2) > 0 then
				local X, Y, Z = getElementPosition(Jugador)
				PTrasera2[Jugador] = createObject(getWeaponModel(WP2), X, Y, Z)
				PTrasera2[Jugador]:setDoubleSided(true)
				if tonumber(Jugador:getData('MAX_Slots')) == 8 then
					exports.bone_attach:attachElementToBone(PTrasera2[Jugador], Jugador, 3,-0.15,-0.17, 0.10, 11, 90, 10)
					setObjectScale(PTrasera2[Jugador], 0.8)
				else
					exports.bone_attach:attachElementToBone(PTrasera2[Jugador], Jugador, 3, -0.27, -0.30, 0, -7, 280, -90)
				end
			else
				if isElement(PTrasera2[Jugador]) then
					destroyElement(PTrasera2[Jugador])
				end
			end
		end

	end
end

function Armas.Disparo()
	local Slot = getPedWeaponSlot(source)
    local mX, mY, mZ = getPedWeaponMuzzlePosition(source)

	Nombre = false

	if Slot == 3 or Slot == 5 or Slot == 6 then
		Nombre = source:getData('currentweapon_1')
	elseif Slot == 2 or Slot == 4 then
		Nombre = source:getData('currentweapon_2')
	end

	if not Nombre then return end

	Sonido = playSound3D('Sonidos/'..Armas[Nombre].Sonido..'.mp3', mX, mY, mZ, false)
	setSoundMaxDistance(Sonido, 75)
end
addEventHandler("onClientPlayerWeaponFire", getRootElement(), Armas.Disparo)

function Armas.Quitar()
	if isElement(Primaria[source]) then
		destroyElement(Primaria[source])
	end

    if isElement(Secundaria[source]) then
		destroyElement(Secundaria[source])
	end

	if isElement(PTrasera[source]) then
		destroyElement(PTrasera[source])
	end

	if isElement(PTrasera2[source]) then
		destroyElement(PTrasera2[source])
	end
end
addEvent('Armas:Quitar', true)
addEventHandler('Armas:Quitar', getRootElement(), Armas.Quitar)

addEventHandler('onClientPlayerQuit', getRootElement(), Armas.Quitar)