extends Control
var start = preload("res://Art/Models/New_Models_Best.tscn")
var settings = preload("res://options.tscn")
var credits = preload("res://credits.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(start)


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_packed(settings)


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_packed(credits)


func _on_button_4_pressed() -> void:
	get_tree().quit()
