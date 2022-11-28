extends StaticBody2D
var anim = ""
var hit = false
var obj 

func _on_Area2D_body_entered(body):
		if body.name == "PlatformerController2D" and not hit:
			anim = "qblockbop"
			_anim()
			hit = true
			_spawn()
func _spawn():
	var instance = obj.instance()
	instance.position = position
	instance.position.y -= 40
	get_parent().add_child(instance)
func _anim():
	$AnimationPlayer.play(anim)
#ye
func setpos(pos):
	position = Vector2(pos.x,pos.y)
