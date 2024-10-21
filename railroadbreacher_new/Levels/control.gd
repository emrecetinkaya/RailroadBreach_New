extends Control
var correct = false
var submit = null
func _ready() -> void:
	$ProgressBar.value = 18000
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
	$LineEdit.insert_text_at_caret("TRAIN IS ARRIVING")
	

func _on_button_11_pressed() -> void:
	$LineEdit.clear()
	

func _on_button_12_pressed() -> void:
	var submit = $LineEdit.text
	$"../../../SubViewportContainer/SubViewport/FullScene/Props/Tabelas ve Posters2/Tabelas ve Posters/Cube_004/InputText".text = (submit)
	$"../../../SubViewportContainer/SubViewport/FullScene/Props/Tabelas ve Posters2/Tabelas ve Posters/Cube_005/InputText".text = (submit)
	$"../../../SubViewportContainer/SubViewport/FullScene/Props/Tabelas ve Posters2/Tabelas ve Posters/Cube_006/InputText".text = (submit)
	$"../../../SubViewportContainer/SubViewport/FullScene/Props/Tabelas ve Posters2/Tabelas ve Posters/Cube_007/InputText".text = (submit)
	$"../../../SubViewportContainer/SubViewport/FullScene/Props/Tabelas ve Posters2/Tabelas ve Posters/Cube_008/InputText".text = (submit)
	$"../../../SubViewportContainer/SubViewport/FullScene/Props/Tabelas ve Posters2/Tabelas ve Posters/Cube_009/InputText".text = (submit)
	$"../../../SubViewportContainer/SubViewport/FullScene/Props/Tabelas ve Posters2/Tabelas ve Posters/Cube_010/InputText".text = (submit)
	$"../../../SubViewportContainer/SubViewport/FullScene/Props/Tabelas ve Posters2/Tabelas ve Posters/Cube_011/InputText".text = (submit)
	$LineEdit.clear()
	$LineEdit.insert_text_at_caret("    SUBMITTED    ")

func _physics_process(delta: float) -> void:
	if !correct:
		$ProgressBar.value -= 1
	if submit != null:
		if submit >=17 and $ProgressBar.value >= 61200:
			print("correct")
			correct = true
		if (submit >= 16 and submit < 17) and ($ProgressBar.value >= 57600 and $ProgressBar.value < 61200):
			print("correct")
			correct = true
		if (submit >=15 and submit < 16) and ($ProgressBar.value >= 54000 and $ProgressBar.value < 57600):
			print("correct")
			correct = true
		if (submit >= 14 and submit < 15) and ($ProgressBar.value >= 50400 and $ProgressBar.value < 54000):
			print("correct")
			correct = true
		if (submit >= 13 and submit < 14) and ($ProgressBar.value >= 46800 and $ProgressBar.value < 50400):
			print("correct")
			correct = true
		if (submit >= 12 and submit < 13) and ($ProgressBar.value >= 43200 and $ProgressBar.value < 46800):
			print("correct")
			correct = true
		if (submit >= 11 and submit < 12) and ($ProgressBar.value >= 39600 and $ProgressBar.value < 43200):
			print("correct")
			correct = true
		if (submit >= 10 and submit < 11) and ($ProgressBar.value >= 36000 and $ProgressBar.value < 39600):
			print("correct")
			correct = true
		if (submit >= 9 and submit < 10) and ($ProgressBar.value >= 32400 and $ProgressBar.value < 36000):
			print("correct")
			correct = true
		if (submit >= 8 and submit < 9) and ($ProgressBar.value >= 28800 and $ProgressBar.value < 32400):
			print("correct")
			correct = true
		if (submit >= 7 and submit < 8) and ($ProgressBar.value >= 25200 and $ProgressBar.value < 28800):
			print("correct")
			correct = true
		if (submit >= 6 and submit < 7) and ($ProgressBar.value >= 21600 and $ProgressBar.value < 25200):
			print("correct")
			correct = true
		if (submit >= 5 and submit < 6) and ($ProgressBar.value >= 18000 and $ProgressBar.value < 21600):
			print("correct")
			correct = true
		if (submit >= 4 and submit < 5) and ($ProgressBar.value >= 14400 and $ProgressBar.value < 21600):
			print("correct")
			correct = true
		if (submit >= 3 and submit < 4) and ($ProgressBar.value >= 10800 and $ProgressBar.value < 14400):
			print("correct")
			correct = true
		if (submit >= 2 and submit < 3) and ($ProgressBar.value >= 7200 and $ProgressBar.value < 10800):
			print("correct")
			correct = true
		if (submit >= 1 and submit < 2) and ($ProgressBar.value >= 3600 and $ProgressBar.value < 7200):
			print("correct")
			correct = true
		if (submit == "ARR") and ($ProgressBar.value >= 0 and $ProgressBar.value < 3600):
			print("correct")
			correct = true
		else: print("incorrect")
