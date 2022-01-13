extends KinematicBody2D

export var GRAVITY = 1000
export var JUMP_FORCE = 600
export var WALK_SPEED = 150
export var RUN_SPEED = 250
var anim = ""
var velocity = Vector2.ZERO
func _physics_process(delta):
	velocity.y += delta * GRAVITY
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
	elif Global.dead:
		anim = "death"
	else:
		anim = "Jump"
	$AnimationPlayer.play(anim)
