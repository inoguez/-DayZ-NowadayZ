DayZ = {}
Mochila = {}
Datos = {}

itemsPacks = {
    {"Cabello", 1, 0, 32 },
    {"Camisa", 0, 0, 67 },
    {"Pantalones", 2, 0, 44 },
    {"Calzado", 3, 0, 37 },
}

InfoItems = {

-- Escopetas--
			{"AA-12", 3, "Escopeta de Combate", 3000,"Munición (AA-12)"},

			-- Rifles de asalto --
			{"AR-15", 3, "Rifle de Asalto", 3000,"Munición (AR-15)"},
			{"ACR", 3, "Rifle de Asalto", 2500,"Munición (ACR)"},
			{"AK-74", 3, "Fusil de Asalto Soviético", 2000,"Munición (AK)"},
			{"AK-74 GP-25", 3, "Fusil de Asalto Soviético", 2000,"Munición (AK)"},
			{"AK-47 Vulcan", 3, "Fusil de Asalto Soviético", 2700,"Munición (AK)"},
			{"AK-107", 3, "Fusil de Asalto Soviético", 2000,"Munición (AK)"},
			{"AK-107 GL", 3, "Fusil de Asalto Soviético", 2000,"Munición (AK)"},
			{"AK-107 GL PSO", 3, "Fusil de Asalto Soviético", 2000,"Munición (AK)"},
			{"AK-107 PSO", 3, "Fusil de Asalto Soviético", 2000,"Munición (AK)"},
			{"AKM", 3, "Fusil de Asalto Soviético", 3000,"Munición (AK)"},
			{"AKS", 3, "Fusil de Asalto Soviético", 2000,"Munición (AK)"},
			{"AKS-74 Kobra", 3, "Fusil de Asalto Soviético", 2000,"Munición (AK)"},
			{"AKS Gold", 3, "Fusil de Asalto Soviético", 3000,"Munición (AK)"},
			{"G36", 3, "Fusil de Asalto Aleman", 2500,"Munición (G36)"},
			{"G36A", 3, "Fusil de Asalto Aleman", 2500,"Munición (G36)"},
			{"G36C", 3, "Fusil de Asalto Aleman", 2500,"Munición (G36)"},
			{"G36C SD", 3, "Fusil de Asalto Aleman", 2500,"Munición (G36)"},
			{"G36K", 3, "Fusil de Asalto Aleman", 2500,"Munición (G36)"},
			{"M4A1", 3, "Fusil de Asalto Americano", 2500,"Munición (STANAG)"},
			{"M4A1 CCO", 3, "Fusil de Asalto Americano", 2500,"Munición (STANAG)"},
			{"M4A1 CCO SD", 3, "Fusil de Asalto Americano (Silenciado)", 2000,"Munición (STANAG)"},
			{"M4A3 CCO", 3, "Fusil de Asalto Americano", 3000,"Munición (STANAG)"},
			{"RPK", 3, "Fusil de Asalto Soviético", 3000,"Munición (RPK)"},

			-- Rifles --
			{"AS50", 3, "Fusil de Asalto Soviético", 20000,"Munición (AS50)"},
			{"AWP", 3, "Fusil de Asalto Soviético", 20000,"Munición (AWP)"},
			{"DMR", 3, "Fusil de Asalto Soviético", 5000,"Munición (DMR)"},
			{"PGM Hecate II", 3, "Fusil de Asalto Soviético", 30400,"Munición (Hecate)"},
			{"KSVK", 3, "Fusil de Asalto Soviético", 34000,"Munición (KSVK)"},
			{"M107", 3, "Fusil de Asalto Soviético", 8000,"Munición (M107)"},
			{"SVD Camo", 3, "Fusil de Asalto Soviético", 3400,"Munición (SVD)"},

			-- Light Machine Guns --
			{"M240", 4, "Ametralladora ligera Americana", 4500,"Munición (M240)"},
			{"M249 Saw", 4, "Ametralladora ligera Belga", 3400,"Munición (M249)"},
			{"Mk48", 4, "Ametralladora ligera Belga", 3400,"Munición (Mk48)"},
			{"PKM", 4, "Ametralladora ligera Soviética", 3400,"Munición (PKM)"},
			{"PKP", 4, "Ametralladora ligera Rusa", 3400,"Munición (PKP)"},
			{"RPD", 3, "Ametralladora ligera Soviética", 3100,"Munición (RPD)"},

			{"Cuchillo", 1, "Arma blanca", 500},
			{"Hacha", 2, "Arma blanca", 800},
			{"Machete", 2, "Arma blanca", 1000},
			{"Palanca", 2, "Arma blanca", 600},

			-- Pistolas
			{"Desert Eagle", 2, "Pistola semiautomática Americana", 2500, "Munición (Desert)"},
			{"G17", 2, "Pistola semiautomática Australiana", 889, "Munición (G17)"},
			{"M9", 2, "Pistola semiautomática Italiana", 889, "Munición (M9)"},
			{"M9 SD", 2, "Pistola semiautomática Italiana (Silenciado)", 889, "Munición (M9)"},
			{"M1911", 2, "Pistola semiautomática Americana", 500, "Munición (M1911)"},

			-- SMG
			{"MP5A5", 2, "Sub-Fusil automatico Aleman", 3100, "Munición (MP5A5)"},
			{"MP5SD6", 2, "Sub-Fusil automatico Aleman (Silenciado)", 3100, "Munición (MP5SD6)"},
			{"Bizon PP-19 SD", 2, "Sub-Fusil automatico Ruso (Silenciado)", 3100, "Munición (Bizon)"},
			{"P90", 2, "Sub-Fusil automatico Belga", 3100, "Munición (P90)"},

			{"Paracaidas", 1, "Frena caidas", 0,"Sin Munición" },
			{"Gas lacrimogeno", 1, "Arma quimica", 50,"Sin Munición"},
			{"Granada", 1, "Proyectil explsivo", 34000,"Sin Munición"},
			{"Binoculares", 1, "Instrumento optico", 0,"Sin Munición"},

			{"Botella de agua",1,"Recipiente con agua",0,"Sin Munición"},
			{"Pasta enlatada", 1,"Recipiente con pasta",0,"Sin Munición"},
			{"Frijoles enlatados", 1,"Recipiente con frijoles",0,"Sin Munición"},
			{"Carne cocida", 1,"Recipiente con Carne",0,"Sin Munición"},

			{"Madera", 2, "Pila de Madera (Fogata)",0,"Sin Munición"},
			{"Vendaje", 1, "Cura el sangrado",0,"Sin Munición"},
			{"Bengala", 1, "Artefacto luminoso",0,"Sin Munición"},
			{"Bidón vacio",2, "Recipiente para gasolina (Rellenable)",0,"Sin Munición"},
			{"Bidón con gasolina",2, "Recipiente con gasolina",0,"Sin Munición"},
			{"Botiquin",2, "Te da 12000 de vida",0,"Sin Munición"},
			{"Bolsa termica",1, "Mantiene tu temperatura",0,"Sin Munición"},
			{"Analgésicos",1, "Calmante para el dolor",0,"Sin Munición"},
			{"Morfina",1, "Droga (Hueso roto)",0,"Sin Munición"},
			{"Bolsa de sangre",1, "Sangre para administrar",0,"Sin Munición"},
			{"Valla de alambre", 2, "Objeto Colocable",0,"Sin Munición"},
			{"Carne cruda", 1, "Carne en mal estado",0,"Sin Munición"},
			{"Botella vacia",1, "Recipiente (Rellenable)",0,"Sin Munición"},
			
			-- Vehiculos
			{"Neumatico", 2, "Neumatico (Vehiculo)",0,"Sin Munición"},
			{"Motor", 5, "Motor (Vehiculo)",0,"Sin Munición"},
			
			-- Tiendas
			{"Tienda", 3, "Tienda de campaña",0,"Sin Munición"},

			-- Mochilas
			{"Alice (Mochila)", 1, "Mochila (16 Espacios)",0,"Sin Munición"},
			{"Asalto (Mochila)", 1, "Mochila (12 Espacios)",0,"Sin Munición"},
			{"Coyote (Mochila)", 1, "Mochila (60 Espacios)",0,"Sin Munición"},
			{"Czech (Mochila)", 1, "Mochila (36 Espacios)",0,"Sin Munición"},
			{"Campamento (Mochila)", 1, "Mochila (20 Espacios)",0,"Sin Munición"},
			{"Armada (Mochila)", 1, "Mochila (30 Espacios)",0,"Sin Munición"},
			
			-- Proteccion
	        {"Casco militar",2,"(Proteccion contra Headshot)",0,"Sin Munición"},
			{"Chaleco militar",3, "(Protege el 15% del daño)",0,"Sin Munición"},

			--Trampas
			{"Mina explosiva",2, "Mina (Colision)",0,"Sin Munición"},
			{"Trampa de oso",3, "Trampa (Colision)",0,"Sin Munición"},

			{"Lentes de visión nocturna", 1, "Permite ver en la noche ('N')",0,"Sin Munición"},
			{"Lentes infrarrojos",1, "Permite detectar calor ('I')",0,"Sin Munición"},
			{"Mapa",1, "Muestra tu Ubicacion (F12)",0,"Sin Munición"},
			{"Caja de cerillas",1, "Iniciador de fogata (necesita Pila de Madera)",0,"Sin Munición"},
			{"Reloj",1, "Marca la hora real",0,"Sin Munición"},
			{"GPS", 1, "Localizacion mediante satélite",0,"Sin Munición"},
			{"Caja de herramientas",1, "Contenedor de Herrameintas (Vehiculo)",0,"Sin Munición"},
}


