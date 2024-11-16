extends Node3D

var trashcollected = 0
var storymilestone = 0
var papernumber = 1
var officeenter = 0
var paper

var paperpath = "res://objet_petit_a/faxpapers/paper.tscn"
var currentpaper = load(paperpath)

@onready var audio_stream_player_3d: AudioStreamPlayer3D = $faxmachine/AudioStreamPlayer3D

signal storymilestonechanged(storymilestone, intd)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func update_storymilestone():
	storymilestone += 1
	print("storymilestone ", storymilestone)



func paperchange():
	papernumber += 1
	paperpath = "res://objet_petit_a/faxpapers/paper_"+ str(papernumber) +".tscn"
	currentpaper = load(paperpath)




func printpaper():
	audio_stream_player_3d.play()
	await get_tree().create_timer(2).timeout
	paper = currentpaper.instantiate()
	add_child(paper)
	paper.global_transform.origin = $faxmachine/Marker3D.global_position
	paper.rotation_degrees = Vector3(15, 90, 90)
	
	var tween = get_tree().create_tween()
	tween.tween_property(paper, "global_position", Vector3(13.90655, 2.43, 15.37724) , 4)
	
	paper.freeze = true
	paper.papertaken.connect(on_papertaken)
	paperchange()




func _on_ofis_officeentered(office_entered: int) -> void:
	officeenter = office_entered
	print("office entered ", officeenter)
	if office_entered == 1:
		update_storymilestone()
		print("paper number ", papernumber)
		printpaper()







func _on_trashcans_trashcollected(amount: int) -> void:
	trashcollected = amount
	print(trashcollected, " trash collected")
	checkcurrentstatus()




func checkcurrentstatus():
	if trashcollected == 7 and officeenter >= 1:
		update_storymilestone()
	if storymilestone == 2:
		printpaper()
		


func on_papertaken(pickedup: int) -> void:
	if storymilestone == 2:
		$"SubViewportContainer/SubViewport/FullScene/Int Objects2/Trashcan2/St_03_161".rotation_degrees = Vector3(0, 0, -90)
		$"SubViewportContainer/SubViewport/FullScene/Int Objects2/Trashcan2/St_03_161".position = Vector3(-0.236, 0.54, -24.52)
		#should instantiate some trash in front of the trash can
		
