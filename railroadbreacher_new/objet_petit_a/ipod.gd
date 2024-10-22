extends RigidBody3D
@onready var original_parent = get_parent()
@onready var original_origin = transform.origin
@onready var new_parent = $"../SubViewportContainer/SubViewport/Character/Marker3D"
@onready var character = $"../SubViewportContainer/SubViewport/Character"
@onready var grabbed = false
@onready var target = $"../SubViewportContainer/SubViewport/Character/Marker3D2"
@onready var creep = $"../creeep_anim"
var event = 0
var once = true
func grab():
	if !grabbed:
		freeze = true
		self.reparent(new_parent, true)
		if grabbed:
			global_transform.origin = new_parent.transform.origin
		collision_layer = 0
		collision_mask = 0
		grabbed = true
		if event == 0:
			creep.visible = true
			event +=1

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") and grabbed:
		secondary()
		var target_direction = (target.global_position - new_parent.global_position).normalized()
		apply_impulse((Vector3(target_direction)*10), global_position)
		character.hands_full = false
		grabbed = false

func secondary():
	if grabbed:
		freeze = false
		self.reparent(original_parent, true)
		collision_layer = 1
		collision_mask = 1
		grabbed = false


func _on_drop_area_body_entered(_body: RigidBody3D) -> void:
	if !grabbed:
		print("success") 


func _on_area_3d_3_body_entered(body: Node3D) -> void:
	creep.visible = false
	var on_area = true

func _physics_process(delta: float) -> void:
	var once = true
