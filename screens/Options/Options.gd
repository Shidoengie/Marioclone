extends Control
onready var devspeed_check_box = $"%DevspeedCheckBox"

var dev_unlock = 0
func _on_DevspeedCheckBox_toggled(button_pressed):
	Global.devspeed = button_pressed
func _on_ReturnButton_pressed():
	get_tree().change_scene("res://screens/Menu/Menu.tscn")


func _on_Control_ready():
	$Panel/VBoxContainer2/Devspeed/DevspeedCheckBox.pressed = Global.devspeed


func _on_SecretButton_pressed():
	if dev_unlock < 7:
		dev_unlock += 1
	else:
		devspeed_check_box.visible = true
	pass # Replace with function body.
