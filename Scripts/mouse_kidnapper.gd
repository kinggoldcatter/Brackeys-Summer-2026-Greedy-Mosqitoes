extends Node

@onready var platform = OS.get_name()

func _input(event: InputEvent) -> void:
	if platform == "Web":
		var mouse_click = event as InputEventMouseButton
		if mouse_click and mouse_click.button_index == 1 and mouse_click.pressed and not GameState.interacting:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
