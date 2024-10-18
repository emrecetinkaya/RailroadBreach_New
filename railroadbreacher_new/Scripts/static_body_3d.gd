extends StaticBody3D
@onready var camera_1 = $"../SubViewport/Camera3D"
@onready var camera_2 = $"../SubViewport/Camera3D2"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func change_cam():
	if camera_1.current:
		camera_2.current = true
	else:
		camera_1.current = true
