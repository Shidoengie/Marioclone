extends KinematicBody2D
const FLOOR = Vector2(0,-1)
export var GRAVITY = 1000
export var WALK_SPEED = 150
var anim = ""
var direction = 1
var sq = false
var velocity = Vector2.ZERO
func _physics_process(delta):
	if not sq:
		velocity.y += GRAVITY*delta
		velocity.x = WALK_SPEED * direction
		anim = "walk"
		velocity = move_and_slide(velocity,FLOOR)
	_anim()
	if is_on_wall():
		direction *= -1
func setpos(pos):
	position = Vector2(pos.x,pos.y)
func _anim():
	$AnimationPlayer.play(anim)
func _on_Area2D_body_entered(body):
	if body.name == "PlatformerController2D" and not Global.powerup and not sq:
		Global.dead = true
func _on_Area2D2_body_entered(body):
	anim = "squash"
	sq = true
	Global.points += 100
	yield(get_tree().create_timer(1.0), "timeout")
	queue_free()
