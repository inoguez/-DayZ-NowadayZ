--#	Variables
local screenW, screenH = guiGetScreenSize()
local dxVisible = false
local weapCount = 0
local estrucCount = 0
local sknsCount = 0
local vehsCount = 0
local alpha = 200

local dxfont0_Roboto = dxCreateFont("Fuentes/WorkSans.ttf", 8)
local dxfont1_Roboto = dxCreateFont("Fuentes/WorkSans.ttf", 13)
local dxfont2_Roboto = dxCreateFont("Fuentes/WorkSans.ttf", 10)


function dxDrawGifImage ( x, y, w, h, path, iStart, iType, effectSpeed )
	local gifElement = createElement ( "dx-gif" )
	if ( gifElement ) then
		setElementData (
			gifElement,
			"gifData",
			{
				x = x,
				y = y,
				w = w,
				h = h,
				imgPath = path,
				startID = iStart,
				imgID = iStart,
				imgType = iType,
				speed = effectSpeed,
				tick = getTickCount ( )
			},
			false
		)
		return gifElement
	else
		return false
	end
end



--#	Tablas
local files = {
	["weapons"] = { -- Los archivos en la carpeta 'weapons'
	--	["nombre del archivo SIN .TXD O .DFF"] = {ID},
	--	EJEMPLO: ["ak47"] = {355},

	["Cuchillo"] = {335},
	["Hacha"] = {334},
	["Machete"] = {333},
	["Palanca"] = {337},

	["Binoculares"] = {367},
	["Parachute"] = {371},


	["Desert"] = {348},
	["G17"] = {1801},
	["M9"] = {1802},
	["M9SD"] = {1803},
	["M1911"] = {1804},

	-- // Escopetas
	["AA12"] = {2422},

	-- // Subfusiles
	["MP5A5"] = {1805},
	["MP5SD6"] = {1806},
	["BizonSD"] = {1807},
	["P90"] = {1809},

	-- // Fusiles de asalto
	["AR-15"] = {2238},
	["ACR"] = {2589},
	["AK47Vulcan"] = {2402},
	["AK74"] = {1870},
	["AK74GP25"] = {1808},
	["AK-107"] = {2054},
	["AK-107GL"] = {2374},
	["AK-107GLPSO"] = {2377},
	["AK-107PSO"] = {2378},
	["AKM"] = {2379},
	["AKS"] = {2442},
	["AKS-74Kobra"] = {2441},
	["AKSGold"] = {2440},
	["G36"] = {2439},
	["G36A"] = {2436},
	["G36C"] = {2435},
	["G36CSD"] = {2434},
	["G36K"] = {2433},
	["M4A1"] = {1830},
	["M4A1CCO"] = {2413},
	["M4A1CCOSD"] = {1869},
	["M4A3CCO"] = {2423},
	["RPK"] = {1917},

	-- // Armas ligeras
	["M240"] = {2052},
	["M249"] = {2053},
	["Mk48"] = {2371},
	["PKM"] = {2372},
	["PKP"] = {2373},
	["RPD"] = {1813},

	["AS50"] = {2385},
	["AWP"] = {1812},
	["DMR"] = {2412},
	["HecateII"] = {2706},
	["KSVK"] = {2387},
	["M107"] = {2388},
	["SVDCamo"] = {2393}
	},
	--
	["skins"] = { -- Los archivos en la carpeta 'skins'
		--	["nombre del archivo SIN .TXD O .DFF"] = {ID},
		--	EJEMPLO: ["staff"] = {217},
	
	},
	--
	["vehicles"] = { -- Los archivos en la carpeta 'veh'
		--	EJEMPLO: ["ak47"] = {355},
		-- EJEMPLO: ["infernus"] = {411},
	},

	["estructuras"] = { -- Los archivos en la carpeta 'veh'
		--	EJEMPLO: ["ak47"] = {355},
		-- EJEMPLO: ["infernus"] = {411},
	--["eelkalol"] = {881},--txd/--dff
	--["eelkalol1"] = {770},--txd/--dff
	--["eelkalol2"] = {779},--txd/--dff
	["KK555"] = {14524},
	["kk111"] = {14523},
	["L130"] = {14522},
	["K133"] = {14521},
	["K132"] = {14520},
	["K26"] = {18094},
	["K33"] = {15027},
	["043"] = {15028},
	["033"] = {14864},
	["object777"] = {2013},
	["K92"] = {2386},
	["object33333333333"] = {2857},
	["object11"] = {1799},
	["object98"] = {2281},
	["tower"] = {2093},
	["blocklong"] = {2099},
	["camonet"] = {2117},
	["camonet2"] = {2100},
	["tent"] = {2102},
	["object"] = {2859},
	["01a7"] = {2525},
	["zonabox3"] = {2704},
	["zonabox6"] = {2705},
	["1"] = {1904},
	["hospital_law"] = {5708},
	["obj1"] = {14792},
	["obj2"] = {2084},
	["obj3"] = {2234},
	["obj4"] = {14835},
	["obj6"] = {4254},
	["obj7"] = {1729},
	["obj10"] = {1790},
	["obj11"] = {2328},
	["obj12"] = {14808},
	["obj13"] = {14831},
	["obj14"] = {2624},
	["obj15"] = {1783},
	["obj16"] = {1931},
	["obj17"] = {2322},
	["obj18"] = {1879},
	["obj19"] = {1900},
	["obj21"] = {2384},
	["obj23"] = {2713},
	["obj24"] = {1809},
	["obj26"] = {2067},
	["obj29"] = {18447},
	["obj30"] = {17469},
	["obj31"] = {17468},
	["obj32"] = {2198},
	["obj35"] = {1867},
	["obj36"] = {1863},
	["obj37"] = {1917},
	["obj38"] = {1926},
	["obj41"] = {1981},
	["obj42"] = {1941},
	["obj43"] = {1989},
	["obj44"] = {1991},
	["obj46"] = {3924},
	["obj47"] = {3112},
	["obj48"] = {3923},
	["obj49"] = {3918},
	["obj50"] = {1912},
	["obj51"] = {2833},

	["198"] = {2073},
	["201"] = {2072},
	["202"] = {2071},
	["207"] = {2070},
	["208"] = {2069},
	["211"] = {2032},
	["219"] = {2030},
	["220"] = {2029},
	["225"] = {2026},
	["234"] = {1961},
	["237"] = {1960},
	["240"] = {1958},
	["243"] = {1770},
	["246"] = {1768},
	["249"] = {1766},
	["252"] = {1764},
	["255"] = {1763},
	["258"] = {1761},
	["264"] = {1757},
	["267"] = {1756},
	["270"] = {1753},
	["276"] = {1713},
	["279"] = {1710},
	["282"] = {1709},
	["288"] = {1706},
	["294"] = {1702},
	["300"] = {16153},
	["303"] = {13608},
	["306"] = {13606},
	["309"] = {13611},
	["312"] = {13610},
	["315"] = {13612},
	["318"] = {13607},
	["321"] = {13609},
	["324"] = {14777},
	["327"] = {1933},
	["333"] = {1936},
	["330"] = {13599},
	["582"] = {1828},
	["585"] = {1839},
	["597"] = {2090}

	},
}

