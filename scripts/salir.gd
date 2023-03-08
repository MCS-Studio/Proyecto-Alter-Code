extends Control

onready var tree = get_tree()
var hoverSalir = false

#Reinicia la animacion de inicio(Para debug)
func _on_reiniciar_pressed():
	tree.change_scene("res://Esenas/Intro.tscn")

#Inicia el juego
func _on_Iniciar_pressed():
	pass
	#Actualizar escena

#Salir de el juego
func _on_Salir_pressed():
	get_node("CuadroDialogo").visible = true

#Ejecuta una esccena secreta
func _on_Secreto_pressed():
	tree.change_scene("res://Esenas/Waifus/Waifus.tscn")

func _on_Config_pressed():
	tree.change_scene("res://Esenas/Configuracion.tscn")

func _on_Salirpop_pressed():
	get_tree().quit()

func _on_Cancelarpop_pressed():
	get_node("CuadroDialogo").hide()

func _physics_process(delta):
	if Input.is_action_pressed("Escape"):
		get_node("CuadroDialogo").visible = true
		hoverSalir = true
