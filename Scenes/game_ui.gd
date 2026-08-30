extends Control

func _ready() -> void:
	GameState.got_scammed.connect(on_got_scammed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("restart"):
		get_tree().reload_current_scene()
	elif Input.is_action_pressed("quit"):
		get_tree().quit()

func on_got_scammed() -> void:
	$ScammedEnding.visible = true
