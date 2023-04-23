extends CharacterBody2D

@export var speed = 300
@export var damage = 20

signal dmg_signal

func _ready():
	velocity = Vector2(1, 0)

func _physics_process(delta):
	move_and_collide(velocity.normalized() * delta * speed)


func _on_area_2d_body_entered(body):
	print(body.get_groups())
	
	if body.is_in_group("enemy"):
		body.change_health(-damage)
		SelfDestruct()
	
func SelfDestruct():
	queue_free()
	
