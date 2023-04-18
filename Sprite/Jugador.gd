extends KinematicBody2D

#---------Variables------------
var velocidad= 100
var animacion=""
var flagRadio = false
var flagPiedra = false
var flagEndGame = false
#---------Nodos guardados en variables----------
onready var animaciones=$AnimatedSprite
onready var mira= $RayCast2D

func _ready():
	ControlsFmod.playEvent("Grass")
	ControlsFmod.pauseEvent("Grass")


func _physics_process(delta):
	comprobarMapa()


func comprobarMapa():
	if $"../UI".get_node("Mapa").visible or $"../UI".get_node("Configuracion").visible or flagEndGame == true:
		velocidad = 0
		ControlsFmod.pauseEvent("Grass")
	else:
		var movimiento = Vector2()
		velocidad = 100
		if Input.is_action_pressed("ui_up"):
			movimiento.y-= velocidad
			mira.set_cast_to(Vector2(0,-50))
			animacion="Movi_Arriba"
			ControlsFmod.resumeEvent("Grass")
		elif mira.get_cast_to() == Vector2 (0,-50):
			animacion="Quieto_arriba"
			ControlsFmod.pauseEvent("Grass")
			
		if Input.is_action_pressed("ui_down"):
			movimiento.y += velocidad
			mira.set_cast_to(Vector2(0,50))
			animacion="Movi_Abajo"
			ControlsFmod.resumeEvent("Grass")
		elif mira.get_cast_to()== Vector2 (0,50):
			animacion="Quieto_abajo"
			ControlsFmod.pauseEvent("Grass")
			
		if Input.is_action_pressed("ui_left"):
			movimiento.x-=velocidad
			mira.set_cast_to(Vector2(-50,0))
			animacion="Movi_izq"
			ControlsFmod.resumeEvent("Grass")
		elif mira.get_cast_to()== Vector2 (-50,0):
			animacion="Quieto_Izq"
			ControlsFmod.pauseEvent("Grass")
			
		if Input.is_action_pressed("ui_right"):
			movimiento.x+=velocidad
			mira.set_cast_to(Vector2(50,0))
			animacion="Movi_der"
			ControlsFmod.resumeEvent("Grass")
		elif mira.get_cast_to()== Vector2 (50,0):
			animacion="Quieto_der"
			ControlsFmod.pauseEvent("Grass")
			
		move_and_slide(movimiento)
		animaciones.play(animacion)


func _on_AreaPelican_area_entered(area):
	print("ENTRASTE AREA PELICAN")
	Globales.Areas = 1
	print(Globales.Areas)
	pass # Replace with function body.



func _on_AreaRuinas_area_entered(area):
	
	print("ENTRASTE AREA RUINA")
	Globales.Areas = 2
	print(Globales.Areas)
	
	pass # Replace with function body.





func _on_AreaBatalla_area_entered(area):
	
	print("ENTRASTE AREA COMBATE")
	Globales.Areas = 3
	print(Globales.Areas)
	
	pass # Replace with function body.





func _on_AreaEntradaPelican2_area_entered(area):
	print("ENTRASTE AREA PELICAN")
	Globales.Areas = 1
	print(Globales.Areas)
	pass # Replace with function body.

	


func _on_area_salida_pelican_area_entered(area):
	print("SALISTE AREA PELICAN")
	Globales.Areas = 0
	print(Globales.Areas)
	pass # Replace with function body.


func _on_AreaSalirRuinas_area_entered(area):
	print("SALISTE AREA RUINA")
	Globales.Areas = 0
	print(Globales.Areas)
	pass # Replace with function body.


func _on_AreaSalirRuinas2_area_entered(area):
	print("SALISTE AREA RUINA")
	Globales.Areas = 0
	print(Globales.Areas)
	pass # Replace with function body.


func _on_AreaEntrarBatalla2_area_entered(area):
	print("ENTRASTE AREA COMBATE")
	Globales.Areas = 3
	print(Globales.Areas)
	pass # Replace with function body.


func _on_AreaSalirBatalla_area_entered(area):
	print("SALISTE AREA COMBATE")
	Globales.Areas = 0
	print(Globales.Areas)
	pass # Replace with function body.


func _on_AreaSalirBatalla2_area_entered(area):
	print("SALISTE AREA COMBATE")
	Globales.Areas = 0
	print(Globales.Areas)
	pass # Replace with function body.


func _on_AreaEntrarRuina2_area_entered(area):
	print("ENTRASTE AREA RUINA")
	Globales.Areas = 2
	print(Globales.Areas)
	pass # Replace with function body.


func _on_Pozo_body_entered(body):
	if Globales.victoria == "true":
		if flagRadio == false:
			$Radio.visible = true
			$Mensaje.bbcode_text = "Has encontrado Radio"
			$Mensaje.visible = true
			Globales.Radio = "true"
			flagRadio = true
	pass # Replace with function body.

func _on_Pozo_body_exited(body):
	$Radio.visible = false
	$Mensaje.visible = false
	pass # Replace with function body.

func _on_Tumba_body_entered(body):
	if flagPiedra == false:
		$Piedra.visible = true
		$Mensaje.bbcode_text = "Piedra sospechosa encontrada"
		$Mensaje.visible = true
		Globales.ItemSecreto = "true"
		flagPiedra = true
	pass # Replace with function body.

func _on_Tumba_body_exited(body):
	$Piedra.visible = false
	$Mensaje.visible = false
	pass # Replace with function body.

func _on_EndCol_body_entered(body):
	print("EndGame")
	flagEndGame = true
	ControlsFmod.pauseEvent("Grass")
	get_tree().change_scene("res://escenas/Menus/EndGame.tscn")
	
