extends Area3D

@onready var viewport = $"../SubViewportContainer3"
@onready var camera_1 = $"../SubViewportContainer3/SubViewport/Camera3D"
@onready var camera_2 = $"../SubViewportContainer3/SubViewport/Camera3D2"
@onready var camera_3 = $"../SubViewportContainer3/SubViewport/Camera3D3"
@onready var camera_4 = $"../SubViewportContainer3/SubViewport/Camera3D4"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_cam():
	print ("change_cam")
	viewport.position = Vector2(0,0)
	if camera_1.current:
		camera_2.current = true
	elif camera_2.current:
		camera_3.current = true
	elif camera_3.current:
		camera_4.current = true
	else:
		camera_1.current = true
		
	
func exit_cam():
	viewport.position = Vector2(-1920,-1080)
	print("evet")
