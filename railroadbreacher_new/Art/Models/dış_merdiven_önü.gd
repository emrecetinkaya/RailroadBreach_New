extends Area3D
@onready var subtitle_label: Label = $"../../SubViewportContainer/SubViewport/Character/Control/SubtitleLabel"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: CharacterBody3D) -> void:
	subtitle_label.visible = true
	subtitle_label.text = "- I can't leave, it isn't morning yet"
	print("subtitles")
	#await get_tree().create_timer(1.5).timeout

func _on_body_exited(body: Node3D) -> void:
	subtitle_label.visible = true
	subtitle_label.text = ""
