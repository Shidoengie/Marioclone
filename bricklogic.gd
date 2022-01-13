extends StaticBody2D
var anim = ""
func _on_Area2D_body_entered(body):
		if body.name == "PlatformerController2D":
			anim = "brickbop"
			_anim()
func _anim():
	$AnimationPlayer.play(anim)
func setpos(pos):
	position = Vector2(pos.x,pos.y)
