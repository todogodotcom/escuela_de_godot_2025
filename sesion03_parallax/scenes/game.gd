extends Node2D

const SPEED_INI:float = 16
const SPEED_MIN:float = 8
const SPEED_MAX:float = 64

@export var speed:float = SPEED_INI


func _process(delta: float) -> void:
	if not has_node("Camera2D"):
		return

	$Camera2D.position.x += speed*delta
