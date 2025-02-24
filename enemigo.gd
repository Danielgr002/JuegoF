extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tipo_anim = $AnimatedSprite2D.sprite_frames.get_animation_names()
	var random_type_number = randi_range(0, tipo_anim.size()-1)
	$AnimatedSprite2D.play(tipo_anim[random_type_number])


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
