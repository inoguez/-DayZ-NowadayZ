--// Proposito: Reemplazar los modelos para el cliente

Modelos = {
	{9131, 'Cartel'},
	{14471, 'Cuerpo'},
	{14476, 'Cuerpo1'},
	{2411, 'wirefence'},
}

Modelos.Vehiculos = {
	2290,
	16356,
	17925,
	16338,
	16339,
	16355,
	3922,
	3921,
	14603,
	14814,
	3919,
	16350,
	2617,
	2894,
	2114,
	2274,
	2740,
	2707,
	2572,
	2571,
	2882,
	2825,
	2357,
	2289,
	2288,
	2287,
	2286,
	2285,
	2284,
	2283,
	2282,
	2281,
	2280,
	2279,
	2278,
	2277,
	2276,
	2275
}

MODS = {
	{1, "Skins/Masculino/guillemasculino.dff", "Skins/Masculino/guillemasculino.txd"},
	{2, "Skins/Masculino/bandidomasculino.dff", "Skins/Masculino/bandidomasculino.txd"},
	{16, "Skins/Masculino/militarmasculino.dff", "Skins/Masculino/militarmasculino.txd"},
	{37, "Skins/Masculino/swat.dff", "Skins/Masculino/swat.txd"},
	{46, "Skins/Masculino/survivor.dff", "Skins/Masculino/survivor.txd"},

	{192, "Skins/Femenino/supervivientefemenino.dff", "Skins/Femenino/supervivientefemenino.txd"},
	{9, "Skins/Femenino/guillefemenino.dff", "Skins/Femenino/guillefemenino.txd"},
	{11, "Skins/Femenino/bandidofemenino.dff", "Skins/Femenino/bandidofemenino.txd"},
	{12, "Skins/Femenino/militarfemenino.dff", "Skins/Femenino/militarfemenino.txd"},
	
	{2573, "Objetos/luz.dff"},
	
	{1517, "Objetos/Chalecos/Tactico.dff", "Objetos/Chalecos/Tactico.txd"},

	{1518, "Objetos/Cascos/Militar.dff", "Objetos/Cascos/Militar.txd"},
	
	
	{1510, "Objetos/mine.dff", "Objetos/mine.txd"},
	{1421, "Objetos/caja.dff", "Objetos/caja.txd"},
	
	
	{1248, "Mochilas/Alice.dff", "Mochilas/Alice.txd"},
	{2401, "Mochilas/Asalto.dff", "Mochilas/Asalto.txd"},
	{1252, "Mochilas/Coyote.dff", "Mochilas/Coyote.txd"},
	{1547, "Mochilas/NowadayZ.dff", "Mochilas/NowadayZ.txd"},
	{1575, "Mochilas/Czech.dff", "Mochilas/Czech.txd"},
	{2399, "Mochilas/Campamento.dff", "Mochilas/Campamento.txd"},
	{2408, "Mochilas/Armada.dff", "Mochilas/Armada.txd"},
	{2903, "Objetos/AirDrop.dff", "Objetos/AirDrop.txd"},
	{2919, "Objetos/Drop1.dff", "Objetos/Drop1.txd","Objetos/Drop1.col"},
	{1919, "Objetos/1.dff", "Objetos/1.txd", "Objetos/1.col"},
	{1920, "Objetos/2.dff", "Objetos/2.txd", "Objetos/2.col"},
	{1921, "Objetos/3.dff", "Objetos/3.txd", "Objetos/3.col"},
	{1922, "Objetos/4.dff", "Objetos/4.txd", "Objetos/4.col"},
	{2403, "Objetos/Tienda.dff", "Objetos/Tienda.txd", "Objetos/Tienda.col"},
	{1515, "Objetos/Crate.dff", "Objetos/Crate.txd", "Objetos/Crate.col"},
	{2263, "Objetos/TentFull.dff", "Objetos/TentFull.txd", "Objetos/TentFull.col"},
	{14560, "Objetos/base.dff", "Objetos/base.txd", "Objetos/base.col"},
	{14546, "Objetos/puertasub.dff", "Objetos/puertasub.txd", "Objetos/puertasub.col"},
}

function importarModelo(ID, Modelo, Textura, Colision)
	if Textura then
		engineImportTXD(engineLoadTXD (Textura), ID)
	end

	if Modelo then
		engineReplaceModel(engineLoadDFF(Modelo, ID), ID)
	end

	if Colision then
		engineReplaceCOL(engineLoadCOL(Colision), ID)
	end

	engineSetModelLODDistance(ID, 200)
end

addEventHandler("onClientResourceStart", resourceRoot, function()
	for k, v in ipairs(MODS) do
		importarModelo(v[1], v[2], v[3], v[4])
	end
	
	for k, v in ipairs(Modelos) do
		importarModelo(v[1], 'Objetos/'..v[2]..'.dff', 'Objetos/'..v[2]..'.txd', 'Objetos/'..v[2]..'.col')
	end

	for k, v in ipairs(Modelos.Vehiculos) do
		importarModelo(v, 'Objetos/Vehiculos/'..k..'.dff', 'Objetos/Vehiculos/'..k..'.txd', 'Objetos/Vehiculos/'..k..'.col')
	end
end)
