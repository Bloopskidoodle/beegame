extends "res://Scripts/basic_entity.gd"

var arr = []

func _process(delta):
	if Input.is_action_just_released("test_button"):
		pass

func _physics_process(delta):
	pass

func death():
	arr = [global_position.x, global_position.y]
	
	var player = get_parent().get_node("NewPlayer")
	SignalBus.location.emit(arr)
	queue_free()
	
