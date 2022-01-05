
--///////////////////////////////////////////////////////////////////////////////
tableShaders = {}
tableDistance = {}

settingNames = {

["Shaders"]= {

	{"EfectosReal", false},
	{"AguaReal", false},
	{"CieloReal", false},
	{"TextGlobal", true},
	{"ReflejoVehiculos", false},
	{"Blur", false},
},

["Distance"]= {
	
	{"EfectosReal", false},
	{"AguaReal", false},
}
	

}

local localPlayer = getLocalPlayer()
--                       MAIN WINDOW
function centerWindow (center_window)
    local screenW, screenH = guiGetScreenSize()
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (screenW - windowW) /2,(screenH - windowH) /2
    return guiSetPosition(center_window, x, y, false)
end
UserPWindow = guiCreateWindow(457, 146, 378, 453, "[F1] Panel de Usuario by Hades", false)
guiWindowSetSizable(UserPWindow, false)
centerWindow(UserPWindow)
guiSetVisible( UserPWindow, false )

function toggleUserPanel(key, keyState)
	if keyState == "down" then
	guiSetVisible(UserPWindow, not guiGetVisible(UserPWindow))
		showCursor(not isCursorShowing())
		if guiGetVisible(UserPWindow) then
			guiSetVisible( UserPWindow, true )
				if not getElementData(localPlayer, "MostrarHUD") then
					guiCheckBoxSetSelected( CBHUD, true )
			        if not getElementData(localPlayer, "OcultarMonitor") then
						guiCheckBoxSetSelected( CBMonitor, true )
					end
					if not getElementData(localPlayer, "OcultarGPS") then
						guiCheckBoxSetSelected( CBGPS, true )
					end
					if not getElementData(localPlayer, "OcultarIconos") then
						guiCheckBoxSetSelected( CBIconos, true )
					end
					if not getElementData(localPlayer, "OcultarArmaActual") then
						guiCheckBoxSetSelected( CBArmaActual, true ) 
					end
					if not getElementData(localPlayer, "OcultarChat") then
						guiCheckBoxSetSelected( CBChat, true ) 
						showChat(true)
					end
					if not getElementData(localPlayer, "OcultarFPSPING") then
						guiCheckBoxSetSelected( CBFPSPING, true ) 
					end
				end
		else

			guiSetVisible( UserPWindow, false )

		end
	end
end




function loadSett()
	if not fileExists( "userSettings.xml" ) then
		xmlsave = xmlCreateFile("userSettings.xml","Settings")	 -- Create the xml file	
		if not xmlsave then print("No se creo el xml") return end
		xmlShadersBranch = xmlCreateChild ( xmlsave, "Shaders" ) -- Create the hud sub-node under the root node
		xmlDistanceBranch = xmlCreateChild ( xmlsave, "Distance" )-- Create the binds sub-node under the root node

		guiCheckBoxSetSelected( tableShaders[3], true ) 
		guiCheckBoxSetSelected( tableShaders[4], true ) 

		switchDynamicSky(true)
		switchTerreno(true)

		for i,v in ipairs(settingNames["Shaders"]) do
			if ( guiCheckBoxGetSelected(tableShaders[i]) ) then
				--saveSettings("Shaders",v[1], true)
				xmlNodeSetValue(xmlCreateChild(xmlShadersBranch, tostring(v[1])), tostring(true))
		    else
				--saveSettings("Shaders",v[1], false)
				xmlNodeSetValue(xmlCreateChild(xmlShadersBranch, tostring(v[1])), tostring(false))
		    end
		end
		xmlSaveFile(xmlsave)
		xmlUnloadFile(xmlsave)
	else
		openSettings("Shaders")
		for i,v in ipairs(nodesOpen) do
			--print(tostring(v))
			guiCheckBoxSetSelected( tableShaders[i], stringToBool(v)) 	    
		end
		for i,v in ipairs(tableShaders) do
			--outputDebugString("1")
			if ( guiCheckBoxGetSelected(tableShaders[i]) ) then
				if i == 1 then switchEfectosR(true) end
				if i == 2 then switchWater(true) end
				if i == 3 then switchDynamicSky(true) end
				if i == 4 then switchTerreno(true) end
				if i == 5 then switchVeh(true) end
				--if i == 6 then switchEfectosR(true) end
		    end
		end
	end
