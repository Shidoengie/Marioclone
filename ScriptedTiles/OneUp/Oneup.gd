extends KinematicBody2D

const FLOOR = Vector2(0,-1)
export var GRAVITY = 1000
export var WALK_SPEED = 150
var direction = 1
var velocity = Vector2.ZERO
func _physics_process(delta):
	velocity.y += GRAVITY*delta
	velocity.x = WALK_SPEED * direction
	velocity = move_and_slide(velocity,FLOOR)
	if is_on_wall():
		direction *= -1

func _on_Area2D_body_entered(body):
	if body.name == "PlatformerController2D":
		Global.lives += 1
		queue_free()
