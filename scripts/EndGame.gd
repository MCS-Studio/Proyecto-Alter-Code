extends CanvasLayer

func _ready():
	ControlsFmod.pauseEvent("Grass")
	ControlsFmod.playEvent("Title")

func _on_Salir_pressed():
	get_tree().quit()
