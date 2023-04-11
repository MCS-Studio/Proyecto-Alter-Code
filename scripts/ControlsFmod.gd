extends Node

var Battle
var Title
var Overworld


func _ready():
	#Prepara al escuchador de fmod
	Fmod.add_listener(0, self)
	#Crea las instancias de los eventos puestos como variables
	reloadInstances()
	
func selectInstance(name):
	match (name):
		"Battle":
			return Battle
		"Title":
			return Title
		"Overworld":
			return Overworld

func playMusicOnce(name):
	name = "event:/Musica/" + name
	Fmod.play_one_shot(name, self)
		
func playMusicParamOnce(name, parameters):
	name = "event:/Musica/" + name
	Fmod.play_one_shot_with_params(name, self, parameters)

func playSFXOnce(name):
	name = "event:/SFX/" + name
	Fmod.play_one_shot(name, self)
	
func playSFXParametersOnce(name, parameters):
	name = "event:/SFX/" + name
	Fmod.play_one_shot_with_params(name, self, parameters)

func playEvent(name):
	#Reproduce un evento de una instancia ya creada
	if Fmod.get_event_playback_state(selectInstance(name)) != Fmod.FMOD_STUDIO_PLAYBACK_PLAYING or Fmod.get_event_playback_state(selectInstance(name)) != Fmod.FMOD_STUDIO_PLAYBACK_STARTING:
		Fmod.start_event(selectInstance(name))

#
#	match (name):
#		"Battle":
#			if Fmod.get_event_playback_state(Battle) != Fmod.FMOD_STUDIO_PLAYBACK_PLAYING or Fmod.get_event_playback_state(Battle) != Fmod.FMOD_STUDIO_PLAYBACK_STARTING:
#				Fmod.start_event(Battle)
#		"Title":
#			if Fmod.get_event_playback_state(Title) != Fmod.FMOD_STUDIO_PLAYBACK_PLAYING or Fmod.get_event_playback_state(Title) != Fmod.FMOD_STUDIO_PLAYBACK_STARTING:
#				Fmod.start_event(Title)
#		"Overworld":
#			if Fmod.get_event_playback_state(Overworld) != Fmod.FMOD_STUDIO_PLAYBACK_PLAYING or Fmod.get_event_playback_state(Overworld) != Fmod.FMOD_STUDIO_PLAYBACK_STARTING:
#				Fmod.start_event(Overworld)

func stopEvent(name):
	#Para los eventos segun el nombre.
	#Talvez el tipo de parada tambien la ponga como parametro de la func
	Fmod.stop_event(selectInstance(name), Fmod.FMOD_STUDIO_STOP_ALLOWFADEOUT)
#	match (name):
#		"Battle":
#			Fmod.stop_event(Battle, Fmod.FMOD_STUDIO_STOP_ALLOWFADEOUT)
#		"Title":
#			Fmod.stop_event(Title, Fmod.FMOD_STUDIO_STOP_ALLOWFADEOUT)
#		"Overworld":
#			Fmod.stop_event(Overworld, Fmod.Fmod.FMOD_STUDIO_STOP_IMMEDIATE)
			
func setGlobalParameter(parameter, value):
	#Establece parametros globales
	#Que pueden ser usadas por varios eventos
	Fmod.set_global_parameter_by_name(parameter, value)
	
func setLocalParameter(name, parameter, value):
	#Establece parametros locales (para un solo evento)
	Fmod.set_event_parameter_by_name(selectInstance(name), parameter, value)
#	match(name):
#		"Battle":
#			Fmod.set_event_parameter_by_name(Battle, parameter, value)
#		"Title":
#			Fmod.set_event_parameter_by_name(Title, parameter, value)
#		"Overworld":
#			Fmod.set_event_parameter_by_name(Overworld, parameter, value)

func pauseEvents(pausar):
	#Se pausan los eventos, dependiendo de una variable booleana (Verdadero o falso)
	Fmod.pause_all_events(pausar)

func muteEvents():
	#Se mutean los eventos
	Fmod.mute_all_events()

func releaseEvent(name):
	#Quita las instancias de la memoria, creo
	Fmod.release_event(selectInstance(name))
#	match (name):
#		"Battle":
#			Fmod.release_event(Battle)
#		"Title":
#			Fmod.release_event(Title)
#		"Overworld":
#			Fmod.release_event(Overworld)
		
func reloadInstances():
	#Recarga las instancias del principio
	Battle = Fmod.create_event_instance("event:/Musica/Battle")
	Title = Fmod.create_event_instance("event:/Musica/TitleTheme")
	Overworld = Fmod.create_event_instance("event:/Musica/Overworld")
