extends Node2D


func _on_Area2D_body_entered(body):
	$AnimatedSprite.play("Surprice")
	var dialog = Dialogic.start("Test")
	add_child(dialog)
	#Agregar un If para entrar a combate
	get_tree().change_scene("res://escenas/Batalla/Batalla.tscn")


func _on_Area2D_body_exited(body):
	$AnimatedSprite.play("idle")
	pass # Replace with function body.
