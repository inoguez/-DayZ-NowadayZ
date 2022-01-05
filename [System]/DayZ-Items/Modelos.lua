MODS = {
	{2684, "Modelos/woodpile.dff", "Modelos/woodpile.txd"},
	{1578, "Modelos/bandage.dff", "Modelos/bandage.txd"},
	{2891, "Modelos/first_aid_kit.dff", "Modelos/first_aid_kit.txd"},
	{2685, "Modelos/wfkit.dff", "Modelos/wfkit.txd"},
	{2682, "Modelos/akmag.dff", "Modelos/akmag.txd"},
	{2976, "Modelos/gps.dff", "Modelos/gps.txd"},
	{1576, "Modelos/heat_pack.dff", "Modelos/heat_pack.txd"},
	{1277, "Modelos/map.dff", "Modelos/map.txd"},
	{1579, "Modelos/morphine.dff", "Modelos/morphine.txd"},
	{2683, "Modelos/stanag.dff", "Modelos/stanag.txd"},
	{2686, "Modelos/g17m9sdmag.dff", "Modelos/g17m9sdmag.txd"},
	{2218, "Modelos/car_wheel.dff", "Modelos/car_wheel.txd"},
	{2414, "Modelos/water_bottle.dff", "Modelos/water_bottle.txd"},
	{2710, "Modelos/watch.dff", "Modelos/watch.txd"},
	{2709, "Modelos/pain_killers.dff", "Modelos/pain_killers.txd"},
	{2969, "Modelos/toolbox.dff", "Modelos/toolbox.txd"},
	{2770, "Modelos/pasta_can.dff", "Modelos/pasta_can.txd"},
	{1650, "Modelos/jerrycan.dff", "Modelos/jerrycan.txd"},
	{328, "Modelos/matches.dff", "Modelos/matches.txd"},
	{1279, "Modelos/tent.dff", "Modelos/tent.txd"},
	{2803, "Modelos/cookedmeat.dff", "Modelos/cookedmeat.txd"},
	{2392, "Modelos/engine.dff", "Modelos/engine.txd"},
	{2393, "Modelos/arrow.dff", "Modelos/arrow.txd"},
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
end

addEventHandler("onClientResourceStart", resourceRoot, function()
	for k, v in ipairs(MODS) do
		importarModelo(v[1], v[2], v[3])
	end
end)
