extends Control

#Estadisticas Jefe
var VidaJefe = 100.00
var DefensaJefe = 50.00
var Ataquejefe = 10.00
var EspecialJefe = 0.00
var DefEspJefe = 0.00
var VelocidadJefe = 0.00
var EstaminaJefe = 100.00
#Valores maximos
var VidaMaximaJefe = 100.00
var EstaminaMaximaJefe = 100.00
#Estadisticas Salter
var VidaSalter = 200.00
var DefensaSalter = 0.00
var AtaqueSalter = 10.00
var EspecialSalter = 0.00
var DefEspSalter = 0.00
var VelocidadSalter = 0.00
var EstaminaSalter = 0.00
var VidaMaximaSalter = 0.00
#Valores maximos

#Turno
var Turno = 1
#Numeros aleatorios 
#var random = RandomNumberGenerator.new()
#	random.randomize()
#	print(random.randi_range(0, 10))

func _ready():
	get_node("Personajes/Jefe/Vida Jefe").max_value = VidaJefe
	get_node("Personajes/Jefe/EstaminaJefe").max_value = EstaminaJefe
	
	get_node("Personajes/Salter/VidaSalter").max_value = VidaSalter

func _process(delta):
	get_node("Personajes/Jefe/Vida Jefe").value = VidaJefe
	get_node("Personajes/Jefe/EstaminaJefe").value = EstaminaJefe
	get_node("Personajes/Jefe/Vida Jefe/lblVidajefe").text = str(VidaJefe) + str(" HP")
	get_node("Personajes/Jefe/EstaminaJefe/lblEstamina").text = str(EstaminaJefe) + str(" STP")
	
	get_node("Personajes/Salter/VidaSalter").value = VidaSalter
	get_node("Personajes/Salter/lblVidaSalter").text = str(VidaSalter) + str(" HP")
	
	get_node("Acciones/Turno").text = str("Turno: " ) + str(Turno)

func _on_Ataque1_pressed():
	if EstaminaJefe >= 10:
		VidaSalter = VidaSalter - (Ataquejefe - (DefensaSalter * (Ataquejefe/100.00)))
		EstaminaJefe = EstaminaJefe - 10
	Turno = Turno + 1

func _on_Vida_pressed():
	VidaJefe = VidaJefe + (VidaMaximaJefe * 0.10)
	VidaJefe = EvaluarVida(VidaJefe, VidaMaximaJefe)
	EstaminaJefe = EstaminaJefe + (EstaminaMaximaJefe * 0.10)
	EstaminaJefe = EvaluarEstamina(EstaminaJefe, EstaminaMaximaJefe)
	Turno = Turno + 1

func EvaluarVida(var vida, var vidaMaxima):
	if	vida > vidaMaxima:
		return vidaMaxima
	else:
		return vida

func EvaluarEstamina(var Estamina, var EstaminaMaxima):
	if Estamina > EstaminaMaxima:
		return EstaminaMaxima
	else:
		return Estamina

func _on_Salir_pressed():
	get_tree().quit()

func _on_RegresarMenu_pressed():
	get_tree().change_scene("res://Esenas/MenuP1.tscn")
