extends StaticBody3D
@onready var camera_1 = $"../SubViewportContainer/SubViewport/Camera3D"
@onready var camera_2 = $"../SubViewportContainer/SubViewport/Camera3D2"
@onready var viewport = $"../SubViewportContainer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func change_cam():
	viewport.position.x = 236
	viewport.position.y = 114
	if camera_1.current:
		camera_2.current = true
	else:
		camera_1.current = true
	
func exit_cam():
	print("evet")
	viewport.position.x = 3000
	viewport.position.y = 3000
