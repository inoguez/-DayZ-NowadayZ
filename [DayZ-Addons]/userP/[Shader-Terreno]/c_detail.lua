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


tablaShaders = {}
----------------------------------------------------------------
-- enableDetail
----------------------------------------------------------------

function enable( ... )
	
	cloudTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/35.png', "dxt3")
	waterTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/73.png', "dxt3")

	sandGrass = dxCreateTexture('[Shader-Terreno]/shaders/media/62.png', "dxt3")
	sandGrass2 = dxCreateTexture('[Shader-Terreno]/shaders/media/72.png', "dxt3")

	grassTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/1.png', "dxt3")
	grass1to2Texture = dxCreateTexture('[Shader-Terreno]/shaders/media/67.png', "dxt3")	
	

	grgrass = dxCreateTexture('[Shader-Terreno]/shaders/media/46.png', "dxt3")
	grgrass2grass = dxCreateTexture('[Shader-Terreno]/shaders/media/57.png', "dxt3")
	grgrass2Rock = dxCreateTexture('[Shader-Terreno]/shaders/media/47.png', "dxt3")
	grgrass2RockU = dxCreateTexture('[Shader-Terreno]/shaders/media/30.png', "dxt3")
	grgrass2Road = dxCreateTexture('[Shader-Terreno]/shaders/media/48.png', "dxt3")
	grgrass2MediumGrass = dxCreateTexture('[Shader-Terreno]/shaders/media/69.png', "dxt3")
	rock2Road = dxCreateTexture('[Shader-Terreno]/shaders/media/22.png', "dxt3")

	mediumGrass = dxCreateTexture('[Shader-Terreno]/shaders/media/49.png', "dxt3")
	mediumGrass2Grass = dxCreateTexture('[Shader-Terreno]/shaders/media/56.png', "dxt3")
	mediumGrass2GrassU = dxCreateTexture('[Shader-Terreno]/shaders/media/66.png', "dxt3")
	mediumGrass2GrassD = dxCreateTexture('[Shader-Terreno]/shaders/media/67.png', "dxt3")

	-- dirtRoadTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/2.png', "dxt3")
	-- dirtRoadRTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/18.png', "dxt3")
	-- dirtRoadLTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/6.png', "dxt3")
	-- dirtRoadXTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/19.png', "dxt3")
	-- dirtRoadUTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/32.png', "dxt3")
	dirtRoadEndTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/33.png', "dxt3")

	roadEdge = dxCreateTexture('[Shader-Terreno]/shaders/media/26.png', "dxt3")

	rockUTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/3.png', "dxt3")
	rockMTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/7.png', "dxt3")
	rockDTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/4.png', "dxt3")

	dirtTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/12.png', "dxt3")
	dirt2GrassTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/52.png', "dxt3")
	dirt2GrassTextureU = dxCreateTexture('[Shader-Terreno]/shaders/media/65.png', "dxt3")

	rockHole = dxCreateTexture('[Shader-Terreno]/shaders/media/27.png', "dxt3")	

	bigRock = dxCreateTexture('[Shader-Terreno]/shaders/media/29.png', "dxt3")	
	bigRockToRock = dxCreateTexture('[Shader-Terreno]/shaders/media/44.png', "dxt3")	
	grassToRock = dxCreateTexture('[Shader-Terreno]/shaders/media/51.png', "dxt3")
	grassToRockR = dxCreateTexture('[Shader-Terreno]/shaders/media/43.png', "dxt3")

	mediumRock = dxCreateTexture('[Shader-Terreno]/shaders/media/45.png', "dxt3")
	mediumRock2Grass = dxCreateTexture('[Shader-Terreno]/shaders/media/25.png', "dxt3")

	--vegRockBot = dxCreateTexture('[Shader-Terreno]/shaders/media/17.png', "dxt3")
	lsCliff2 = dxCreateTexture('[Shader-Terreno]/shaders/media/24.png', "dxt3")


	palm_bark = dxCreateTexture('[Shader-Terreno]/shaders/media/40.png', "dxt3")
	palm_leaf = dxCreateTexture('[Shader-Terreno]/shaders/media/39.png', "dxt3")

	grassDeadTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/9.png', "dxt3")
	grassToDeadTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/8.png', "dxt3")
	grassToDeadTextureU = dxCreateTexture('[Shader-Terreno]/shaders/media/8.png', "dxt3")
	deadGrassRoad = dxCreateTexture('[Shader-Terreno]/shaders/media/55.png', "dxt3")
	deadFieldTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/53.png', "dxt3")
	deadFieldTextureToDeadGrass = dxCreateTexture('[Shader-Terreno]/shaders/media/54.png', "dxt3")

	oldAeroTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/4.png', "dxt3")

	gravelToRoadM = dxCreateTexture('[Shader-Terreno]/shaders/media/22.png', "dxt3")
	gravelToRoadL = dxCreateTexture('[Shader-Terreno]/shaders/media/23.png', "dxt3")
	gravel = dxCreateTexture('[Shader-Terreno]/shaders/media/20.png', "dxt3")
	gravelToRoadU = dxCreateTexture('[Shader-Terreno]/shaders/media/21.png', "dxt3")
	gravelToRoadD = dxCreateTexture('[Shader-Terreno]/shaders/media/79.png', "dxt3")

	vegRockBot = dxCreateTexture('[Shader-Terreno]/shaders/media/30.png', "dxt3")
	vegRockMid = dxCreateTexture('[Shader-Terreno]/shaders/media/29.png', "dxt3")
	vegRockLeft = dxCreateTexture('[Shader-Terreno]/shaders/media/31.png', "dxt3")
	vegRockCorn = dxCreateTexture('[Shader-Terreno]/shaders/media/80.png', "dxt3")
    con = dxCreateTexture('[Shader-Terreno]/shaders/media/83.png', "dxt3")
    co2 = dxCreateTexture('[Shader-Terreno]/shaders/media/84.png', "dxt3")
	--vegRockNoCorn = dxCreateTexture('[Shader-Terreno]/shaders/media/81.png', "dxt3")

	wallTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/36.png', "dxt3")

	roadLineU = dxCreateTexture('[Shader-Terreno]/shaders/media/5.png', "dxt3")
	roadRTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/13.png', "dxt3")

	grassRoadTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/55.png', "dxt3")

	bush0 = dxCreateTexture('[Shader-Terreno]/shaders/media/41.png', "dxt3")
	-- bush1 = dxCreateTexture('[Shader-Terreno]/shaders/media/10.png', "dxt3")
	-- bush2 = dxCreateTexture('[Shader-Terreno]/shaders/media/42.png', "dxt3")

	train = dxCreateTexture('[Shader-Terreno]/shaders/media/14.png', "dxt3")
	trainGravel = dxCreateTexture('[Shader-Terreno]/shaders/media/15.png', "dxt3")
	dirtGravel = dxCreateTexture('[Shader-Terreno]/shaders/media/16.png', "dxt3")

	blockTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/78.png', "dxt3")
	greyTexture = dxCreateTexture('[Shader-Terreno]/shaders/media/38.png', "dxt3")
	testRock = dxCreateTexture('[Shader-Terreno]/shaders/media/60.png', "dxt3") 
	cement = dxCreateTexture('[Shader-Terreno]/shaders/media/58.png', "dxt3") 

	

	keyToTexture = {
			--["cloud*"]				= cloudTexture,
			["*_dirt1*"] 			= grassTexture,
			["*scrub1*"]			= grassTexture,
			["*oldrun*"] 			= grassTexture,
			["*panelconc*"]			= grassTexture,
			["*ripplsand*"] 		= grassTexture,
			["*dirtgrassmix*"] 		= grassTexture,
			["grassdeadbrn256"] 	= grassTexture,
			["*grasstype5*"] 		= grassTexture,
			["*heavygrass*"] 		= grassTexture,
			["*grassbrn"] 			= grassTexture,
			["*grassbrn_lod"] 		= grassTexture,
			["*grass2scrub*"] 		= grassTexture,
			["*grass2dirt*"] 		= grassTexture,		
			["*desgrasand*"] 		= grassTexture,			
			["*grass_gen*"] 		= grassTexture,
			["*grass_lod*"] 		= grassTexture,
			["*dirt64b2*"] 			= grassTexture,
			["Grass"] 				= grassTexture,
			["Grass_128*"] 			= grassTexture,
			["Grass_lod"] 			= grassTexture,
			["*sandgrnd*"] 			= grassTexture,
			["*grass_dry*"] 		= grassTexture,
			["*yardgras*"] 			= grassTexture,
			["*vegasgolflod*"] 		= grassTexture,
			["newcrop3"] 			= grassTexture,
			["desgreengrassmix"] 	= grassTexture,
			["*con2sand*"] 			= grassTexture,
			["*grassdry*"] 			= grassTexture,
			["*vgn_ground*"] 		= grassTexture,
			["*drvin_ground*"] 		= grassTexture,
			["*grasslod*"] 			= grassTexture,
			["*brngrass*"] 			= grassTexture,
			["*desgrassbrnLOD*"] 		= grassTexture,
			["*vgsEcoast*"] 			= grassTexture,
			["*vgwestbildlod*"] 		= grassTexture,
			["*sfn_grass1*"] 			= grassTexture,
			["*asfnsjm6*"] 				= grassTexture,
			["*asfnsjm94*"] 			= grassTexture,
			["*asfnsjm93*"] 			= grassTexture,
			["*asfnsjm9i*"] 			= grassTexture,
			["*asfnsjm9h*"] 			= grassTexture,
			["*grass4dirty*"] 			= grassTexture,
			["*grasstype4"] 			= grassTexture,
			["*oldflowerb*"]			= grassTexture,
			["*grassbrn_grn*"] 			= grassTexture,
			["*desertgryard*"] 			= grassTexture,
			["*desertgryard*"] 			= grassTexture,
			["desertstones256forestm"] 	= grassTexture,
			["*dirt2gygras*"] 			= grassTexture,
			["*sl_sfn*"] 				= grassTexture,
			["florestfloor256_blenddirt"] = grassTexture,
			["grassdead1"]			    = grassTexture,
			["forestfloor_sones256"]	= grassTexture,
			["forestfloor3_forest"]	    = grassTexture,
            ["forestfloorblendded"]	    = grassTexture,
			["*grasstype10*"]			= grassTexture,
			["*grasstype4_10*"]			= grassTexture,
			["*grasstype4_forest*"]		= grassTexture,
			["*florestfloor3*"]		    = grassTexture,
			["*florestfloor3_florest*"]	= grassTexture,
			["grasstype4_forestblend"]  = grassTexture,
			["*desertgravelgrass*"]		= grassTexture,
			["*dirtKB_64*"]				= grassTexture,
			["*grassdeep1*"]			= grassTexture,
			["*desmudgrass*"]			= grassTexture,
			["*grasspatch*"]			= grassTexture,
			["*Grass_path*"]			= grassTexture,
			["desertstones256"] 		= grassTexture,
			["des_dirt2stones*"] 		= grassTexture,
			["des_dirt2grass*"] 		= grassTexture,
			["desgreengrass"]			= grassTexture,
			["grasstype7*"]				= grassTexture,
			["grassdirtblend"]				= grassTexture,
			["compurch_lod"]				= grassTexture,
			["*church_dirt*"]				= grassTexture,
			["*grasstype3*"]				= grassTexture,
			["*grasstype4-3*"]				= grassTexture,			
			["desmudtrail"]			= grassTexture,
			["*weeroad*"]			= grassTexture,
			["*dirttracksgrass*"]	= grassTexture,
			["*dirttrack1*"] 		= grassTexture,
			["*dirttrack1r*"] 		= grassTexture,
			["*dirttrackl*"] 		= grassTexture,
			["*dirttrackx*"] 		= grassTexture,
			["*forestfloor256*"]		= grassTexture,
			["forestfloor256_blenddirt"]		= grassTexture,
			["*forestfloor256L*"]		= grassTexture,
			["*forestfloorgrass*"]		= grassTexture,
			["dirtblendlit*"] 				= grassTexture,
			["*hiway2sand*"] 			= grassTexture,
			["*forestfloor3"] 		= grassTexture,
			["*roadblendcu*"] 		= grassTexture,
			["*dirttracksfor*"]		= grassTexture,
			
		
			["*_1line*"] 			= roadLineU,
			["*des_road1*"] 		= roadLineU,
			["*_2line*"] 			= roadLineU,
			["*_lines*"] 			= roadLineU,
			["*dt_road*"] 			= roadLineU,
			["*Tar_vent*"] 			= roadLineU,
			["*Tar_free*"] 			= roadLineU,
			["*Tar_LeftR*"] 		= roadLineU,	
			["*cn2_troad*"] 		= roadLineU,
			["*countryroads*"] 		= roadLineU,	
			["*sjmlas2lod5n"] 		= roadLineU,	
			["*snpdwargrn*"] 		= roadLineU,	
			["*1linefree*"] 		= roadLineU,	
			["*lawnroad*"] 			= roadLineU,	

			["grass10_stones256"] 		= dirt2GrassTexture,
			["*grass10dir*"] 			= dirt2GrassTexture,
			["*stonesgrass*"] 			= dirt2GrassTexture,
			["*frate_doors128red*"] 		= con2,
            ["*frate64_red*"] 			= con,

			["sw_grass01a*"]			= grassToDeadTexture,			
			["sw_grassB01*"]			= deadFieldTextureToDeadGrass,			
			["sw_grass01"]				= grassDeadTexture,
			["sw_grass01LOD"]			= grassDeadTexture,
			["sw_dirt01*"]				= grassDeadTexture,
			["sw_crops*"]				= deadFieldTexture,
			["grassgrnbrnx*"]			= deadFieldTexture,
			["sw_farmroad*"]			= deadGrassRoad,

			["*desertgryard*"] 			= grassDeadTexture,

			["*forestfloorblend*"]		= grassToDeadTextureU,
			["*forestfloorblendb*"]		= grassToDeadTextureU,

			["*forestfloorbranch*"]		= grgrass,
			["*forestfloorbranch256*"]	= grgrass,

			

			
			

			["*mounttrail*"]			= dirtTexture,	
			--["*des_dam_conc*"]			= dirtTexture,	
			["*forest_rocks*"] 			= dirt2GrassTextureU,
			
			["*sw_stones*"] 			= dirtTexture,
			["*mountainskree*"]			= dirtTexture,
			["stones256"] 				= dirtTexture,
			
			["*grasstype4blnd*"] 		= dirt2GrassTextureU,
			["*mountdirt2grass"]		= dirt2GrassTexture,	
			["*mountdirt"]				= dirtTexture,	

			["*rock2grgrass*"] 		= vegRockBot,
			["*mountrock*"] 		= vegRockMid,
			--["*mountdirt*"] 		= vegRockMid, TODO:
			["*rockhole*"] 			= rockHole,
			["*sfn_rocktbrn*"] 		= vegRockLeft,
			["*golf_grassrock*"] 	= vegRockMid,
			["*asfnsjm9zb*"] 		= vegRockMid,
			["*sw_rockgrass1*"] 	= vegRockMid,
			["*sw_rockgrassB*"] 	= vegRockBot,

			["*rockdetail2*"] 		= bigRock,
			["*grassbrn2rock*"] 	= grassToRock,
			

			
					
			--["*forestfloor256_blend*"]		= gravelToRoadU,
			--["*forestfloor256mudblend*"]	= gravelToRoadD,
			

			["*mountdirt2forest*"]			= grgrass2grass,
			["*mountroad*"]					= rock2Road,		
			

			["*sfncn_rockgrass3*"] 			= vegRockCorn,
			["*sfncn_rockgrass4*"] 			= vegRockNoCorn,
			["*rock_country*"] 				= vegRockMid,

			["sw_sandgrass"]				= sandGrass,
			["sw_sandgrass4"]				= sandGrass2,

			["*grasstype4_mudblend*"] 		= gravelToRoadU,			
			["desmud"] 						= gravel,
			
		
			["desertstones256for*"] 		= gravelToRoadD,
			["forestfloor_sones*"] 			= gravelToRoadU,
			

			["brngrss2stones*"] 			= gravelToRoadU,			

			
			["*patchygravel*"] 			= alpha,



			["*_dirt2 t*"] 			= gravelToRoadL,
			["*_dirt2track"] 		= gravelToRoadM,
			["*_dirt2trackr*"] 		= gravelToRoadM,


			["*crackeddirt1*"] 		= dirtTexture,
			
			["*dirt2ded*"] 			= grassToDeadTexture,


			["*dirtgravel*"] 		= gravel,
			["*_dirt2"] 			= gravel,
			["*_dirt2lod"] 			= gravel,

			
			--["*mudtrail*"] 			= dirtRoadXTexture,
			
			["*grasstrckend*"] 		= dirtRoadEndTexture,
			

			--["*mudtrail2*"] 		= dirtRoadUTexture,

			["BLOCK*"] 				= blockTexture,
			["brick*"] 				= blockTexture,
			--["*tunnelwall*"] 		= blockTexture,


			["*railwy*"] 			= wallTexture,

			--["greyground*"]			= greyTexture,

			

			["*sl_laefreeway*"] 	= roadRTexture,	
			["*freewaylae*"] 	= roadRTexture,	
			["*lawroad*"] 			= roadRTexture,	
			["*lawhiway*"] 			= roadRTexture,	
			
			["*sjmloda991*"] 		= roadRTexture,	
			["*dualroad*"] 			= roadRTexture,	
			["*snpedtest*"] 		= roadRTexture,	
			["*_1lineX*"] 			= roadRTexture,
			["*roadverge*"] 		= roadRTexture,	
			["*laneverge*"] 		= roadRTexture,	
			["*hroadlod*"] 			= roadRTexture,	
			["*townroad*"] 			= roadRTexture,	
			["*roadgrassbl*"] 		= roadRTexture,	
			["*roadwide*"] 			= roadRTexture,	
			["*LODfreeway*"] 		= roadRTexture,	
			["*MelroadL*"] 			= roadRTexture,	
			["*roadLOD*"] 			= roadRTexture,	
			["*bridgroad*"] 		= roadRTexture,	

			["*freewayroads*"] 		= roadRTexture,	
			["*lastroadbug*"] 		= roadRTexture,	
			["*free2road*"] 		= roadRTexture,	
			["*lanLODroad*"] 		= roadRTexture,	
			["*sjmlaelodf995*"] 	= roadRTexture,	
			["*sjmlaelodf5"] 		= roadRTexture,	
			
			["*craproad1*"] 		= roadRTexture,	
			["*lae2roadiv*"] 		= roadRTexture,	
			["*roadcoast5*"] 		= roadRTexture,	
			["*roadcoast6*"] 		= roadRTexture,	
			["*freewayfae*"] 		= roadRTexture,	
			["*lae2rdcst*"] 		= roadRTexture,	

			["*ws_freeway3*"] 			= roadRTexture,	
			["*lanefreeway*"] 			= roadRTexture,	
			["*road5*"] 				= roadRTexture,
			["*sfroad2*"] 				= roadRTexture,
			["*roadnew*"] 				= roadRTexture,
			["*greypavroad*"] 			= roadRTexture,				
			["*hiwayout*"] 				= roadRTexture,
			["*hiwaymid*"] 				= roadRTexture,
			["*hiwayend*"] 				= roadRTexture,
			["*vegasroad*"] 			= roadRTexture,
			["*dirtyroad*"] 			= roadRTexture,			
			["*roadirt*"] 				= roadRTexture,
			["*road01_lod*"] 			= roadRTexture,
			["*road02_lod*"] 			= roadRTexture,
			["*road02c_lod*"] 			= roadRTexture,
			["*road02b_lod*"] 			= roadRTexture,
			["*road02d_lod*"] 			= roadRTexture,
			["*roadjunc*"] 				= roadRTexture,
			["*junction*"] 				= roadRTexture,
			["*dt_road*"] 				= roadRTexture,
			["*gasroad*"] 				= roadRTexture,
			["*striproad*"] 			= roadRTexture,
			["*roadgas*"] 				= roadRTexture,	
			["*lae2rdfuk*"] 			= roadRTexture,	
			["*freewaylaw2*"] 			= roadRTexture,	

			["*hiwaygras_lod*"] 		= roadRTexture,
			["*roads_sfnLOD*"] 			= roadRTexture,
			["*LOD_mountainroad*"] 		= roadRTexture,
	
			["*pave*"] 					= roadEdge,
			["*hiwayin*"] 				= roadEdge,	
			["*sidewalk*"] 				= roadEdge,	
			["*hoodlawn*"] 				= roadEdge,	
			["*sidewgrass*"] 			= roadEdge,	
			["*backalley*"] 			= roadEdge,	
			["*craproad5*"] 			= roadEdge,	
			--["*sub_pen_conc*"] 		= red,

			["rocktbrn128*"] 		= bigRock,
			["rocktbrn_*"] 			= bigRockToRock,
			["des_dirt2blend*"] 	= gravelToRoadU,
		
			["*rocktq128"] 			= mediumRock,					
			["*rocktq128_dirt"] 	= mediumRock2Grass,					
			["*rocktq128ble*"] 		= mediumRock,						
			--["*rockdetail*"] 		= mediumRock,	
			["*yelrock*"] 			= mediumRock,			
			["*rocktq128_forest*"] 	= mediumRock2Grass,
			["*rocktq128_grass*"] 	= mediumRock2Grass,

			["*descliff*"] 			= grassToRock,
			["*cuntbrncliff*"] 		= lsCliff2,
			["*lasclif*"] 			= lsCliff2,

			["*redrockmid*"] 		= rockUTexture,
			["*redrockbot*"] 		= rockDTexture,

			["*vgs_rockbot*"] 		= vegRockBot,
			["*vgs_rockmid*"] 		= vegRockMid,


			["*redrock1*"] 			= rockMTexture,
			["*redrock2*"] 			= rockMTexture,
			["*sm_rock2*"] 			= rockMTexture,
			["*rocky*"] 			= rockMTexture,
			

			-- ["*des_bush1*"] 			= bush0,
			-- ["*des_bush2*"] 			= bush1,
			-- ["*des_bush3*"] 			= bush2,
			["*josh_bark*"] 			= palm_bark,
			["*josh_leaf*"] 			= palm_leaf,

			["*traintrax*"] 			= train,
			["*traingrav*"] 			= trainGravel,
			["*dirtgravel*"] 			= dirtGravel,

			--["*water*"] 				= waterTexture,
			
			["*roadedge*"] 				= gravelToRoadU,

			["*bonyrd_skin*"] 			= greyTexture,
			["*sam_camo*"] 				= blockTexture,

			--["*parking2plain*"] 		= cement,
			--["*concrete*"] 				= cement,

		}
