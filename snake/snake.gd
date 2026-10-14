class_name Snake
extends Node2D


const CELL_SIZE := 32

@export var start_length := 3
@export var head_color := Color("a3e635")
@export var body_color := Color("4d7c0f")

var body: Array[Vector2i] = [] #body[0] = la tete
var direction := Vector2i.RIGHT
var _grow_pending := 0

func reset(start_cell: Vector2i) -> void:
	body.clear()
	for i in start_length:
		body.append(start_cell - Vector2i(i, 0)) 
	direction = Vector2i.RIGHT
	_grow_pending = 0
	queue_redraw()

## Avance d'une case et renvoie la nouvelle position de la tête.
func step() -> Vector2i:
	var new_head: Vector2i = body[0] + direction
	body.push_front(new_head)
	if _grow_pending > 0:
		_grow_pending -= 1
	else:
		body.pop_back()
	queue_redraw()
	return new_head

func grow(amount := 1) -> void:
	_grow_pending += amount

func is_on_ready(cell: Vector2i, skip_head := false) -> bool:
	var start := 1 if skip_head else 0
	for i in range(start, body.size()):
		if body[i] == cell:
			return true
	return false

func _draw() -> void:
	for i in body.size():
		var cell: Vector2i = body[i]
		var rect := Rect2(Vector2(cell * CELL_SIZE), Vector2(CELL_SIZE, CELL_SIZE)).grow(-1)
		draw_rect(rect, head_color if i == 0 else body_color)
