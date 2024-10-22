extends StaticBody3D

var open = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func open_thing():
	print("sesame")
	if open:
		var tween = get_tree().create_tween()
		tween.tween_property($"..", "rotation_degrees", Vector3(0,180,-90) , 0.1)
		open = false
	elif !open:
		var tween = get_tree().create_tween()
		tween.tween_property($"..", "rotation_degrees", Vector3(0,90,-90), 0.1)
		open = true
