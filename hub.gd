extends CanvasLayer

signal empezar_juego

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	$start.hide()
	empezar_juego.emit()
	
func actualizar_punt(puntuacion: int):
	$Label.text = str(puntuacion)

func enseñar_mensaje(text: String):
	$Label2.text=text
	$Label2.show()
	$Timer.start()

func enseñar_game_over():
	enseñar_mensaje("GAME OVER!")
	await $Timer.timeout
	
	$Label2.text  = "Esquiva los enemigos!"
	$Label2.show()
	
	await get_tree().create_timer(1.0).timeout
	$start.show()

func _on_timer_timeout() -> void:
	$Label2.hide() # Replace with function body.
