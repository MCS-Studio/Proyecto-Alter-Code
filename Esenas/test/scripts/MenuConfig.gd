extends TextureRect

func _on_Controles_pressed():
	$Controles.disabled = true
	$Video/CheckButton.visible = false
	$Video.disabled = false
	$Controles/ControlesCtrl.visible = true

func _on_Video_pressed():
	$Controles/ControlesCtrl.visible = false
	$Video.disabled = true
	$Controles.disabled = false
	$Video/CheckButton.visible = true

func _on_Creditos_pressed():
	$Creditos.disabled = true
	$Controles.disabled = false
	
