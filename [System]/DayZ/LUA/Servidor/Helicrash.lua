--// Creador: TheCrazy
--// Fecha: 15/08/2016
--// Proposito: Funcionamiento de los helicrash

Helicrash = {
	{-696.49609375, 918.8681640625, 12.29887676239, 0, 0, 0},
	{1520.3076171875, -18.3369140625, 22.426195144653, 0, 0, 280},
	{2143.2392578125, -87.1015625, 2.5057299137115, 0, 0, 20},
	{2701.330078125, 115.443359375, 45.195281982422, 0, 0, 340},
	{2576.541015625, -647.0810546875, 135.90234375, 0, 0, 40},
	{2428.63671875, -1750.8828125, 17.892728805542, 0, 0, 0},
	{2418.4775390625, -2214.7724609375, 24.20680809021, 0, 0, 10},
	{2676.9736328125, -2534.0517578125, 13.067512512207, 0, 0, 0},
	{2157.9765625, -2262.2607421875, 26.361293792725, 0, 10, 330},
	{1691.0400390625, 721.2919921875, 10.499994277954, 0, 0, 130}
}

Helicrash.Items = {
	"Mk48",
	"M240",
	"PKP",
	"PKM",
	"M4A1 CCO SD",
	"DMR",
	"M249 Saw",
	"G36C SD",
	"AKS Gold"
}

function Helicrash.Crear()
	if isElement(Helicrash.Objeto) then
		destroyElement(Helicrash.Objeto:getData('parent'))
		destroyElement(Helicrash.Objeto)
	end

	local Tabla = Helicrash[math.random(1, #Helicrash)]
	
	Helicrash.Objeto = createObject(1920, Tabla[1], Tabla[2], Tabla[3], Tabla[4], Tabla[5], Tabla[6])

	local Col = createColSphere(Tabla[1], Tabla[2], Tabla[3], 5)
	Col:setData('itemloot', true)
	Col:setData('helicrash', true)
	Col:setData('parent', Helicrash.Objeto)
	Col:setData('MAX_Slots', 0)
	Helicrash.Objeto:setData('parent', Col)

	for i = 1, 2 do
		local Arma = Helicrash.Items[math.random(1, #Helicrash.Items)]
		local Datos = getWeaponData(Arma)

		Col:setData(Arma, 1)
		Col:setData(Datos[3], Datos[4] * math.random(1, 2))
	end

	setTimer(Helicrash.Crear, 900000, 1)
end
addEventHandler('onResourceStart', resourceRoot, Helicrash.Crear)