extends "res://Scripts/basic_entity.gd"

var can_move: bool = true

const bulletPath = preload("res://Enemy/honey_bullet.tscn")

func _ready():
	SignalBus.location.connect(_find_location)

func _process(delta):
	#Player movement paused when the Tab button is pressed
	if Input.is_action_just_released("stop_movement"):
		allow_movement()
		
	if Input.is_action_just_released("test_button"):
		shoot()
		
	$Locator.look_at(get_global_mouse_position())

func _physics_process(delta):
	if can_move:
		player_movement(delta)

func allow_movement():
	#Function to influence movement
	can_move = !can_move
	print(can_move)

func death():
	pass

#Called when enemy dies
func _find_location(arr):
	self.global_position = Vector2(arr[0], arr[1])
	
func shoot():
	var bullet = bulletPath.instantiate()
	get_parent().add_child(bullet)
	
	bullet.position = $Locator/Marker2D.global_position
	bullet.velocity = get_global_mouse_position() - bullet.position
