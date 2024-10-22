extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var collider = $"../Character/RayCast3D".get_collider()
	if $"../Character/RayCast3D".is_colliding():
		if collider.has_method("open_thing"):
			if Input.is_action_just_pressed("interact"):
					collider.open_thing()
