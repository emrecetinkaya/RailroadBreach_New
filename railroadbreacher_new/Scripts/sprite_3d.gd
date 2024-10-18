extends Sprite3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func change_cam():
	print("changing cam")
	if $"../SubViewport/Camera3D".current:
		$"../SubViewport/Camera3D".current = false
		$"../SubViewport/Camera3D2".current = true
	if $"../SubViewport/Camera3D2".current:
		$"../SubViewport/Camera3D2".current = false
		$"../SubViewport/Camera3D".current = true
