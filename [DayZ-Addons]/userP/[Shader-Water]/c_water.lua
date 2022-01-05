--
-- c_water.lua
--
function switchWater( bool)
  outputDebugString( "switchWater: " .. tostring(bool) )
  if bool then
    aplicarWater()
  else
    removerWater()
  end
end

function aplicarWater()

	-- Create shader
	 shaderWater, tec = dxCreateShader ( "[Shader-Water]/water.fx" )


		-- Set textures
		 textureVol = dxCreateTexture ( "[Shader-Water]/images/smallnoise3d.dds" );
		 textureCube = dxCreateTexture ( "[Shader-Water]/images/cube_env256.dds" );
		dxSetShaderValue ( shaderWater, "sRandomTexture", textureVol );
		dxSetShaderValue ( shaderWater, "sReflectionTexture", textureCube );
		engineApplyShaderToWorldTexture ( shaderWater, "waterclear256" )
		if shaderWater then
			local r,g,b,a = getWaterColor()
			dxSetShaderValue ( shaderWater, "sWaterColor", r/255, g/255, b/255, a/255 );
		end

end


function removerWater()
	engineRemoveShaderFromWorldTexture ( shaderWater, "waterclear256" )
	if isElement( shaderWater ) then
		destroyElement( shaderWater )
	end
	if isElement( textureVol ) then
		destroyElement( textureVol )
	end
	if isElement( textureCube ) then
		destroyElement( textureCube )
	end
end