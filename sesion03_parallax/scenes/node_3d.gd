extends Node3D


func _ready() -> void:
	var m:MeshInstance3D = $MeshInstance3D.duplicate(DuplicateFlags.DUPLICATE_USE_INSTANTIATION)
	
	m.position.z -= 2
	
	m.mesh.resource_local_to_scene = true
	
	var m2:Material = m.get_active_material(0).duplicate(DuplicateFlags.DUPLICATE_USE_INSTANTIATION)

	#m2.get_active_material(0).resource_local_to_scene = true
	
	m2.albedo_color = Color.RED
	
	m.set_surface_override_material(0, m2)
	
	call_deferred("add_child", m)
