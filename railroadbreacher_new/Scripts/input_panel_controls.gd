extends Area3D

@onready var viewport = $"../SubViewportContainer2"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	

func enter_cam():
	$"../Sol Ekran Kameralar".cameracycle += 1

func change_cam():
	print ("change_cam")
	$"../SubViewportContainer/SubViewport/Character".on_camera = true
	viewport.position = Vector2(0,0)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func exit_cam():
	viewport.position = Vector2(-1920,-1080)
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$"../Sol Ekran Kameralar".cameracycle = 0
