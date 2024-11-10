extends Node3D

var storymilestone = 0

var currentpaper = preload("res://objet_petit_a/faxpapers/paper.tscn")
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $faxmachine/AudioStreamPlayer3D

signal storymilest

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(10).timeout
	printpaper()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_faxmachine_print() -> void:
	pass



func printpaper():
	audio_stream_player_3d.play()
	await get_tree().create_timer(2).timeout
	var paper = currentpaper.instantiate()
	add_child(paper)
	paper.global_transform.origin = $faxmachine/Marker3D.global_position
	paper.rotation_degrees = Vector3(15, 90, 90)
	
	var tween = get_tree().create_tween()
	tween.tween_property(paper, "global_position", Vector3(13.90655, 2.43, 15.37724) , 4)
	
	paper.freeze = true


func _on_ofis_officeentered(office_entered: Variant) -> void:
	print("çalışıoy")
	print(office_entered)
	if office_entered >= 1:
		printpaper()
