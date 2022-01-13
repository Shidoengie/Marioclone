extends Area2D

func _on_Area2D_body_entered(body):
	if body.name == "PlatformerController2D":
		Global.lives -= 1
		get_tree().reload_current_scene()
func _process(delta):
	if Global.lives < 0:
		get_tree().change_scene("res://screens/Loose screen.tscn")
