extends Control

var time = 0
var timer_on = false
var suma = 0
var turnoActivacion = Globales.Turno
var activacion = false


func _process(delta):
	if(timer_on == true):
		time += delta
		suma += 1
		if suma == 100 or suma == 200 or suma == 300 :
			print("====Quemadura====\n")
			Globales.VidaSalter = Globales.VidaSalter - 10.00
		if suma == 301:
			timer_on = false
			time = 0
			suma = 0
	if activacion ==  true:
		Globales.evadir = 0
		if Globales.Turno == turnoActivacion + 3:
			Globales.evadir = 1
			activacion = false 
			print("ya no evado")
		
func _on_Granada_pressed():
	GranadaJefe()

func _on_Embestida_pressed():
	EmbestidaJefe()

func _on_Subfusil_pressed():
	SubfusilJefe()

func _on_Vida_pressed():
	SuministrosJefe()

func _on_Ultimate_pressed():
	ultimate()

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
	Globales.VidaJefe = Globales.VidaJefe - ((Globales.AtaqueSalter - (Globales.DefensaJefe * (Globales.AtaqueSalter/100.00))) * Globales.evadir ) 
	Globales.Turno = Globales.Turno + 1
	$AnimationPlayer.play("DañoJefe")
	$AnimationPlayer.play("Daño")

func SuministrosJefe():
	Globales.VidaJefe = Globales.VidaJefe + (Globales.VidaMaximaJefe * 0.10)
	Globales.VidaJefe = EvaluarVida(Globales.VidaJefe, Globales.VidaMaximaJefe)
	Globales.EstaminaJefe = Globales.EstaminaJefe + (Globales.EstaminaMaximaJefe * 0.10)
	Globales.EstaminaJefe = EvaluarEstamina(Globales.EstaminaJefe, Globales.EstaminaMaximaJefe)
	Globales.Turno = Globales.Turno + 1

func GranadaJefe():
	Globales.Turno += 1
	timer_on = true

func EmbestidaJefe():
	turnoActivacion = Globales.Turno
	Globales.Turno += 1
	activacion = true
	
func ultimate():
	Globales.VidaSalter = Globales.VidaSalter - (Globales.EspecialJefe * (Globales.VelocidadJefe*0.5))
