class_name ColorAnimator extends Node

@export var buttonStyleBox: StyleBoxTexture:
	set(value):
		buttonStyleBox = value
		hoverColor = value.modulate_color * 1.1
		pressedColor = value.modulate_color * 1.15

@export var pressedColor:Color
@export var hoverColor:Color
@export var disabledColor:Color
@export var focusedColor:Color
@export var curve: Curve

@onready var _originalColor:Color = buttonStyleBox.modulate_color
@onready var targetColor: Color = _originalColor

var counter:float = 0

func _process(delta: float) -> void:
	buttonStyleBox.modulate_color = buttonStyleBox.modulate_color.lerp(targetColor, curve.sample(counter))
	if counter < curve.max_domain:
		counter += delta

func _on_button_mouse_exited() -> void:
	targetColor = _originalColor
	counter = 0

func _on_button_mouse_entered() -> void:
	targetColor = hoverColor
	counter = 0


func _on_button_button_down() -> void:
	targetColor = pressedColor
	counter = 0


func _on_button_button_up() -> void:
	targetColor = _originalColor
	counter = 0
