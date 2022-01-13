extends Area2D
func _on_win_body_entered(body):
	if body.name == "PlatformerController2D":
		print("you win")
		get_tree().change_scene("res://screens/Winscreen.tscn")
