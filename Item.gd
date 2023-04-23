extends Sprite2D

func _input(event):
	if event.is_action_pressed("test_button"):
		get_node("AnimationPlayer").play("swipe")