end
addEventHandler( "onClientResourceStart", getRootElement(), loadSett)

function saveSett()
	--print(1)
	for i,v in ipairs(settingNames["Shaders"]) do
		if ( guiCheckBoxGetSelected(tableShaders[i]) ) then
			--print(1)
			saveSettings("Shaders",v[1], true)
	    else
	    	--print(2)
			saveSettings("Shaders",v[1], false)
	    end
	end
	for i,v in ipairs(settingNames["Distance"]) do
		if ( guiCheckBoxGetSelected(tableShaders[i]) ) then
			saveSettings("Distance",v[1], true)
	    else
			saveSettings("Distance",v[1], false)
	    end
	end

end

addEventHandler( "onClientResourceStop", getRootElement(), saveSett )
--addCommandHandler( "save", saveSett )



function saveSettings(branch, parent, bool)
	local xmlsave = xmlLoadFile ( "userSettings.xml" )
    if xmlsave then -- If the xml loaded then...
		local xmlBranch = xmlFindChild(xmlsave,branch,0) -- Find the hud sub-node
		local Nodes = xmlNodeGetChildren(xmlBranch) 
		if branch == "Shaders" then
			for i,node in ipairs(Nodes) do
				nodeName = xmlNodeGetName( node)
				--print(nodeName)
				if parent == nodeName then
					xmlNodeSetValue(node, tostring(bool) )
				end
			end
		end
	end
    xmlSaveFile(xmlsave)
	xmlUnloadFile(xmlsave)
end


function openSettings(branch)
	if fileExists("userSettings.xml" ) then
		local xmlsave = xmlLoadFile ( "userSettings.xml" )
		local optionsNode = xmlFindChild ( xmlsave, branch, 0 )
		local settingsNodes = xmlNodeGetChildren(optionsNode) 
		nodesOpen ={}
		for i,node in ipairs(settingsNodes) do
			nodesOpen[i] = xmlNodeGetValue(node) 
		end
		xmlUnloadFile(xmlsave)
	end
end

function stringToBool(string)
	if string == "true" then return true end
	if string == "false" then return false end
end



bindKey("F1", "down", toggleUserPanel)
--///////////////////////////////////////////////////////////////////////////////

TabUserpanel = guiCreateTabPanel(9, 26, 359, 417, false, UserPWindow)

--///////////////////////////////////////////////////////////////////////////////



TabConfig = guiCreateTab("Configuración", TabUserpanel)

LabelHUD = guiCreateLabel(20, 10, 70, 15, "HUD (F3)", false, TabConfig)
guiLabelSetColor(LabelHUD, 255, 0, 0)
CBHUD = guiCreateCheckBox(20, 30, 148, 15, "HUD", false, false, TabConfig)

CBGPS = guiCreateCheckBox(20, 47, 148, 15, "Gps", false, false, TabConfig)
CBMonitor = guiCreateCheckBox(20, 64, 148, 15, "Monitor", false, false, TabConfig)
CBIconos = guiCreateCheckBox(20, 81, 148, 15, "Iconos (Supervivencia)", false, false, TabConfig)
CBArmaActual = guiCreateCheckBox(20, 98, 148, 15, "Arma Actual", false, false, TabConfig)
CBChat = guiCreateCheckBox(20, 115, 148, 15, "Chat", false, false, TabConfig)
CBFPSPING = guiCreateCheckBox(20, 132, 148, 15, "FPS/PING", false, false, TabConfig)

