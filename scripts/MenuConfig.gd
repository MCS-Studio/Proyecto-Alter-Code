extends TextureRect

func _on_Controles_pressed():
	$Controles.disabled = true
	$Video.disabled = false
	$Audio.disabled = false
	$Creditos.disabled = false
	$Video/CheckButton.visible = false
	$Controles/ControlesCtrl.visible = true

func _on_Video_pressed():
	$Video.disabled = true
	$Creditos.disabled = false
	$Controles.disabled = false
	$Audio.disabled = false
	$Controles/ControlesCtrl.visible = false
	$Video/CheckButton.visible = true

func _on_Audio_pressed():
	$Audio.disabled = true
	$Creditos.disabled = false
	$Controles.disabled = false
	$Video.disabled = false
	$Video/CheckButton.visible = false
	$Controles/ControlesCtrl.visible = false
