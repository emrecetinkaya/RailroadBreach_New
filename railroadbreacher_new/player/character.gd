extends CharacterBody3D
var SPEED = 5.0
const JUMP_VELOCITY = 4.5
var mouse_sensitivity = 0.002
var hands_full = false
var on_camera = false
var crouched = false
var y = 1


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
			tween.tween_property($Marker3D2, "position", Vector3(0, 0.33,0), 0.2)
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
			tween.tween_property($Marker3D2, "position", Vector3(0, 0.73,0), 0.2)
			
	#if Input.is_action_just_pressed("1"):
		#y = 0
	#if Input.is_action_just_pressed("2"):
		#y = 1
	#if Input.is_action_just_pressed("3"):
		#y = 2
	#if Input.is_action_just_pressed("4"):
		#y = 3

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if Input.is_action_just_pressed("Toggle Flashlight"):
			print("f pressed")
			$SpotLight3D.visible = !$SpotLight3D.visible
			
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
#	
	if Input.is_action_pressed("secondary") and hands_full:
		var item = $Marker3D.get_child(0)
		item.secondary()
		hands_full = false
#Open and close menu.
	if on_camera:
		SPEED = 0
	else: SPEED = 5.0
		
	if crouched:
		SPEED = 2.5
	else: SPEED = 5.0

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
		if collider.has_method("grab"):
			if Input.is_action_just_pressed("interact") and $RayCast3D.is_colliding and !hands_full:
				hands_full = true
				collider.grab()
		if collider.has_method("change_cam"):
			if Input.is_action_just_pressed("interact") and $RayCast3D.is_colliding and on_camera == false:
				print(collider)
				$Camera3D.clear_current()
				collider.enter_cam()
				collider.change_cam()
			if Input.is_action_just_pressed("interact") and $RayCast3D.is_colliding and on_camera == true:
				collider.change_cam()
		if collider.has_method("exit_cam"):
			if Input.is_action_just_pressed("secondary") and on_camera == true:
				$Camera3D.make_current()
				on_camera = false
				collider.exit_cam()
			if collider.has_method("change_cam_better") and !on_camera:
				if Input.is_action_just_pressed("secondary"):
					collider.change_cam_better()
	move_and_slide()
	
