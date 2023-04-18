extends Control

func _ready():
	get_node("Personajes/Vida Jefe").max_value = Globales.VidaJefe
	get_node("Personajes/EstaminaJefe").max_value = Globales.EstaminaJefe
#	#Define la esena actual
#	get_tree().set_current_scene(self)
	get_node("Personajes/VidaSalter").max_value = Globales.VidaSalter
	randomize()
	ControlsFmod.playEvent("Battle")

func _process(delta):
	#Label Jefe
	get_node("Personajes/Vida Jefe").value = Globales.VidaJefe
	get_node("Personajes/EstaminaJefe").value = Globales.EstaminaJefe
	get_node("Personajes/Vida Jefe/lblVidajefe").text = str(Globales.VidaJefe) + str(" HP")
	get_node("Personajes/EstaminaJefe/lblEstamina").text = str(Globales.EstaminaJefe) + str(" STP")
	#Label Salter
	get_node("Personajes/VidaSalter").value = Globales.VidaSalter
	get_node("Personajes/VidaSalter/lblVidaSalter").text = str(Globales.VidaSalter) + str(" HP")
	#Label Turno
	get_node("Acciones/Turno").text = str("Ronda: " ) + str(Globales.Turno)
	var HealthRemaining = round((Globales.VidaJefe / Globales.VidaMaximaJefe) * 100) 
	ControlsFmod.setGlobalParameter("Health", HealthRemaining)

func _on_RegresarMenu_pressed():
	ControlsFmod.stopEvent("Battle")
	get_tree().change_scene("res://escenas/Menus/Menu.tscn")

func _on_Salir_pressed():
	get_tree().quit()