addEventHandler( "onClientGUIClick", CBHUD, function() 
		if ( guiCheckBoxGetSelected(CBHUD) ) then
	        guiCheckBoxSetSelected( CBGPS, true )
	        setElementData( localPlayer, "OcultarGPS", false )
			guiCheckBoxSetSelected( CBMonitor, true )
			setElementData( localPlayer, "OcultarMonitor", false )
	        guiCheckBoxSetSelected( CBIconos, true )
	        guiCheckBoxSetSelected( CBArmaActual, true )
	        guiCheckBoxSetSelected( CBChat, true )
	        guiCheckBoxSetSelected( CBFPSPING, true )
	        showChat(true)
	        setElementData( localPlayer, "MostrarHUD", false )
	    else
	        guiCheckBoxSetSelected( CBGPS, false )
	        setElementData( localPlayer, "OcultarGPS", true )
	        guiCheckBoxSetSelected( CBMonitor, false )
	        setElementData( localPlayer, "OcultarMonitor", true )
	        guiCheckBoxSetSelected( CBIconos, false )
	        guiCheckBoxSetSelected( CBArmaActual, false )
	        guiCheckBoxSetSelected( CBChat, false )
	        guiCheckBoxSetSelected( CBFPSPING, false )
	        showChat(false)
	        setElementData( localPlayer, "MostrarHUD", true )
	    end
	end,false)

addEventHandler( "onClientGUIClick", CBGPS, function() 
		if ( guiCheckBoxGetSelected(CBGPS) ) then
	        guiCheckBoxSetSelected( CBGPS, true )
	        setElementData( localPlayer, "OcultarGPS", false )
	    else
	        guiCheckBoxSetSelected( CBGPS, false )
	        setElementData( localPlayer, "OcultarGPS", true )
	    end
	end,false)

addEventHandler( "onClientGUIClick", CBMonitor, function() 
		if ( guiCheckBoxGetSelected(CBMonitor) ) then
	        guiCheckBoxSetSelected( CBMonitor, true )
	        setElementData( localPlayer, "OcultarMonitor", false )
	    else
	        guiCheckBoxSetSelected( CBMonitor, false )
	        setElementData( localPlayer, "OcultarMonitor", true )
	    end
	end,false)

addEventHandler( "onClientGUIClick", CBIconos, function() 
		if ( guiCheckBoxGetSelected(CBIconos) ) then
	        guiCheckBoxSetSelected( CBIconos, true )
	        setElementData( localPlayer, "OcultarIconos", false )
	    else
	        guiCheckBoxSetSelected( CBIconos, false )
	        setElementData( localPlayer, "OcultarIconos", true )
	    end
	end,false)
addEventHandler( "onClientGUIClick", CBArmaActual, function() 
		if ( guiCheckBoxGetSelected(CBArmaActual) ) then
	        guiCheckBoxSetSelected( CBArmaActual, true )
	        setElementData( localPlayer, "OcultarArmaActual", false )
	    else
	        guiCheckBoxSetSelected( CBArmaActual, false )
	        setElementData( localPlayer, "OcultarArmaActual", true )
	    end
	end,false)
addEventHandler( "onClientGUIClick", CBChat, function() 
		if ( guiCheckBoxGetSelected(CBChat) ) then
	        guiCheckBoxSetSelected( CBChat, true )
	        setElementData( localPlayer, "OcultarChat", false )
	        showChat( true )
	    else
	        guiCheckBoxSetSelected( CBChat, false )
	        setElementData( localPlayer, "OcultarChat", true )
	        showChat( false )
	    end
	end,false)
addEventHandler( "onClientGUIClick", CBFPSPING, function() 
		if ( guiCheckBoxGetSelected(CBFPSPING) ) then
	        guiCheckBoxSetSelected( CBFPSPING, true )
	        setElementData( localPlayer, "OcultarFPSPING", false )
	    else
	        guiCheckBoxSetSelected( CBFPSPING, false )
	        setElementData( localPlayer, "OcultarFPSPING", true )
	    end
	end,false)




