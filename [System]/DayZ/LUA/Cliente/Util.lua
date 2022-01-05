--// Proposito: Funciones utiles y compartidas en cliente
colorPrincipal = tocolor( 120, 140, 119, 220)

colorSecundario = tocolor( 179, 191, 170, 255)

colorBlanco = tocolor(240, 255, 240, 230)

screenSizeX, screenSizeY = guiGetScreenSize()
devSizeX, devSizeY = 1366, 768
sW, sH = (screenSizeX/devSizeX),(screenSizeY/devSizeY)

dxfont = dxCreateFont("Fuentes/WorkSans.ttf", 10)
guiFont = guiCreateFont( "Fuentes/WorkSans.ttf", 10)

function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
end








