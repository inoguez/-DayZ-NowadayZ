local font0_Roboto = guiCreateFont("Fuentes/Roboto.ttf", 10)
function centerWindow (center_window)
    local screenW, screenH = guiGetScreenSize()
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (screenW - windowW) /2,(screenH - windowH) /2
    guiSetPosition(center_window, x, y, false)
end
--Funcion KDR
function round(number, decimals, method) 
    decimals = decimals or 0 
    local factor = 10 ^ decimals 
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor 
    else return tonumber(("%."..decimals.."f"):format(number)) end 
end 

TOP = guiCreateWindow(365, 215, 588, 335, "Tabla de Lideres: NowadayZ", false)
        guiWindowSetSizable(TOP, false)
        guiSetProperty(TOP, "CaptionColour", tocolor(173,255,47,255))

        A = guiCreateLabel(317, 26, 127, 18, "Asesinatos: ", false, TOP)
        
        guiSetFont(A, font0_Roboto)
        M = guiCreateLabel(454, 26, 127, 18, "Muertes:  ", false, TOP)
        guiSetFont(M, font0_Roboto)

        TabPanel = guiCreateTabPanel(9, 25, 569, 300, false, TOP)

        TabPlayers = guiCreateTab("TOP Players", TabPanel)

        GridTopPlayers = guiCreateGridList(0, 0, 569, 276, false, TabPlayers)
        IDp = guiGridListAddColumn(GridTopPlayers, "#", 0.04)
        USERp = guiGridListAddColumn(GridTopPlayers, "Usuario", 0.2)
        Ap = guiGridListAddColumn(GridTopPlayers, "Asesinatos", 0.15)
        Mp = guiGridListAddColumn(GridTopPlayers, "Muertes", 0.15)
        KDRp = guiGridListAddColumn(GridTopPlayers, "KDR", 0.15)
        GANGp = guiGridListAddColumn(GridTopPlayers, "Grupo", 0.28)

        TabGrupos = guiCreateTab("TOP Grupos", TabPanel)

        GridTopGrupos = guiCreateGridList(0, 0, 569, 276, false, TabGrupos)
        IDg = guiGridListAddColumn(GridTopGrupos, "#", 0.04)
        GANGg = guiGridListAddColumn(GridTopGrupos, "Grupo", 0.35)
        Ag = guiGridListAddColumn(GridTopGrupos, "Asesinatos", 0.20)
        Mg = guiGridListAddColumn(GridTopGrupos, "Muertes", 0.20)    
        KDRg = guiGridListAddColumn(GridTopGrupos, "KDR", 0.15) 

guiSetVisible( TOP, false )
centerWindow ( TOP )

function openGUI( )
	if guiGetVisible( TOP ) == false then
		guiSetVisible( TOP, true )
		showCursor( true )
		requestTOPList ( )
	else
		guiSetVisible( TOP, false )
		showCursor( false )
	end
end
bindKey("F4", "down", openGUI)

function requestTOPList( )
	guiGridListClear( GridTopPlayers )
	guiGridListClear( GridTopGrupos )
	triggerServerEvent( "requestTOPList", getLocalPlayer(  ) )
	triggerServerEvent( "requestPlayer", getLocalPlayer(  ) )
end

function addList( i1, nick, tk, td, kdr, g  )
		local row = guiGridListAddRow( GridTopPlayers )
		guiGridListSetItemText( GridTopPlayers, row, IDp ,i1,false, false )
		guiGridListSetItemText( GridTopPlayers, row, USERp , nick:gsub("#%x%x%x%x%x%x", ""),false, false )
		guiGridListSetItemText( GridTopPlayers, row, Ap , tk, false, false )
		guiGridListSetItemText( GridTopPlayers, row, Mp , td, false, false )
		guiGridListSetItemText( GridTopPlayers, row, KDRp , round(tonumber(kdr),2), false, false )
		guiGridListSetItemText( GridTopPlayers, row, GANGp , ( g or "N/A" ), false, false )

		guiGridListSetItemColor( GridTopPlayers, row, IDp,  60,179,113, 255 )	
		guiGridListSetItemColor( GridTopPlayers, row, USERp, 60,179,113, 255 )
		guiGridListSetItemColor( GridTopPlayers, row, Ap, 60,179,113, 255 )
		guiGridListSetItemColor( GridTopPlayers, row, Mp, 60,179,113, 255 )
		guiGridListSetItemColor( GridTopPlayers, row, KDRp, 60,179,113, 255 )
		guiGridListSetItemColor( GridTopPlayers, row, GANGp,  60,179,113, 255 )
end
addEvent( "sendTOPList", true )
addEventHandler( "sendTOPList", getLocalPlayer(  ), addList )

function addList2( i2, groupGP, tkGP, tdGP, kdrg )
	local row = guiGridListAddRow( GridTopGrupos )
		guiGridListSetItemText( GridTopGrupos, row, IDg ,i2,false, false )
		guiGridListSetItemText( GridTopGrupos, row, GANGg , groupGP, false, false )
		guiGridListSetItemText( GridTopGrupos, row, Ag , tkGP, false, false )
		guiGridListSetItemText( GridTopGrupos, row, Mg , tdGP, false, false )
		guiGridListSetItemText( GridTopGrupos, row, KDRg , round(tonumber(kdrg),2), false, false )

		guiGridListSetItemColor( GridTopGrupos, row, IDg,  60,179,113, 255 )
		guiGridListSetItemColor( GridTopGrupos, row, GANGg,  60,179,113, 255 )
		guiGridListSetItemColor( GridTopGrupos, row, Ag, 60,179,113, 255 )
		guiGridListSetItemColor( GridTopGrupos, row, Mg, 60,179,113, 255 )
		guiGridListSetItemColor( GridTopGrupos, row, KDRg, 60,179,113, 255 )
end
addEvent( "sendTOPList2", true )
addEventHandler( "sendTOPList2", getLocalPlayer(  ), addList2 )


function labels ( a, b )
	guiSetText( A, "Asesinatos: "..tostring( a ) )
	guiSetText( M, "Muertes: "..tostring( b ) )
end
addEvent( "sendPlayerStat", true )
addEventHandler( "sendPlayerStat", getLocalPlayer(  ), labels )


if fileExists("client.lua") then
    fileDelete("client.lua")
end

