extends Control


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
	print($LineEdit.text)
	$LineEdit.clear()
