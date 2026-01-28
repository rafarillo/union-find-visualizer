extends Node2D

func _draw() -> void:
	draw_arc(Vector2(200, 100), 50, 0, 1.2 * PI, 20, Color.WHITE)

func _process(delta: float) -> void:
	queue_redraw()
