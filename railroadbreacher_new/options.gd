class_name Options
extends Control
# Called when the node enters the scene tree for the first time.
@onready var back_button = $MarginContainer/VBoxContainer/BackButton as Button


signal exit_options_menu


func _ready() -> void:
	back_button.button_down.connect(on_back_pressed)
	set_process(false)

func on_back_pressed():
	exit_options_menu.emit()
	set_process(false)
