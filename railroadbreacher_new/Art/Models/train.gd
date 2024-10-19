extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_basic_interactable_grabed() -> void:
	$"../../../AnimationPlayer".play_backwards("train_arrive")
	$"../../../AudioStreamPlayer3D".play()
	
	
