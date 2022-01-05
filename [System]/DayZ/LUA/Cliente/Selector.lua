--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
local nW, nH = guiGetScreenSize()
local sW = nW/1280
local sH = nH/1024

local ingresarCall = false
local registroCall = false
local personajeCall = false
local resourceRoot = getResourceRootElement(getThisResource())
local localPlayer = getLocalPlayer()
--/////EDITA AQUI ////////////////////////////////
local x, y, z, lx, ly, lz = -277.95458984375, 2475.2541503906, 106.9, -277.83181762695, 2474.2749023438, 107
-- -275.99481201172, 2435.8513183594, 107.57080078125, -275.70248413086, 2434.8952636719, 107.59275054932
local xPosition, yPosition, zPosition = -279.,2471.5,107.03601837158
local cancion = "Sonidos/auth/1.mp3" 
local DGS = exports.dgs

--Comentan despues de usar esta utilidad

addCommandHandler( "a", function ()
    setElementPosition( localPlayer, x, y, z)
end)

--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
fuego = {
    {xPosition +1.5, yPosition , zPosition - 0.75},
}


--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
alfaRectangle = 210
--colores login principal
green1 = tocolor( 179, 191, 170, 255)
green2 = tocolor( 179, 191, 170, 255)
green3 = tocolor( 179, 191, 170, 255)

black1 = tocolor( 120, 140, 119, 220)
black2 = tocolor( 120, 140, 119, 220)
black3 = tocolor( 120, 140, 119, 220)

--colores login ingreso

greeni = tocolor( 120, 140, 119, 220)
greenr = tocolor( 120, 140, 119, 220)




dgsLoginEdit = DGS:dgsCreateEdit(sW*36, sH*720, sW*254, sH*20,"",false)
dgsLoginPassEdit = DGS:dgsCreateEdit(sW*36, sH*780, sW*254, sH*20, "", false)
DGS:dgsEditSetMasked(dgsLoginPassEdit, true)

DGS:dgsSetVisible(dgsLoginEdit, false)
DGS:dgsSetVisible(dgsLoginPassEdit, false)

dgsRegEdit = DGS:dgsCreateEdit(sW*36, sH*720, sW*254, sH*20, "", false)
dgsRegPassEdit1 = DGS:dgsCreateEdit(sW*36, sH*760, sW*254, sH*20, "", false)
dgsRegPassEdit2 = DGS:dgsCreateEdit(sW*36, sH*800, sW*254, sH*20, "", false)

DGS:dgsEditSetMasked(dgsRegPassEdit1, true)
DGS:dgsEditSetMasked(dgsRegPassEdit2, true)

DGS:dgsSetVisible(dgsRegEdit, false)
DGS:dgsSetVisible(dgsRegPassEdit1, false)
DGS:dgsSetVisible(dgsRegPassEdit2, false)



function ResourceStartLogin(thePlayer)
    showChat( false )
	fadeCamera(false, 0)
	setPlayerHudComponentVisible("all", false)
	setPlayerHudComponentVisible("crosshair", true)
	setPedTargetingMarkerEnabled(false)
    addEventHandler( "onClientRender",getRootElement(), login_panel_dx)
    for k, v in ipairs(fuego) do
        fireElement = createEffect( "fire", v[1], v[2], v[3])
    end
	light = createLight(0, xPosition +1.5, yPosition , zPosition - 0.80, 5, 226, 88, 34, xPosition + 1, yPosition, zPosition, true  )
	Sonido = playSound(cancion, true)
    
end
addEventHandler("onClientResourceStart", resourceRoot, ResourceStartLogin)


function login_panel_dx()
        showCursor( true)
        --dxDrawRectangle(sW*0, sH*0, sW*1280, sH*171, tocolor(0, 0, 0, 255), false)
        --dxDrawRectangle(sW*0, sH*853, sW*1280, sH*171, tocolor(0, 0, 0, 255), false)
        dxDrawRectangle(sW*27, sH*883, sW*273, sH*31, black1, false)
        dxDrawRectangle(sW*27, sH*919, sW*273, sH*31, black2, false)
        dxDrawRectangle(sW*27, sH*955, sW*273, sH*31, black3, false)
        dxDrawText("INGRESAR", sW*27, sH*883, sW*300, sH*915, colorBlanco, 1.00, dxfont, "center", "center", false, false, false, false, false)
        dxDrawText("REGISTRARSE", sW*27, sH*919, sW*300, sH*951, colorBlanco, 1.00, dxfont, "center", "center", false, false, false, false, false)
        dxDrawText("PERSONAJE", sW*27, sH*955, sW*300, sH*987, colorBlanco, 1.00, dxfont, "center", "center", false, false, false, false, false)
          