Skins = {
	{'Carl Johnson', 0},
	{'Superviviente masculino', 46},
	{'Superviviente femenino', 192},
	{'Camuflaje masculino', 1},
	{'Camuflaje femenino', 9},
	{'Bandido', 2},
	{'Bandida', 11},
	{'Militar masculino', 16},
	{'Militar femenino', 12},
	{'S.W.A.T.', 37}
}

Mochilas = {
	-- Nombre, Espacios, Modelo, x, y, z, rx, ry, rz(Bone Attach)
	{"Asalto (Mochila)", 12, 2401, 0, -0.225, 0.05, 90, 0, 0},
	{"Alice (Mochila)", 16, 1248, 0, -0.225, 0.05, 90, 0, 0},
	{"Campamento (Mochila)", 20, 2399, 0, -0.190, 0.05, 90, 0, 0},
	{"Armada (Mochila)", 30, 2408, 0, -0.225, 0.05, 90, 0, 0},
	{"Czech (Mochila)", 36, 1575, 0, -0.225, 0.05, 90, 0, 0},
	{"Coyote (Mochila)", 60, 1252, 0.050, -0.225, 0.05, 90, 0, 0},
	{"NowadayZ (Mochila)", 150, 1547, 0, -0.225, 0.05, 90, 0, 0 },
}

