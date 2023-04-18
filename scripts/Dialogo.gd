extends Control

var Dialogo1 = [
	'texto de prueba 1 buenas texto texto texto texto',
	'texto de prueba 2 buenas texto texto texto texto',
	'texto de prueba 3 buenas texto texto texto texto'
]

var Dialogo1_index = 0
var textSpeed = 0.1
var finalizado = false

func _ready():
	$RichTextLabel.bbcode_text = ""
	cargarDialogo()

func _process(delta):
	$Next.visible = finalizado
	if Input.is_action_just_pressed("ui_accept"):
		cargarDialogo()

func cargarDialogo():
	if Dialogo1_index < Dialogo1.size():
			finalizado = false
			$RichTextLabel.bbcode_text = Dialogo1[Dialogo1_index]
			$RichTextLabel.percent_visible = 0
			var TweenDuration = textSpeed * Dialogo1[Dialogo1_index].length()
			$Tween.interpolate_property(
				$RichTextLabel, "percent_visible", 0, 1, 1,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
			)
			$Tween.start()
	else:
		queue_free()
	Dialogo1_index += 1

func _on_Tween_tween_completed(object, key):
	finalizado = true
	$Next.visible = true
	$Next/AnimationPlayer.play("Esperando")
