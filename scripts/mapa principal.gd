extends Node2D


func _ready():
	$Jugador.position.x = Globales.POx
	$Jugador.position.y = Globales.POy
	
	Globales.Turno = 1
	Globales.VidaJefe = Globales.VidaMaximaJefe
	Globales.EstaminaJefe = Globales.EstaminaMaximaJefe
	Globales.VidaSalter = Globales.VidaMaximaSalter
	
	if Globales.flagDialogo == false:
		var dialogo = Dialogic.start("Inicio")
		add_child(dialogo)
		Globales.flagDialogo = true
	if Globales.victoria == "true":
		$"bosque camino muralla/tapon".disabled = true
		$Mapa/cesped/tapon.visible = false
