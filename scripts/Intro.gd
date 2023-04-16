extends Control

func _on_SaltarIntro_pressed():
	ControlsFmod.playSFXOnce("Button")
	get_tree().change_scene("res://escenas/Menus/Menu.tscn")

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://escenas/Menus/Menu.tscn")

func _on_LogoAnimado_finished():
	get_tree().change_scene("res://escenas/Menus/Menu.tscn")
