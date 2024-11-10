extends Area3D

var erasable

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: RigidBody3D) -> void:
	erasable = body
	erasable.get_child(1).disabled = true
	get_tree().create_timer(0.3).timeout
	erasable.queue_free()
	
