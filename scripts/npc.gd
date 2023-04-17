extends Node2D

func _on_Area2D_body_entered(body):
	$AnimatedSprite.play("Hablando")
	var dialog = Dialogic.start("Test")
	add_child(dialog)


func _on_Area2D_body_exited(body):
	$AnimatedSprite.play("Callado")
	