--////////////////////////////////////////////////////////////////////
--////////////////////////////////////////////////////////////////////
--////////////////////////////////////////////////////////////////////
--/////////////////////////////Pendiente//////////////////////////////
--////////////////////////////////////////////////////////////////////
--////////////////////////////////////////////////////////////////////
LabelIdioma = guiCreateLabel(178, 10, 70, 15, "Multi-Idioma:", false, TabConfig)
ComboBIdioma = guiCreateComboBox(258, 8, 91, 81, "Español", false, TabConfig)
guiComboBoxAddItem(ComboBIdioma, "Español")
guiComboBoxAddItem(ComboBIdioma, "Ingles")
guiComboBoxAddItem(ComboBIdioma, "Portugués")
guiSetProperty( ComboBIdioma, "Disabled", "True" )
guiSetAlpha( LabelIdioma, .5 )

LabelTexturasCombo = guiCreateLabel(178, 35, 70, 17, "Texturas:", false, TabConfig)
ComboBTexturas = guiCreateComboBox(258, 35, 91, 81, "Verdes", false, TabConfig)
guiComboBoxAddItem(ComboBTexturas, "Verdes")
guiComboBoxAddItem(ComboBTexturas, "Blancas")
guiSetProperty( ComboBTexturas, "Disabled", "True" )
guiSetAlpha( LabelTexturasCombo, .5 )

LabelCalidadDeGraficos = guiCreateLabel(178, 62, 70, 29, "Calidad de \nGraficos: ", false, TabConfig)
ComboBCalidadText = guiCreateComboBox(258, 67, 91, 81, "Media", false, TabConfig)
guiComboBoxAddItem(ComboBCalidadText, "Alta")
guiComboBoxAddItem(ComboBCalidadText, "Media")
guiComboBoxAddItem(ComboBCalidadText, "Baja")
guiSetProperty( ComboBCalidadText, "Disabled", "True" )
guiSetAlpha( LabelCalidadDeGraficos, .5 )

LabelADVERTENCIA = guiCreateLabel(178, 97, 171, 71, "(ADVERTENCIA) Modificar las \nTexturas puede afectar la \njugabilidad del servidor.", false, TabConfig)
guiLabelSetColor(LabelADVERTENCIA, 255, 0, 0)
guiLabelSetHorizontalAlign(LabelADVERTENCIA, "center", false)
guiLabelSetVerticalAlign(LabelADVERTENCIA, "center")






LabelTexturas = guiCreateLabel(20, 157, 70, 15, "Shaders", false, TabConfig)
guiLabelSetColor(LabelTexturas, 255, 0, 0)

tableShaders[1] = guiCreateCheckBox(20, 178, 148, 15, "Efectos Realistas ", false, false, TabConfig)
tableShaders[2] = guiCreateCheckBox(20, 195, 148, 15, "Agua", false, false, TabConfig)
tableShaders[3] = guiCreateCheckBox(20, 212, 148, 15, "Cielo Real", false, false, TabConfig)
tableShaders[4] = guiCreateCheckBox(168, 178, 148, 15, "Texturas Globales", false, false, TabConfig)
tableShaders[5] = guiCreateCheckBox(168, 195, 148, 15, "Texturas Vehiculos", false, false, TabConfig)
tableShaders[6] = guiCreateCheckBox(168, 212, 170, 15, "Desenfoque de Movimiento", false, false, TabConfig)

addEventHandler( "onClientGUIClick", tableShaders[1], function() 
		if ( guiCheckBoxGetSelected(tableShaders[1]) ) then
	        guiCheckBoxSetSelected( tableShaders[1], true )
	        switchEfectosR(true)
	    else
	    	guiCheckBoxSetSelected( tableShaders[1], false )
	    	switchEfectosR(false)
	    end
	end,false)

