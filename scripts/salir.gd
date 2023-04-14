extends Control

onready var tree = get_tree()
var WinFlag = false
var EscFlag = false

func _ready():
	ControlsFmod.playEvent("Title")

#Reinicia la animacion de inicio(Para debug)
func _on_reiniciar_pressed():
	ControlsFmod.playSFXOnce("Button")
	ControlsFmod.stopEvent("Title")
	tree.change_scene("res://Esenas/Inicio.tscn")

#Inicia el juego
func _on_Iniciar_pressed():
	ControlsFmod.playSFXOnce("Button")
	ControlsFmod.stopEvent("Title")
	$Fade.visible = true
	$AnimacionSalir.play("Cargar")
#	tree.change_scene("res://Esenas/Batalla/Batalla.tscn")

#Salir de el juego
func _on_Salir_pressed():
	ControlsFmod.playSFXOnce("Button")
	get_node("ColorRect").visible = true
	get_node("ConfirmacionSalida").visible = true
	get_node("MenuInicial").hide()

#Ejecuta una esccena secreta
func _on_Secreto_pressed():
	ControlsFmod.playSFXOnce("Button")
	tree.change_scene("res://Esenas/Waifus/Waifus.tscn")

func _on_Config_pressed():
	ControlsFmod.playSFXOnce("Button")
	OcultarMenu()

func _on_Salirpop_pressed():
	tree.quit()

func _on_Cancelarpop_pressed():
	ControlsFmod.playSFXOnce("Button")
	get_node("ColorRect").hide()
	get_node("ConfirmacionSalida").hide()
	get_node("MenuInicial").visible = true

func _on_SalirConfig_pressed():
	ControlsFmod.playSFXOnce("Button")
	MostrarMenu()

func _input(event):
	#Abre el menu de config al precionar la tecla ESC
	if Input.is_action_pressed("Escape"):
		if EscFlag != true:
			OcultarMenu()
			EscFlag = true
		else:
			MostrarMenu()
			EscFlag = false

func _physics_process(delta):
	pass

func OcultarMenu():
	get_node("MenuInicial").hide()
	get_node("MenuConfig").visible = true
	get_node("ColorRect").visible = true
	get_node("Fades").play("Fade_In")

func MostrarMenu():
	get_node("MenuInicial").visible = true
	get_node("ColorRect").hide()
	get_node("MenuConfig").hide()

func DesabilitarBotones():
	get_node("MenuInicial/Botones/Iniciar").disabled = true
	get_node("MenuInicial/Botones/Config").disabled = true
	get_node("MenuInicial/Botones/reiniciar").disabled = true
	get_node("MenuInicial/Botones/Secreto").disabled = true
	get_node("MenuInicial/Botones/Salir").disabled = true
	get_node("ColorRect").visible = true
	get_node("AnimationPlayer").play("Fade_In")

func HabilitarBotones():
	get_node("MenuInicial/Botones/Iniciar").disabled = false
	get_node("MenuInicial/Botones/Config").disabled = false
	get_node("MenuInicial/Botones/reiniciar").disabled = false
	get_node("MenuInicial/Botones/Secreto").disabled = false
	get_node("MenuInicial/Botones/Salir").disabled = false
	get_node("ColorRect").hide()

func _on_CheckButton_pressed():
	ControlsFmod.playSFXOnce("Button")
	if WinFlag !=  true:
		OS.window_fullscreen = true
		WinFlag = true
	else:
		OS.window_fullscreen = false
		WinFlag = false

func _on_Creditos_pressed():
	ControlsFmod.playSFXOnce("Button")
	get_node("ColorRect").hide()
	get_node("MenuConfig").hide()
	get_node("Creditos").visible = true

func _on_Reresar_pressed():
	ControlsFmod.playSFXOnce("Button")
	get_node("Creditos").visible = false
	get_node("MenuConfig").visible = true
	get_node("ColorRect").visible = true

func _on_SalirConfiig_pressed():
	ControlsFmod.playSFXOnce("Button")
	MostrarMenu()

func _on_AnimacionSalir_animation_finished(anim_name):
	Globales.call_deferred("goto_scene", "res://juego.tscn", self)
