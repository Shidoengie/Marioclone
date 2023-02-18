extends Control

onready var options_window = $OptionsWindow


func _on_StartButton_pressed():
	get_tree().change_scene("res://Levels/Level1/level1.tscn")
func _on_OptionsButton_pressed():
	options_window.show()
func _on_QuitButton_pressed():
	get_tree().quit()
