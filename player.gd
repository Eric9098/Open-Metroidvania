extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -700.0

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if not is_on_floor():
		velocity += get_gravity() * delta	
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

func _input(event):
	if event.is_action_released("Jump"):
		if !is_on_floor():
			velocity.y *= 0.5
