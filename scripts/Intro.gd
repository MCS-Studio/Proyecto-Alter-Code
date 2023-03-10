extends Control

func _on_SaltarIntro_pressed():
	get_tree().change_scene("res://Esenas/MenuP1.tscn")

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://Esenas/MenuP1.tscn")