end


function jugar_login( )
  local logedit = DGS:dgsGetText(dgsLoginEdit)
  local passedit = DGS:dgsGetText(dgsLoginPassEdit)
        dxDrawRectangle(sW*27, sH*661, sW*273, sH*220, tocolor(0, 0, 0, 180), false)
        dxDrawRectangle(sW*21, sH*661, sW*285, sH*27, colorPrincipal, false)
        dxDrawText("NOWADAYZ", sW*33, sH*665, sW*296, sH*683, colorBlanco, 1.00, dxfont, "center", "center", false, false, false, false, false)
        dxDrawText("USUARIO", sW*27, sH*695, sW*300, sH*714, colorBlanco, 1.00, dxfont, "center", "center", false, false, false, false, false)
        dxDrawText("CONTRASEÑA", sW*27, sH*755, sW*300, sH*774, colorBlanco, 1.00, dxfont, "center", "center", false, false, false, false, false)
        dxDrawRectangle(sW*95, sH*830, sW*135, sH*25, greeni, false)
        dxDrawText("INGRESAR", sW*95, sH*830, sW*231, sH*850, colorBlanco, 1.00, dxfont, "center", "center", false, false, false, false, false)
        if logedit == "" then
    			dxDrawText("usuario",sW*36, sH*498, sW*254, sH*17,tocolor(0,0,0,255),1,"default","center","center",false,false,true)
    		end
    		if passedit == "" then
    			dxDrawText("contraseña",sW*36, sH*554, sW*254, sH*17,tocolor(0,0,0,255),1,"default","center","center",false,false,true)
    		end
end
function registrarse_login()
        dxDrawRectangle(sW*27, sH*661, sW*273, sH*220, tocolor(0, 0, 0, 180), false)
        dxDrawRectangle(sW*21, sH*661, sW*285, sH*27, colorPrincipal, false)
        dxDrawText("NOWADAYZ", sW*33, sH*665, sW*296, sH*683, colorBlanco, 1.00, dxfont, "center", "center", false, false, false, false, false)      
        dxDrawText("USUARIO", sW*27, sH*695, sW*300, sH*714, colorBlanco, 1.00, dxfont, "center", "center", false, false, false, false, false)
        dxDrawText("CONTRASEÑA", sW*27, sH*740, sW*300, sH*759, colorBlanco, 1.00, dxfont, "center", "center", false, false, false, false, false)
        dxDrawText("REPETIR CONTRASEÑA", sW*27, sH*782, sW*300, sH*799, colorBlanco, 1.00, dxfont, "center", "center", false, false, false, false, false)
        dxDrawRectangle(sW*95, sH*840, sW*135, sH*25, greenr, false)
        dxDrawText("REGISTRO", sW*95, sH*840, sW*231, sH*860, colorBlanco, 1.00, dxfont, "center", "center", false, false, false, false, false)
end



testPed = nil

selectedClothes = {}

