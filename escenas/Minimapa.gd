extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var test = preload("res://scripts/mapa principal.gd")
# Called when the node enters the scene tree for the first time.
func _ready():
	 # Replace with function body.
	$MarginContainer/TextureRect/ViewportContainer/Viewport/mapa/Jugador/Camera2D.zoom=Vector2(1,1)
	print(Globales.POx," : ",Globales.POy)
	$MarginContainer/TextureRect/ViewportContainer/Viewport/mapa/Jugador.position.x = 1500
	$MarginContainer/TextureRect/ViewportContainer/Viewport/mapa/Jugador.position.y = 4142
#	print(Globales.POx," : ",Globales.POy)
#	$MarginContainer/TextureRect/ViewportContainer/Viewport/Jugador/Camera2D.zoom=Vector2(8,8)
#	$ViewportContainer/Viewport/Jugador/Camera2D.zoom=Vector2(3,3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _on_Jugador_poX(value):
#	print(value)
#	pass # Replace with function body.
