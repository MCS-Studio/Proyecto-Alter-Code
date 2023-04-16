extends MarginContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (NodePath) var player
export var zoom= 1.5

onready var grid = $MarginContainer/Grid
onready var player_m = $MarginContainer/Grid/PlayerMark

var grid_scale
var markers = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	player_m.position = grid.rect_size / 2
	grid_scale = grid.rect_size / (get_viewport_rect().size * zoom)
#	pass # Replace with function body.

func _process (delta):
	if ! player:
		return
	player_m.rotation = get_node(player).rotation + PI / 2
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