addEventHandler( "onClientGUIClick", tableShaders[2], function() 
		if ( guiCheckBoxGetSelected(tableShaders[2]) ) then
	        guiCheckBoxSetSelected( tableShaders[2], true )
	        switchWater(true)
	    else
	    	guiCheckBoxSetSelected( tableShaders[2], false )
	    	switchWater(false)
	    end
	end,false)



addEventHandler( "onClientGUIClick", tableShaders[3], function() 
		if ( guiCheckBoxGetSelected(tableShaders[3]) ) then
	        guiCheckBoxSetSelected( tableShaders[3], true )
	        switchDynamicSky(true)
	        --triggerEvent( "switchDynamicSky", resourceRoot, true )
	    else
	    	guiCheckBoxSetSelected( tableShaders[3], false )
	    	switchDynamicSky(false)
	    	--triggerEvent( "switchDynamicSky", resourceRoot, false )
	    end
	end,false)

addEventHandler( "onClientGUIClick", tableShaders[4], function() 
		if ( guiCheckBoxGetSelected(tableShaders[4]) ) then
	        guiCheckBoxSetSelected( tableShaders[4], true )
	        switchTerreno(true)
	    else
	    	guiCheckBoxSetSelected( tableShaders[4], false )
	    	switchTerreno(false)
	    end
	end,false)

addEventHandler( "onClientGUIClick", tableShaders[5], function() 
		if ( guiCheckBoxGetSelected(tableShaders[5]) ) then
	        guiCheckBoxSetSelected( tableShaders[5], true )
	        switchVeh(true)
	    else
	    	guiCheckBoxSetSelected( tableShaders[5], false )
	    	switchVeh(false)
	    end
	end,false)

addEventHandler( "onClientGUIClick", tableShaders[6], function() 
		if ( guiCheckBoxGetSelected(tableShaders[6]) ) then
	        guiCheckBoxSetSelected( tableShaders[6], true )

	    else
	    	guiCheckBoxSetSelected( tableShaders[6], false )

	    end
	end,false)




LabelDisDibujado = guiCreateLabel(20, 235, 148, 15, "", false, TabConfig)
DisDibujadoSrollBar = guiCreateScrollBar(178, 235, 170, 15, true, false, TabConfig)
guiScrollBarSetScrollPosition(DisDibujadoSrollBar, 100.0)
LabelLimiteFPS = guiCreateLabel(20, 254, 148, 15, "", false, TabConfig)
FPSScrollBar = guiCreateScrollBar(178, 254, 170, 15, true, false, TabConfig)



guiSetText( LabelDisDibujado, "Distancia de dibujado: ".. 700 )
guiScrollBarSetScrollPosition(DisDibujadoSrollBar, 25)
setFarClipDistance(700)
setPedsLODDistance(500)


guiSetText( LabelLimiteFPS, "Limite de FPS:              " .. 61)
guiScrollBarSetScrollPosition(FPSScrollBar, 100.0)
setFPSLimit( 61 )

addEventHandler( "onClientGUIScroll", DisDibujadoSrollBar, function (onScroll)
	local scroll = guiScrollBarGetScrollPosition(onScroll)

	setFarClipDistance(scroll * 30)
	setPedsLODDistance(scroll * 5)
	--print(scroll * 5)
	guiSetText( LabelDisDibujado, "Distancia de dibujado: ".. scroll * 30  )

end, false)

addEventHandler( "onClientGUIScroll", FPSScrollBar, function (onScroll)
	local scroll = guiScrollBarGetScrollPosition(onScroll)
	setFPSLimit( scroll / 1.63 )
	guiSetText( LabelLimiteFPS, "Limite de FPS:              " .. scroll/1.63)
end, false)







LabelGPS = guiCreateLabel(20, 279, 70, 15, "GPS", false, TabConfig)
guiLabelSetColor(LabelGPS, 255, 0, 0)

LabelSeleccionGPS = guiCreateLabel(20, 302, 148, 17, "Seleccion de GPS:", false, TabConfig)
guiSetAlpha( LabelSeleccionGPS, .5 )

