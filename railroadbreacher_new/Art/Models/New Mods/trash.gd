extends Area3D

var erasable
var trashamount = 0
signal trashcollected(amount: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: RigidBody3D) -> void:
	erasable = body
	erasable.get_child(1).disabled = true
	erasable.collision_layer = 4
	await get_tree().create_timer(0.3).timeout
	erasable.queue_free()
	trashamount += 1
	emit_signal("trashcollected", trashamount)
	

func trashcan():
	pass