end





local row = {}
function enableDetail()
	if bEffectEnabled then return end
	enable()
	
	-- Create shaders
	brickWallShader, tec = getBrickWallShader()
	if brickWallShader then
		-- Only create the rest if the first one is OK
		grassShader = getGrassShader()
		roadShader = getRoadShader()
		road2Shader = getRoad2Shader()
		paveDirtyShader = getPaveDirtyShader()
		paveStretchShader = getPaveStretchShader()
		barkShader = getBarkShader()
		rockShader = getRockShader()
		mudShader = getMudShader()
		concreteShader = getBrickWallShader()	-- TODO make this better
		sandShader = getMudShader()				-- TODO make this better

	end

	-- Get list of all elements used
	effectParts = {
						detail22Texture, detail58Texture, detail68Texture, detail63Texture, dirtyTexture,
						detail04Texture, detail29Texture, detail55Texture, detail35TTexture,
						brickWallShader, grassShader, roadShader, road2Shader, paveDirtyShader,
						paveStretchShader, barkShader, rockShader, mudShader,
						concreteShader, sandShader
					}

	-- Check list of all elements used
	bAllValid = true
	for _,part in ipairs(effectParts) do
		bAllValid = part and bAllValid
	end

	bEffectEnabled = true

	if not bAllValid then
		disableDetail()
	else	
		--engineApplyShaderToWorldTexture ( roadShader, "*dirtyroad*" )
		--engineApplyShaderToWorldTexture ( roadShader, "*vegasroad*" )
		--engineApplyShaderToWorldTexture ( roadShader, "*roadirt*" )
		--engineApplyShaderToWorldTexture ( roadShader, "*tar*" )
		--engineApplyShaderToWorldTexture ( paveDirtyShader, "*dirtypave*" )
		--engineApplyShaderToWorldTexture ( concreteShader, "*conc*" )
		--engineApplyShaderToWorldTexture ( road2Shader, "*hiway*" )
		--engineApplyShaderToWorldTexture ( roadShader, "*junction*" )
		--engineApplyShaderToWorldTexture ( paveStretchShader, "snpedtest*" )


		engineApplyShaderToWorldTexture ( roadShader, "*asphalt*" )
		engineApplyShaderToWorldTexture ( concreteShader, "*wall*" )
		engineApplyShaderToWorldTexture ( concreteShader, "*bridge*" )
		engineApplyShaderToWorldTexture ( concreteShader, "*drain*" )
		engineApplyShaderToWorldTexture ( paveDirtyShader, "*cross*" )
		engineApplyShaderToWorldTexture ( barkShader, "*leave*" )
		engineApplyShaderToWorldTexture ( barkShader, "*log*" )
		engineApplyShaderToWorldTexture ( barkShader, "*d_bark*" )
		engineApplyShaderToWorldTexture ( roadShader, "*carpark*" )		
		engineApplyShaderToWorldTexture ( paveStretchShader, "sidelatino*" )
		engineApplyShaderToWorldTexture ( paveStretchShader, "sjmhoodlawn41" )


		 
		
		for tex, shad in pairs(keyToTexture) do
			row[tex] = dxCreateShader ( "[Shader-Terreno]/fx/world.fx" )
			dxSetShaderValue( row[tex], "gTexture", shad )
			engineApplyShaderToWorldTexture ( row[tex], tex )
			--table.insert(tablaShaders, shader)
		end

		for i,part in ipairs(effectParts) do
			if getElementType(part) == "shader" then
				engineRemoveShaderFromWorldTexture ( part, "tx*" )
				engineRemoveShaderFromWorldTexture ( part, "lod*" )
			end
		end	


	end

