extends Node

func _ready():
	$VBoxContainer/VBoxContainer/Inico.grab_focus()

func _on_Salir_pressed():
	print("salir")

func _on_Config_pressed():
	print("Config")

func _on_Inico_pressed():
	print("inicio")
