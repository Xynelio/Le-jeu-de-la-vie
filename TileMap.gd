extends TileMap
var ticks
var new_ticks

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#print(self.get_used_cells(0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#self.set_cell(0,Vector2(1,2),1,Vector2i(0,0))
	var cells_to_erase = []
	var cells_to_set = []
	for x in range(int(get_viewport().size.x / scale.x)):
		for y in range(int(get_viewport().size.y / scale.y)):
			var nb_living_cells = 0
			for i in [0, 3, 4, 7, 8, 11, 12, 15]:
				if get_cell_source_id(0, get_neighbor_cell(Vector2i(x, y), i)) != -1:
					nb_living_cells += 1
			if get_cell_source_id(0, Vector2i(x, y)) == -1: # if cell is dead
				if nb_living_cells == 3:
					cells_to_set.append(Vector2i(x,y))
			else: # cell is alive
				if nb_living_cells in [0, 1, 4, 5, 6, 7, 8]:
					cells_to_erase.append((Vector2i(x,y)))
	for cell in cells_to_erase:
		self.erase_cell(0, cell)
	for cell in cells_to_set:
		self.set_cell(0,cell,1,Vector2i(0,0))


func _on_speed_up_pressed():
	ticks = Engine.get_physics_ticks_per_second()
	new_ticks = min(ticks + ticks/10+1,60)
	Engine.set_physics_ticks_per_second(new_ticks)


func _on_speed_down_pressed():
	ticks = Engine.get_physics_ticks_per_second()
	new_ticks = max(ticks - ticks/10-1,1)
	Engine.set_physics_ticks_per_second(new_ticks)
