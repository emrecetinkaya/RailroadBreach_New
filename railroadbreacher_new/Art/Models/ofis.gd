extends Area3D

@onready var subtitle_label: Label = $"../SubViewportContainer/SubViewport/Character/Control/SubtitleLabel"

var office_entered = 0
var office_exited = 0
signal officeentered(office_entered)
signal officeexited(office_exited)



var incomingsubmittedvalue = "txt"
var storymilestone = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_body_entered(body: CharacterBody3D):
	print("entered office")
	office_entered += 1
	emit_signal("officeentered")
	if office_entered == 1:
		subtitle_label.visible = true
		subtitle_label.text = "- I should log the train's arrival time"
		await get_tree().create_timer(2).timeout
		subtitle_label.text = ""
		await get_tree().create_timer(1).timeout
		subtitle_label.text = "- I can use the right screen for that"
		await get_tree().create_timer(2).timeout
		subtitle_label.text = ""

func _on_body_exited(body: CharacterBody3D) -> void:
	print("exited office")
	office_exited += 1
	emit_signal("officeexited")

	if storymilestone >= 1:
		subtitle_label.text = ""
	

func _on_character_exited_screen(screen_exit_count) -> void:
	if screen_exit_count == 1 and "60" in incomingsubmittedvalue:
		print("correct on the first try")
	elif screen_exit_count == 1:
		subtitle_label.text = "- I can see the arrival times at the poster behind the screen"
		await get_tree().create_timer(4).timeout
		subtitle_label.text = ""
		

	if screen_exit_count >= 2:
		subtitle_label.text = "- I should get out and clean up the place as I wait"
		storymilestone += 1
	

func _on_control_submittedvalue(submit: Variant) -> void:
	incomingsubmittedvalue = submit
