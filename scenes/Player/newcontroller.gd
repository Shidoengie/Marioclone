extends KinematicBody2D

export var gravity = 1000
export var jump_force = 600
export var walk_speed = 150
onready var base_walkSpeed = walk_speed
export var run_speed = 250
onready var anim_player = $AnimationPlayer
const animDict = {
	RESET = "RESET",
	WALK = "Walk",
	JUMP = "Jump",
	DEATH = "death"
}
var anim = animDict.RESET
var velocity = Vector2.ZERO
func _physics_process(delta):
	velocity.y += delta * gravity
	if not Global.dead:
		_controler()
	_anim()
	
	$Player.scale.y = 1.5 if Global.powerup else 1
func _moveX():
	walk_speed = run_speed if Input.is_action_pressed("run") else base_walkSpeed
	if Input.is_action_pressed("move_right"):
		velocity.x = walk_speed
		$Player.flip_h = false
		return
	if Input.is_action_pressed("move_left"):
		velocity.x = -walk_speed
		$Player.flip_h = true
		return
	velocity.x = lerp(velocity.x, 0, 0.5)
func _controler():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
		$jumpsound.play()
	_moveX()
	velocity = move_and_slide(velocity, Vector2.UP)
	if Global.devspeed:
		walk_speed += run_speed
		return

func _anim():
	
	if Global.dead:
		anim_player.play("death")
		return
	anim_player.play(anim)
	if not is_on_floor():
		anim = animDict.JUMP
		return
	anim = animDict.WALK if Input.get_axis("move_left","move_right") != 0 else animDict.RESET
	
	
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == animDict.DEATH and Global.dead:
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().reload_current_scene()
		Global.lives -= 1
		Global.dead = false
		Global.powerup = false
