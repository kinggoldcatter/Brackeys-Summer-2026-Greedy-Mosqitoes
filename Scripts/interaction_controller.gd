extends Node

@onready var hand: Marker3D = $"../Hand"
@onready var interaction_ray_cast: RayCast3D = $"../InteractionRayCast"
@onready var player_camera: Camera3D = $"../Camera"

var current_object: Object
var last_potential_object: Object
var interaction_component: InteractionComponent

func _process(delta: float) -> void:
	
	
	if current_object:
		if Input.is_action_just_pressed("secondary"):
			if interaction_component:
				interaction_component.aux_interact()
				current_object = null
		elif Input.is_action_pressed("primary"):
			if interaction_component:
				interaction_component.interact()
			else:
				if interaction_component:
					interaction_component.post_interact()
					current_object = null
	else:
		var potential_object: Object = interaction_ray_cast.get_collider()
		
		if potential_object and potential_object is Node:
			interaction_component = potential_object.get_node_or_null("InteractionComponent")
			if interaction_component:
				if interaction_component.can_interact == false:
					return
				
				last_potential_object = current_object
				
				if Input.is_action_pressed("primary"):
					current_object = potential_object
					interaction_component.pre_interact()
					
