class_name TransformAnimator extends Node

@export var hoverScale: float = 1.05
@export var pressScale: float = 0.95
@export var curve: Curve

var _targetSize: Vector2
var _counter: float = 0
var _originalSize: Vector2 = Vector2.ZERO
var _button: Button

func _ready() -> void:
	_button = get_parent() as Button
	_originalSize = _button.scale
	_targetSize = _originalSize

func _process(delta: float) -> void:
	_button.scale = _button.scale.lerp(_targetSize, curve.sample(_counter))
	if _counter < curve.max_domain:
		_counter += delta

func _on_button_button_down() -> void:
	_targetSize = _originalSize * pressScale
	_counter = 0

func _on_button_button_up() -> void:
	_targetSize = _originalSize
	_counter = 0


func _on_button_mouse_exited() -> void:
	_targetSize = _originalSize
	_counter = 0

func _on_button_mouse_entered() -> void:
	_targetSize = _originalSize * hoverScale
	_counter = 0
