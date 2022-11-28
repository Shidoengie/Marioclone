extends Area2D

export var scene : String
var player : KinematicBody2D
var canenter = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().find_node("PlatformerController2D") as KinematicBody2D
	pass # Replace with function body.

func _process(delta):
	if(Input.is_action_just_pressed("duck")) and canenter:
		get_tree().change_scene(scene)

func _on_Warp_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if(body != player):
		return
	canenter = true

