extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if get_parent().section1 == -1:
		get_parent().section1 = get_index()
	elif get_parent().section2 == -1:
		get_parent().section2 = get_index()
