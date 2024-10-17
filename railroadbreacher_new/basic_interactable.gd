extends RigidBody3D
@onready var original_parent = get_parent()
@onready var original_origin = transform.origin
@onready var new_parent = $"../Character/Marker3D"
@onready var grabbed = false


func grab():
	if !grabbed:
		freeze = true
		self.reparent(new_parent, false)
		global_transform.origin = new_parent.transform.origin
		collision_layer = 0
		collision_mask = 0
		grabbed = true
		
		
func secondary():
	if grabbed:
		freeze = false
		self.reparent(original_parent, false)
		collision_layer = 1
		collision_mask = 1
		grabbed = false