function personaje_login()
    if not isElement ( clothWindow ) then
            clothWindow = DGS:dgsCreateWindow(sW*29, sH*425, sW*268, sH * #itemsPacks*50, "Ropa CJ", false, colorBlanco, 25, nil, colorPrincipal, nil, tocolor(0, 0, 0, 180), 5, true)
            DGS:dgsWindowSetSizable(clothWindow, false)
            DGS:dgsWindowSetMovable( clothWindow, false)
            addEventHandler('onClientRender', root, rotateTestPed )
            addEventHandler('onClientRender', root, renderRotateText )
            bindKey ( "mouse1", "down", setPrevX )
            x_prev = nil
            for i, v in ipairs ( itemsPacks ) do
                local rub_label = DGS:dgsCreateLabel(11* sW, 10+25*(i-1)* sH, 51 * sW, 18 * sH, v[1], false, clothWindow)
                local run_back_b = DGS:dgsCreateButton(83* sW, 10+25*(i-1)* sH, 30 * sW, 18* sH, "<<", false, clothWindow)
                DGS:dgsSetProperty(run_back_b, "NormalTextColour", "FFAAAAAA")
                local rub_back = DGS:dgsCreateButton(124* sW, 10+25*(i-1)* sH, 30 * sW, 18* sH, "<", false, clothWindow)
                DGS:dgsSetProperty(rub_back, "NormalTextColour", "FFAAAAAA")
                local rub_forw = DGS:dgsCreateButton(188* sW, 10+25*(i-1)* sH, 30 * sW, 18* sH, ">", false, clothWindow)
                DGS:dgsSetProperty(rub_forw, "NormalTextColour", "FFAAAAAA")
                local rub_forw_b = DGS:dgsCreateButton(229* sW, 10+25*(i-1)* sH, 30 * sW, 18* sH, ">>", false, clothWindow)
                DGS:dgsSetProperty(rub_forw_b, "NormalTextColour", "FFAAAAAA")
                local cur_cloth = getElementData ( localPlayer, "cloth"..v[2]) or v[3]
                local rub_num = DGS:dgsCreateLabel(159* sW, 10+25*(i-1)* sH, 22 * sW, 18* sH, cur_cloth, false, clothWindow)
                DGS:dgsLabelSetHorizontalAlign(rub_num, "center", false)    
                setElementData ( run_back_b, "clothButBackB", true )
                setElementData ( rub_forw_b, "clothButForwB", true )
                setElementData ( rub_back, "clothButBack", true )
                setElementData ( rub_forw, "clothButForw", true )
                setElementData ( run_back_b, "clothButID", i )
                setElementData ( rub_forw_b, "clothButID", i )
                setElementData ( rub_back, "clothButID", i )
                setElementData ( rub_forw, "clothButID", i )
                table.insert ( selectedClothes, { rub_num, cur_cloth, v[2], v[3], v[4] } )
                setPedClothes ( testPed, v[2], cur_cloth )
            end
            button_save = DGS:dgsCreateButton(13* sW, 10+#itemsPacks*28 * sH, 242 * sW, 23 *sH,"Guardar Ropa",false,clothWindow)
            
            addEventHandler("onDgsMouseClickUp", button_save, allowCloth )

    end	
end

function clothWindow()
    DGS:CreateWindow(sW*29, sH*425, sW*268, sH * #itemsPacks*50, "Ropa CJ", false)
end


text = "Mantenga presionado el botón izquierdo del mouse y muévalo para girar el personaje."
function renderRotateText()
        width = dxGetTextWidth( text )
        dxDrawLine(sW*338 - 1, sH*192 - 1, sW*338 - 1, sH*237, tocolor(153, 0, 0, 255), 1, false)
        dxDrawLine(sW*943, sH*192 - 1, sW*338 - 1, sH*192 - 1, tocolor(153, 0, 0, 255), 1, false)
        dxDrawLine(sW*338 - 1, sH*237, sW*943, sH*237, tocolor(153, 0, 0, 255), 1, false)
        dxDrawLine(sW*943, sH*237, sW*943, sH*192 - 1, tocolor(153, 0, 0, 255), 1, false)

        dxDrawRectangle(sW*338, sH*192, sW*605, sH*45, tocolor(50, 50, 50, 150), false)
        dxDrawText(text, sW*337, sH*191, sW*943, sH*237, colorBlanco, 1.00, dxfont, "center", "center", false, false, false, false, false)
end

function allowCloth ()
    if source ~= button_save then return true end

    for i, v in ipairs ( itemsPacks ) do
        setElementData ( localPlayer, "cloth"..v[2], selectedClothes[i][2] )
	end   
    triggerEvent( "DayZ:MostrarMensaje", localPlayer, "#008B8B* #F0FFF0 Ropa guardada")
    --outputChatBox ( "Ropa guardada!", 60,179,113)
    save()
    closeClothWindow()
    personajeCall = false
    
end

function save()
    xmlsave = xmlCreateFile("Clothes.xml","RopaCJ")	
    for i, v in ipairs ( itemsPacks ) do
		xmlNodeSetValue(xmlCreateChild(xmlsave, tostring(v[1])), selectedClothes[i][2])
    end
    xmlSaveFile(xmlsave)
	xmlUnloadFile(xmlsave)

end


function load()
	if fileExists( "Clothes.xml" ) then
		xmlload = xmlLoadFile( "Clothes.xml" )
		clothesXML = xmlNodeGetChildren(xmlload) 
			if xmlload then
				saveCJ = {}
				for i,node in ipairs(clothesXML) do	
					saveCJ[i] = xmlNodeGetValue(node)
				end
			end
			xmlUnloadFile(xmlload)

        	for i, v in ipairs ( itemsPacks ) do
		        setElementData ( localPlayer, "cloth"..v[2], tonumber(saveCJ[i]))
			end 

		    for i, v in ipairs ( itemsPacks ) do
				if getElementModel ( testPed ) == 0 then
					local cur_cloth = getElementData ( localPlayer, "cloth"..v[2]) or v[3]
		            setPedClothes ( testPed, v[2], cur_cloth )
		        end
        	end 
        else
        	UpdatePedClothes()
    end
end


function disallowCloth ()
    if source ~= button_back then return true end
    closeClothWindow()
end

function closeClothWindow ()
    destroyElement ( clothWindow )
    selectedClothes = {}
    unbindKey ( "mouse1", "down", setPrevX )
    removeEventHandler('onClientRender', root, rotateTestPed )
    removeEventHandler('onClientRender', root, renderRotateText )
    showCursor ( false )
end

x_prev = nil

function setPrevX()
    x, _ = getCursorPosition ()
    x_prev = x*nW
end

function rotateTestPed()
    if getKeyState ("mouse1") then
        x, _ = getCursorPosition ()
        x=x*nW
        change_rot = (x-x_prev)
        local _, _, ped_rot = getElementRotation ( testPed )
        local rot_to = ped_rot+change_rot
        if rot_to < 0 then
            rot_to = ped_rot+change_rot+360
        end
        setElementRotation ( testPed, 0, 0, rot_to )
        x_prev = x
    end
end

function clickOntoCloth ()
    local id = getElementData ( source, "clothButID" ) or 0 
    if id > 0 then
        local setCloth = selectedClothes[id][4]
        if getElementData ( source, "clothButBackB" ) then
            setCloth = selectedClothes[id][4]
        elseif getElementData ( source, "clothButForwB" ) then
            setCloth = selectedClothes[id][5]
        elseif getElementData ( source, "clothButBack" ) then
            if selectedClothes[id][2] > selectedClothes[id][4] then
                setCloth = selectedClothes[id][2]-1
            else
                setCloth = selectedClothes[id][5]
            end
        elseif getElementData ( source, "clothButForw" ) then
            if selectedClothes[id][2] < selectedClothes[id][5] then
                setCloth = selectedClothes[id][2]+1
            end
        end
        selectedClothes[id][2] = setCloth
        DGS:dgsSetText (selectedClothes[id][1],setCloth)
        setPedClothes ( testPed, selectedClothes[id][3], setCloth )
    end
end

addEventHandler("onDgsMouseClickUp", root, clickOntoCloth )

function setPedClothes(thePed, clothingSlot, clothingID)
	if not isElement(thePed) or type(clothingSlot) ~= "number" then
		error("Invalid arguments to setPedClothes()!", 2)
	end

	
	if not clothingID then
		return removePedClothes(thePed, clothingSlot)
	end
	
	local hasClothes = getPedClothes(thePed, clothingSlot) 
	if hasClothes then
		removePedClothes(thePed, clothingSlot)
	end
	
	local texture, model = getClothesByTypeIndex(clothingSlot, clothingID)
	return addPedClothes(thePed, texture, model, clothingSlot)
end

addEventHandler( "onClientElementStreamIn", getRootElement( ),
    function ( )
        if getElementType( source ) == "player" or ( getElementType( source ) == "ped" and getElementData ( source, "deadman" ) ) and getElementModel ( source ) == 0 then
            for i, v in ipairs ( itemsPacks ) do
                setPedClothes (source,v[2],getElementData ( source, "cloth"..v[2] ) or 0)
            end
        end
    end
);

function updatePlayerClothesC (skin)
    if isElement ( source ) then 
        if skin == 0 then
            for i, v in ipairs ( itemsPacks ) do
                setPedClothes (source,v[2],getElementData ( source, "cloth"..v[2] ) or 0)
            end
        else
            for i, v in ipairs ( itemsPacks ) do
                removePedClothes(source, v[2])
            end
        end
    end
end

addEvent("updatePlayerClothes", true)
addEventHandler("updatePlayerClothes", getRootElement(), updatePlayerClothesC)

function putPlayerClothesOnSpawn ()
    if getElementModel ( localPlayer ) == 0 then
        for i, v in ipairs ( itemsPacks ) do
            setPedClothes (localPlayer,v[2],getElementData ( localPlayer, "cloth"..v[2] ) or 0)
        end
    end
end

addEvent("onClientPlayerDayZSpawn", true)
addEventHandler("onClientPlayerDayZSpawn", getRootElement(), putPlayerClothesOnSpawn)

addEvent("onClientPlayerDayZLogin", true)
addEventHandler("onClientPlayerDayZLogin", getRootElement(), putPlayerClothesOnSpawn)


function UpdatePedClothes()
    if getElementModel ( testPed ) == 0 then
        for i, v in ipairs ( selectedClothes ) do
            setPedClothes (testPed,v[2],getElementData ( localPlayer, "cloth"..v[2] ) or 0)
        end     
    end
end






botonJugar = guiCreateButton( sW*27, sH*883, sW*273, sH*31, "", false)
guiSetAlpha( botonJugar, 0)
guiSetVisible( botonJugar, true)
addEventHandler("onClientGUIClick",botonJugar,
    function ()
    ---funcion para aparecer el gui de logear----------------------------
    if personajeCall == true then return end
    if ingresarCall == true then return end
      
    
    if registroCall == true then
        removeEventHandler( "onClientRender",getRootElement(), registrarse_login)
        DGS:dgsSetVisible(dgsRegEdit, false)
        DGS:dgsSetVisible(dgsRegPassEdit1, false)
        DGS:dgsSetVisible(dgsRegPassEdit2, false)
          guiSetVisible( botonregistrar, false )
          registroCall = false
    end
  
    addEventHandler( "onClientRender",getRootElement(), jugar_login)
    DGS:dgsSetVisible(dgsLoginEdit, true)
    DGS:dgsSetVisible(dgsLoginPassEdit, true)
    --guiSetVisible( rememberlog, true )
    guiSetVisible( botonIngresar, true)
    ingresarCall = true
  end)

    addEventHandler( "onClientMouseEnter",botonJugar,
        function ()
            black1 = colorSecundario
            playSound( "Sonidos/hover.wav")
        end)
    addEventHandler( "onClientMouseLeave",botonJugar,
        function ()
            black1 = colorPrincipal
        end)





botonRegistrarse = guiCreateButton( sW*27, sH*919, sW*273, sH*31, "", false)
guiSetAlpha( botonRegistrarse, 0)
guiSetVisible( botonRegistrarse, true)
addEventHandler("onClientGUIClick",botonRegistrarse,
    function ()
--funcion para aparecer el gui de registrarse-------------------------------
if personajeCall == true then return end
if registroCall == true then return end
 

if ingresarCall == true then
      removeEventHandler( "onClientRender", getRootElement(), jugar_login)
      DGS:dgsSetVisible(dgsLoginEdit, false)
      DGS:dgsSetVisible(dgsLoginPassEdit, false)
      guiSetVisible( botonIngresar, false )

      ingresarCall = false
end
    addEventHandler( "onClientRender",getRootElement(), registrarse_login)
        DGS:dgsSetVisible(dgsRegEdit, true)
        DGS:dgsSetVisible(dgsRegPassEdit1, true)
        DGS:dgsSetVisible(dgsRegPassEdit2, true)
        guiSetVisible( botonregistrar, true )
        registroCall = true

end)

    addEventHandler( "onClientMouseEnter",botonRegistrarse,
        function ()
            black2 = colorSecundario
            playSound( "Sonidos/hover.wav")
        end)
    addEventHandler( "onClientMouseLeave",botonRegistrarse,
        function ()
            black2 = colorPrincipal
        end)


botonPersonaje = guiCreateButton( sW*27, sH*955, sW*273, sH*31, "", false)
guiSetAlpha( botonPersonaje, 0)
guiSetVisible( botonPersonaje, true)
addEventHandler("onClientGUIClick",botonPersonaje,
    function ()
-----------------------------------------------------funcion para aparecer el gui de registrarse
if personajeCall == true then
    return
end


if ingresarCall == true then
      removeEventHandler( "onClientRender", getRootElement(), jugar_login)
      DGS:dgsSetVisible(dgsLoginEdit, false)
      DGS:dgsSetVisible(dgsLoginPassEdit, false)
      --guiSetVisible( rememberlog, false )
      guiSetVisible( botonIngresar, false )
      ingresarCall = false
end
if registroCall == true then
      removeEventHandler( "onClientRender", getRootElement(), registrarse_login)
      DGS:dgsSetVisible(dgsRegEdit, false)
      DGS:dgsSetVisible(dgsRegPassEdit1, false)
      DGS:dgsSetVisible(dgsRegPassEdit2, false)
      guiSetVisible( botonregistrar, false )
      registroCall = false
end
      personaje_login()
      personajeCall = true
    end)

    addEventHandler( "onClientMouseEnter",botonPersonaje,
        function ()

            black3 = colorSecundario
            playSound( "Sonidos/hover.wav")
        end)
    addEventHandler( "onClientMouseLeave",botonPersonaje,
        function ()
            black3 = colorPrincipal
        end)

--|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
botonIngresar = guiCreateButton( sW*95, sH*830, sW*135, sH*25, "", false)
guiSetAlpha( botonIngresar, 0)
guiSetVisible( botonIngresar, false)
addEventHandler("onClientGUIClick",botonIngresar,
                function ()
                    Usuario = DGS:dgsGetText(dgsLoginEdit)
                    Clave = DGS:dgsGetText(dgsLoginPassEdit)
                    if Usuario ~= "" and Clave ~= "" then
                      triggerServerEvent('DayZ:Login', localPlayer, Usuario, Clave)
                      if isElement(wood) then
                        destroyElement(wood)
                      end
                      if isElement(fireElement) then
                        destroyElement(fireElement)
                      end
                      if isElement(light) then
                        destroyElement(light)
                      end
                      if isElement(Sonido) then
                        destroyElement(Sonido)
                      end
                      showChat( true )
                        --triggerEvent( "DayZ:MostrarMensaje", localPlayer, "#008B8B* #F0FFF0 Iniciado correctamente!")
                    else
                        triggerEvent( "DayZ:MostrarMensaje", localPlayer, "#008B8B* #F0FFF0 Por favor ingrese nombre de usuario/contraseña y confirme para logearse!")
                      return
                    end
                    end, false )
                  
                  config = xmlLoadFile("fragconf.xml")
                  if config then
                      uname = xmlNodeGetAttribute(config,"username")
                      pass = xmlNodeGetAttribute(config,"pass")
                      DGS:dgsSetText(dgsLoginEdit,uname)
                      DGS:dgsSetText(dgsLoginPassEdit,pass)
                  else
                      config = xmlCreateFile("fragconf.xml","account")
                      xmlNodeSetAttribute(config, "username", "")
                      xmlNodeSetAttribute(config, "pass", "")
                      xmlSaveFile(config)
                end
                



function home()
  setTimer( function()  
    testPed = createPed(0,  xPosition, yPosition, zPosition, -20,false)
    wood = createObject(2684, xPosition +1.5, yPosition , zPosition - 0.80, 0, 0, 0)
    setObjectScale(wood, 0.5)
    load()
    setCameraMatrix(x, y, z, lx, ly, lz) --camara jugador 2880.30859375,-2124.9255371094,4.4720997810364,2879.3088378906,-2124.9392089844,4.4824285507202
  end,1500,1)
  guiSetInputMode("no_binds_when_editing")
  fadeCamera (true) 
end
addEventHandler("onClientResourceStart", resourceRoot, home)


function cameraM()
    local x, y, z, lx, ly, lz = getCameraMatrix (getLocalPlayer( ))
    outputChatBox( x..", "..y..", "..z..", "..lx..", "..ly..", "..lz)
end

addCommandHandler( "camera", cameraM)




    addEventHandler( "onClientMouseEnter",botonIngresar,
        function ()
            greeni = colorSecundario
            playSound( "Sonidos/hover.wav")
        end)
  addEventHandler( "onClientMouseLeave",botonIngresar,
        function ()
            greeni = colorPrincipal
        end)


botonregistrar = guiCreateButton( sW*95, sH*840, sW*135, sH*25, "", false)
guiSetAlpha( botonregistrar, 0)
guiSetVisible( botonregistrar, false)
addEventHandler("onClientGUIClick",botonregistrar,
function ()
  local Usuario = DGS:dgsGetText(dgsRegEdit)
  local Clave = DGS:dgsGetText(dgsRegPassEdit1)
  local Clave1 = DGS:dgsGetText(dgsRegPassEdit2)
  if Usuario ~="" and Clave ~="" and Clave1 ~="" then
    if Clave == Clave1 then
      if string.len(Clave) >= 4 then
        triggerServerEvent('DayZ:Registro', localPlayer, Usuario, Clave)
      else
        triggerEvent( "DayZ:MostrarMensaje", localPlayer, "#008B8B* #F0FFF0 Tu contraseña es demasiado corta. [4 caracteres]")
        --outputChatBox("#008B8B* #F0FFF0 Tu contraseña es demasiado corta. [4 caracteres]",255,255,255,true)
      end
    else
        triggerEvent( "DayZ:MostrarMensaje", localPlayer, "#008B8B* #F0FFF0 Las contraseñas no son iguales!")
      --outputChatBox("#008B8B* #F0FFF0 Las contraseñas no son iguales!",255,255,255,true)
    end
  else
        triggerEvent( "DayZ:MostrarMensaje", localPlayer, "#008B8B* #F0FFF0 Por favor ingrese nombre de usuario o contraseña y confirme para registrarse!")
  end
end)

    addEventHandler( "onClientMouseEnter",botonregistrar,
        function ()
            greenr = colorSecundario
            playSound( "Sonidos/hover.wav")
        end)
  addEventHandler( "onClientMouseLeave",botonregistrar,
        function ()
            greenr = colorPrincipal
        end)




--|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


function finishlogin()
    if isElement( testPed ) then
    destroyElement(testPed)
    end

    config = xmlLoadFile("fragconf.xml")
    if config then

      xmlNodeSetAttribute(config, "username",DGS:dgsGetText(dgsLoginEdit))
      xmlNodeSetAttribute(config, "pass",DGS:dgsGetText(dgsLoginPassEdit))
      xmlSaveFile(config)
    end
    removeEventHandler( "onClientRender", getRootElement(), login_panel_dx)
    removeEventHandler( "onClientRender", getRootElement(), registrarse_login)
    removeEventHandler( "onClientRender", getRootElement(), personaje_login)
    removeEventHandler( "onClientRender", getRootElement(), jugar_login)

    guiSetVisible( botonJugar, false)
    guiSetVisible( botonIngresar, false)
    guiSetVisible( botonregistrar, false)
    guiSetVisible( botonRegistrarse, false)
    guiSetVisible( botonPersonaje, false)


    DGS:dgsSetVisible(dgsLoginEdit, false)
    DGS:dgsSetVisible(dgsLoginPassEdit, false)
    DGS:dgsSetVisible(dgsRegEdit, false)
    DGS:dgsSetVisible(dgsRegPassEdit1, false)
    DGS:dgsSetVisible(dgsRegPassEdit2, false)
    showCursor(false)
    showChat(true) 
end
addEvent("onPlayerDoneLogin", true)
addEventHandler("onPlayerDoneLogin", getRootElement(), finishlogin)

--local  smoothcamera
local sm = {}
sm.moov = 0
sm.object1,sm.object2 = nil,nil
 
local function removeCamHandler()
    if(sm.moov == 1)then
        sm.moov = 0
    end
end
 
local function camRender()
    if (sm.moov == 1) then
        local x1,y1,z1 = getElementPosition(sm.object1)
        local x2,y2,z2 = getElementPosition(sm.object2)
        setCameraMatrix(x1,y1,z1,x2,y2,z2)
    else
        removeEventHandler("onClientPreRender",root,camRender)
    end
end

 
function smoothMoveCamera(x1,y1,z1,x1t,y1t,z1t,x2,y2,z2,x2t,y2t,z2t,time)
    if(sm.moov == 1)then return false end
    sm.object1 = createObject(1337,x1,y1,z1)
    sm.object2 = createObject(1337,x1t,y1t,z1t)
        setElementCollisionsEnabled (sm.object1,false) 
    setElementCollisionsEnabled (sm.object2,false) 
    setElementAlpha(sm.object1,0)
    setElementAlpha(sm.object2,0)
    setObjectScale(sm.object1,0.01)
    setObjectScale(sm.object2,0.01)
    moveObject(sm.object1,time,x2,y2,z2,0,0,0,"InOutQuad")
    moveObject(sm.object2,time,x2t,y2t,z2t,0,0,0,"InOutQuad")
    sm.moov = 1
    setTimer(removeCamHandler,time,1)
    setTimer(destroyElement,time,1,sm.object1)
    setTimer(destroyElement,time,1,sm.object2)
    addEventHandler("onClientPreRender",root,camRender)
    return true
end