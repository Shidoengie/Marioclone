extends KinematicBody2D

export var GRAVITY = 1000
export var JUMP_FORCE = 600
export var WALK_SPEED = 150
export var RUN_SPEED = 250
var anim = ""
var velocity = Vector2.ZERO
func _physics_process(delta):
	velocity.y += delta * GRAVITY
	if not Global.dead:
		_controler()
	_anim()
func _controler():
	if Input.is_action_pressed("move_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("move_right"):
		velocity.x = WALK_SPEED
	else:
		velocity.x = lerp(velocity.x, 0, 0.5)
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_FORCE
		$jumpsound.play()
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_pressed("run") and Global.devspeed:
		WALK_SPEED += RUN_SPEED
	elif Input.is_action_pressed("run"):
		WALK_SPEED = RUN_SPEED
	else:
		WALK_SPEED = 150
	
func _anim():
	if is_on_floor():
		if Input.is_action_pressed("move_left"):
			anim = "Walk"
			$Player.flip_h = true
		elif Input.is_action_pressed("move_right"):
			anim = "Walk"
			$Player.flip_h = false
		else:
			anim = "player"
	elif Input.is_action_pressed("move_left"):
		anim = "Jump"
		$Player.flip_h = true
	elif Input.is_action_pressed("move_right"):
		anim = "Jump"
		$Player.flip_h = false
	else:
		anim = "Jump"
	if Global.dead:
		anim = "death"
	_on_AnimationPlayer_animation_finished(anim)
	$AnimationPlayer.play(anim)
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "death" and Global.dead:
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().reload_current_scene()
		Global.lives -= 1
		Global.dead = false
