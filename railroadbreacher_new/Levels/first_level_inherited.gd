extends Node3D

@onready var camera_change_box = $Area3D/CollisionShape3D
var paper: PackedScene = preload("res://paper.tscn")
var spawn = paper.instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("0"):
		add_child(spawn)
