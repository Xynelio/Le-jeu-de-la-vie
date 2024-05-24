extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#print(self.get_used_cells(0))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#self.set_cell(0,Vector2(1,2),1,Vector2i(0,0))
	for x in range(int(get_viewport().size.x / scale.x)):
		for y in range(int(get_viewport().size.y / scale.y)):
			var nb_living_cells = 0
			for i in [0, 3, 4, 7, 8, 11, 12, 15]:
				if get_cell_source_id(0, get_neighbor_cell(Vector2i(x, y), i)) != -1:
					nb_living_cells += 1
			if get_cell_source_id(0, Vector2i(x, y)) == -1: # if cell is dead
				if nb_living_cells == 3:
					self.set_cell(0,Vector2i(x,y),1,Vector2i(0,0))
			else: # cell is alive
				if nb_living_cells in [0, 1, 4, 5, 6, 7, 8]:
					self.erase_cell(0, Vector2i(x,y))
		
