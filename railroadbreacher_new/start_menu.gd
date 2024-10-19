extends Control

@onready var volume_slider = $MarginContainer/HSlider as HSlider
@onready var start_button = $MarginContainer/VBoxContainer/Button as Button
@onready var credits_button = $MarginContainer/VBoxContainer/Button3 as Button
@onready var exit_button = $MarginContainer/VBoxContainer/Button4 as Button
@onready var margin_container = $MarginContainer as MarginContainer

var level = preload("res://Art/Models/Models.tscn") as PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	handle_signals()
	$AudioStreamPlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
func handle_signals():
	start_button.button_down.connect(on_start_pressed)
	exit_button.button_down.connect(on_exit_pressed)


func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(level)



func on_exit_pressed() -> void:
	get_tree().quit()
	
