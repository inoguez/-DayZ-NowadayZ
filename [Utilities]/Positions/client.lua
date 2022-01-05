function panel()
    window = guiCreateWindow(203, 172, 388, 214, "[Warp] Position", false)
    guiWindowSetSizable(window, false)
    showCursor (true)
    positionxgtasa = guiCreateEdit(27, 25, 351, 31,"", false, window)
    positionygtasa = guiCreateEdit(28, 76, 350, 31, "", false, window)
    positionzgtasa = guiCreateEdit(27, 127, 351, 31,"" , false, window)
    warp = guiCreateButton(9, 169, 284, 35, "Warp to Position Word GTA:SA", false, window)
    guiSetProperty(warp, "NormalTextColour", "FFAAAAAA")
    sair = guiCreateButton(303, 168, 75, 36, "Exit Panel", false, window)
    guiSetProperty(sair, "NormalTextColour", "FFAAAAAA")
    warpxgtasa = guiCreateLabel(10, 28, 15, 18, "X:", false, window)
    warpygtasa = guiCreateLabel(12, 79, 15, 18, "Y:", false, window)
    warpzgtasa = guiCreateLabel(12, 132, 15, 18, "Z:", false, window)

        addEventHandler("onClientGUIClick", sair, cancelar ,false)
        addEventHandler("onClientGUIClick", warp, gotowarp, false)
end
addCommandHandler("warpos",panel)
function cancelar()
destroyElement(window)
showCursor(false)
end

function gotowarp()
local x, y, z = guiGetText(positionxgtasa), guiGetText(positionygtasa), guiGetText(positionzgtasa)
    setElementPosition(getLocalPlayer(), x, y, z)
end