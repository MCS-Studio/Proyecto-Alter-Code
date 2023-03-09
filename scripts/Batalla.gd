extends Control

#Estadisticas Jefe
var VidaJefe = 100.00
var DefensaJefe = 50.00
var Ataquejefe = 0
var EspecialJefe = 0
var DefEspJefe = 0
var VelocidadJefe = 0
var EstaminaJefe = 0
#Estadisticas Salter
var VidaSalter = 200
var DefensaSalter = 0
var AtaqueSalter = 0
var EspecialSalter = 0
var DefEspSalter = 0
var VelocidadSalter = 0
var EstaminaSalter = 0

func _ready():
	get_node("Personajes/Jefe/Vida Jefe").max_value = VidaJefe
	get_node("Personajes/Salter/VidaSalter").max_value = VidaSalter

func _process(delta):
	get_node("Personajes/Jefe/Vida Jefe").value = VidaJefe
	get_node("Personajes/Salter/VidaSalter").value = VidaSalter
	get_node("Personajes/Jefe/lblVidajefe").text = str(VidaJefe) + str("HP")
	get_node("Personajes/Salter/lblVidaSalter").text = str(VidaSalter) + str("HP")

func _on_Ataque1_pressed():
	VidaJefe = VidaJefe - (10.00 - (DefensaJefe * (10.00/100.00)))
	print(50.00 * (10.00/100.00))
	VidaSalter = VidaSalter - 10
