extends WindowDialog
onready var devspeed_check_box = $"%DevspeedCheckBox"
onready var volume_slider = $"%VolumeSlider"
onready var mute_check_box = $"%MuteCheckBox"
onready var volume_label = $"%VolumeLabel"

var dev_unlock = 0
func _on_DevspeedCheckBox_toggled(button_pressed):
	Global.devspeed = button_pressed
func _on_Control_ready():
	devspeed_check_box.pressed = Global.devspeed


func _on_SecretButton_pressed():
	if dev_unlock < 7:
		dev_unlock += 1
	else:
		devspeed_check_box.visible = true


func _on_VolumeSlider_value_changed(value):
	Global.volume_level = value
	volume_label.text = str(value)

func _on_MuteCheckBox_toggled(button_pressed):
	Global.volume_muted = button_pressed
