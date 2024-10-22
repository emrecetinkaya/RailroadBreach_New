extends StaticBody3D


@onready var card_out = $SubViewportContainer/SubViewport/FullScene/Props/ticket_machine6/StaticBody3D/Marker3D
var card = preload("res://objet_petit_a/card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass

func hold():
	var instance = card.instantiate()
	card_out.add_child(instance)
