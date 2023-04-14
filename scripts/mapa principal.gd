extends Node2D
#signal poX(value)
#signal poY(value)
#var pX 
#var pY
func _process(delta):
	Globales.POx = $Jugador.position.x
	Globales.POy = $Jugador.position.y
#	emit_signal("poX",pX)
#	emit_signal("poY",pY)
#	print(Globales.POx," : ",Globales.POy)
	pass
