extends KinematicBody2D
const FLOOR = Vector2(0,-1)
export var GRAVITY = 1000
export var WALK_SPEED = 150
var anim = ""
var direction = round(randf())
var is_squashed = false
var velocity = Vector2.ZERO
func _ready():
	set_physics_process(false)
func _physics_process(delta):
	if direction == 0:
		direction = -1
	if not is_squashed:
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
	if not body.name == "PlatformerController2D" or is_squashed:
		return
	if not Global.powerup:
		Global.dead = true
	else:
		Global.powerup = false
func _on_Area2D2_body_entered(body):
	if body.name == "PlatformerController2D" and not Global.dead and body.velocity.y > 0:
		anim = "squash"
		is_squashed = true
		$KillArea.set_deferred("monitoring",false)
		$SquashArea.set_deferred("monitoring",false)
		Global.points += 100
		$Timer.start()
func _on_Timer_timeout():
	queue_free()


func _on_VisibilityNotifier2D_screen_entered():
	set_physics_process(true)
