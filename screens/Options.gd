extends Control

func _on_DevspeedCheckBox_toggled(button_pressed):
	Global.devspeed = true
func _on_ReturnButton_pressed():
	get_tree().change_scene("res://screens/Menu.tscn")
