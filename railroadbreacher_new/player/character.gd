extends CharacterBody3D
var SPEED = 5.0
const JUMP_VELOCITY = 4.5
var mouse_sensitivity = 0.002
var hands_full = false
var on_camera = false

signal interacted

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
				print("interacted")
				emit_signal("interacted")
				collider.grab()
		if collider.has_method("change_cam"):
			if Input.is_action_just_pressed("interact") and $RayCast3D.is_colliding and on_camera == false:
				print(collider)
				$Camera3D.clear_current()
				on_camera = true
				collider.change_cam()
			if Input.is_action_just_pressed("interact") and $RayCast3D.is_colliding and on_camera == true:
				collider.change_cam()
		if collider.has_method("exit_cam"):
			if Input.is_action_just_pressed("secondary") and on_camera == true:
				$Camera3D.make_current()
				on_camera = false
				collider.exit_cam()
	move_and_slide()
	
