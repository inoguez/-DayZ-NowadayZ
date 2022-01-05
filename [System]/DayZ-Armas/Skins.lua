function Reemplazar(ID, Archivo)
	engineImportTXD(engineLoadTXD('Armas/'..Archivo..'.txd'), ID)
	engineReplaceModel(engineLoadDFF('Armas/'..Archivo..'.dff'), ID)
end

function load()
	--Desactivar los sonidos originales de las armas
	setWorldSoundEnabled(5, false)
	
	tex = engineLoadTXD ( "Armas/full.txd", 356)
	engineImportTXD ( tex, 347)
	engineImportTXD ( tex, 351)
	engineImportTXD ( tex, 353)
	engineImportTXD ( tex, 355)
	engineImportTXD ( tex, 356)
	engineImportTXD ( tex, 358)
	mod = engineLoadDFF ( "Armas/full.dff", 356)
	engineReplaceModel ( mod, 347)
	engineReplaceModel ( mod, 351)
	engineReplaceModel ( mod, 353)
	engineReplaceModel ( mod, 355)
	engineReplaceModel ( mod, 356)
	engineReplaceModel ( mod, 358)
	
	txd = engineLoadTXD("Armas/Otros/paracx.txd", 3131 ) 
  	engineImportTXD(txd, 3131)
	--------------
	-- Pistolas --
	--------------
	-- Desert
	--[[
	engineImportTXD(engineLoadTXD("Armas/Pistolas/Desert.txd"), 348)
	engineReplaceModel(engineLoadDFF("Armas/Pistolas/Desert.dff"), 348)

	-- Glock 17
	engineImportTXD(engineLoadTXD("Armas/Pistolas/G17.txd"), 1801)
	engineReplaceModel(engineLoadDFF("Armas/Pistolas/G17.dff"), 1801)

	-- M9
	engineImportTXD(engineLoadTXD("Armas/Pistolas/M9.txd"), 1802)
	engineReplaceModel(engineLoadDFF("Armas/Pistolas/M9.dff"), 1802)

	-- M9 Silenced
	engineImportTXD(engineLoadTXD("Armas/Pistolas/M9SD.txd"), 1803)
	engineReplaceModel(engineLoadDFF("Armas/Pistolas/M9SD.dff"), 1803)

	-- M1911
	engineImportTXD(engineLoadTXD("Armas/Pistolas/M1911.txd"), 1804)
	engineReplaceModel(engineLoadDFF("Armas/Pistolas/M1911.dff"), 1804)

	----------------
	-- Subfusiles --
	----------------

	-- MP5A5
	engineImportTXD(engineLoadTXD("Armas/SMG/MP5A5.txd"), 1805)
	engineReplaceModel(engineLoadDFF("Armas/SMG/MP5A5.dff"), 1805)

	-- MP5SD6
	engineImportTXD(engineLoadTXD("Armas/SMG/MP5SD6.txd"), 1806)
	engineReplaceModel(engineLoadDFF("Armas/SMG/MP5SD6.dff"), 1806)

	-- Bizon PP-19 SD
	engineImportTXD(engineLoadTXD("Armas/SMG/BizonSD.txd"), 1807)
	engineReplaceModel(engineLoadDFF("Armas/SMG/BizonSD.dff"), 1807)
	
	engineImportTXD(engineLoadTXD("Armas/Asalto/AK74.txd"), 1870)
	engineReplaceModel(engineLoadDFF("Armas/Asalto/AK74.dff"), 1870)

	Reemplazar(1809, 'SMG/P90')

	-- AK-74 GP-25
	
	engineImportTXD(engineLoadTXD("Armas/Asalto/AK74GP25.txd"), 1808)
	engineReplaceModel(engineLoadDFF("Armas/Asalto/AK74GP25.dff"), 1808)
	
	---------------------
	-- Cuerpo a cuerpo --
	---------------------
	Reemplazar(335, 'Melee/Cuchillo')
	Reemplazar(334, 'Melee/Hacha')
	Reemplazar(333, 'Melee/Machete')
	Reemplazar(337, 'Melee/Palanca')

	---------------
	-- Escopetas --
	---------------
	Reemplazar(2422, 'Escopetas/AA12')

	----------------------
	-- Rifles de asalto --
	----------------------
	Reemplazar(2238, 'Asalto/AR-15')
	Reemplazar(2589, 'Asalto/ACR')
	Reemplazar(2402, 'Asalto/AK47Vulcan')
	Reemplazar(2054, 'Asalto/AK-107')
	Reemplazar(2374, 'Asalto/AK-107GL')
	Reemplazar(2377, 'Asalto/AK-107GLPSO')
	Reemplazar(2378, 'Asalto/AK-107PSO')
	Reemplazar(2379, 'Asalto/AKM')
	Reemplazar(2442, 'Asalto/AKS')
	Reemplazar(2441, 'Asalto/AKS-74Kobra')
	Reemplazar(2440, 'Asalto/AKSGold')
	Reemplazar(2439, 'Asalto/G36')
	Reemplazar(2436, 'Asalto/G36A')
	Reemplazar(2435, 'Asalto/G36C')
	Reemplazar(2434, 'Asalto/G36CSD')
	Reemplazar(2433, 'Asalto/G36K')
	Reemplazar(1830, 'Asalto/M4A1')
	Reemplazar(2413, 'Asalto/M4A1CCO')
	Reemplazar(1869, 'Asalto/M4A1CCOSD')
	Reemplazar(2423, 'Asalto/M4A3CCO')

	------------------------
	-- Light Machine Guns --
	------------------------
	Reemplazar(2052, 'LMG/M240')
	Reemplazar(2053, 'LMG/M249')
	Reemplazar(2371, 'LMG/Mk48')
	Reemplazar(2372, 'LMG/PKM')
	Reemplazar(2373, 'LMG/PKP')
	Reemplazar(1813, 'LMG/RPD')
	
	------------
	-- Rifles --
	------------
	Reemplazar(1812, 'Rifles/AWP')
	Reemplazar(2385, 'Rifles/AS50')
	Reemplazar(2412, 'Rifles/DMR')
	Reemplazar(2706, 'Rifles/HecateII')
	Reemplazar(2387, 'Rifles/KSVK')
	Reemplazar(2388, 'Rifles/M107')
	Reemplazar(2393, 'Rifles/SVDCamo')

	-----------
	-- Otros --
	-----------
	Reemplazar(367, 'Otros/Binoculares')]]
end

addEventHandler("onClientResourceStart",resourceRoot,
function ()
	load()
end)