extends PathFollow3D

var area = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if area == true:
		const move_speed := 40
		$".".progress += move_speed * delta
	


func _on_area_3d_3_body_entered(body: CharacterBody3D) -> void:
	area = true
