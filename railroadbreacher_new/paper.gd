extends RigidBody3D
@onready var original_parent = get_parent()
@onready var original_origin = transform.origin
@onready var new_parent: Marker3D = $"../SubViewportContainer/SubViewport/Character/Marker3D"
@onready var character: CharacterBody3D = $"../SubViewportContainer/SubViewport/Character"
@onready var grabbed = false
@onready var target: Marker3D = $"../SubViewportContainer/SubViewport/Character/Marker3D2"

var target_direction: Vector3

var pickedup = 0
var dropped = 0

signal papertaken(pickedup: int)

#func _ready() -> void:
	#self.reparent($".", true)

	
func _physics_process(_delta: float) -> void:
	pass
	#if grabbed: 
		#look_at(new_parent.global_position)

func grab():
	if !grabbed:
		freeze = true
		self.reparent(new_parent, true)
		if grabbed:
			global_transform.origin = new_parent.transform.origin
		position = Vector3(0.008641, -0.13637, -0.330138)
		rotation = Vector3(0, 0, 0)
		#collision_layer = 0
		#collision_mask = 0
		$CollisionShape3D.disabled = true
		grabbed = true
		pickedup += 1
		emit_signal("papertaken", pickedup)
		
func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") and grabbed:
		secondary()
		target_direction = (target.global_position - new_parent.global_position).normalized()
		apply_impulse((Vector3(target_direction)*1), global_position)
		character.hands_full = false
		$CollisionShape3D.disabled = false
		dropped += 1

func secondary():
	if grabbed:
		freeze = false
		position = Vector3(0.008641, -0.15, -1)
		self.reparent(original_parent, true)
		#collision_layer = 1
		#collision_mask = 1
		$CollisionShape3D.disabled = false
		grabbed = false
		dropped += 1


func _on_drop_area_body_entered(_body: RigidBody3D) -> void:
	if !grabbed:
		print("success") 
		
