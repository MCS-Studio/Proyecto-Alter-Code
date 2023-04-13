extends Control

var time = 0
var timer_on = false
var suma = 0
var turnoActivacion = Globales.Turno
var activacion = false
var activacionEnemy = false
var activacionBurn = false
var test = 0
var tipoPlayer = 6
var tipoEnemy = 2
var multiplicadorDamage = 1
var accion = 0

func aleatorio():
	return (randi() % 3 + 1)

func _process(delta):
	time += delta
	quemadura()
	evasion()
	ultimateJefe()

func evasion():
	if activacion ==  true:
		Globales.evadir = 0
		if Globales.Turno == turnoActivacion + 3:
			Globales.evadir = 1
			activacion = false 
			print("ya no evado")	

func ComparacionDeTipo(var player,var enemy):
	#comparativa atk 1
	if player == 1 and enemy == 1 :
		return 1.00
	if player == 1 and enemy == 2 :
		return 0.50
	if player == 1 and enemy == 3 :
		return 1.00
	if player == 1 and enemy == 4 :
		return 1.00
	if player == 1 and enemy == 5 :
		return 2.00
	if player == 1 and enemy == 6 :
		return 1.00
	if player == 1 and enemy == 7 :
		return 1.00
	#comparativa atk 2
	if player == 2 and enemy == 1 :
		return 2.00
	if player == 2 and enemy == 2 :
		return 1.00
	if player == 2 and enemy == 3 :
		return 2.00
	if player == 2 and enemy == 4 :
		return 1.00
	if player == 2 and enemy == 5 :
		return 1.00
	if player == 2 and enemy == 6 :
		return 0.50
	if player == 2 and enemy == 7 :
		return 1.00
	#comparativa atk 3
	if player == 3 and enemy == 1 :
		return 2.00
	if player == 3 and enemy == 2 :
		return 0.50
	if player == 3 and enemy == 3 :
		return 1.00
	if player == 3 and enemy == 4 :
		return 1.00
	if player == 3 and enemy == 5 :
		return 1.00
	if player == 3 and enemy == 6 :
		return 0.50
	if player == 3 and enemy == 7 :
		return 2.00
	#comparativa atk 4
	if player == 4 and enemy == 1 :
		return 2.00
	if player == 4 and enemy == 2 :
		return 1.00
	if player == 4 and enemy == 3 :
		return 0.50
	if player == 4 and enemy == 4 :
		return 0.50
	if player == 4 and enemy == 5 :
		return 0.50
	if player == 4 and enemy == 6 :
		return 1.00
	if player == 4 and enemy == 7 :
		return 2.00
	#comparativa atk 5
	if player == 5 and enemy == 1 :
		return 2.00
	if player == 5 and enemy == 2 :
		return 1.00
	if player == 5 and enemy == 3 :
		return 1.00
	if player == 5 and enemy == 4 :
		return 0.50
	if player == 5 and enemy == 5 :
		return 1.00
	if player == 5 and enemy == 6 :
		return 2.00
	if player == 5 and enemy == 7 :
		return 0.50
	#comparativa atk 6
	if player == 6 and enemy == 1 :
		return 1.00
	if player == 6 and enemy == 2 :
		return 0.50
	if player == 6 and enemy == 3 :
		return 2.00
	if player == 6 and enemy == 4 :
		return 1.00
	if player == 6 and enemy == 5 :
		return 0.50
	if player == 6 and enemy == 6 :
		return 0.50
	if player == 6 and enemy == 7 :
		return 0.50
	#comparativa atk 7
	if player == 7 and enemy == 1 :
		return 1.00
	if player == 7 and enemy == 2 :
		return 0.50
	if player == 7 and enemy == 3 :
		return 2.00
	if player == 7 and enemy == 4 :
		return 0.50
	if player == 7 and enemy == 5 :
		return 0.50
	if player == 7 and enemy == 6 :
		return 2.00
	if player == 7 and enemy == 7 :
		return 1.00

func quemadura():
	if(timer_on == true):
		
		suma += 1
		if suma == 100 or suma == 200 or suma == 300 :
			if activacionBurn == true:
				Globales.VidaSalter = Globales.VidaSalter - 100.00
				$AnimationPlayer.play("DamageSalter")
			if activacionEnemy == true:
				
				Globales.VidaJefe -= 20.00
		if suma == 301:
			timer_on = false
			time = 0
			suma = 0
			activacionBurn = false
			activacionEnemy = false

#FUNCIONES DE ATAQUE DEL JEFE

func _on_Subfusil_pressed():
	SubfusilJefe()
	SalterGod()

func _on_Granada_pressed():
	GranadaJefe()
	SalterGod()

func _on_Embestida_pressed():
	EmbestidaJefe()
	SalterGod()

