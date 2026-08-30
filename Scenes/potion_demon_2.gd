extends Node3D

@onready var player: Node3D = get_tree().get_first_node_in_group("the_player").find_child("Head")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(player.global_position)
