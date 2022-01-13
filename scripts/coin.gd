extends Area2D


#func _on_Area2D2_area_entered(body):
#	Scores.coins += 1
#	print(body.name)
#	print(Scores.coins)
#	pass # Replace with function body.

func _on_Coin_body_entered(body):
	if body.name == "PlatformerController2D":
		Global.coins += 1
		Global.points += 200
		queue_free()
	
	pass # Replace with function body.
