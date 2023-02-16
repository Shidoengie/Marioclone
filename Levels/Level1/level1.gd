extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Global.lives < 0:
		get_tree().change_scene("res://screens/Lose/Loose screen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D2_body_entered(body):
	if body.name == "PlatformerController2D":
		Global.lives -= 1
		get_tree().reload_current_scene()


func _on_win_body_entered(body):
	if body.name == "PlatformerController2D":
		print("you win")
		get_tree().change_scene("res://screens/Win/Winscreen.tscn")
