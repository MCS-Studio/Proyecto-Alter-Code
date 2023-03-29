extends Control

func _ready():
	get_node("Personajes/Vida Jefe").max_value = Globales.VidaJefe
	get_node("Personajes/EstaminaJefe").max_value = Globales.EstaminaJefe
	
	get_node("Personajes/Salter/VidaSalter").max_value = Globales.VidaSalter
	#Define la esena actual
	get_tree().set_current_scene(self)
	randomize()

func _process(delta):
	#Label Jefe
	get_node("Personajes/Vida Jefe").value = Globales.VidaJefe
	get_node("Personajes/EstaminaJefe").value = Globales.EstaminaJefe
	get_node("Personajes/Vida Jefe/lblVidajefe").text = str(Globales.VidaJefe) + str(" HP")
	get_node("Personajes/EstaminaJefe/lblEstamina").text = str(Globales.EstaminaJefe) + str(" STP")
	#Label Salter
	get_node("Personajes/Salter/VidaSalter").value = Globales.VidaSalter
	get_node("Personajes/Salter/lblVidaSalter").text = str(Globales.VidaSalter) + str(" HP")
	#Label Turno
	get_node("Acciones/Turno").text = str("Turno: " ) + str(Globales.Turno)

func _on_RegresarMenu_pressed():
	get_tree().change_scene("res://Esenas/MenuP1.tscn")


func _on_Salir_pressed():
	get_tree().quit()
