extends Control


func _on_StartButton_pressed():
	get_tree().change_scene("res://Levels/level1.tscn")
func _on_OptionsButton_pressed():
	get_tree().change_scene("res://screens/Options.tscn")
func _on_QuitButton_pressed():
	get_tree().quit()
