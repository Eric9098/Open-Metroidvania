extends CharacterBody2D

const SPEED = 500.0
const JUMP_VELOCITY = -900.0
const ACCELERATION = 45
const JUMP_CUT = 0.5

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Jump"):
		$JumpBufferTimer.start()
	
	if is_on_floor() and !$JumpBufferTimer.is_stopped():
		velocity.y = JUMP_VELOCITY
		
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_released("Jump") and velocity.y < 0:
		if !is_on_floor():
			velocity.y *= JUMP_CUT
	
	if velocity.y > 0:
		velocity.y += ACCELERATION
		
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	print(velocity.y)
