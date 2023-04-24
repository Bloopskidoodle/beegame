extends CharacterBody2D

@export var speed = 300
@export var damage = 20

@export var lifespan = 5

var timer = Timer.new()

func _ready():
	velocity = Vector2(1, 0)
	
	timer.timeout.connect(SelfDestruct) 
	timer.wait_time = lifespan
	timer.one_shot = true
	add_child(timer)
	timer.start()

func _physics_process(delta):
	move_and_collide(velocity.normalized() * delta * speed)


func _on_area_2d_body_entered(body):
	print(body.get_groups())
	
	if body.is_in_group("enemy"):
		body.change_health(-damage)
		SelfDestruct()
	
func SelfDestruct():
	queue_free()
	
