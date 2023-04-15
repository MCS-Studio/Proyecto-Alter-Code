extends CanvasLayer

var flagMapa = false
var flagConfig = false

func _input(event):
	#Boton para abir el mapa
	if flagMapa == false:
		if Input.is_action_pressed("Mapa"):
			$Fade.visible = true
			$AnimationPlayer.play("Fade_In")
			$Mapa.visible = true
			$Configuracion.visible = false
			$BtnMapa.visible = true
			$BtnConfig.visible =  true
			flagMapa = true
			flagConfig = false
			if Globales.Inicio:
				$Mapa/Nohay.visible = true
			if Globales.Areas == 0:
				$Mapa/Nohay.visible = true
			if Globales.Areas == 1:
				$Mapa/Pelican.visible = true
			if Globales.Areas == 2:
				$Mapa/Ruinas.visible = true
			if Globales.Areas == 3:
				$Mapa/Combate.visible = true
	else:
		if Input.is_action_pressed("Mapa"):
			$Fade.visible = false
			$Mapa.visible = false
			$BtnMapa.visible = false
			$BtnConfig.visible =  false
			flagMapa = false
			if Globales.Inicio == false:
				$Mapa/Nohay.visible = false
			if Globales.Areas == 0:
				$Mapa/Nohay.visible = false
			if Globales.Areas == 1:
				$Mapa/Pelican.visible = false
			if Globales.Areas == 2:
				$Mapa/Ruinas.visible = false
			if Globales.Areas == 3:
				$Mapa/Combate.visible = false
	#Boton para abir configuracion
	if flagConfig == false:
		if Input.is_action_pressed("Escape"):
			$Fade.visible = true
			$AnimationPlayer.play("Fade_In")
			$Configuracion.visible = true
			$Mapa.visible = false
			$BtnMapa.visible = true
			$BtnConfig.visible =  true
			flagConfig = true
			flagMapa = false
	else:
		if Input.is_action_pressed("Escape"):
			$Fade.visible = false
			$Configuracion.visible = false
			$BtnMapa.visible = false
			$BtnConfig.visible =  false
			flagConfig = false

func _on_BtnMapa_pressed():
	$Configuracion.visible = false
	$Mapa.visible = true
	if Globales.Inicio == false:
		$Mapa/Nohay.visible = false
	if Globales.Areas == 0:
		$Mapa/Nohay.visible = true
	if Globales.Areas == 1:
		$Mapa/Pelican.visible = true
	if Globales.Areas == 2:
		$Mapa/Ruinas.visible = true
	if Globales.Areas == 3:
		$Mapa/Combate.visible = true
	flagMapa = true
	flagConfig = false
	ControlsFmod.playSFXOnce("Button")

func _on_BtnConfig_pressed():
	$Configuracion.visible = true
	$Mapa.visible = false
	flagConfig = true
	flagMapa = false
	ControlsFmod.playSFXOnce("Button")


