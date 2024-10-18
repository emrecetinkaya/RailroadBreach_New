extends Control


func _ready() -> void:
	$ProgressBar.value = randi_range(32400,64800)
func _on_button_pressed() -> void:
	$LineEdit.insert_text_at_caret("1")


func _on_button_2_pressed() -> void:
	$LineEdit.insert_text_at_caret("2")


func _on_button_3_pressed() -> void:
	$LineEdit.insert_text_at_caret("3")


func _on_button_4_pressed() -> void:
	$LineEdit.insert_text_at_caret("4")


func _on_button_5_pressed() -> void:
	$LineEdit.insert_text_at_caret("5")
	

func _on_button_6_pressed() -> void:
	$LineEdit.insert_text_at_caret("6")


func _on_button_7_pressed() -> void:
	$LineEdit.insert_text_at_caret("7")
	


func _on_button_8_pressed() -> void:
	$LineEdit.insert_text_at_caret("8")


func _on_button_9_pressed() -> void:
	$LineEdit.insert_text_at_caret("9")
	


func _on_button_10_pressed() -> void:
	$LineEdit.insert_text_at_caret("ARRIVED")




func _on_button_11_pressed() -> void:
	$LineEdit.clear()


func _on_button_12_pressed() -> void:
	var submit = $LineEdit.text 
	$LineEdit.clear()

func _physics_process(delta: float) -> void:
	$ProgressBar.value -= 1
	print($ProgressBar.value)
	if submit >=17 and $ProgressBar.value >= 61200:
		print("correct")
	if (submit >= 16 and submit < 17) and ($ProgressBar.value >= 57600 and $ProgressBar.value < 61200):
		print("correct")
	if (submit >=15 and submit < 16) and ($ProgressBar.value >= 54000 and $ProgressBar.value < 57600):
		print("correct")
	if (submit >= 14 and submit < 15) and ($ProgressBar.value >= 50400 and $ProgressBar.value < 54000):
		print("correct")
	if (submit >= 13 and submit < 14) and ($ProgressBar.value >= 46800 and $ProgressBar.value < 50400):
		print("correct")
	if (submit >= 12 and submit < 13) and ($ProgressBar.value >= 43200 and $ProgressBar.value < 46800):
		print("correct")
	if (submit >= 11 and submit < 12) and ($ProgressBar.value >= 39600 and $ProgressBar.value < 43200):
		print("correct")
	if (submit >= 10 and submit < 11) and ($ProgressBar.value >= 36000 and $ProgressBar.value < 39600):
		print("correct")
		
