extends TileMap
const QuestionBlock_S = preload("res://scenes/QuestionBlock/QuestionBlock.tscn")
const OneUp_S = preload("res://ScriptedTiles/OneUp/Moneup.tscn")
const PowerUp_S = preload("res://ScriptedTiles/PowerUp/PowerUp.tscn")
const Coin_S = preload("res://ScriptedTiles/Coins/Mcoin.tscn")
const brickS = preload("res://ScriptedTiles/Bricks/brick.tscn")
const goombaS = preload("res://scenes/goomba.tscn")

func _ready():
	var qblockcoinarr = get_used_cells_by_id(0)
	var brickarr = get_used_cells_by_id(1)
	var goombaarr = get_used_cells_by_id(2)
	var qblockoneuparr = get_used_cells_by_id(3)
	var qpoweruparr = get_used_cells_by_id(4)
	_replacetiles(qblockcoinarr,QuestionBlock_S,Coin_S)
	_replacetiles(brickarr,brickS)
	_replacetiles(goombaarr,goombaS)
	_replacetiles(qblockoneuparr,QuestionBlock_S,PowerUp_S)
	_replacetiles(qpoweruparr,QuestionBlock_S,OneUp_S)
	
func _replacetiles(tilearr,object,spawnobj = null):
	for i in range(0,tilearr.size()):
		var tilepos
		var newobject = object.instance()
		tilepos = map_to_world(tilearr[i])
		newobject.setpos(tilepos)
		set_cell(tilearr[i].x,tilearr[i].y,-1)
		self.add_child(newobject)
		if spawnobj != null:
			newobject.obj = spawnobj
func setpos(pos):
	position = Vector2(pos.x,pos.y)
