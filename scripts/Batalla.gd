extends Control



func _ready():
	get_node("Personajes/Vida Jefe").max_value = Globales.VidaJefe
	get_node("Personajes/EstaminaJefe").max_value = Globales.EstaminaJefe
	
	get_node("Personajes/Salter/VidaSalter").max_value = Globales.VidaSalter
	#Define la esena actual
	get_tree().set_current_scene(self)

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

func _on_Ataque1_pressed():
	SubfusilJefe()

func _on_Vida_pressed():
	SuministrosJefe()

func _on_Salir_pressed():
	get_tree().quit()

func _on_RegresarMenu_pressed():
	get_tree().change_scene("res://Esenas/MenuP1.tscn")

#Funciones de Evaluacion

func EvaluarEstamina(var Estamina, var EstaminaMaxima):
	if Estamina > EstaminaMaxima:
		return EstaminaMaxima
	else:
		return Estamina

func EvaluarVida(var vida, var vidaMaxima):
	if	vida > vidaMaxima:
		return vidaMaxima
	else:
		return vida

#Funciones de ataque
func SubfusilJefe():
	if Globales.EstaminaJefe >= 10:
		Globales.VidaSalter = Globales.VidaSalter - (Globales.Ataquejefe - (Globales.DefensaSalter * (Globales.Ataquejefe/100.00)))
		Globales.EstaminaJefe = Globales.EstaminaJefe - 10
		Globales.VidaJefe = Globales.VidaJefe - (Globales.AtaqueSalter - (Globales.DefensaJefe * (Globales.AtaqueSalter/100.00)))
	Globales.Turno = Globales.Turno + 1

func SuministrosJefe():
	Globales.VidaJefe = Globales.VidaJefe + (Globales.VidaMaximaJefe * 0.10)
	Globales.VidaJefe = EvaluarVida(Globales.VidaJefe, Globales.VidaMaximaJefe)
	Globales.EstaminaJefe = Globales.EstaminaJefe + (Globales.EstaminaMaximaJefe * 0.10)
	Globales.EstaminaJefe = EvaluarEstamina(Globales.EstaminaJefe, Globales.EstaminaMaximaJefe)
	Globales.Turno = Globales.Turno + 1


#Funciones de daño se Salter

func Excalibur():
	pass
