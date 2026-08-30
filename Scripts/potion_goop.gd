extends MeshInstance3D

var ing_count: int = 0

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("ing"):
		var ing: Ingredient = body
		material_override.albedo_color = ing.color
		body.queue_free()
		ing_count += 1
		if ing_count == 6 :
			%TrueEnding.visible = true
			$"../../../../GameUI/TrueEnding/AudioStreamPlayer3D".play()
		else :
			$AudioStreamPlayer3D.play()
