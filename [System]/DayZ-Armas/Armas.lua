--// Creador: TheCrazy
--// Fecha: 12/05/2017
--// Proposito: Definiciones y funciones compartidas

Originales = {344, 347, 348, 351, 352, 353, 355, 356, 357, 358, 372}
Armas = {}

Armas = {
	-- // Ejemplo: {'Nombre del arma', ID de su modelo, 'Nombre de su sonido'}

	-- // NOTA: En caso de no tener un nombre de sonido asignado, se usará el
	-- // mismo nombre del arma como sonido, por ejemplo:

	-- // {"AKM", 2379}, al no tener nombre de sonido, usará como sonido 'AKM.mp3'.
	-- // {"AKS-74 Kobra", 2441, "AKS"}, al tener el ya mencionado nombre, usará como sonido 'AKS.mp3'.


	-- // Pistolas
	['Machete'] = {333},
	['Cuchillo'] = {335},
	['Desert Eagle'] = {348, 'Eagle'},
	['G17'] = {1801},
	['M9'] = {1802},
	['M9 SD'] = {2376, 'M4A1SD'},
	['M1911'] = {1804},
	['Walther P99'] = {2054, 'P99'},

	-- // Escopetas
	['AA-12'] = {2422, "AA12"},

	-- // Subfusiles
	['MP5A5'] = {1805},
	['MP5SD6'] = {1806, 'Silenced'},
	['Bizon PP-19 SD'] = {1807, 'Silenced'},
	['Ingram MAC-10'] = {2807, 'Mac10'},
	['P90'] = {2445},

	-- // Fusiles de asalto
	['AR-15'] = {2238},
	['ACR'] = {2589},
	['Scar-H'] = {2560, 'AK-47'},
	['AK-47 Vulcan'] = {2402, 'AK-Vulcan'},
	['AK-74'] = {1870},
	['AK-74 GP-25'] = {1808, 'AK-74'},
	['AKM'] = {2379},
	['AKS'] = {2442, 'AKM'},
	['AKS-74 Kobra'] = {2441, 'AKS'},
	['AKS Gold'] = {2440, 'AKM'},
	['AUG A3'] = {3923, 'AUG'},
	['FAMAS G2'] = {2378, 'FAMAS'},
	['G36'] = {2439},
	['G36A'] = {2436, 'G36'},
	['G36C'] = {2435, 'G36'},
	['G36C SD'] = {2434, 'Silenced'},
	['Lee Enfield'] = {2424, 'LeeEnfield'},
	['M16A2'] = {2374, 'M16'},
	['M4A1'] = {2377},
	['M4A1 CCO'] = {2413, 'M4A1'},
	['M4A1 CCO SD'] = {1869, 'M4A1SD'},
	['M4A3 CCO'] = {2423, 'M4A3'},
	['RPK'] = {1917, 'M4A3'},

	-- // Armas ligeras
	['M240'] = {2052},
	['M249 Saw'] = {2053, 'M249Saw'},
	['MK48'] = {2371},
	['PKM'] = {2372},
	['PKP'] = {2373},

	['AS50'] = {2385},
	['AWP'] = {2386},
	['Ballesta'] = {2634},
	['DMR'] = {2412},
	['PGM Hecate II'] = {2706, 'Hecate'},
	['KSVK'] = {2387},
	['M107'] = {2388},
	['SVD Camo'] = {2393, 'SVD'}
}

-- Obtiene el modelo de un arma
function getWeaponModel(Weapon)
	if Armas[Weapon] then
		return Armas[Weapon][1]
	else
		return false
	end
end
