local screenW, screenH = guiGetScreenSize()
local devScreenW, devScreenH = 1366, 768
local sW, sH = (screenW/devScreenW), (screenH/devScreenH)

local localplayer = getLocalPlayer()
local showCur = false
local tableCord = {}


	-- body
ventanaCord = guiCreateWindow((screenW - 722) / 2, (screenH - 480) / 2, 722, 480, "CordsToTXT", false)
--ventanaCord = guiCreateWindow((screenW - 722) / 2, (screenH - 480) / 2, 722, 480, "CordsToTXT", false)
guiSetVisible(ventanaCord, false)
guiWindowSetSizable(ventanaCord, false)

gridCord = guiCreateGridList(sW * 16, sH * 42, sW * 545, sH * 422, false, ventanaCord)
guiGridListAddColumn( gridCord, "Cordenadas", .97 )
botonAnadirCord = guiCreateButton(sW * 576, sH * 42, sW * 130, sH * 37, "Añadir cordenada", false, ventanaCord)
botonRemoverCord = guiCreateButton(sW * 576, sH * 89, sW * 130, sH * 37, "Remover cordenada", false, ventanaCord)
botonLimpiarCord = guiCreateButton(sW * 639, sH * 136, sW * 67, sH * 37, "Limpiar output", false, ventanaCord)

botonGuardarText = guiCreateButton(sW * 576, sH * 255, sW * 130, sH * 37, "Guardar .txt", false, ventanaCord)
botonEliminarText = guiCreateButton(sW * 576, sH * 302, sW * 130, sH * 37, "Eliminar .txt", false, ventanaCord)

memoCredits = guiCreateMemo(sW * 575, sH * 377, sW * 131, sH * 87, "         Sistema:\n        Almacenar\n       cordenadas\n      Autor: Hades", false, ventanaCord)    
guiMemoSetReadOnly( memoCredits, true )
addEventHandler( "onClientGUIClick", botonAnadirCord, function ()
	local x, y, z = getElementPosition( localplayer )
	
	table.insert(tableCord,{tostring("{"..x..", "..y..", "..z.."},")})
	guiGridListAddRow( gridCord, tableCord[#tableCord][1])
	--[[
	for k,v in pairs(tableCord) do
		outputChatBox(v[1])
	end]]
	
end, false )

addEventHandler( "onClientGUIClick", botonRemoverCord, function ()
	local item = guiGridListGetSelectedItem( gridCord )
	table.remove(tableCord,item)
	guiGridListRemoveRow( gridCord, item)
end, false )

addEventHandler( "onClientGUIClick", botonLimpiarCord, function ()
	for k in pairs (tableCord) do
	    tableCord [k] = nil
	end
	guiGridListClear( gridCord )
	
end, false)

addEventHandler( "onClientGUIClick", botonGuardarText, function ()
    cordTxt = fileCreate( "Cordenadas.txt" )
    if (cordTxt) then
        for i,v in ipairs(tableCord) do
            fileWrite( cordTxt,  v[1]..'\n')
        end
        fileClose( cordTxt)
        outputChatBox( "TXT Guardado en:\n C:/Program Files (x86)/MTA San Andreas 1.5/mods/deathmatch/resources/CordsToTXT" )
    end
end, false)

addEventHandler( "onClientGUIClick", botonEliminarText, function ()
	if(cordTxt) then
        fileDelete( "Cordenadas.txt" )
        outputChatBox( "TXT Eliminado" )
    end

end, false)







function openGUI( )
	if guiGetVisible( ventanaCord ) == false then
		guiSetVisible( ventanaCord, true )
		showCursor( true )
	else
		guiSetVisible( ventanaCord, false )
		showCursor( false )
	end
end
bindKey("F3", "down", openGUI)