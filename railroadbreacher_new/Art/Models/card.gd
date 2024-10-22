extends Area3D

@onready var card = $"../SubViewportContainer/Int Objects/Cube_006"
@onready var marker = $Marker3D
@onready var bar = $ProgressBar
var once = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("interact"):
		bar.value = 0


func hold():
	if Input.is_action_pressed("interact") and once:
		bar.value +=1
		bar.visible = true
	if bar.value == 360:
		card.global_position = marker.global_position
		bar.visible = false
		once = false
