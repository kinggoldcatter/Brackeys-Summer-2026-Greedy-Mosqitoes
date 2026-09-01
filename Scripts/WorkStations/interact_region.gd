extends Area3D

@export var station_cam: Camera3D


var possible_interaction: bool = false
var looked_at: bool = false
var interacting: bool = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and looked_at and possible_interaction and not interacting:
		station_cam.current = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		interacting = true
		GameState.now_interacting.emit()
		
		
	elif Input.is_action_just_pressed("interact") and interacting:
		%Character.CAMERA.current = true
		station_cam.current = false
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		interacting = false
		GameState.done_interacting.emit()


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("the_player"):
		possible_interaction = true
		print("interaction time!")
	else :
		pass


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("the_player"):
		possible_interaction = false
		print("interaction time OVER!")
	else :
		pass


func _on_visible_on_screen_notifier_3d_screen_entered() -> void:
	looked_at = true


func _on_visible_on_screen_notifier_3d_screen_exited() -> void:
	looked_at = false
