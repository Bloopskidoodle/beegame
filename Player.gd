extends CharacterBody2D

@export var speed: float = 400
@export var acceleration: float = 1500
@export var friction: float = 600

var input = Vector2.ZERO

func _physics_process(delta):
	player_movement(delta)
	
func get_input():
	input.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))  
	input.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
	print(input.normalized())
	return input.normalized()
	
func player_movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		#slows player
		
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		#speeds player
		
		velocity += (input * acceleration* delta)
		velocity = velocity.limit_length(speed)
		
	move_and_slide()
