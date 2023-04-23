extends Sprite2D



func _physics_process(_delta):
	if velocity > 0 :
		$AnimationTree.set("parameters/Walk/blend_position", get_local_mouse_position().normalized())
	else:
		$AnimationTree.set("parameters/Idle/blend_position", get_local_mouse_position().normalized())

