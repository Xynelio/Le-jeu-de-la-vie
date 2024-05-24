extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.get_used_cells(0))
	self.set_cell(0,Vector2(1,2),1,Vector2i(0,0))
	print(self.get_used_cells(0))
 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
