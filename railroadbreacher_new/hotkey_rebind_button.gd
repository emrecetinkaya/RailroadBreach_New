class_name hotkey_rebind_button
extends Control

@onready var label = $HBoxContainer/Label
@onready var button = $HBoxContainer/Button

@export var action_name : String = "left"


func _ready() -> void:
	set_process_unhandled_key_input(false)
	set_action_name()
	set_text_for_key()
	

func set_action_name():
	label.text = "unassigned"
	
	match action_name:
		"left":
			label.text = "Move Left"
		"right":
			label.text = "Move Right"
		"jump":
			label.text = "Jump"
		"forward":
			label.text = "Move Forward"
		"backward":
			label.text = "Move Backward"
		"interact":
			label.text = "Interact"
		"secondary":
			label.text = "Secondary Action"
		"menu":
			label.text = "Menu"



func set_text_for_key():
	var action_events = InputMap.action_get_events(action_name)
	var action_event = (InputEventKey)action_events[0]
	var action_keycode = OS.get_keycode_string(action_event.physical_keycode)
	
	button.text = "%s" % action_keycode
