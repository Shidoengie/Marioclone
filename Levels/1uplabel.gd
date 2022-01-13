extends Label
func _process(delta):
	text = String(Global.lives)
func _ready():
	if Global.coins >= 100:
		Global.lives += 1
		Global.coins = 0
