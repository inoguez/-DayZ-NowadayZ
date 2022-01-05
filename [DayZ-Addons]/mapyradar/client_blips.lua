--# Textures table

local blips_textures = {
  { "arrow", "images/blips/2.png" },
  { "radardisc", "images/blips/radardisc.png" },
  { "radarRingPlane", "images/blips/radarRingPlane.png" }, 
  { "radar_light", "images/blips/56.png" }, 
  --{ "radar_airYard", "images/blips/radar_airYard.png" },
  { "radar_ammugun", "images/blips/radar_ammugun.png" },
  -- { "radar_barbers", "images/blips/radar_barbers.png" },
  -- { "radar_BIGSMOKE", "images/blips/radar_BIGSMOKE.png" },
  -- { "radar_boatyard", "images/blips/radar_boatyard.png" },
  -- { "radar_bulldozer", "images/blips/radar_bulldozer.png" },
  -- { "radar_burgerShot", "images/blips/radar_burgerShot.png" },
  -- { "radar_cash", "images/blips/radar_cash.png" },
  -- { "radar_CATALINAPINK", "images/blips/radar_CATALINAPINK.png"},
  { "radar_centre", "images/blips/2.png" },
  -- { "radar_CESARVIAPANDO", "images/blips/radar_CESARVIAPANDO.png" },
  -- { "radar_chicken", "images/blips/radar_chicken.png" },
  { "radar_CJ", "images/blips/15.png" },
  -- { "radar_CRASH1", "images/blips/radar_CRASH1.png" },
  -- { "radar_dateDisco", "images/blips/radar_dateDisco.png" },
  -- { "radar_dateDrink", "images/blips/radar_dateDrink.png" },
  -- { "radar_dateFood", "images/blips/radar_dateFood.png" },
  -- { "radar_diner", "images/blips/radar_diner.png" },
  -- { "radar_emmetGun", "images/blips/radar_emmetGun.png" },
  -- { "radar_enemyAttack", "blips/radar_enemyAttack.png" },
  -- { "radar_fire", "images/blips/radar_fire.png" },
  -- { "radar_Flag", "images/blips/radar_Flag.png" },
  -- { "radar_gangB", "images/blips/radar_gangB.png" },
  -- { "radar_gangG", "images/blips/radar_gangG.png" },
  -- { "radar_gangN", "images/blips/radar_gangN.png" },
  -- { "radar_gangP", "images/blips/radar_gangP.png" },
  -- { "radar_gangY", "images/blips/radar_gangY.png" },
  -- { "radar_girlfriend", "images/blips/radar_girlfriend.png" },
  -- { "radar_gym", "images/blips/radar_gym.png" },
  -- { "radar_hostpital", "images/blips/radar_hostpital.png" },
  -- { "radar_impound", "images/blips/radar_impound.png" },
  -- { "radar_light", "images/blips/radar_light.png" },
  { "radar_LocoSyndicate", "images/blips/23.png" },
  -- { "radar_MADDOG", "images/blips/radar_MADDOG.png" },
  -- { "radar_mafiaCasino", "images/blips/radar_mafiaCasino.png" },
  -- { "radar_MCSTRAP", "images/blips/radar_MCSTRAP.png" },
  -- { "radar_modGarage", "images/blips/radar_modGarage.png" },
  { "radar_north", "images/blips/4.png" },
  -- { "radar_OGLOC", "images/blips/radar_OGLOC.png" },
  -- { "radar_pizza", "images/blips/radar_pizza.png" },
  -- { "radar_police", "images/blips/radar_police.png" },
  -- { "radar_propertyG", "images/blips/radar_propertyG.png" },
  -- { "radar_propertyR", "images/blips/radar_propertyR.png" },
  -- { "radar_qmark", "images/blips/radar_qmark.png" },
  -- { "radar_race", "images/blips/radar_race.png" },
  { "radar_runway", "images/blips/57.png" },
  -- { "radar_RYDER", "images/blips/radar_RYDER.png" },
  -- { "radar_saveGame", "images/blips/radar_saveGame.png" },
  -- { "radar_school", "images/blips/radar_school.png" },
  -- { "radar_spray", "images/blips/radar_spray.png" },
  -- { "radar_SWEET", "images/blips/radar_SWEET.png" },
  -- { "radar_tattoo", "images/blips/radar_tattoo.png" },
  -- { "radar_THETRUTH", "images/blips/radar_THETRUTH.png" },
  -- { "radar_TORENO", "images/blips/radar_TORENO.png" },
  -- { "radar_TorenoRanch", "images/blips/radar_TorenoRanch.png" },
  -- { "radar_triads", "images/blips/radar_triads.png" },
  -- { "radar_triadsCasino", "images/blips/radar_triadsCasino.png" },
  -- { "radar_truck", "images/blips/radar_truck.png" },
  -- { "radar_tshirt", "images/blips/radar_tshirt.png" },
  -- { "radar_waypoint", "images/blips/radar_waypoint.png" },
  -- { "radar_WOOZIE", "images/blips/radar_WOOZIE.png" },
  -- { "radar_ZERO", "images/blips/radar_ZERO.png" },
  { "siterocket", "images/blips/siterocket.png" }
}

--# Apply textures

addEventHandler("onClientResourceStart", resourceRoot, 
    function()
        for i = 2, #blips_textures do
            local shader = dxCreateShader("texture.fx")
                engineApplyShaderToWorldTexture(shader, blips_textures[i][1])
                dxSetShaderValue(shader, "gTexture", dxCreateTexture(blips_textures[i][2]))
        end
    end
)