end
----------------------------------------------------------------
-- disableDetail
----------------------------------------------------------------
function disableDetail()
	if not bEffectEnabled then return end

	for tex, shad in pairs(keyToTexture) do
		engineRemoveShaderFromWorldTexture ( row[tex], tex)
		if isElement( shad ) then
			destroyElement( shad )
		end
	end

	
	if isElement( shader ) then
		destroyElement( shader )
	end

	-- Destroy all parts
	for _,part in ipairs(effectParts) do
		if part then
			destroyElement( part )
		end
	end
	effectParts = {}
	bAllValid = false

	-- Flag effect as stopped
	bEffectEnabled = false
end


----------------------------------------------------------------
-- All the shaders
----------------------------------------------------------------
function getBrickWallShader()
	return getMakeShader( getBrickWallSettings () )
end

function getGrassShader()
	return getMakeShader( getGrassSettings () )
end

function getRoadShader()
	return getMakeShader( getRoadSettings () )
end

function getRoad2Shader()
	return getMakeShader( getRoad2Settings () )
end

function getPaveDirtyShader()
	return getMakeShader( getPaveDirtySettings () )
end

function getPaveStretchShader()
	return getMakeShader( getPaveStretchSettings () )
end

function getBarkShader()
	return getMakeShader( getBarkSettings () )
