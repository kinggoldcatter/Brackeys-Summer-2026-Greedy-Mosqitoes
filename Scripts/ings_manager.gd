extends Node


func _ready() -> void:
	GameState.pot_bought.connect(on_pot_bought)
	$Ings.process_mode = Node.PROCESS_MODE_DISABLED
	
func on_pot_bought() -> void:
	$Ings.process_mode = Node.PROCESS_MODE_PAUSABLE
	$Ings.visible = true
