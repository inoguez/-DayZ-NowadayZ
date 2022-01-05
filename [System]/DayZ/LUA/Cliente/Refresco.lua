local screenWidth,screenHeight = guiGetScreenSize()
addEventHandler("onClientResourceStart", resourceRoot,
    function()
        myScreenSource = dxCreateScreenSource ( screenWidth, screenHeight )         
    end
)

Fuente = dxCreateFont('Fuentes/PressStyle.ttf', 35)

Texto = 'Refrescando items\n #6CA53F. #FFFFFF. .'

function CambiarTexto()
	if Texto == 'Refrescando items\n #6CA53F. #FFFFFF. .' then
		Texto = 'Refrescando items\n . #6CA53F. #FFFFFF.'
	elseif Texto == 'Refrescando items\n . #6CA53F. #FFFFFF.' then
		Texto = 'Refrescando items\n . . #6CA53F.'
	else
		Texto = 'Refrescando items\n #6CA53F. #FFFFFF. .'
	end
end

function cleanmyscreen()
	if myScreenSource then
		dxUpdateScreenSource( myScreenSource )                  
		dxDrawImage(0, 0,  screenWidth, screenHeight, myScreenSource, 0, 0, 0, tocolor (255, 255, 255, 255), true)
		dxDrawRectangle(0, 0, screenWidth, screenHeight, 0xCC000000, true, true, true)
		
		if Fuente then
			Font = Fuente
			Size = 1
		else
			Font = 'default-bold'
			Size = 2
		end
		dxDrawText(Texto, 0, 0, screenWidth, screenHeight, tocolor(255, 255, 255, 255), Size, Font, 'center', 'center', true, true, true, true)
	end
end

function IniciarRefresco()
	if localPlayer:getData('Ocupado') then return end

	TimerR = setTimer(CambiarTexto, 500, 0)
	addEventHandler( "onClientRender", root, cleanmyscreen)
end
addEvent('Refresco:Iniciar', true)
addEventHandler('Refresco:Iniciar', getLocalPlayer(), IniciarRefresco)

function FinalizarRefresco()
	if localPlayer:getData('Ocupado') then return end

	killTimer(TimerR)
	removeEventHandler( "onClientRender", root, cleanmyscreen)
end
addEvent('Refresco:Finalizar', true)
addEventHandler('Refresco:Finalizar', getLocalPlayer(), FinalizarRefresco)