end

function getRockShader()
	return getMakeShader( getRockSettings () )
end

function getMudShader()
	return getMakeShader( getMudSettings () )
end

function getMakeShader(v)
	--  Create shader with a draw range of 100 units
	local shader,tec = dxCreateShader ( "[Shader-Terreno]/fx/detail.fx", 1, 500 )
	if shader then
		--dxSetShaderValue( shader, "sDetailTexture", v.texture )
		dxSetShaderValue( shader, "sDetailScale", v.detailScale )
		dxSetShaderValue( shader, "sFadeStart", v.sFadeStart )
		dxSetShaderValue( shader, "sFadeEnd", v.sFadeEnd )
		dxSetShaderValue( shader, "sStrength", v.sStrength )
		dxSetShaderValue( shader, "sAnisotropy", v.sAnisotropy )
	end
	return shader,tec
end

function replaceShader(image)
	
	if shader then
		
		--outputChatBox( "World fx is using technique " .. tec )
	end
	return shader,tec
end


-- brick wall type thing
---------------------------------
function getBrickWallSettings ()
	local v = {}
	v.texture=detail22Texture
	v.detailScale=3
	v.sFadeStart=60
	v.sFadeEnd=100
	v.sStrength=0.6
	v.sAnisotropy=1
	return v
end
---------------------------------

