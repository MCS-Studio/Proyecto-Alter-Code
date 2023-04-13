extends CanvasLayer

var flagMapa = false
var flagConfig = false

func _input(event):
	#Boton para abir el mapa
	if flagMapa == false:
		if Input.is_action_pressed("Mapa"):
			$Mapa.visible = true
			flagMapa = true
	else:
		if Input.is_action_pressed("Mapa"):
			$Mapa.visible = false
			flagMapa = false
	#Boton para abir configuracion
	if flagConfig == false:
		if Input.is_action_pressed("Escape"):
			$Configuracion.visible = true
			flagConfig = true
	else:
		if Input.is_action_pressed("Escape"):
			$Configuracion.visible = false
			flagConfig = false
