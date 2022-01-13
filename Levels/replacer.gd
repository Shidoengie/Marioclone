extends TileMap

const qblockcoinS = preload("res://scenes/qblockcoin.tscn")
const qblockoneupS = preload("res://scenes/qblockoneup.tscn")
const brickS = preload("res://scenes/brick.tscn")
const goombaS = preload("res://scenes/goomba.tscn")
func _ready():
	var qblockcoinarr = get_used_cells_by_id(0)
	var brickarr = get_used_cells_by_id(1)
	var goombaarr = get_used_cells_by_id(2)
	var qblockoneuparr = get_used_cells_by_id(3)
	_replacetiles(qblockcoinarr,qblockcoinS)
	_replacetiles(brickarr,brickS)
	_replacetiles(goombaarr,goombaS)
	_replacetiles(qblockoneuparr,qblockoneupS)
func _replacetiles(tilearr,object):
	var tilepos
	for i in range(0,tilearr.size()):
		var newobject = object.instance()
		tilepos = map_to_world(tilearr[i])
		newobject.setpos(tilepos)
		set_cell(tilearr[i].x,tilearr[i].y,-1)
		self.add_child(newobject)
func setpos(pos):
	position = Vector2(pos.x,pos.y)
