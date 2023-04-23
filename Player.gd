extends CharacterBody2D

@export var speed: float = 400
@export var acceleration: float = 1500
@export var friction: float = 600

@export var health: int = 100

signal health_updated(health)
signal health_depleted

var input = Vector2.ZERO

var can_move: bool = true

func _process(delta):
	#Player movement paused when the Tab button is pressed
	if Input.is_action_just_released("stop_movement"):
		allow_movement()

func _physics_process(delta):
	if can_move:
		player_movement(delta)
		
func allow_movement():
	#Function to influence movement
	can_move = !can_move
	print(can_move)
	
func get_input():
	input.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))  
	input.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
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
	
	#print(velocity)
	move_and_slide()
	
func change_health(num: int):
	health += num
	health_updated.emit(health)
	
	if health <= 0:
		health = 0
		
		health_depleted.emit()
		death()
	
func death():
	pass
	
	
