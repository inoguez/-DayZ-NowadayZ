--
-- c_detail.lua
--


function switchTerreno( bool )
	outputDebugString( "switchTerreno: " .. tostring(bool) )
	if bool then
		enableDetail()
	else
		disableDetail()
	end
end

 keyToTexture = {
	["cloud*"]				= '[Shader-Terreno]/shaders/media/35.png',

	["_dirt1"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["scrub1"]			= '[Shader-Terreno]/shaders/media/1.png',
	["oldrun"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["panelconc"]			= '[Shader-Terreno]/shaders/media/1.png',
	["ripplsand"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["dirtgrassmix"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["grassdeadbrn256"] 	= '[Shader-Terreno]/shaders/media/1.png',
	["grasstype5"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["heavygrass"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["grassbrn"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["grassbrn_lod"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["grass2scrub"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["grass2dirt"] 		= '[Shader-Terreno]/shaders/media/1.png',
			
	["desgrasand"] 		= '[Shader-Terreno]/shaders/media/1.png',			
	["grass_gen"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["grass_lod"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["dirt64b2"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["Grass"] 				= '[Shader-Terreno]/shaders/media/1.png',
	["Grass_128"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["Grass_lod"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["sandgrnd"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["grass_dry"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["yardgras"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["vegasgolflod"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["newcrop3"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["desgreengrassmix"] 	= '[Shader-Terreno]/shaders/media/1.png',
	["con2sand"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["grassdry"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["vgn_ground"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["drvin_ground"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["grasslod"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["brngrass"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["desgrassbrnLOD"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["vgsEcoast"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["vgwestbildlod"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["sfn_grass1"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["asfnsjm6"] 				= '[Shader-Terreno]/shaders/media/1.png',
	["asfnsjm94"] 			= '[Shader-Terreno]/shaders/media/1.png',
    ["frate_doors128red"] 	= '[Shader-Terreno]/shaders/media/84.png',
    ["frate64_red"] 			= '[Shader-Terreno]/shaders/media/83.png',
	["asfnsjm93"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["asfnsjm9i"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["asfnsjm9h"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["grass4dirty"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["grasstype4"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["oldflowerb"]			= '[Shader-Terreno]/shaders/media/1.png',
	["grassbrn_grn"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["desertgryard"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["desertgryard"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["desertstones256forestm"] 	= '[Shader-Terreno]/shaders/media/1.png',
	["dirt2gygras"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["sl_sfn"] 				= '[Shader-Terreno]/shaders/media/1.png',
	["florestfloor256_blenddirt"] = '[Shader-Terreno]/shaders/media/1.png',
	
	["grassdead1"]			    = '[Shader-Terreno]/shaders/media/1.png',
	["forestfloor_sones256"]	= '[Shader-Terreno]/shaders/media/1.png',
	["forestfloor3_forest"]	    = '[Shader-Terreno]/shaders/media/1.png',
    ["forestfloorblendded"]	    = '[Shader-Terreno]/shaders/media/1.png',
	["grasstype10"]			= '[Shader-Terreno]/shaders/media/1.png',
	["grasstype4_10"]			= '[Shader-Terreno]/shaders/media/1.png',
	["grasstype4_forest"]		= '[Shader-Terreno]/shaders/media/1.png',
	["florestfloor3"]		    = '[Shader-Terreno]/shaders/media/1.png',
	["florestfloor3_florest"]	= '[Shader-Terreno]/shaders/media/1.png',
	["grasstype4_forestblend"]  = '[Shader-Terreno]/shaders/media/1.png',
	["desertgravelgrass"]		= '[Shader-Terreno]/shaders/media/1.png',
	["dirtKB_64"]				= '[Shader-Terreno]/shaders/media/1.png',
	["grassdeep1"]			= '[Shader-Terreno]/shaders/media/1.png',
	["desmudgrass"]			= '[Shader-Terreno]/shaders/media/1.png',
	["grasspatch"]			= '[Shader-Terreno]/shaders/media/1.png',
	["Grass_path"]			= '[Shader-Terreno]/shaders/media/1.png',
	["desertstones256"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["des_dirt2stones"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["des_dirt2grass"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["desgreengrass"]			= '[Shader-Terreno]/shaders/media/1.png',
	["grasstype7"]				= '[Shader-Terreno]/shaders/media/1.png',
	["grassdirtblend"]				= '[Shader-Terreno]/shaders/media/1.png',
	["compurch_lod"]				= '[Shader-Terreno]/shaders/media/1.png',
	["church_dirt"]				= '[Shader-Terreno]/shaders/media/1.png',
	["grasstype3"]				= '[Shader-Terreno]/shaders/media/1.png',
	["grasstype4-3"]				= '[Shader-Terreno]/shaders/media/1.png',			


	["sw_grass01a"]			= '[Shader-Terreno]/shaders/media/8.png',			
	["sw_grassB01"]			= '[Shader-Terreno]/shaders/media/54.png',			
	["sw_grass01"]				= '[Shader-Terreno]/shaders/media/9.png',
	["sw_grass01LOD"]			= '[Shader-Terreno]/shaders/media/9.png',
	["sw_dirt01"]				= '[Shader-Terreno]/shaders/media/9.png',
	["sw_crops"]				= '[Shader-Terreno]/shaders/media/53.png',
	["grassgrnbrnx"]			= '[Shader-Terreno]/shaders/media/53.png',
	["sw_farmroad"]			= '[Shader-Terreno]/shaders/media/55.png',

	["desertgryard"] 			= '[Shader-Terreno]/shaders/media/9.png',

	["forestfloorblend"]		= '[Shader-Terreno]/shaders/media/8.png',
	["forestfloorblendb"]		= '[Shader-Terreno]/shaders/media/8.png',

	["forestfloorbranch"]		= '[Shader-Terreno]/shaders/media/46.png',
	["forestfloorbranch256"]	= '[Shader-Terreno]/shaders/media/46.png',

	["forestfloor256"]		= '[Shader-Terreno]/shaders/media/1.png',
	["forestfloor256_blenddirt"]		= '[Shader-Terreno]/shaders/media/1.png',
	["forestfloor256L"]		= '[Shader-Terreno]/shaders/media/1.png',
	["forestfloorgrass"]		= '[Shader-Terreno]/shaders/media/1.png',

	
	

	["mounttrail"]			= '[Shader-Terreno]/shaders/media/12.png',	
	--["des_dam_conc"]			= dirtTexture,	
	["forest_rocks"] 			= '[Shader-Terreno]/shaders/media/65.png',
	["stonesgrass"] 			= '[Shader-Terreno]/shaders/media/52.png',
	["sw_stones"] 			= '[Shader-Terreno]/shaders/media/12.png',
	["mountainskree"]			= '[Shader-Terreno]/shaders/media/12.png',
	["stones256"] 				= '[Shader-Terreno]/shaders/media/12.png',
	["grass10_stones256"] 		= '[Shader-Terreno]/shaders/media/52.png',
	["grass10dir"] 			= '[Shader-Terreno]/shaders/media/52.png',
	["grasstype4blnd"] 		= '[Shader-Terreno]/shaders/media/65.png',
	["mountdirt2grass"]		= '[Shader-Terreno]/shaders/media/52.png',	
	["mountdirt"]				= '[Shader-Terreno]/shaders/media/12.png',	

	["rock2grgrass"] 		= '[Shader-Terreno]/shaders/media/30.png',
	["mountrock"] 		= '[Shader-Terreno]/shaders/media/29.png',
	--["mountdirt"] 		= '[Shader-Terreno]/shaders/media/29.png', TODO:
	["rockhole"] 			= '[Shader-Terreno]/shaders/media/27.png',
	["sfn_rocktbrn"] 		= '[Shader-Terreno]/shaders/media/31.png',
	["golf_grassrock"] 	= '[Shader-Terreno]/shaders/media/29.png',
	["asfnsjm9zb"] 		= '[Shader-Terreno]/shaders/media/29.png',
	["sw_rockgrass1"] 	= '[Shader-Terreno]/shaders/media/29.png',
	["sw_rockgrassB"] 	= '[Shader-Terreno]/shaders/media/30.png',

	["rockdetail2"] 		= '[Shader-Terreno]/shaders/media/29.png',
	["grassbrn2rock"] 	= '[Shader-Terreno]/shaders/media/51.png',
	

	
			
	--["forestfloor256_blend"]		= gravelToRoadU,
	--["forestfloor256mudblend"]	= gravelToRoadD,
	

	["mountdirt2forest"]			= '[Shader-Terreno]/shaders/media/57.png',
	["mountroad"]					= '[Shader-Terreno]/shaders/media/22.png',		
	

	["sfncn_rockgrass3"] 			= '[Shader-Terreno]/shaders/media/80.png',
	["sfncn_rockgrass4"] 			= '[Shader-Terreno]/shaders/media/77.png',
	["rock_country"] 				= '[Shader-Terreno]/shaders/media/29.png',

	["sw_sandgrass"]				= '[Shader-Terreno]/shaders/media/62.png',
	["sw_sandgrass4"]				= '[Shader-Terreno]/shaders/media/72.png',

	["grasstype4_mudblend"] 		= '[Shader-Terreno]/shaders/media/21.png',			
	["desmud"] 						= '[Shader-Terreno]/shaders/media/dirty.png',
	

	["desertstones256for"] 		= '[Shader-Terreno]/shaders/media/79.png',
	["forestfloor_sones"] 			= '[Shader-Terreno]/shaders/media/21.png',
	["dirtblendlit"] 				= '[Shader-Terreno]/shaders/media/1.png',

	["brngrss2stones"] 			= '[Shader-Terreno]/shaders/media/21.png',			

	["hiway2sand"] 			= '[Shader-Terreno]/shaders/media/1.png',
	["patchygravel"] 			= '[Shader-Terreno]/shaders/media/detail29.png',



	["_dirt2 t"] 			= '[Shader-Terreno]/shaders/media/23.png',
	["_dirt2track"] 		= '[Shader-Terreno]/shaders/media/22.png',
	["_dirt2trackr"] 		= '[Shader-Terreno]/shaders/media/22.png',


	["crackeddirt1"] 		= '[Shader-Terreno]/shaders/media/12.png',
	["forestfloor3"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["dirt2ded"] 			= '[Shader-Terreno]/shaders/media/8.png',


	["dirtgravel"] 		= '[Shader-Terreno]/shaders/media/dirty.png',
	["_dirt2"] 			= '[Shader-Terreno]/shaders/media/dirty.png',
	["_dirt2lod"] 			= '[Shader-Terreno]/shaders/media/dirty.png',

	["desmudtrail"]			= '[Shader-Terreno]/shaders/media/1.png',
	["weeroad"]			= '[Shader-Terreno]/shaders/media/1.png',
	["dirttracksgrass"]	= '[Shader-Terreno]/shaders/media/1.png',
	["dirttrack1"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["dirttrack1r"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["dirttrackl"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["dirttrackx"] 		= '[Shader-Terreno]/shaders/media/1.png',
	--["mudtrail"] 			= dirtRoadXTexture,
	["roadblendcu"] 		= '[Shader-Terreno]/shaders/media/1.png',
	["grasstrckend"] 		= '[Shader-Terreno]/shaders/media/33.png',
	["dirttracksfor"]		= '[Shader-Terreno]/shaders/media/1.png',

	--["mudtrail2"] 		= dirtRoadUTexture,

	["BLOCK"] 				= '[Shader-Terreno]/shaders/media/78.png',
	["brick"] 				= '[Shader-Terreno]/shaders/media/78.png',
	--["tunnelwall"] 		= blockTexture,


	["railwy"] 			= '[Shader-Terreno]/shaders/media/36.png',

	--["greyground"]			= greyTexture,

	["_1line"] 			= '[Shader-Terreno]/shaders/media/5.png',
	["des_road1"] 		= '[Shader-Terreno]/shaders/media/5.png',
	["_2line"] 			= '[Shader-Terreno]/shaders/media/5.png',
	["_lines"] 			= '[Shader-Terreno]/shaders/media/5.png',
	["dt_road"] 			= '[Shader-Terreno]/shaders/media/5.png',
	["Tar_vent"] 			= '[Shader-Terreno]/shaders/media/5.png',
	["Tar_free"] 			= '[Shader-Terreno]/shaders/media/5.png',
	["Tar_LeftR"] 		= '[Shader-Terreno]/shaders/media/5.png',	
	["cn2_troad"] 		= '[Shader-Terreno]/shaders/media/5.png',
	["countryroads"] 		= '[Shader-Terreno]/shaders/media/5.png',	
	["sjmlas2lod5n"] 		= '[Shader-Terreno]/shaders/media/5.png',	
	["snpdwargrn"] 		= '[Shader-Terreno]/shaders/media/5.png',	
	["1linefree"] 		= '[Shader-Terreno]/shaders/media/5.png',	
	["lawnroad"] 			= '[Shader-Terreno]/shaders/media/5.png',	

	["sl_laefreeway"] 	= '[Shader-Terreno]/shaders/media/13.png',	
	["freewaylae"] 	= '[Shader-Terreno]/shaders/media/13.png',	
	["lawroad"] 			= '[Shader-Terreno]/shaders/media/13.png',	
	["lawhiway"] 			= '[Shader-Terreno]/shaders/media/13.png',	
	
	["sjmloda991"] 		= '[Shader-Terreno]/shaders/media/13.png',	
	["dualroad"] 			= '[Shader-Terreno]/shaders/media/13.png',	
	["snpedtest"] 		= '[Shader-Terreno]/shaders/media/13.png',	
	["_1lineX"] 			= '[Shader-Terreno]/shaders/media/13.png',
	["roadverge"] 		= '[Shader-Terreno]/shaders/media/13.png',	
	["laneverge"] 		= '[Shader-Terreno]/shaders/media/13.png',	
	["hroadlod"] 			= '[Shader-Terreno]/shaders/media/13.png',	
	["townroad"] 			= '[Shader-Terreno]/shaders/media/13.png',	
	["roadgrassbl"] 		= '[Shader-Terreno]/shaders/media/13.png',	
	["roadwide"] 			= '[Shader-Terreno]/shaders/media/13.png',	
	["LODfreeway"] 		= '[Shader-Terreno]/shaders/media/13.png',	
	["MelroadL"] 			= '[Shader-Terreno]/shaders/media/13.png',	
	["roadLOD"] 			= '[Shader-Terreno]/shaders/media/13.png',	
	["bridgroad"] 		= '[Shader-Terreno]/shaders/media/13.png',	

	["freewayroads"] 		= '[Shader-Terreno]/shaders/media/13.png',	
	["lastroadbug"] 		= '[Shader-Terreno]/shaders/media/13.png',	
	["free2road"] 		= '[Shader-Terreno]/shaders/media/13.png',	
	["lanLODroad"] 		= '[Shader-Terreno]/shaders/media/13.png',	
	["sjmlaelodf995"] 	= '[Shader-Terreno]/shaders/media/13.png',	
	["sjmlaelodf5"] 		= '[Shader-Terreno]/shaders/media/13.png',	
	
	["craproad1"] 		= '[Shader-Terreno]/shaders/media/13.png',	
	["lae2roadiv"] 		= '[Shader-Terreno]/shaders/media/13.png',	
	["roadcoast5"] 		= '[Shader-Terreno]/shaders/media/13.png',	
	["roadcoast6"] 		= '[Shader-Terreno]/shaders/media/13.png',	
	["freewayfae"] 		= '[Shader-Terreno]/shaders/media/13.png',	
	["lae2rdcst"] 		= '[Shader-Terreno]/shaders/media/13.png',	

	["ws_freeway3"] 			= '[Shader-Terreno]/shaders/media/13.png',	
	["lanefreeway"] 			= '[Shader-Terreno]/shaders/media/13.png',	
	["road5"] 				= '[Shader-Terreno]/shaders/media/13.png',
	["sfroad2"] 				= '[Shader-Terreno]/shaders/media/13.png',
	["roadnew"] 				= '[Shader-Terreno]/shaders/media/13.png',
	["greypavroad"] 			= '[Shader-Terreno]/shaders/media/13.png',				
	["hiwayout"] 				= '[Shader-Terreno]/shaders/media/13.png',
	["hiwaymid"] 				= '[Shader-Terreno]/shaders/media/13.png',
	["hiwayend"] 				= '[Shader-Terreno]/shaders/media/13.png',
	["vegasroad"] 			= '[Shader-Terreno]/shaders/media/13.png',
	["dirtyroad"] 			= '[Shader-Terreno]/shaders/media/13.png',			
	["roadirt"] 				= '[Shader-Terreno]/shaders/media/13.png',
	["road01_lod"] 			= '[Shader-Terreno]/shaders/media/13.png',
	["road02_lod"] 			= '[Shader-Terreno]/shaders/media/13.png',
	["road02c_lod"] 			= '[Shader-Terreno]/shaders/media/13.png',
	["road02b_lod"] 			= '[Shader-Terreno]/shaders/media/13.png',
	["road02d_lod"] 			= '[Shader-Terreno]/shaders/media/13.png',
	["roadjunc"] 				= '[Shader-Terreno]/shaders/media/13.png',
	["junction"] 				= '[Shader-Terreno]/shaders/media/13.png',
	["dt_road"] 				= '[Shader-Terreno]/shaders/media/13.png',
	["gasroad"] 				= '[Shader-Terreno]/shaders/media/13.png',
	["striproad"] 			= '[Shader-Terreno]/shaders/media/13.png',
	["roadgas"] 				= '[Shader-Terreno]/shaders/media/13.png',	
	["lae2rdfuk"] 			= '[Shader-Terreno]/shaders/media/13.png',	
	["freewaylaw2"] 			= '[Shader-Terreno]/shaders/media/13.png',	

	["hiwaygras_lod"] 		= '[Shader-Terreno]/shaders/media/13.png',
	["roads_sfnLOD"] 			= '[Shader-Terreno]/shaders/media/13.png',
	["LOD_mountainroad"] 		= '[Shader-Terreno]/shaders/media/13.png',

	["pave"] 					= '[Shader-Terreno]/shaders/media/26.png',
	["hiwayin"] 				= '[Shader-Terreno]/shaders/media/26.png',	
	["sidewalk"] 				= '[Shader-Terreno]/shaders/media/26.png',	
	["hoodlawn"] 				= '[Shader-Terreno]/shaders/media/26.png',	
	["sidewgrass"] 			= '[Shader-Terreno]/shaders/media/26.png',	
	["backalley"] 			= '[Shader-Terreno]/shaders/media/26.png',	
	["craproad5"] 			= '[Shader-Terreno]/shaders/media/26.png',	
	--["sub_pen_conc"] 		= red,

	["rocktbrn128"] 		= '[Shader-Terreno]/shaders/media/29.png',
	["rocktbrn_"] 			= '[Shader-Terreno]/shaders/media/44.png',
	["des_dirt2blend"] 	= '[Shader-Terreno]/shaders/media/21.png',

	["rocktq128"] 			= '[Shader-Terreno]/shaders/media/45.png',					
	["rocktq128_dirt"] 	= '[Shader-Terreno]/shaders/media/25.png',					
	["rocktq128ble"] 		= '[Shader-Terreno]/shaders/media/45.png',						
	--["rockdetail"] 		= mediumRock,	
	["yelrock"] 			= '[Shader-Terreno]/shaders/media/45.png',			
	["rocktq128_forest"] 	= '[Shader-Terreno]/shaders/media/25.png',
	["rocktq128_grass"] 	= '[Shader-Terreno]/shaders/media/25.png',

	["descliff"] 			= '[Shader-Terreno]/shaders/media/51.png',
	["cuntbrncliff"] 		= '[Shader-Terreno]/shaders/media/24.png',
	["lasclif"] 			= '[Shader-Terreno]/shaders/media/24.png',

	["redrockmid"] 		= '[Shader-Terreno]/shaders/media/3.png',
	["redrockbot"] 		= '[Shader-Terreno]/shaders/media/4.png',

	["vgs_rockbot"] 		= '[Shader-Terreno]/shaders/media/30.png',
	["vgs_rockmid"] 		= '[Shader-Terreno]/shaders/media/29.png',


	["redrock1"] 			= '[Shader-Terreno]/shaders/media/7.png',
	["redrock2"] 			= '[Shader-Terreno]/shaders/media/7.png',
	["sm_rock2"] 			= '[Shader-Terreno]/shaders/media/7.png',
	["rocky"] 			= '[Shader-Terreno]/shaders/media/7.png',
	

	-- ["des_bush1"] 			= bush0,
	-- ["des_bush2"] 			= bush1,
	-- ["des_bush3"] 			= bush2,
	["josh_bark"] 			= '[Shader-Terreno]/shaders/media/40.png',
	["josh_leaf"] 			= '[Shader-Terreno]/shaders/media/39.png',

	["traintrax"] 			= '[Shader-Terreno]/shaders/media/14.png',
	["traingrav"] 			= '[Shader-Terreno]/shaders/media/15.png',
	["dirtgravel"] 			= '[Shader-Terreno]/shaders/media/16.png',

	--["water"] 				= '[Shader-Terreno]/shaders/media/73.png',,
	
	["roadedge"] 				= '[Shader-Terreno]/shaders/media/21.png',

	["bonyrd_skin"] 			= '[Shader-Terreno]/shaders/media/38.png',
	["sam_camo"] 				= '[Shader-Terreno]/shaders/media/78.png',

	--["*parking2plain*"] 		= cement,
	--["*concrete*"] 				= cement,

}


----------------------------------------------------------------
-- enableDetail
----------------------------------------------------------------
function enableDetail()
	shader = dxCreateShader ( "[Shader-Terreno]/fx/world.fx" )
	for tex, shad in pairs(keyToTexture) do
		tx = dxCreateTexture(shad) 
		dxSetShaderValue( shader, "t",  tx);
		engineApplyShaderToWorldTexture (shader , tex )
	end
end
----------------------------------------------------------------
-- disableDetail
----------------------------------------------------------------
function disableDetail()
	for tex, shad in pairs(keyToTexture) do
		engineRemoveShaderFromWorldTexture ( shader, tex )
	end
	if isElement( tx ) then
		destroyElement( tx )
	end
	if isElement( shader ) then
		destroyElement( shader )
	end
end



function replaceShader(image)
	
	shader = dxCreateShader ( "[Shader-Terreno]/fx/world.fx" )
	if shader then
		dxSetShaderValue( shader, "t", image );
		--outputChatBox( "World fx is using technique " .. tec )
	end
	return shader
end



---------------------------------

if fileExists("c_detail.lua") == true then
fileDelete("c_detail.lua")
end