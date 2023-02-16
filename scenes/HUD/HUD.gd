extends CanvasLayer
onready var coin_label = $"%CoinLabel"
onready var oneup_label = $"%oneuplabel"
onready var points_label = $"%Points"


func _process(delta):
	
	coin_label.text = str(Global.coins)
	oneup_label.text = str(Global.lives)
	if Global.coins >= 100:
		Global.lives += 1
		Global.coins = 0
	points_label.text = str(Global.points)
	
