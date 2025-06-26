extends CharacterBody2D

var SPEED = 50.0
var current_interactions := []

var pause = false

func _physics_process(delta: float) -> void:
	player_movement(delta)
	
func player_movement(_delta):
	if pause:
		return
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
	
	
var dialog_r:DialogueResource
var dialog_s: String = "start"
#var balloon: Node = load(DialogueManager._get_example_balloon_path()).instantiate()\
var balloon: Node = load("res://components/balloon.tscn").instantiate()

	
func _input(event: InputEvent) ->void:	
	if event.is_action_pressed("interact") and (current_interactions.size() > 0):
		if pause:
			pause = false
			balloon.hide()
		else: 
			print(current_interactions[0].name)
			print(current_interactions[0].interact_value)
			var resource = DialogueManager.create_resource_from_text("~ start\n"+ current_interactions[0].interact_value + "\n=> END")
			#DialogueManager.show_dialogue_balloon(resource,dialog_s)
			DialogueManager.get_current_scene.call().add_child(balloon)
			balloon.show()
			balloon.start(resource,dialog_s)
						
			pause = true
			var anim = $AnimatedSprite2D
			anim.stop()

func _on_area_2d_area_entered(area: Area2D) -> void:
	current_interactions.push_back(area)


func _on_area_2d_area_exited(area: Area2D) -> void:
	current_interactions.erase(area)
