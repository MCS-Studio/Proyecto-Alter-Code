extends Control

var test = preload("res://scripts/mapa principal.gd")

func _ready():
	$MarginContainer/TextureRect/ViewportContainer/Viewport/mapa/Jugador/Camera2D.zoom=Vector2(1,1)
	
	Globales.POx = $MarginContainer/TextureRect/ViewportContainer/Viewport/mapa/Jugador.position.x
	Globales.POy = $MarginContainer/TextureRect/ViewportContainer/Viewport/mapa/Jugador.position.y
	
	print(Globales.POx," : ",Globales.POy)
