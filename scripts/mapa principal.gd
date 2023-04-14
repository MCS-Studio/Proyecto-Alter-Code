extends Node2D

func _ready():
	print("Pos X: " , $Jugador.position.x, "Pos Y: " , $Jugador.position.y)
	Globales.POx = $Jugador.position.x
	Globales.POy = $Jugador.position.y

func _process(delta):
	pass
