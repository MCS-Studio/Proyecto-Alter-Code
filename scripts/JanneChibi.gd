extends Node2D


func _on_Area2D_body_entered(body):
	$AnimatedSprite.play("Surprice")
	Dialogic.set_variable('victoria', Globales.victoria)
	Dialogic.set_variable('ObjetoAldeano', Globales.Radio)
	Dialogic.set_variable('ObjetoEspecial', Globales.ItemSecreto)
	var conversacionAlter = Dialogic.start("Conversasion")
	add_child(conversacionAlter)
	Globales.Combate =  Dialogic.get_variable('Combate')
	#Agregar un If para entrar a combate
	#if Globales.Combate == "true":
	#	get_tree().change_scene("res://escenas/Batalla/Batalla.tscn")


func _on_Area2D_body_exited(body):
	$AnimatedSprite.play("idle")
	pass # Replace with function body.
