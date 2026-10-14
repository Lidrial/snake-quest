extends Node2D


@onready var snake: Snake = $Snake

func _ready() -> void:
	snake.reset(Vector2i(5, 5))
	$Timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout() -> void:
	snake.step()
	if snake.body.size() < 8:
		snake.grow()
