extends RigidBody3D
@onready var original_parent = get_parent()
@onready var original_origin = transform.origin
@onready var new_parent = $"../Character/Marker3D"
@onready var character = $"../Character"
@onready var grabbed = false
@onready var target = $"../Character/Marker3D2"
func _physics_process(delta: float) -> void:
	if grabbed: 
		look_at(new_parent.global_position)
		print(position)

func grab():
	if !grabbed:
		freeze = true
		self.reparent(new_parent, true)
		if grabbed:
			global_transform.origin = new_parent.transform.origin
		position = Vector3(0.008641, -0.13637, -0.330138)
		collision_layer = 0
		collision_mask = 0
		grabbed = true
		
func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") and grabbed:
		secondary()
		var target_direction = (target.global_position - new_parent.global_position).normalized()
		apply_impulse((Vector3(target_direction)*10), global_position)
		character.hands_full = false

func secondary():
	if grabbed:
		freeze = false
		self.reparent(original_parent, true)
		collision_layer = 1
		collision_mask = 1
		grabbed = false


func _on_drop_area_body_entered(body: RigidBody3D) -> void:
	if !grabbed:
		print("success") 
