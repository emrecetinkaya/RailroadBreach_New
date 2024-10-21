extends CharacterBody3D

@export var parent = get_parent() as PathFollow3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	const move_speed = 4
	$"..".progress += move_speed * delta
	$creep_anim/AnimationPlayer.play("rigAction")
