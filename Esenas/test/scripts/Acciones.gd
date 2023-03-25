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
		if suma % 100 == 0:
			print(suma)
			print(timer_on)
		if suma == 100 or suma == 200 or suma == 300 :
			print("=========WOOOO======\n", suma)
			Globales.VidaSalter = Globales.VidaSalter - 10.00
		if suma == 301:
			timer_on = false
			time = 0
			suma = 0
			print(suma)
			print(timer_on)
	if activacion ==  true:
		Globales.evadir = 0
		print("evadi")
		if Globales.Turno == turnoActivacion+2:
			activacion = false 
			print("ya no evado")
		
func _on_Granada_pressed():
	Globales.Turno += 1
	timer_on = true



func _on_Embestida_pressed():
	turnoActivacion = Globales.Turno
	Globales.Turno += 1
	print("hola")
	print(Globales.Turno)
	print(turnoActivacion)
	activacion = true
	
	
