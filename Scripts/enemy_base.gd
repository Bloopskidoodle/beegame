extends "res://Scripts/basic_entity.gd"

var arr = []
var player = null

func _process(delta):
	if Input.is_action_just_released("test_button"):
		pass

func _physics_process(delta):
	
	if player:
		#print("tracking")
		velocity += (position.direction_to(player.global_position) * acceleration * delta)
		velocity = velocity.limit_length(speed)
	else:
		#print("ignore :/")
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	
	move_and_slide()

func death():
	arr = [global_position.x, global_position.y]
	
	SignalBus.location.emit(arr)
	queue_free()

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		player = body


func _on_area_2d_body_exited(body):
	player = null


func _on_safe_space_body_entered(body):
	if body.is_in_group("player"):
		player = null

func _on_safe_space_body_exited(body):
	if body.is_in_group("player"):
		player = body
	