Tiendas = {
	-- Modelo, Espacio
	["Tienda"] = {2403, 100},
}

-- Tabla de posiciones donde los jugadores pueden aparecer
DayZ.Posiciones = {
	{902.3125, -1492.1103515625, 13.538821220398},
	{966.1748046875, -2150.470703125, 13.09375},
	{512.8349609375, -1898.9736328125, 1.3703856468201},
	{21.7275390625, -1126.27734375, 1.8762073516846},
	{-219.787109375, -795.671875, 2.9512844085693},
	{-371.0751953125, -394.6357421875, 7.6121063232422},
	{-326.55078125, -466.794921875, 1.9922351837158},
	{-374.4443359375, 291.7421875, 2.0757875442505},
	{-211.5439453125, 502.62890625, 2.3015012741089},
	{-722.3408203125, 692.6171875, 8.1016044616699},
	{-720.08984375, 890.5712890625, 12.865586280823},
	{-967.7109375, 1077.095703125, 25.033414840698},
	{-1278.0537109375, 1650.943359375, 1.5826568603516},
	{-1949.2509765625, 2192.650390625, 2.7079911231995},
	{-2811.9921875, 1313.4111328125, 7.1015625},
	{-2946.7001953125, 1199.36328125, 2.2172622680664},
	{-2976.6044921875, 502.0849609375, 2.4296875},
	{-2922.3974609375, -7.40234375, 1.3853785991669},
	{-2863.2470703125, -421.8037109375, 11.394373893738},
	{-2537.658203125, -326.470703125, 37.873321533203},
	{-1737.8984375, -723.3603515625, 18.194038391113},
	{-1198.798828125, -2569.8955078125, 3.6294479370117},
	{-1356.197265625, -2961.5361328125, 1.247499704361},
	{-1865.197265625, -2764.0712890625, 2.4442844390869},
	{1269.791015625, -2650.888671875, 1.9811255931854},
	{2784.7919921875, -2493.3515625, 13.653935432434},
	{833.4658203125, 2912.7666015625, 2.6094741821289},
	{-894.361328125, 2682.052734375, 41.755664825439},
	{-894.73046875, 2680.48046875, 41.946971893311}
}

function DayZ.ElementoCercano(Elemento, X, Y, Z, Rango)
	if isElement(Elemento) then
		return getDistanceBetweenPoints3D(X, Y, Z, getElementPosition(Elemento)) <= Rango
	end
	return false
end

-- Datos unicos de jugadores
Datos.Jugador = {
	'alivetime',
	'banditskilled',
	'bleeding',
	'blood',
	'brokenbone',
	'cold',
	'food',
	'headshots',
	'humanity',
	'murders',
	'pain',
	'temperature',
	'thirst',
	'zombieskilled'
}

