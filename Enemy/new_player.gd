extends "res://Enemy/basic_entity.gd"

var can_move: bool = true

func _process(delta):
	#Player movement paused when the Tab button is pressed
	if Input.is_action_just_released("stop_movement"):
		allow_movement()
		
	if Input.is_action_just_released("test_button"):
		change_health(-20)

func _physics_process(delta):
	if can_move:
		player_movement(delta)

func allow_movement():
	#Function to influence movement
	can_move = !can_move
	print(can_move)
