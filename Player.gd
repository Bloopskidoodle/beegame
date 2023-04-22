extends CharacterBody2D

@export var speed: float = 200
@export var acceleration: float = 2000
var friction: float = acceleration / speed

func _process(delta: float) -> void:
	apply_traction(delta)
	apply_friction(delta)

func _physics_process(delta: float) -> void:
	move_and_slide()
	
func  apply_traction(delta: float) -> void:
	var traction: Vector2 = Vector2()
	
	if Input.is_action_pressed("move_up"):
		traction.y -= 1
	if Input.is_action_pressed("move_down"):
		traction.y = 1
	if Input.is_action_pressed("move_left"):
		traction.x -= 1
	if Input.is_action_pressed("move_right"):
		traction.x = 1
	
	#print(traction)
	traction = traction.normalized()
	#print(traction)
	
	velocity += traction * acceleration * delta
	
func apply_friction(delta: float) -> void:
	velocity -= velocity * friction * delta
