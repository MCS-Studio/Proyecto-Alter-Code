extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var objeto1 = 1
	var objeto2 = 0
	var combate = 1
	Dialogic.set_variable('objeto1', objeto1)
	Dialogic.set_variable('objeto2', objeto2)
	Dialogic.set_variable('combate', combate)
	var dialog = Dialogic.start("Conversasion")
	add_child(dialog)
	
	
