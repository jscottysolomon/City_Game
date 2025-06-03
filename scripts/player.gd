extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	player_movement(delta)
	
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()

func player_movement(delta):
	var anim = $AnimatedSprite2D
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		velocity.y = 0
		anim.play("walk_right")
		anim.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		velocity.y = 0
		anim.play("walk_right")
		anim.flip_h = true
	elif Input.is_action_pressed("ui_down"):
		velocity.x = 0
		velocity.y = SPEED
		anim.play("walk_down")
		anim.flip_h = false
	elif Input.is_action_pressed("ui_up"):
		velocity.x = 0
		velocity.y = -SPEED
		anim.play("walk_up")
		anim.flip_h = false
	else:
		velocity.x = 0
		velocity.y = 0
		anim.stop()
	move_and_slide()
