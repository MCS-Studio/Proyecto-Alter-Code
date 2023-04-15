extends TextureRect

var WinFlag = false

func _on_Controles_pressed():
	$Controles.disabled = true
	$Video.disabled = false
	$Audio.disabled = false
	$Creditos.disabled = false
	$Video/CheckButton.visible = false
	$Controles/ControlesCtrl.visible = true
	$Audio/ConfVolume.visible = false
	ControlsFmod.playSFXOnce("Button")


func _on_Video_pressed():
	$Video.disabled = true
	$Creditos.disabled = false
	$Controles.disabled = false
	$Audio.disabled = false
	$Controles/ControlesCtrl.visible = false
	$Video/CheckButton.visible = true
	$Audio/ConfVolume.visible = false
	ControlsFmod.playSFXOnce("Button")

func _on_Audio_pressed():
	$Audio.disabled = true
	$Creditos.disabled = false
	$Controles.disabled = false
	$Video.disabled = false
	$Video/CheckButton.visible = false
	$Controles/ControlesCtrl.visible = false
	$Audio/ConfVolume.visible = true
	ControlsFmod.playSFXOnce("Button")

func _on_Cerrar_pressed():
	$".".visible = false
	$"../Fade".visible = false
	Globales.Cerrar = true
	ControlsFmod.playSFXOnce("Button")

func _on_Creditos_pressed():
	$"../AnimationPlayer".play("Fade_In")
	$".".visible = false
	$"../Creditoss".visible = true
	ControlsFmod.playSFXOnce("Button")

func _on_SalirConfiig_pressed():
	$".".visible = false
	$"../AnimationPlayer".play("Fade_In")
	$"../ConfirmacionSalida".visible = true
	ControlsFmod.playSFXOnce("Button")

func _on_Salirpop_pressed():
	get_tree().quit()

func _on_Cancelarpop_pressed():
	$"../ConfirmacionSalida".visible = false
	$".".visible = true
	ControlsFmod.playSFXOnce("Button")

func _on_CheckButton_pressed():
	if WinFlag !=  true:
		OS.window_fullscreen = true
		WinFlag = true
	else:
		OS.window_fullscreen = false
		WinFlag = false
	ControlsFmod.playSFXOnce("Button")

func _on_Master_scrolling():
	evaluarVolumen()

func _on_Music_scrolling():
	evaluarVolumen()
	
func _on_SFX_scrolling():
	evaluarVolumen()

func evaluarVolumen():
	Globales.VolMaster = $Audio/ConfVolume/VolMaster/Master.value
	$Audio/ConfVolume/VolMaster/PerVolume.text = str(Globales.VolMaster) + str(" %")
	Globales.VolMusic = $Audio/ConfVolume/VolMusic/Music.value
	$Audio/ConfVolume/VolMusic/PerVolume.text = str(Globales.VolMusic) + str(" %")
	Globales.VolSFX = $Audio/ConfVolume/VolSFX/SFX.value
	$Audio/ConfVolume/VolSFX/PerVolume.text = str(Globales.VolSFX) + str(" %")
	#Como los valores del Fmod toman valores del 0 al 1, los divido entre 100
	ControlsFmod.setMasterVolume((Globales.VolMaster / 100)) 
	ControlsFmod.setMusicVolume((Globales.VolMusic / 100))
	ControlsFmod.setSFXVolume((Globales.VolSFX / 100))

func _on_Reresar_pressed():
	$"../Creditoss".visible = false
	$".".visible = true
	ControlsFmod.playSFXOnce("Button")
