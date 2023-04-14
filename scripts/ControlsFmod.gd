extends Node

var Battle
var Title
var Overworld
var Item
var Buster

func _ready():
	#Prepara al escuchador de fmod
	print("Fmod listener initializing...")
	Fmod.add_listener(0, self)
	print("Fmod Listener initialized")
	print("cargando?")
	print(Fmod.banks_still_loading())
	while(Fmod.banks_still_loading()):
		print("...")
	reloadInstances()
	
func selectInstance(name):
	match (name):
		"Battle":
			return Battle
		"Title":
			return Title
		"Overworld":
			return Overworld
		"ItemCollected":
			return Item
		"Buster":
			return Buster


func playMusicOnce(name):
	name = "event:/Musica/" + name
	Fmod.play_one_shot(name, self)
		
func playMusicParamOnce(name, parameters):
	#name = "event:/Musica/" + name
	#Fmod.play_one_shot_with_params(name, self, parameters)
	print("Estas de parametro no funcionan por el momento. Utilice setLocalParameter o setGloblaParameter para conseguir un resultado similar")

func playSFXOnce(name):
	name = "event:/SFX/" + name
	Fmod.play_one_shot(name, self)
	
func playSFXParametersOnce(name, parameters):
	#name = "event:/SFX/" + name
	#Fmod.play_one_shot_with_params(name, self, parameters)
	print("Estas de parametro no funcionan por el momento. Utilice setLocalParameter o setGloblaParameter para conseguir un resultado similar")

func playEvent(name):
	#Como hay veces que no se cargan las instancias,
	#Pondré un verificador para comprobar si estan vacias para crearlas
	if areInstancesMissing():
		print("No se encontraron las instancias de los eventos; se crearán de nuevo.")
		reloadInstances()
	#Reproduce un evento de una instancia ya creada
#	
	#Esta es una validación que no me agarró, pero que antes si. la dejo por si acaso
	#if Fmod.get_event_playback_state(selectInstance(name)) != Fmod.FMOD_STUDIO_PLAYBACK_PLAYING or Fmod.get_event_playback_state(selectInstance(name)) != Fmod.FMOD_STUDIO_PLAYBACK_STARTING:
	
	#Esta es otra validación que ya ni se si de verdad sirve o no
	if not is_instance_valid(selectInstance(name)):
		print("es valido")
		Fmod.start_event(selectInstance(name))
	else:
		print("Algo salio mal, creo")

func stopEvent(name):
	if areInstancesMissing():
		print("No se encontraron las instancias de los eventos; se crearán de nuevo.")
		reloadInstances()
	else:
		#Para los eventos segun el nombre.
		#Talvez el tipo de parada tambien la ponga como parametro de la func
		Fmod.stop_event(selectInstance(name), Fmod.FMOD_STUDIO_STOP_ALLOWFADEOUT)
			
func setGlobalParameter(parameter, value):
	#Establece parametros globales
	#Que pueden ser usadas por varios eventos
	Fmod.set_global_parameter_by_name(parameter, value)
	
func setLocalParameter(name, parameter, value):
	#Establece parametros locales (para un solo evento)
	Fmod.set_event_parameter_by_name(selectInstance(name), parameter, value)

func pauseEvents():
	#Se pausan los eventos, dependiendo de una variable booleana (Verdadero o falso)
	Fmod.pause_all_events(true)

func resumeEvents():
	Fmod.pause_all_events(false)

func isEventPaused(name):
	Fmod.get_event_paused(selectInstance(name))

func pauseEvent(name):
	Fmod.set_event_paused(selectInstance(name), true)

func resumeEvent(name):
	Fmod.set_event_paused(selectInstance(name), false)
	
func togglePauseEvent(name):
	#Similar to pause event, but this one pauses and resumes from the same function.
	var event = selectInstance(name)
	Fmod.set_event_paused(event, not Fmod.get_event_paused(event))

func muteEvents():
	#Se mutean los eventos
	Fmod.mute_all_events()

func unmuteEvents():
	#Se mutean los eventos
	Fmod.unmute_all_events()

func releaseEvent(name):
	#Quita las instancias de la memoria, creo
	Fmod.release_event(selectInstance(name))
		
func reloadInstances():
	#Recarga las instancias del principio
	Battle = Fmod.create_event_instance("event:/Musica/Battle")
	print(Battle)
	Title = Fmod.create_event_instance("event:/Musica/TitleTheme")
	print(Title)
	Overworld = Fmod.create_event_instance("event:/Musica/Overworld")
	print(Overworld)
	Item = Fmod.create_event_instance("event:/SFX/ItemCollected")
	Buster = Fmod.create_event_instance("event:/SFX/AtaquesSalter/CorteLateralBuster")
	
func areInstancesMissing():
	return (Battle == 0 or Title == 0 or Overworld == 0 or Item == 0 or Buster == 0)

func setMasterVolume(value):
	#El valor del volumen:
	#0 es silencio total
	#1 es defalut
	#Entre 0 y 1 es para el volumen debajo del default
	#Se puede subir encima de 1.
	#Casi nunca se necesita llegar arriba de 20 a menos que se le haya bajado al master y
	#se quiera subir el volumen a los otros.
	Fmod.set_bus_volume("bus:/", value)

func setMusicVolume(value):
	#Se mide igual que el master
	Fmod.set_bus_volume("bus:/Musica", value)
	
func setSFXVolume(value):
	#Se mide igual que el master
	Fmod.set_bus_volume("bus:/SFX", value)

func help():
	print("Para ayuda adicional, te falto la suerte porque no hay xd")
