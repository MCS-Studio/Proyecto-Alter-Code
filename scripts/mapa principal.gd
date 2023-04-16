extends Node2D

func _on_Button_pressed():
	Globales.POx = $Jugador.position.x
	Globales.POy = $Jugador.position.y
	
	print(Globales.POx," : " , Globales.POy)
	get_tree().change_scene("res://escenas/Batalla/Batalla.tscn")
