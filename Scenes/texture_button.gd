extends TextureButton


func _pressed() -> void:
	if GameState.deamon_there :
		GameState.pot_bought.emit()
