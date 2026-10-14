extends Node2D

const CELL_SIZE := 32

# Vector2i : le i pour int. il est mis à 0
var grid_pos := Vector2i.ZERO

func _ready() -> void:
	# Quand on veux bouger Food, on le place
	Events.food_moved.connect(place)
	#Events.food_moved.emit(Vector2i(5, 5))   # test temporaire

# Reçoit une position de la cellule souhaité
func place(cell: Vector2i) -> void:
	grid_pos = cell
# On place Food à l'endroit souhaité
	position = Vector2(cell * CELL_SIZE)
