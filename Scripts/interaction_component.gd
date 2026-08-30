extends Node
class_name InteractionComponent

enum InteractionType {
	DEFAULT
}

@export var object_ref: Node3D 
@export var interaction_type: InteractionType = InteractionType.DEFAULT

var can_interact: bool = true
var is_inteacting: bool = false

var player_hand: Marker3D

func _ready() -> void:
	pass



func pre_interact() -> void:
	print("we are doing stuff")
	is_inteacting = true
	match interaction_type:
		InteractionType.DEFAULT:
			var player: Node = get_tree().get_first_node_in_group("the_player")
			player_hand = player.find_child("Hand", true, false)

func  interact() -> void:
	if not can_interact: 
		return
	
	match  interaction_type:
		InteractionType.DEFAULT:
			_default_interact()
	

func aux_interact() -> void:
	if not can_interact: 
		return
	
	match  interaction_type:
		InteractionType.DEFAULT:
			_default_throw()

func post_interact() -> void:
	is_inteacting = false

func _input(event: InputEvent) -> void:
	pass
	
	
func _default_interact() -> void:
	var object_current_position: Vector3 = object_ref.global_transform.origin
	var player_hand_position: Vector3 = player_hand.global_transform.origin
	var object_distance: Vector3 = player_hand_position - object_current_position
	
	var rigid_body_3d: RigidBody3D = object_ref as RigidBody3D
	if rigid_body_3d:
		rigid_body_3d.set_linear_velocity((object_distance)*(5/rigid_body_3d.mass))


func _default_throw() -> void:
	var object_current_position: Vector3 = object_ref.global_transform.origin
	var player_hand_position: Vector3 = player_hand.global_transform.origin
	var object_distance: Vector3 = player_hand_position - object_current_position
	
	var rigid_body_3d: RigidBody3D = object_ref as RigidBody3D
	if rigid_body_3d:
		var throw_direction: Vector3 = -player_hand.global_transform.basis.z.normalized()
		var throw_strength: float = (20.0/rigid_body_3d.mass)
		rigid_body_3d.set_linear_velocity(throw_direction*throw_strength)
		can_interact = false
		await  get_tree().create_timer(2.0).timeout
		can_interact = true
