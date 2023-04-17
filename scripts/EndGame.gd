extends CanvasLayer

func _ready():
	ControlsFmod.pauseEvent("Grass")

func _on_Salir_pressed():
	get_tree().quit()
