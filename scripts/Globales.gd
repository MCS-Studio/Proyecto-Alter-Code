extends Node

#Variable Menu3
var Cerrar
var Inicio
var flagDialogo = false

#Variables MAPA
var POx = 1569
var POy = 4786
#Variables de volumen
var VolMaster = 0.00
var VolMusic = 0.00
var VolSFX = 0.00
#Variables
var evadir = 1.00

var max_loadtime = 100000

#Mapa
var Areas
var Combate = false
var Radio = "false"
var ItemSecreto = "false"
var victoria = "false"
# 0 = no hay nada
# 1 = pelican
# 2 = ruinas
# 3 = combate

#Estadisticas Jefe

var VidaJefe = 2000.00
var DefensaJefe = 75.00
var Ataquejefe = 500.00
var EspecialJefe = 32.00
var DefEspJefe = 30.00
var VelocidadJefe = 75.00
var EstaminaJefe = 200.00
#Valores maximos

var VidaMaximaJefe =2000.00
var EstaminaMaximaJefe = 200.00
#Estadisticas Salter

var VidaSalter = 2000.00
var DefensaSalter = 50.00
var AtaqueSalter = 430.00
var EspecialSalter = 40.00
var DefEspSalter = 70.00
var VelocidadSalter = 70.00
var EstaminaSalter = 500.00
var VidaMaximaSalter = 2000.00
#Valores maximos

#Turno
var Turno = 1
var Charge = 0

#Funciones Globales

func goto_scene(path, current_scene) -> void:
	var loader = ResourceLoader.load_interactive(path)
	
	#Debug
	if loader == null:
		print("La herramienta de carga no puede cargar el recurso en la ruta")
		return
	
	var loading_bar = load("res://escenas/Cargando/Cargando.tscn").instance()
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
