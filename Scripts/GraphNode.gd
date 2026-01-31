class_name GraphNodeCustom extends Node

var _isPressing: bool = false
var _targetPosition: Vector2 = Vector2.ZERO
var _motionDirection: Vector2

func _ready() -> void:
	_targetPosition = self.position
	$TextureRect/Button.button_down.connect(OnButtonDown)
	$TextureRect/Button.button_up.connect(OnButtonUp)

func OnButtonDown() -> void:
	_isPressing = true
	_targetPosition = get_viewport().get_mouse_position()

func OnButtonUp() -> void:
	_isPressing = false


func _process(delta: float) -> void:
	if _isPressing:
		_motionDirection = (_targetPosition - self.position) * 10
		_targetPosition = get_viewport().get_mouse_position()
		self.position = self.position.lerp(_targetPosition, 0.1)
		return
	self.position += _motionDirection * delta
	KeepInsideBounds()

func KeepInsideBounds() -> void:
	var screen_size: Vector2 = DisplayServer.window_get_size()
	var node_size: Vector2 = $TextureRect.size * 0.5 * self.scale
	
	print("screen_size:", screen_size)
	print("node_size:", node_size)
	print("position:", self.position)
	# Check left and right boundaries
	if self.position.x - node_size.x <= 0:
		self.position.x = node_size.x
		_motionDirection.x = -_motionDirection.x
	elif self.position.x + node_size.x >= screen_size.x:
		self.position.x = screen_size.x - node_size.x
		_motionDirection.x = -_motionDirection.x

	# Check top and bottom boundaries
	if self.position.y - node_size.y <= 0:
		self.position.y = node_size.y
		_motionDirection.y = -_motionDirection.y
	elif self.position.y + node_size.y >= screen_size.y:
		self.position.y = screen_size.y - node_size.y	
		_motionDirection.y = -_motionDirection.y