function checkTransfer()
	if ( isTransferBoxActive() == true ) then
		setTimer(checkTransfer, 2000, 1)
	else
		startDownload()
	end
end
addEventHandler("onClientResourceStart", resourceRoot, checkTransfer)


function startDownload()
	for filepath, id in pairs(files["weapons"]) do
		local path = "models/weap/"..filepath
		
		downloadFile(path..".txd")
		weapCount = weapCount + 0.5
		---
		downloadFile(path..".dff")
		weapCount = weapCount + 0.5
		---
		dxVisible = true
	end
	--
	for filepath, id in pairs(files["estructuras"]) do
		local path = "models/estruc/"..filepath
		
		downloadFile("models/estruc/"..filepath..".txd")
		estrucCount = estrucCount + 0.33
		---
		downloadFile("models/estruc/"..filepath..".dff")
		estrucCount = estrucCount + 0.33

		downloadFile("models/estruc/"..filepath..".col")
		estrucCount = estrucCount + 0.33
		---
		dxVisible = true
	end
	
	for filepath, id in pairs(files["skins"]) do
		local path = "models/skins/"..filepath

		downloadFile(path..".txd")
		sknsCount = sknsCount + 0.5
		---
		downloadFile(path..".dff")
		sknsCount = sknsCount + 0.5
		---
		dxVisible = true
	end
	--
	--
	for filepath, id in pairs(files["vehicles"]) do
		local path = "models/veh/"..filepath
		
		downloadFile("models/veh/"..filepath..".txd")
		vehsCount = vehsCount + 0.5
		---
		downloadFile("models/veh/"..filepath..".dff")
		vehsCount = vehsCount + 0.5
		---
		dxVisible = true
	end
	--
	
