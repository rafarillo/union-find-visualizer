class_name ColorAnimator extends Node

@export var buttonStyleBox: StyleBoxTexture
@export var pressedColor:Color
@export var hoverColor:Color
@export var disabledColor:Color
@export var focusedColor:Color


func _on_button_mouse_exited() -> void:
	print("Exit hover")

func _on_button_mouse_entered() -> void:
	print("bla")
	buttonStyleBox.modulate_color = Color.RED
