extends Area3D

signal print
signal printtaken


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	emit_signal("print")




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func paper_taken():
	pass
