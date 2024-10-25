extends CharacterBody3D
var SPEED = 4.0
const JUMP_VELOCITY = 4.5
var mouse_sensitivity = 0.002
var hands_full = false
var on_camera = false
var crouched = false
var y = 1
var spritepath = "res://2D Sprites/Hands/updated akbil.png"

signal entered_screen(screen_enter_count)
signal exited_screen(screen_exit_count)
var screen_enter_count = 0
var screen_exit_count = 0


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$Control/SubtitleLabel.visible = false

func _input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED and on_camera == false:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Camera3D.rotate_x(-event.relative.y * mouse_sensitivity)
		$Camera3D.rotation.x = clampf($Camera3D.rotation.x, -deg_to_rad(80), deg_to_rad(80))
		$RayCast3D.rotate_x(-event.relative.y * mouse_sensitivity)
		$RayCast3D.rotation.x = clampf($RayCast3D.rotation.x, -deg_to_rad(80), deg_to_rad(80))
		$Marker3D.rotate_x(-event.relative.y * mouse_sensitivity)
		$Marker3D.rotation.x = clampf($Marker3D.rotation.x, -deg_to_rad(80), deg_to_rad(80))
		$Marker3D2.rotate_x(-event.relative.y * mouse_sensitivity)
		$Marker3D2.rotation.x = clampf($Marker3D.rotation.x, -deg_to_rad(80), deg_to_rad(80))

	if event.is_action_pressed("menu"):
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		else:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			
	if Input.is_action_just_pressed("crouch"):
		if !crouched:
			crouched = true
			$CrouchedCollision.disabled = false
			$CollisionShape3D.disabled = true
			var tween = get_tree().create_tween()
			tween.tween_property($Camera3D, "position", Vector3(0, 0.33,0), 0.2)
			tween.set_parallel()
			tween.tween_property($RayCast3D, "position", Vector3(0, 0.33,0), 0.2)
			tween.set_parallel()
			tween.tween_property($Marker3D, "position", Vector3(0, 0.33,0), 0.2)
			tween.set_parallel()
			tween.tween_property($Marker3D2, "position", Vector3(0, 0.33,-2), 0.2)
		elif crouched:
			crouched = false
			$CrouchedCollision.disabled = true
			$CollisionShape3D.disabled = false
			var tween = get_tree().create_tween()
			tween.tween_property($Camera3D, "position", Vector3(0, 0.73,0), 0.2)
			tween.set_parallel()
			tween.tween_property($RayCast3D, "position", Vector3(0, 0.73,0), 0.2)
			tween.set_parallel()
			tween.tween_property($Marker3D, "position", Vector3(0, 0.73,0), 0.2)
			tween.set_parallel()
			tween.tween_property($Marker3D2, "position", Vector3(0, 0.73,-2), 0.2)
			





func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
		
	if Input.is_action_just_pressed("Toggle Flashlight"):
			print("f pressed")
			$SpotLight3D.visible = !$SpotLight3D.visible
			
		
	# Handle jump.
	#if Input.is_action_just_pressed("jump") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#	
	if Input.is_action_pressed("secondary") and hands_full:
		var item = $Marker3D.get_child(0)
		item.secondary()
		hands_full = false
#Open and close menu.
	if on_camera:
		SPEED = 0
	else: SPEED = 4.0
		
	if crouched:
		SPEED = 2.5
	else: SPEED = 4.0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction :
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	var collider = $RayCast3D.get_collider()
	if $RayCast3D.is_colliding():
		
		if collider.has_method("hold"):
			if Input.is_action_pressed("interact"):
				collider.hold()

		if collider.has_method("open_thing"):
			if Input.is_action_just_pressed("interact") and !hands_full:
				collider.open_thing()
				
				
		if collider.has_method("grab"):
			$Control/Label.text = "PRESS LEFT CLICK TO GRAB"
			if Input.is_action_just_pressed("interact") and !hands_full:
				hands_full = true
				collider.grab()


		if collider.has_method("change_cam") and collider.has_method("enter_cam"):
			$Control/Label.text = "PRESS LEFT CLICK TO INTERACT"
			if Input.is_action_just_pressed("interact") and on_camera == false:
				print(collider)
				$Camera3D.clear_current()
				collider.enter_cam()
				emit_signal("entered_screen", screen_enter_count)
				screen_enter_count += 1
				collider.change_cam()

			if Input.is_action_just_pressed("interact") and on_camera == true:
				collider.change_cam()
				collider.enter_cam()


		if collider.has_method("exit_cam"):
			
			if Input.is_action_just_pressed("secondary") and on_camera == true:
					$Camera3D.make_current()
					collider.exit_cam()
					on_camera = false
					screen_exit_count += 1
					emit_signal("exited_screen", screen_exit_count)


			if collider.has_method("change_cam_better") and !on_camera:
				if Input.is_action_just_pressed("secondary"):
					collider.change_cam_better()
					

	move_and_slide()
	
	if !$RayCast3D.is_colliding():
		$Control/Label.text = "."

func _on_card_grabed() -> void:
	spritepath = $Control/Sprite2D.texture
	$Control/Sprite2D.visible = true
	var tween1 = get_tree().create_tween().set_loops()
	tween1.tween_property($Control/Sprite2D, "position", Vector2(512, 750), 1)
	tween1.tween_property($Control/Sprite2D, "position", Vector2(512, 700), 1)
	
func _on_card_letgo() -> void:
	$Control/Sprite2D.visible = false
