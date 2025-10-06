extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0
var modifier = 0
var dTime = 0
var direction = 0
var Jcount = 0

func _physics_process(delta: float) -> void:
	modifier = 0
	if dTime > 0:
		dTime -= 1
		modifier += 10
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		Jcount = 0

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		$Health.health -= 10
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_pressed("jump") and not is_on_floor():
		Jcount+=1
		$Health.health -= 10 + 5*Jcount
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
		direction = -1
	if Input.is_action_pressed("move_right"):
		velocity.x = (SPEED)
		direction = 1
	if Input.is_action_just_released("move_left") or Input.is_action_just_released("move_right"):
		velocity.x =0
			#velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_just_pressed("dash"):
		$Health.health -= 15
		dTime = 10
				
	position.x += modifier * direction
		
	move_and_slide()
	if position.y >= 200:
		$Health.health = 0


#func _on_area_2d_2_body_exited(body: Node2D) -> void:
	
