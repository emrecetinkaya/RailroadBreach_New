
extends RigidBody3D
@onready var original_parent = get_parent()
@onready var original_origin = transform.origin
@onready var new_parent = $"../SubViewportContainer/SubViewport/Character/Marker3D"
@onready var character = $"../SubViewportContainer/SubViewport/Character"
@onready var grabbed = false
@onready var target = $"../SubViewportContainer/SubViewport/Character/Marker3D2"

signal grabed
signal letgo

func _physics_process(delta: float) -> void:
	pass

func grab():
	if !grabbed:
		$"../card".visible = true
		freeze = true
		self.reparent(new_parent, true)
		position = Vector3(0.008641, -0.4, -0.330138)
		emit_signal("grabed")
		if grabbed:
			global_transform.origin = new_parent.transform.origin
		collision_layer = 0
		collision_mask = 0
		grabbed = true
		
		

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") and grabbed:
		secondary()
		var target_direction = (target.global_position + Vector3(0, 0.5, 0) - new_parent.global_position).normalized()
		apply_impulse((Vector3(target_direction)*10), position)
		character.hands_full = false
		$"../card".visible = true
		emit_signal("letgo")

func secondary():
	if grabbed:
		freeze = false
		self.reparent(original_parent, true)
		var target_direction = (target.global_position + Vector3(0, 0.8, 0) - new_parent.global_position).normalized()
		apply_impulse((Vector3(target_direction)*2), position)
		#$"../SubViewportContainer/SubViewport/Character/RayCast3D".get_collision_point
		collision_layer = 1
		collision_mask = 1
		grabbed = false
		character.hands_full = false
		$"../card".visible = true
		emit_signal("letgo")