func _on_Vida_pressed():
	SuministrosJefe()
	SalterGod()

func _on_Ultimate_pressed():
	ultimate()
	SalterGod()

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
	if Globales.EstaminaJefe >= 15:
		multiplicadorDamage = ComparacionDeTipo(1,2)
		Globales.VidaSalter = Globales.VidaSalter -  (multiplicadorDamage * (Globales.Ataquejefe - (Globales.DefensaSalter * (Globales.Ataquejefe/100.00))))
		Globales.EstaminaJefe = Globales.EstaminaJefe - 10
	#Globales.VidaJefe = Globales.VidaJefe - ((Globales.AtaqueSalter - (Globales.DefensaJefe * (Globales.AtaqueSalter/100.00))) * Globales.evadir ) 
	Globales.Turno = Globales.Turno + 1
	$AnimationPlayer.play("DamageSalter")

func SuministrosJefe():
	Globales.VidaJefe = Globales.VidaJefe + (Globales.VidaMaximaJefe * 0.10)
	Globales.VidaJefe = EvaluarVida(Globales.VidaJefe, Globales.VidaMaximaJefe)
	Globales.EstaminaJefe = Globales.EstaminaJefe + (Globales.EstaminaMaximaJefe * 0.10)
	Globales.EstaminaJefe = EvaluarEstamina(Globales.EstaminaJefe, Globales.EstaminaMaximaJefe)
	Globales.Turno = Globales.Turno + 1

func GranadaJefe():
	if Globales.EstaminaJefe >= 10:
		Globales.Turno += 1
		activacionBurn = true
		timer_on = true
		$AnimationPlayer.play("DamageSalter")

func EmbestidaJefe():
	if Globales.EstaminaJefe >= 20:
		turnoActivacion = Globales.Turno
		Globales.Turno += 1
		activacion = true
		$AnimationPlayer.play("DamageSalter")
	
func ultimate():
	multiplicadorDamage = ComparacionDeTipo(6,2)
	Globales.VidaSalter = Globales.VidaSalter - (multiplicadorDamage * (Globales.EspecialJefe * ((Globales.VelocidadJefe - (Globales.VelocidadSalter/3)) *0.5)))
	$AnimationPlayer.play("DamageSalter")
	#Funciones de daño se Salter

func Excalibur():
	multiplicadorDamage = ComparacionDeTipo(2,6)
	Globales.VidaJefe = Globales.VidaJefe - (multiplicadorDamage * (Globales.AtaqueSalter - (Globales.DefensaJefe * (Globales.AtaqueSalter/(100.00-(Globales.VelocidadSalter/10))))))
	
	test = aleatorio()
	if test == 1:
		activacionEnemy = true
		timer_on = true

func avalon():
	Globales.VidaSalter = Globales.VidaSalter + (Globales.VidaMaximaSalter * 0.10)
	Globales.VidaSalter = EvaluarVida(Globales.VidaSalter, Globales.VidaMaximaSalter)
	print("avalon")

func Barrera_del_viento_del_rey():
	multiplicadorDamage = ComparacionDeTipo(3,6)
	Globales.VidaJefe = Globales.VidaJefe - (multiplicadorDamage * (Globales.AtaqueSalter - (Globales.DefensaJefe * (Globales.AtaqueSalter/100.00))))
	if (Globales.EstaminaJefe - 20) <= 0:
		Globales.EstaminaJefe = 0
	else:
		Globales.EstaminaJefe -= 20

func Corte_lateral_Buster():
	multiplicadorDamage = ComparacionDeTipo(1,6)
	test = (randi() % 6 + 1)
	Globales.VidaJefe = Globales.VidaJefe - (multiplicadorDamage * (test * (Globales.AtaqueSalter - ((Globales.DefensaJefe * 2) * (Globales.AtaqueSalter/100.00)))))

func HPlow():
	if Globales.VidaSalter == (20 * (Globales.VidaMaximaSalter)):
		accion = 4

func SalterGod():
	accion = (randi() % 4 + 1)
	if accion == 1:
		print("excalibur")
		Excalibur()
		$AnimationPlayer.play("DamageJefe")
		HPlow()
	if accion == 2:
		print("barrera de viento")
		Barrera_del_viento_del_rey()
		$AnimationPlayer.play("DamageJefe")
		HPlow()
	if accion == 3:
		print("corte buster")
		Corte_lateral_Buster()
		$AnimationPlayer.play("DamageJefe")
		HPlow()
	if accion == 4:
		print("avalon")
		avalon()
		$AnimationPlayer.play("DamageJefe")
		HPlow()

func ultimateJefe():
	if $Ultimate/UltimateProgress.value == 100:
		$AnimationPlayer.play("Ultimate")
	pass