end

addEventHandler("onClientFileDownloadComplete", root,
function (fileName, success)
	if ( source == resourceRoot ) then
		if ( fileName:find("models/weap/") ) then
			local n = fileName:sub(13, #fileName)
			local s = n:sub(0, #n-4)
			--
			if ( fileName:find(".dff") ) then setModification(fileName, files["weapons"][s][1], "dff")  end
			if ( fileName:find(".txd") ) then setModification(fileName, files["weapons"][s][1], "txd")  end
			weapCount = weapCount - (1/2)
		elseif ( fileName:find("models/estruc/") ) then
			local n = fileName:sub(15, #fileName)
			local s = n:sub(0, #n-4)
			--
			if ( fileName:find(".dff") ) then setModification(fileName, files["estructuras"][s][1], "dff") fileDelete( fileName )  end
			if ( fileName:find(".txd") ) then setModification(fileName, files["estructuras"][s][1], "txd") fileDelete( fileName )  end
			if ( fileName:find(".col") ) then setModification(fileName, files["estructuras"][s][1], "col") fileDelete( fileName )  end
			estrucCount = estrucCount - (1/3)	
		elseif ( fileName:find("models/skins/") ) then
			local n = fileName:sub(14, #fileName)
			local s = n:sub(0, #n-4)
			--engineReplaceModel(engineLoadDFF (fileName, files["skins"][s][1]), files["skins"][s][1])
			if ( fileName:find(".dff") ) then setModification(fileName, files["skins"][s][1], "dff") fileDelete( fileName )  end
			if ( fileName:find(".txd") ) then setModification(fileName, files["skins"][s][1], "txd") fileDelete( fileName )  end
			sknsCount = sknsCount - (1/2)
		elseif ( fileName:find("models/veh/") ) then
			local n = fileName:sub(12, #fileName)
			local s = n:sub(0, #n-4)
			--
			if ( fileName:find(".dff") ) then setModification(fileName, files["vehicles"][s][1], "dff") fileDelete( fileName )  end
			if ( fileName:find(".txd") ) then setModification(fileName, files["vehicles"][s][1], "txd") fileDelete( fileName )  end
			vehsCount = vehsCount - (1/2)
		end
	end
end
)

function setModification(filePath, id, fileType)
	if ( fileType == "txd" ) then
		engineImportTXD(engineLoadTXD(filePath, id), id) -- LINEA 156
	elseif ( fileType == "dff" ) then
		engineReplaceModel(engineLoadDFF (filePath, id), id) -- LINEA 158
	elseif ( fileType == "col" ) then
		engineReplaceCOL(engineLoadCOL (filePath, id), id) -- LINEA 158
	else
		engineImportTXD(engineLoadTXD(filePath, id), id)
		engineReplaceModel(engineLoadDFF (filePath, id), id)
		engineReplaceCOL(engineLoadTXD(filePath, id), id)
	end
end



addEventHandler("onClientRender", root,
function()
	local currentTick = getTickCount ( )
	if ( dxVisible == true ) then
		local w = math.ceil(weapCount)
		local e = math.ceil(estrucCount)
		local s = math.ceil(sknsCount)
		local v = math.ceil(vehsCount)
		local t = math.ceil(w + e + s + v )
		if ( w >= 1 ) or ( e >= 1 ) or ( s >= 1 ) or ( v >= 1 ) then
			dxDrawText("[ADVERTENCIA]\nDescargando Archivos,\nPuede que no vea correctamente algunas Texturas.", 436, 354, 844, 414, tocolor(237, 0, 0, 210), 1.00, dxfont1_Roboto, "center", "center", false, false, false, false, false)
	        dxDrawRectangle(1025, 286, 240, 105, tocolor(0, 0, 0, 210), false)
	  		dxDrawLine(1025, 318, 1265, 318, tocolor(237, 0, 0, 210), 1, false)
	  		dxDrawText("Descargas en segundo plano...".." ["..t.."]", 1037, 293, 1255, 313, tocolor(240, 255, 240, 255), 1.00, dxfont2_Roboto, "center", "top", false, false, false, false, false)
	        dxDrawText("Descargando ("..w..") Armas\nDescargando ("..e..") Estructuras\nDescargando ("..s..") Skins\nDescargando ("..v..") Vehiculos", 1035, 323, 1255, 381, tocolor(255, 255, 255, 255), 1.00, dxfont0_Roboto, "left", "bottom", false, false, false, false, false)

	    for index, gif in ipairs ( getElementsByType ( "dx-gif" ) ) do
			local gifData = getElementData ( gif, "gifData" )
			if ( gifData ) then
				if ( currentTick - gifData.tick >= gifData.speed ) then
					gifData.tick = currentTick
					gifData.imgID = ( gifData.imgID + 1 )
					if ( fileExists ( gifData.imgPath .."".. gifData.imgID ..".".. gifData.imgType ) ) then
						gifData.imgID = gifData.imgID
						setElementData ( gif, "gifData", gifData, false )
					else
						gifData.imgID = gifData.startID
						setElementData ( gif, "gifData", gifData, false )
					end
				end
				dxDrawImage ( gifData.x, gifData.y, gifData.w, gifData.h, gifData.imgPath .."".. gifData.imgID ..".".. gifData.imgType )
			end
		end

		elseif ( w == 0 ) and ( e == 0 ) and ( s == 0 ) and ( v == 0 )  then
			if ( math.ceil(alpha) >= 1 ) then
 				if ( alpha <= 0 ) then
 				 	dxVisible = false 
 				end

 				alpha = alpha - 1
 				
 				
				if isElement( gif ) then
					destroyElement( gif )
				end
				---
				dxDrawLine(473 - 1, 172 - 1, 473 - 1, 219, tocolor(247, 247, 247, alpha), 1, false)
		        dxDrawLine(807, 172 - 1, 473 - 1, 172 - 1, tocolor(247, 247, 247, alpha), 1, false)
		        dxDrawLine(473 - 1, 219, 807, 219, tocolor(247, 247, 247, alpha), 1, false)
		        dxDrawLine(807, 219, 807, 172 - 1, tocolor(247, 247, 247, alpha), 1, false)
		        dxDrawRectangle(473, 172, 334, 47, tocolor(0, 0, 0, alpha), false)
		        dxDrawText("Archivos descargados con exito!", 483, 179, 797, 209, tocolor(155, 244, 138, alpha), 1.00, dxfont2_Roboto, "center", "center", true, true, false, false, false)

			end
		end
	end
end
)

gif = dxDrawGifImage( 1185, 305, 100, 100, "loader/loading", 0, "png", 40 )


for i, v in ipairs(getElementsByType("object")) do
    local model = getElementModel(v)
    engineSetModelLODDistance(model, 300)   -- Set maximum draw distance
end


