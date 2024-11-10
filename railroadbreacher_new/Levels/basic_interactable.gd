
extends RigidBody3D
@onready var original_parent = get_parent()
@onready var original_origin = transform.origin
@onready var new_parent = $"../SubViewportContainer/SubViewport/Character/Marker3D"
@onready var character = $"../SubViewportContainer/SubViewport/Character"
@onready var grabbed = false
@onready var target = $"../SubViewportContainer/SubViewport/Character/Marker3D2"
@onready var sprite_2d: Sprite2D = $"../SubViewportContainer/SubViewport/Character/Sprite2D"


var itself = $".".name

signal grabed
signal letgo

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func grab():
	if !grabbed:
		freeze = true
		self.reparent(new_parent, true)
		new_parent.visible = false
		position = Vector3(0.008641, -0.3, -0.330138)
		emit_signal("grabed")
		if grabbed:
			global_transform.origin = new_parent.transform.origin
		#collision_layer = 0
		#collision_mask = 0
		$CollisionShape3D.disabled = true
		grabbed = true
		
		if itself == "coke_yellow":
			sprite_2d.texture = load("res://2D Sprites/Hands/trash fanta.png")
			sprite_2d.visible = true
		if itself == "coke":
			sprite_2d.texture = load("res://2D Sprites/Hands/trash cola.png")
			sprite_2d.visible = true
		if itself == "polaroid":
			sprite_2d.texture = load("res://2D Sprites/Hands/polaroid.png")
			sprite_2d.visible = true
		if itself == "chips":
			sprite_2d.texture = load("res://2D Sprites/Hands/cips lays.png")
			sprite_2d.visible = true
		if itself == "card":
			sprite_2d.texture = load("res://2D Sprites/Hands/akbil.png")
			sprite_2d.visible = true
		

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") and grabbed:
		secondary()
		var target_direction = (target.global_position + Vector3(0, 0.5, 0) - new_parent.global_position).normalized()
		apply_impulse((Vector3(target_direction)*0.2), position)
		character.hands_full = false
		sprite_2d.visible = false
		new_parent.visible = true
		$CollisionShape3D.disabled = false
		emit_signal("letgo")

func secondary():
	if grabbed:
		freeze = false
		self.reparent(original_parent, true)
		var target_direction = (target.global_position + Vector3(0, 0.8, 0) - new_parent.global_position).normalized()
		apply_impulse((Vector3(target_direction)*0.1), position)
		#$"../SubViewportContainer/SubViewport/Character/RayCast3D".get_collision_point
		#collision_layer = 1
		#collision_mask = 1
		grabbed = false
		character.hands_full = false
		sprite_2d.visible = false
		new_parent.visible = true
		$CollisionShape3D.disabled = false
		emit_signal("letgo")
