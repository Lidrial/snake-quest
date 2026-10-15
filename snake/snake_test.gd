extends Node2D


@onready var snake: Snake = $Snake

func _ready() -> void:
	snake.reset(Vector2i(5, 5))

func _on_timer_timeout() -> void:
	snake.step()
