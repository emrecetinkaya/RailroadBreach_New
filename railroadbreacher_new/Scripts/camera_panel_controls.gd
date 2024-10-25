extends Area3D

@onready var viewport = $"../SubViewportContainer3"
@onready var camera_1 = $"../SubViewportContainer3/SubViewport/CanvasLayer/ColorRect/Camera3D"
@onready var camera_2 = $"../SubViewportContainer3/SubViewport/CanvasLayer/ColorRect/Camera3D2"
@onready var camera_3 = $"../SubViewportContainer3/SubViewport/CanvasLayer/ColorRect/Camera3D3"
@onready var camera_4 = $"../SubViewportContainer3/SubViewport/CanvasLayer/ColorRect/Camera3D4"
@onready var audio_listener_3d: AudioListener3D = $"../AudioListener3D"


var audio = load("res://sounds/(mouse click loud)697565_siyaam_big-mouse-click.mp3")
var activecamera = camera_1
var previouscamera = camera_4
var cameracycle = 0

var cameras_entered = 0
var cameras_exited = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#bilgisayar sesi
	#$"../PCAmbientSound".play
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	
	if $"../SubViewportContainer/SubViewport/Character".on_camera == true: 
		if Input.is_action_pressed("forward") or Input.is_action_pressed("backward") or Input.is_action_pressed("left") or Input.is_action_pressed("right") or Input.is_action_pressed("jump"):
			exit_cam()
		
	if cameracycle <= 0:
		$"../SubViewportContainer/SubViewport/Character".on_camera = false
	else:
		$"../SubViewportContainer/SubViewport/Character".on_camera = true

func enter_cam():
	viewport.position = Vector2(0,0)
	cameracycle += 1
	$"../SubViewportContainer/SubViewport/Character/Camera3D".current = false
	audio_listener_3d.current = true
	$"../PCSesi".play()
	cameras_entered += 1
	


func change_cam():
	print ("camera cycle", cameracycle)
	if $"../SubViewportContainer/SubViewport/Character".on_camera == true: 
		if camera_1.current and cameracycle > 0:
			camera_2.current = true
			audio_listener_3d.current = true
			activecamera = camera_2
			cameracycle += 1
		elif camera_2.current and cameracycle > 0:
			camera_3.current = true
			audio_listener_3d.current = true
			activecamera = camera_3
			cameracycle += 1
		elif camera_3.current and cameracycle > 0:
			camera_4.current = true
			audio_listener_3d.current = true
			activecamera = camera_4
			cameracycle += 1
		elif camera_4.current and cameracycle > 0:
			camera_1.current = true
			audio_listener_3d.current = true
			activecamera = camera_1
			cameracycle += 1
	$"../PCSesi".play()
	
func exit_cam():
	
	cameras_exited += 1
		#camera stays the same as you exit the screen
	if activecamera == camera_1:
		previouscamera = camera_4
		camera_4.current = true
	elif activecamera == camera_2:
		previouscamera = camera_1
		camera_1.current = true
	elif activecamera == camera_3:
		previouscamera = camera_2
		camera_2.current = true
	elif activecamera == camera_4:
		previouscamera = camera_3
		camera_3.current = true
	viewport.position = Vector2(-1920,-1080)
	cameracycle = 0
	$"../SubViewportContainer/SubViewport/Character/Camera3D".current = true



func change_cam_better():
	$"../PCSesi".play()
	if camera_1.current:
		camera_2.current = true
		activecamera = camera_2
	elif camera_2.current:
		camera_3.current = true
		activecamera = camera_3
	elif camera_3.current:
		camera_4.current = true
		activecamera = camera_4
	else:
		camera_1.current = true
		activecamera = camera_1
