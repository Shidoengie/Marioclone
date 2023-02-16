extends Control


func _on_StartButton_pressed():
	get_tree().change_scene("res://Levels/Level1/level1.tscn")
func _on_OptionsButton_pressed():
	get_tree().change_scene("res://screens/Options/Options.tscn")
func _on_QuitButton_pressed():
	get_tree().quit()
