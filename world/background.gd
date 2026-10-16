extends Node2D

const CELL_SIZE := 32
const GRID_SIZE := Vector2i(20, 15)

@export var color_a := Color("1d2b1f")
@export var color_b := Color("22331f")


func _draw() -> void:
	for x in GRID_SIZE.x:
		for y in GRID_SIZE.y:
			var rect := Rect2(x * CELL_SIZE, y * CELL_SIZE, CELL_SIZE, CELL_SIZE)
			var color := color_a if (x + y) % 2 == 0 else color_b
			draw_rect(rect, color)
			
			# Tentative du défi bonus, pas réussi, et pas trop compris ce qu'il voulait comme résultat
			#draw_line(Vector2(x,y) , Vector2(x + CELL_SIZE ,y) , color, float(-0.75) )
