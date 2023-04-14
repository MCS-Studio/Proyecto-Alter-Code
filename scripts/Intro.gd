extends Control

func _on_SaltarIntro_pressed():
	ControlsFmod.playSFXOnce("Button")
	get_tree().change_scene("res://Esenas/MenuP1.tscn")

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://Esenas/MenuP1.tscn")

func _on_LogoAnimado_finished():
	get_tree().change_scene("res://Esenas/MenuP1.tscn")
