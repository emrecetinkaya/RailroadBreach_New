extends StaticBody3D

var open = false
var audio = load("res://sounds/(door close)sfx100v2_door_05.mp3")

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
		tween.tween_property($"..", "rotation_degrees", Vector3(0,0,0) , 0.1)
		open = false
		audio = load("res://sounds/(door close)sfx100v2_door_05.mp3")
		$"../../AudioStreamPlayer3D".set_stream(audio)
		await get_tree().create_timer(0.1).timeout
		$"../../AudioStreamPlayer3D".play()
		
	elif !open:
		var tween = get_tree().create_tween()
		tween.tween_property($"..", "rotation_degrees", Vector3(0,90,0), 0.1)
		open = true
		audio = load("res://sounds/(kapi)sfx100v2_door_04.mp3")
		$"../../AudioStreamPlayer3D".set_stream(audio)
		$"../../AudioStreamPlayer3D".play()
