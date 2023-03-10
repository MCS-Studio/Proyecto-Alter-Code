extends Control

func _on_LogoAnimado_finished():
	get_tree().change_scene("res://Esenas/MenuP1.tscn")

func _on_SaltarIntro_pressed():
	get_tree().change_scene("res://Esenas/MenuP1.tscn")
