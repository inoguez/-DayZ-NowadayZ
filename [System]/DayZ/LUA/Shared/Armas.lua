--// Creador: TheCrazy
--// Fecha: 27/07/2016
--// Proposito: Funciones y definiciones de las armas

Tablas = {}
Tablas.Armas = {}
Tablas.Armas.Cargador = {}

Armas = {
	--{ID,"Arma", "Municion", Tamaño de cartucho, Daño}

	-- Cuerpo a cuerpo
	{2, "Machete", "Machete", 1, 1000},
	{3, "Hacha", "Hacha", 1, 800},
	{4, "Cuchillo", "Cuchillo", 1, 500},
	{6, "Palanca", "Palanca", 1, 600},

	-- Pistolas
	{24, "Desert Eagle", "Munición (Desert)", 7, 2500},
	{23, "G17", "Munición (G17)", 17, 889},
	{23, "M9", "Munición (M9)", 17, 889},
	{23, "M9 SD", "Munición (M9)", 17, 889},
	{23, "M1911", "Munición (M1911)", 17, 500},
	--Sub Machine Gun
	{29, "MP5A5", "Munición (MP5A5)", 30, 1000},
	{29, "MP5SD6", "Munición (MP5SD6)", 30, 889},
	{29, "Bizon PP-19 SD", "Munición (Bizon)", 30, 1500},
	{29, "P90", "Munición (P90)", 30, 1800},

	-- Escopetas
	{27, "AA-12", "Munición (AA-12)", 20, 3000},
	
	-- Rifles de asalto
	{31, "AR-15", "Munición (AR-15)", 30, 3000},


	{31, "ACR", "Munición (ACR)", 30, 2500},
	{31, "AK-47 Vulcan", "Munición (AK)", 30, 2700},
	{31, "AK-74", "Munición (AK)", 30, 2000},
	{31, "AK-74 GP-25", "Munición (AK)", 30, 2000},
	{31, "AK-107", "Munición (AK)", 30, 2000},
	{31, "AK-107 GL", "Munición (AK)", 30, 2000},
	{31, "AK-107 GL PSO", "Munición (AK)", 30, 2000},
	{31, "AK-107 PSO", "Munición (AK)", 30, 2000},
	{31, "AKM", "Munición (AKM)", 30, 3000},
	{31, "AKS", "Munición (AK)", 30, 2000},
	{31, "AKS-74 Kobra", "Munición (AK)", 30, 2000},
	{31, "AKS Gold", "Munición (AK)", 30, 3000},
	{31, "G36", "Munición (G36)", 30, 2500},
	{31, "G36A", "Munición (G36)", 30, 2500},
	{31, "G36C", "Munición (G36)", 30, 2500},
	{31, "G36C SD", "Munición (G36)", 30, 2500},
	{31, "G36K", "Munición (G36)", 30, 2500},
	{31, "M4A1", "Munición (STANAG)", 30, 2500},
	{31, "M4A1 CCO", "Munición (STANAG)", 30, 2500},
	{31, "M4A1 CCO SD", "Munición (STANAG)", 30, 2000},
	{31, "M4A3 CCO", "Munición (STANAG)", 30, 3000},
	{31, "RPK", "Munición (RPK)", 30, 3000},


	-- Rifles
	{34, "AS50", "Munición (AS50)", 5, 20000},
	{34, "AWP", "Munición (AWP)", 5, 20000},
	{34, "DMR", "Munición (DMR)", 5, 5000},
	{34, "PGM Hecate II", "Munición (Hecate)", 5, 30400},
	{34, "KSVK", "Munición (KSVK)", 5, 34000},
	{34, "M107", "Munición (M107)", 5, 8000},
	{34, "SVD Camo", "Munición (SVD)", 5, 3400},

	-- Light Machine Guns
	{30, "M240", "Munición (M240)", 100, 4500},
	{30, "M249 Saw", "Munición (M249)", 100, 3400},
	{30, "Mk48", "Munición (Mk48)", 100, 3400},
	{30, "PKP", "Munición (PKP)", 100, 3400},
	{30, "PKM", "Munición (PKM)", 100, 3400},
	{30, "RPD", "Munición (RPD)", 100, 3100},
	
	-- Arrojables
	{16, "Granada", "Granada", 1, 34000},
	{17, "Gas lacrimogeno", "Gas lacrimogeno", 1, 50},
	
	-- Otros
	{43, "Binoculares", "Binoculares", 1},
	{46, "Paracaidas", "Paracaidas", 1},
	
}

for k, v in ipairs(Armas) do
	Tablas.Armas[v[2]] = v
	Tablas.Armas.Cargador[v[3]] = tonumber(v[4])
end

function getPedWeapon(Jugador)
	local Slot = getPedWeaponSlot(Jugador)

	if Slot == 3 or Slot == 5 or Slot == 6 then
		Arma = 'currentweapon_1'
	elseif Slot == 1 or Slot == 2 or Slot == 4 then
		Arma = 'currentweapon_2'
	elseif Slot == 8 then
		Arma = 'currentweapon_3'
	else
		Arma = false
	end

	if Arma then
		return Jugador:getData(Arma)
	else
		return false
	end
end

function getWeaponData(Arma)
	if Tablas.Armas[Arma] then
		return Tablas.Armas[Arma]
	else
		return false
	end
end

function getCartridgeSize(Municion)
	if Tablas.Armas.Cargador[Municion] then
		return Tablas.Armas.Cargador[Municion]
	end
end