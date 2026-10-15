class_name Snake
extends Node2D

const CELL_SIZE := 32
const MAX_QUEUED_INPUTS := 2

@export var start_length := 3
@export var head_color := Color("a3e635")
@export var body_color := Color("4d7c0f")

var body: Array[Vector2i] = []   # body[0] = la tête
var direction := Vector2i.RIGHT
var _grow_pending := 0
var _input_queue: Array[Vector2i] = []


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("move_up"):
		_queue_direction(Vector2i.UP)
		print("up")
	elif event.is_action_pressed("move_down"):
		_queue_direction(Vector2i.DOWN)
		print("down")
	elif event.is_action_pressed("move_left"):
		_queue_direction(Vector2i.LEFT)
		print("left")
	elif event.is_action_pressed("move_right"):
		_queue_direction(Vector2i.RIGHT)
		print("right")


func _queue_direction(new_dir: Vector2i) -> void:
	var last: Vector2i = _input_queue.back() if not _input_queue.is_empty() else direction
	if new_dir == last or new_dir == -last:
		return   # même direction ou demi-tour : ignoré
	if _input_queue.size() < MAX_QUEUED_INPUTS:
		_input_queue.append(new_dir)


func reset(start_cell: Vector2i) -> void:
	body.clear()
	_input_queue.clear()
	for i in start_length:
		body.append(start_cell - Vector2i(i, 0))
	direction = Vector2i.RIGHT
	_grow_pending = 0
	queue_redraw()


## Avance d'une case et renvoie la nouvelle position de la tête.
func step() -> Vector2i:
	if not _input_queue.is_empty():
		direction = _input_queue.pop_front()
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


func is_on_body(cell: Vector2i, skip_head := false) -> bool:
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
