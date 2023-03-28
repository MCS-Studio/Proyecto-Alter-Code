extends Node
#Variables
var evadir = 1.00

var max_loadtime = 100000

#Estadisticas Jefe

var VidaJefe = 100.00
var DefensaJefe = 50.00
var Ataquejefe = 10.00
var EspecialJefe = 0.00
var DefEspJefe = 0.00
var VelocidadJefe = 0.00
var EstaminaJefe = 100.00
#Valores maximos

var VidaMaximaJefe = 100.00
var EstaminaMaximaJefe = 100.00
#Estadisticas Salter

var VidaSalter = 200.00
var DefensaSalter = 0.00
var AtaqueSalter = 10.00
var EspecialSalter = 0.00
var DefEspSalter = 0.00
var VelocidadSalter = 0.00
var EstaminaSalter = 0.00
var VidaMaximaSalter = 0.00
#Valores maximos

#Turno
var Turno = 1

#Funciones Globales

func goto_scene(path, current_scene) -> void:
	var loader = ResourceLoader.load_interactive(path)
	
	#Debug
	if loader == null:
		print("La herramienta de carga no puede cargar el recurso en la ruta")
		return
	
	var loading_bar = load("res://Esenas/Cargando/Cargando.tscn").instance()
	get_tree().get_root().call_deferred('add_child', loading_bar)
	
	var t = OS.get_ticks_msec()
	
	while OS.get_ticks_msec() - t < max_loadtime:
		var err = loader.poll()
		
		if err == ERR_FILE_EOF:
			#Carga completa
			var resource = loader.get_resource()
			
			current_scene.queue_free()
			loading_bar.queue_free()
			get_tree().get_root().call_deferred('add_child', resource.instance())
			break
		elif err == OK:
			#Sigue cargando
			var progress = float(loader.get_stage()) / loader.get_stage_count()
			loading_bar.get_node("TextureProgress").value = progress * 100
		else:
			print("Error al cargar el archivo")
			break
		
		yield(get_tree(), "idle_frame")
