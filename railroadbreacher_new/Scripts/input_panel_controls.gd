extends Area3D

@onready var viewport = $"../SubViewportContainer2"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_cam():
	print ("change_cam")
	viewport.position = Vector2(0,0)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func exit_cam():
	viewport.position = Vector2(-1920,-1080)
	print("evet")
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
