extends Node2D


func _on_Area2D_body_entered(body):
	$AnimatedSprite.play("Surprice")
	Dialogic.set_variable('victoria', Globales.victoria)
	Dialogic.set_variable('ObjetoAldeano', Globales.Radio)
	Dialogic.set_variable('ObjetoEspecial', Globales.ItemSecreto)
	var conversacionAlter = Dialogic.start("Conversasion")
	add_child(conversacionAlter)
	Globales.POx = ($"../../Jugador".position.x -30)
	Globales.POy = ($"../../Jugador".position.y - 30)



func _on_Area2D_body_exited(body):
	$AnimatedSprite.play("idle")
	pass # Replace with function body.
