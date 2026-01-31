extends Node2D

var _graphNode: Resource = preload("res://Scenes/Node.tscn")

var _unionFind: UnionFind

func _ready() -> void:
	_unionFind = UnionFind.new(0)
# func _draw() -> void:
	# draw_arc(Vector2(200, 100), 50, 0, 1.2 * PI, 20, Color.WHITE)

# func _process(delta: float) -> void:
	# queue_redraw()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.double_click and event.pressed:
			var newIndex = _unionFind.AddElement()
			var newNode = _graphNode.instantiate()
			newNode.position = event.position
			add_child(newNode)
			newNode.SetText(str(newIndex))
