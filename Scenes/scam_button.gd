extends TextureButton


func _on_pressed() -> void:
	GameState.got_scammed.emit()
	print("scammed")
