extends Area3D
@onready var subtitle_label: Label = $"../../SubViewportContainer/SubViewport/Character/Control/SubtitleLabel"
@onready var d___merdiven__n_: Area3D = $"."
@onready var sol_turnikeler: Area3D = $"../SolTurnikeler"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: CharacterBody3D) -> void:
	if self.name == "DışMerdivenÖnü" :
		if subtitle_label.visible == false:
			subtitle_label.visible = true
			subtitle_label.text = "- I can't leave, it isn't morning yet"
			print("subtitles")
	
	elif self.name == "SolTurnikeler" :
		if subtitle_label.visible == false:
			subtitle_label.visible = true
			subtitle_label.text = "- I am not responsible for this platform today"
			print("subtitles")



func _on_body_exited(body: CharacterBody3D) -> void:
	if subtitle_label.visible == true:
		subtitle_label.visible = false
		subtitle_label.text = ""
