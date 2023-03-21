extends TextureRect

func _on_Controles_pressed():
	$Controles.disabled = true
	$Creditos.disabled = false
	$Video/CheckButton.visible = false
	$Video.disabled = false
	$Controles/ControlesCtrl.visible = true

func _on_Video_pressed():
	$Controles/ControlesCtrl.visible = false
	$Video.disabled = true
	$Creditos.disabled = false
	$Controles.disabled = false
	$Video/CheckButton.visible = true

func _on_Creditos_pressed():
#	$Creditos.disabled = true
#	$Controles.disabled = false
#	$Video.disabled = false
	pass
	
