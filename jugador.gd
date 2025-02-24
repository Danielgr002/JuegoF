extends Area2D

var speed = 300
var screen_size
signal golpe
func _ready() -> void:
	screen_size = get_viewport_rect().size
	hide()
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _process(delta: float) -> void:
	var direccion = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direccion:
		position += direccion * speed * delta
		if direccion.x:
			$AnimatedSprite2D.play("caminar")
			$AnimatedSprite2D.flip_v = false
			$AnimatedSprite2D.flip_h = direccion.x < 0
		elif direccion.y:
			$AnimatedSprite2D.play("arriba")
			$AnimatedSprite2D.flip_v = direccion.y > 0
	position = position.clamp(Vector2.ZERO, screen_size)


func _on_body_entered(body: Node2D) -> void:
	golpe.emit()
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
