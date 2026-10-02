extends CharacterBody2D

@export var gravity: float = 1300.0
@export var jetpack_force: float = 1900.0
@export var max_fall_speed: float = 700.0
@export var max_rise_speed: float = -600.0

func _physics_process(delta):
	velocity.y += gravity * delta

	if Input.is_action_pressed("fly"):
		velocity.y -= jetpack_force * delta

	velocity.y = clamp(
		velocity.y,
		max_rise_speed,
		max_fall_speed
	)

	move_and_slide()

	position.y = clamp(position.y, 50.0, 670.0)
