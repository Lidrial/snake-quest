extends Node2D

const GRID_SIZE := Vector2i(20, 15)
const CELL_SIZE := 32
const START_CELL := Vector2i(10, 7)

enum State { PLAYING, GAME_OVER }

## Carré provisoire pour voir la pomme tant que la scene food d'elton n'est pas dans main.tscn
@export var show_debug_food := true

var state := State.GAME_OVER
var score := 0
var food_cell := Vector2i.ZERO

@onready var snake: Snake = $Snake
@onready var tick_timer: Timer = $TickTimer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.restart_requested.connect(start_game)
	start_game()

func _unhandled_input(event: InputEvent) -> void:
	if state == State.GAME_OVER and event.is_action_pressed("ui_accept"):
		start_game()

func start_game() -> void:
	score = 0
	snake.reset(START_CELL)
	spawn_food()
	state = State.PLAYING
	tick_timer.start()
	Events.game_started.emit()
	Events.score_changed.emit(score)

func _on_tick_timer_timeout() -> void:
	var new_head := snake.step()
	var out_of_grid := not Rect2i(Vector2i.ZERO, GRID_SIZE).has_point(new_head)
	if out_of_grid or snake.is_on_body(new_head, true):
		game_over()
		return
	if new_head == food_cell:
		score += 1
		Events.score_changed.emit(score)
		snake.grow()
		spawn_food()

func spawn_food() -> void:
	var free_cells: Array[Vector2i] = []
	for x in GRID_SIZE.x:
		for y in GRID_SIZE.y:
			var cell := Vector2i(x, y)
			if not snake.is_on_body(cell):
				free_cells.append(cell)
	if free_cells.is_empty():
		game_over()  #grille pleine : techniquement une victoire puisque snake a tout manger
		return
	food_cell = free_cells.pick_random()
	Events.food_moved.emit(food_cell)
	queue_redraw()

func game_over() -> void:
	state = State.GAME_OVER
	tick_timer.stop()
	Events.game_over.emit(score)

func _draw() -> void:
	if show_debug_food:
		draw_rect(Rect2(Vector2(food_cell * CELL_SIZE), Vector2(CELL_SIZE, CELL_SIZE)), Color.RED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