ComboBoxGPS = guiCreateComboBox(178, 302, 150, 74, "GPS Predeterminado", false, TabConfig)
guiComboBoxAddItem(ComboBoxGPS, "GPS Predeterminado")
guiComboBoxAddItem(ComboBoxGPS, "GPS Alternativo")
guiSetProperty( ComboBoxGPS, "Disabled", "True" )



addEventHandler( "onClientGUIComboBoxAccepted", ComboBoxGPS, function (comboBox)

	local item = guiComboBoxGetSelected( ComboBoxGPS )
	local text = tostring(guiComboBoxGetItemText( ComboBoxGPS, item ))
	if (text == "GPS Predeterminado" ) then
		--print("GPS Predeterminado")
		setElementData( localPlayer, "gpsType", "Predeterminado")
	elseif( text == "GPS Alternativo") then
		setElementData( localPlayer, "gpsType", "Alternativo")
	end
end, false)



LabelOtros = guiCreateLabel(20, 326, 70, 15, "Otros", false, TabConfig)
guiLabelSetColor(LabelOtros, 255, 0, 0)

CBAFK = guiCreateCheckBox(20, 351, 148, 15, "AFK", false, false, TabConfig)
CBParticiparEventos = guiCreateCheckBox(168, 351, 148, 15, "Participar en Eventos", true, false, TabConfig)
CBInvitacionesClan = guiCreateCheckBox(20, 368, 148, 15, "Invitaciones de Clan", false, false, TabConfig)

addEventHandler( "onClientGUIComboBoxAccepted", CBAFK, function ()
	if ( guiCheckBoxGetSelected(CBAFK) ) then
		setElementData( localPlayer, "bool_AFK", true)
		guiCheckBoxSetSelected( CBAFK, true )
    else
    	setElementData( localPlayer, "bool_AFK", false)
        guiCheckBoxSetSelected( CBAFK, false )
        
    end
end, false)

addEventHandler( "onClientGUIComboBoxAccepted", CBParticiparEventos, function ()
	if ( guiCheckBoxGetSelected(CBParticiparEventos) ) then
		setElementData( localPlayer, "bool_Participo", true)
		guiCheckBoxSetSelected( CBParticiparEventos, true )
    else
    	setElementData( localPlayer, "bool_Participo", false)
        guiCheckBoxSetSelected( CBParticiparEventos, false )
        
    end
end, false)

addEventHandler( "onClientGUIComboBoxAccepted", CBInvitacionesClan, function ()
	if ( guiCheckBoxGetSelected(CBInvitacionesClan) ) then
		setElementData( localPlayer, "bool_Invitaciones", true)
		guiCheckBoxSetSelected( CBInvitacionesClan, true )
    else
    	setElementData( localPlayer, "bool_Invitaciones", false)
        guiCheckBoxSetSelected( CBInvitacionesClan, false )
        
    end
end, false)




local row = {}
local moveDown = 0
local moveRight = 0
local maxMoveDown = 10
local maxMoveRight = 5
local loadCrosshairsBool = false
local Miras = {

	":DayZ/Imagenes/Crosshairs/CrosshairDefault.png",
	":DayZ/Imagenes/Crosshairs/Crosshair2.png",
	":DayZ/Imagenes/Crosshairs/holo.png",
	":DayZ/Imagenes/Crosshairs/holoblack.png",
	":DayZ/Imagenes/Crosshairs/79.png",
	":DayZ/Imagenes/Crosshairs/cross1.png",
}
--///////////////////////////////////////////////////////////////////////////////////////
TabCross = guiCreateTab("Crosshair", TabUserpanel)

crossScrollPanel = guiCreateScrollPane(9, 10, 340, 373, false, TabCross)
crossScrollBar = guiCreateScrollBar(325, 0, 15, 373, false, false, crossScrollPanel)

