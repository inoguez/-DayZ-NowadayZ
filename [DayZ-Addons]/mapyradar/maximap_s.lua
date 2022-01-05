function HideGPS(Jugador)
	setElementData( Jugador, "ShowMap", true)
end

addEvent("ShowMapDiseableGPS")
addEventHandler( "ShowMapDiseableGPS", root, HideGPS)