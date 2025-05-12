extends Node2D

var SPEED_INI:float = 16
var SPEED_MIN:float = 8
var SPEED_MAX:float = 64

@onready var speed:float = SPEED_INI


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Camera2D.position.x += speed*delta