-- grass
---------------------------------
function getGrassSettings ()
	local v = {}
	v.texture=detail58Texture
	v.detailScale=2
	v.sFadeStart=60
	v.sFadeEnd=100
	v.sStrength=0.6
	v.sAnisotropy=1
	return v
end
---------------------------------

-- road
---------------------------------
function getRoadSettings ()
	local v = {}
	v.texture=detail68Texture
	v.detailScale=1
	v.sFadeStart=60
	v.sFadeEnd=100
	v.sStrength=0.6
	v.sAnisotropy=1
	return v
end
---------------------------------

-- road2
---------------------------------
function getRoad2Settings ()
	local v = {}
	v.texture=detail63Texture
	v.detailScale=1
	v.sFadeStart=90
	v.sFadeEnd=100
	v.sStrength=0.7
	v.sAnisotropy=0.9
	return v
end
---------------------------------

-- dirty pave
---------------------------------
function getPaveDirtySettings ()
	local v = {}
	v.texture=dirtyTexture
	v.detailScale=1
	v.sFadeStart=60
	v.sFadeEnd=100
	v.sStrength=0.4
	v.sAnisotropy=1
	return v
end
---------------------------------

-- stretch pave 
---------------------------------
function getPaveStretchSettings ()
	local v = {}
	v.texture=detail04Texture
	v.detailScale=1
	v.sFadeStart=80
	v.sFadeEnd=100
	v.sStrength=0.3
	v.sAnisotropy=1
	return v
end
---------------------------------

-- tree bark
---------------------------------
function getBarkSettings ()
	local v = {}
	v.texture=detail29Texture
	v.detailScale=1
	v.sFadeStart=80
	v.sFadeEnd=100
	v.sStrength=0.6
	v.sAnisotropy=1
	return v
end
---------------------------------

-- rock
---------------------------------
function getRockSettings ()
	local v = {}
	v.texture=detail55Texture
	v.detailScale=1
	v.sFadeStart=80
	v.sFadeEnd=100
	v.sStrength=0.5
	v.sAnisotropy=1
	return v
end
---------------------------------

-- mud
---------------------------------
function getMudSettings ()
	local v = {}
	v.texture=detail35TTexture
	v.detailScale=2
	v.sFadeStart=80
	v.sFadeEnd=100
	v.sStrength=0.6
	v.sAnisotropy=1
	return v
end


---------------------------------

if fileExists("[Shader-Terreno]c_detail.lua") == true then
fileDelete("[Shader-Terreno]c_detail.lua")
end