extends Control

func _on_DevspeedCheckBox_toggled(button_pressed):
	Global.devspeed = button_pressed
func _on_ReturnButton_pressed():
	get_tree().change_scene("res://screens/Menu/Menu.tscn")


func _on_Control_ready():
	$Panel/VBoxContainer2/Devspeed/DevspeedCheckBox.pressed = Global.devspeed
