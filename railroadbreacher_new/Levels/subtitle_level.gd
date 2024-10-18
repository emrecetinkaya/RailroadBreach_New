extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_subtitle_area_body_entered(body: CharacterBody3D) -> void:
	print("area entered")
	$Character/Control/SubtitleLabel.visible = true
	$Character/Control/SubtitleLabel.set_text($SubtitleArea.subtitletext)
