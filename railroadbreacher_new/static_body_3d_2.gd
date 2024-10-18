extends StaticBody3D





# Called every frame. 'delta' is the elapsed time since the previous frame.
func change_cam():
	$"../SubViewport/Camera3D".current = false
