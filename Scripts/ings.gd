extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.pot_bought.connect(on_pot_bought)
	process_mode = Node.PROCESS_MODE_DISABLED

func on_pot_bought() -> void:
	process_mode = Node.PROCESS_MODE_PAUSABLE
