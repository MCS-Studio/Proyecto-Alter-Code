extends Node2D

func _on_Area2D_body_entered(body):
	$AnimatedSprite.play("Hablando")
	Dialogic.set_variable('ObjetoAldeano', Globales.Radio)
	var dialog = Dialogic.start("SolicitudAyuda")
	add_child(dialog)


func _on_Area2D_body_exited(body):
	$AnimatedSprite.play("Callado")
	