-- Lista de todos los items disponibles en el servidor
LItems = {
	"AA-12",


	"AR-15",
	"ACR",
	"AK-47 Vulcan",
	"AK-74",
	"AK-74 GP-25",
	"AK-107",
	"AK-107 GL",
	"AK-107 GL PSO",
	"AK-107 PSO",
	"AKM",
	"AKS",
	"AKS-74 Kobra",
	"AKS Gold",
	"G36",
	"G36A",
	"G36C",
	"G36C SD",
	"G36K",
	"M4A1",
	"M4A1 CCO",
	"M4A1 CCO SD",
	"M4A3 CCO",
	"RPK",

	"AS50",
	"AWP",
	"DMR",
	"PGM Hecate II",
	"KSVK",
	"M107",
	"SVD Camo",

	"M240",
	"M249 Saw",
	"Mk48",
	"PKM",
	"PKP",
	"RPD",

	"Cuchillo",
	"Hacha",
	"Machete",
	"Palanca",

	"G17",
	"M9",
	"M9 SD",
	"M1911",
	"Desert Eagle",

	"MP5A5",
	"MP5SD6",
	"Bizon PP-19 SD",
	"P90",

	"Paracaidas",
	"Gas lacrimogeno",
	"Granada",
	"Binoculares",

	"Munición (G17)",
	"Munición (M9)",
	"Munición (M1911)",
	"Munición (MP5A5)",
	"Munición (MP5SD6)",
	"Munición (Bizon)",
	"Munición (P90)",
	"Munición (Desert)",

	"Munición (AA-12)",

	"Munición (AR-15)",
	"Munición (ACR)",
	"Munición (AK)",
	"Munición (RPK)",
	"Munición (AKM)",
	"Munición (G36)",
	"Munición (STANAG)",
	
	"Munición (AS50)",
	"Munición (AWP)",
	"Munición (DMR)",
	"Munición (Hecate)",
	"Munición (KSVK)",
	"Munición (M107)",
	"Munición (SVD)",

	"Munición (M240)",
	"Munición (M249)",
	"Munición (Mk48)",
	"Munición (PKM)",
	"Munición (RPD)",

	"Botella de agua",
	"Pasta enlatada",
	"Frijoles enlatados",
	"Carne cocida",

	"Madera",
	"Vendaje",
	"Bengala",
	"Bidón vacio",
	"Bidón con gasolina",
	"Botiquin",
	"Bolsa termica",
	"Analgésicos",
	"Morfina",
	"Bolsa de sangre",
	"Valla de alambre",
	"Carne cruda",
	"Botella vacia",
	"Neumatico",
	"Motor",

	"Tienda",

	"Casco militar",
	"Chaleco militar",
	"Mina explosiva",
	"Trampa de oso",

	"Alice (Mochila)",
	"Asalto (Mochila)",
	"Coyote (Mochila)",
	"Czech (Mochila)",
	"Armada (Mochila)",
	"Campamento (Mochila)",
	"NowadayZ (Mochila)",

	"Lentes de visión nocturna",
	"Lentes infrarrojos",
	"Mapa",
	"Caja de cerillas",
	"Reloj",
	"GPS",
	"Caja de herramientas"
}

gameplayVariables = {}

	gameplayVariables["zombieblood"] = 5000
	gameplayVariables["foodrestore"] = math.random(50,100)
	gameplayVariables["thirstrestore"] = math.random(50,100)
	gameplayVariables["loseHunger"] = -1.5
	gameplayVariables["loseThirst"] = -1.5
	gameplayVariables["playerzombies"] = 3
	gameplayVariables["amountzombies"] = 6
	gameplayVariables["temperaturewater"] = -0.1
	gameplayVariables["temperaturesprint"] = 0.01
	gameplayVariables["sprintthirst"] = -0.2
	gameplayVariables["ping"] = 300

-- HELI CRASH SIDES
gameplayVariables["helicrashsides"] = 
{
{-1360.0478515625,-1070.7314453125,160.4069519043},
{-421.4619140625,-1284.4345703125,33.740924835205},
{-2357.654296875,-1634.3623046875,483.703125},
{979.0849609375,160.59375,28.935249328613},
{-2057.2294921875,2781.73828125,163.12780761719},
{826.90234375,2803.6259765625,74.863929748535},
{2577.7060546875,-650.541015625,136.37449645996},
}

Creditos ='Dueño:~Hades~' 

