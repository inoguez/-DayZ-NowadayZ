--// Proposito: Textos que informativos se muestran en la pantalla

-- Configuración
local Textos = {}
local Max = 4
local Dis = 24

local Texto = ''

function Textos.Agregar(Texto)
	table.insert(Textos, {Texto, getTickCount()})
end
addEvent('DayZ:MostrarMensaje', true)
addEventHandler('DayZ:MostrarMensaje', getLocalPlayer(), Textos.Agregar)

function Textos.Render()
	--dxDrawText(" ", 650*scaleX, 700*sH, 981*sW, 550*sH, 0xFFFFFFFF, 1.00, Fuente, 'center', 'center', false, false, false, true)

	for k, v in ipairs(Textos) do
		if k <= Max then
			--dxDrawRectangle(306*sW, (770 - (Dis * k)) * sH, 413*sW, 18*sH, tocolor(155, 68, 68, 240))
			dxDrawText(v[1]:gsub('#%x%x%x%x%x%x', ''), 306*sW - 1, (768 - (Dis * k)) * sH - 1, 719*sW - 1, (788 - (Dis * k)) * sH - 1, tocolor(0, 0, 0, 255), 1, dxfont, "left", "center", false, false, false, true)
			dxDrawText(v[1]:gsub('#%x%x%x%x%x%x', ''), 306*sW + 1, (768 - (Dis * k)) * sH - 1, 719*sW + 1, (788 - (Dis * k)) * sH - 1, tocolor(0, 0, 0, 255), 1, dxfont, "left", "center", false, false, false, true)
			dxDrawText(v[1]:gsub('#%x%x%x%x%x%x', ''), 306*sW - 1, (768 - (Dis * k)) * sH + 1, 719*sW - 1, (788 - (Dis * k)) * sH + 1, tocolor(0, 0, 0, 255), 1, dxfont, "left", "center", false, false, false, true)
			dxDrawText(v[1]:gsub('#%x%x%x%x%x%x', ''), 306*sW + 1, (768 - (Dis * k)) * sH + 1, 719*sW + 1, (788 - (Dis * k)) * sH + 1, tocolor(0, 0, 0, 255), 1, dxfont, "left", "center", false, false, false, true)
			dxDrawText(v[1], 306*sW, (768 - (Dis * k)) * sH, 719*sW, (788 - (Dis * k)) * sH, tocolor(240, 255, 240, 230), 1, dxfont, "left", "center", false, false, false, true)

			if (getTickCount() - v[2] > 5000) then
				table.remove(Textos, 1)
			end
		end
	end
end
addEventHandler('onClientRender', root, Textos.Render)