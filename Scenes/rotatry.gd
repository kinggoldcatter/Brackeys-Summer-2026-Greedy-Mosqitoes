extends Node3D

var mouseOnObject: bool = false
var leftClicking = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("leftClick") and mouseOnObject:
		leftClicking = true
	elif Input.is_action_just_released("leftClick") or !mouseOnObject:
		leftClicking = false
		pass

func _physics_process(delta: float) -> void:
	if leftClicking:
		print("Im in here and im clicking up a storm")

func _on_area_3d_mouse_entered() -> void:
	print("Mouse in me")
	mouseOnObject = true	
	pass # Replace with function body.



func _on_area_3d_mouse_exited() -> void:
	print("Mouse left me :(")
	mouseOnObject = false
	pass # Replace with function body.
