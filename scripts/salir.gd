extends Control

onready var tree = get_tree()
var WinFlag = false
var EscFlag = false

func _ready():
	ControlsFmod.playEvent("Title")
	Globales.Inicio = true

func _process(delta):
	comprobarMenu()

#Reinicia la animacion de inicio(Para debug)
func _on_reiniciar_pressed():
	ControlsFmod.playSFXOnce("Button")
	ControlsFmod.stopEvent("Title")
	tree.change_scene("res://Esenas/Inicio.tscn")

#Inicia el juego
func _on_Iniciar_pressed():
	ControlsFmod.playSFXOnce("Button")
	ControlsFmod.stopEvent("Title")
	get_node("MenuInicial").hide()
	$Fade.visible = true
	$AnimacionSalir.play("Cargar")
	Globales.Inicio = false

#Salir de el juego
func _on_Salir_pressed():
	ControlsFmod.playSFXOnce("Button")
	$Fade.visible = true
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
	$Fade.hide()
	get_node("ConfirmacionSalida").hide()
	get_node("MenuInicial").visible = true

func _on_SalirConfig_pressed():
	ControlsFmod.playSFXOnce("Button")
	MostrarMenu()

func OcultarMenu():
	$MenuInicial.visible = false
	$Fade.visible = true
	$Fades.play("Fade_In")
	$UI.get_node("Configuracion").visible = true

func MostrarMenu():
	$MenuInicial.visible = true
	$Fade.hide()
	$UI/Configuracion.hide()

func comprobarMenu():
	if Globales.Cerrar:
		$MenuInicial.visible = true
		$Fade.visible = false
		Globales.Cerrar = false

func _on_AnimacionSalir_animation_finished(anim_name):
	Globales.call_deferred("goto_scene", "res://escenas/mapa principal.tscn", self)
