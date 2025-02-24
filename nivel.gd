extends Node

@export var escena_enemigo: PackedScene
@onready var path_follow_2d: PathFollow2D = $Path2D/PathFollow2D
var puntuacion

func _ready() -> void:
	#new_game()
	$"jugador".connect("golpe", game_over)
	$hub.connect("empezar_juego", new_game)
func _on_timer_timeout() -> void:
	var enemigo = escena_enemigo.instantiate()
	path_follow_2d.progress_ratio=randf()
	enemigo.position = path_follow_2d.position
	var velocidad = Vector2(randf_range(150.0, 250.0), 0.0)
	var direccion = path_follow_2d.rotation + deg_to_rad(90)
	direccion += randf_range(deg_to_rad(-45), deg_to_rad(45))
	enemigo.rotation = direccion
	enemigo.linear_velocity = velocidad.rotated(direccion)
	add_child(enemigo)

func new_game():
	$jugador.start($Marker2D.position)
	puntuacion=0	
	$hub.actualizar_punt(puntuacion)
	$Timerstart.start()
	$hub.enseñar_mensaje("Preparate!")
	get_tree().call_group("grupo_enemigos", "queue_free")
func game_over():
	print("game over")
	$Timerpunt.stop()
	$Timer.stop()
	$hub.enseñar_game_over()

func _on_timerpunt_timeout() -> void:
	puntuacion += 1
	print(puntuacion)
	$hub.actualizar_punt(puntuacion)
	



func _on_timerstart_timeout() -> void:
	$Timer.start()
	$Timerpunt.start()
