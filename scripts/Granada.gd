extends Button

var time = 0
var timer_on = false
var suma = 0

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

func _on_Granada_pressed():
	Globales.Turno += 1
	timer_on = true