function loadCross()
	for i,v in ipairs(Miras) do
		number = i
		row[number] = ""
		if i == 1 then
			--print(number)
			row[number] = guiCreateStaticImage(1, 2 , 60, 60, v, false, crossScrollPanel)
		else
			if i > maxMoveRight then
				--print(number)
				moveDown = moveDown + 60
				row[number] = guiCreateStaticImage(1, 2 + moveDown, 60, 60, v, false, crossScrollPanel)
			else
				--print(number)
				moveRight = moveRight + 60
				row[number] = guiCreateStaticImage(1 + moveRight, 2, 60, 60, v, false, crossScrollPanel)
			end
		end
	end
end

function refreshCross()
	for i,v in ipairs(Miras) do
		moveDown = 0
		moveRight = 0
		if isElement( row[i] )then
			destroyElement( row[i] )
		end
	end
end



addEventHandler( "onClientGUIClick", TabUserpanel, function() 
	if(guiGetSelectedTab(TabUserpanel)==TabCross)then --Check what tab is currently shown
		refreshCross()
		loadCross()
   	end
end,false)


addEventHandler( "onClientGUIClick",getRootElement(), function ()
	for i,v in ipairs(Miras) do
		if source == row[i] then
			setElementData( localPlayer, "Mira", v)
		end
	end
 end)

addEventHandler( "onClientMouseEnter", getRootElement(), function()
	for i,v in ipairs(Miras) do
		if source == row[i] then
			guiSetSize( row[i], 75, 75, false )
		end
	end
	
end)


addEventHandler( "onClientMouseLeave", getRootElement(), function() 
	for i,v in ipairs(Miras) do
		if source == row[i] then
			guiSetSize( row[i], 60, 60, false )
		end
	end
end)





TabCuenta = guiCreateTab("Cuenta", TabUserpanel)

LabelCuenta = guiCreateLabel(11, 9, 119, 18, "Cuenta", false, TabCuenta)

EditboxCuenta = guiCreateEdit(10, 31, 240, 25, "", false, TabCuenta)
guiEditSetReadOnly(EditboxCuenta, true)
guiSetAlpha( EditboxCuenta, .8 )

LabelOldPass = guiCreateLabel(11, 67, 119, 18, "Contraseña actual:", false, TabCuenta)
oldPassEdit = guiCreateEdit(11, 90, 240, 25, "", false, TabCuenta)
guiEditSetMasked( oldPassEdit, true )



newPass1L = guiCreateLabel(11, 125, 119, 18, "Nueva contraseña:", false, TabCuenta)
newPass1E = guiCreateEdit(11, 149, 240, 25, "", false, TabCuenta)
guiEditSetMasked( newPass1E, true )

newPass2L = guiCreateLabel(11, 183, 119, 18, "Repetir contraseña:", false, TabCuenta)
newPass2E = guiCreateEdit(11, 208, 240, 25, "", false, TabCuenta)
guiEditSetMasked( newPass2E, true )

BotonCambiarPass = guiCreateButton(257, 149, 92, 25, "Cambiar Contraseña", false, TabCuenta)

triggerServerEvent( "accname", localPlayer, localPlayer )

addEventHandler( "onClientGUIClick", TabUserpanel, function() 
	if(guiGetSelectedTab(TabUserpanel)==TabCuenta)then --Check what tab is currently shown
		triggerServerEvent("accname", resourceRoot, localPlayer)   	end
end,false)

function setAccountName( player )
	guiSetText( EditboxCuenta, player)
end
addEvent( "accountName", true)
addEventHandler( "accountName", localPlayer, setAccountName)


addEventHandler( "onClientGUIClick", BotonCambiarPass, function() 
	pass1 = guiGetText( newPass1E )
	pass2 = guiGetText( newPass2E )
	passNew = guiGetText( oldPassEdit )
	if pass1 == pass2 then
		triggerServerEvent( "accpass", resourceRoot, localPlayer, passNew, pass1 )
	end
	end,false)















