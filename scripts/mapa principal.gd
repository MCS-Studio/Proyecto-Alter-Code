extends Node2D


func _ready():
	$Jugador.position.x = Globales.POx
	$Jugador.position.y = Globales.POy
	
	if Globales.flagDialogo == false:
		var dialogo = Dialogic.start("Inicio")
		add_child(dialogo)
		Globales.flagDialogo = true
