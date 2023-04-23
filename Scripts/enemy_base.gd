extends "res://Scripts/basic_entity.gd"

var arr = []

var player_position

var statemachine

const dead_body = preload("res://Enemy/dead_body.tscn")

func _ready():
	SignalBus.player_location.connect(get_player_location)
	
	statemachine = $EnemySprite/AnimationTree.get("parameters/playback")

func _process(delta):
	if Input.is_action_just_released("test_button"):
		pass
		
	if player:
		if velocity == Vector2.ZERO:
			statemachine.travel("Idle")
			$EnemySprite/AnimationTree.set("parameters/Idle/blend_position", player_position)
		elif velocity != Vector2.ZERO:
			statemachine.travel("Walk")
			$EnemySprite/AnimationTree.set("parameters/Walk/blend_position", player_position)

func _physics_process(delta):
	pass

func death():
	arr = [global_position.x, global_position.y]
	SignalBus.location.emit(arr)
	
	var db = dead_body.instantiate()
	get_parent().get_parent().add_child(db)
	print(player_position)
	
	if player_position:
		db.position = player_position
	
	queue_free()
<<<<<<< Updated upstream
	
=======

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

func get_player_location(pos):
	player_position = pos
>>>>>>> Stashed changes
