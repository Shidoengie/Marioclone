extends KinematicBody2D

const FLOOR = Vector2(0,-1)
export var GRAVITY = 1000
export var WALK_SPEED = 100
var direction = 1
var velocity = Vector2.ZERO
func _physics_process(delta):
	velocity.y += GRAVITY*delta
	velocity.x = WALK_SPEED * direction
	velocity = move_and_slide(velocity,FLOOR)
	if is_on_wall():
		direction *= -1

	

func _on_Area2D_body_exited(body):
	if body.name == "PlatformerController2D":
		velocity = Vector2.ZERO
		Global.coins += 1
		Global.points += 200
		queue_free()

