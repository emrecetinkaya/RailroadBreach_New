extends Control
var correct = false
var submit = "text"
var submitcounter = 0
var currentframe = 18000
var kharmapoints = 100000
var clock = 00.00

var input1 = 99
var input2 = 99
var input3 = 99
var submittedinput: int = 9999
var hardsubmit: int = 9999
var submitcorrect = false

@onready var subtitle_label: Label = $"../../../SubViewportContainer/SubViewport/Character/Control/SubtitleLabel"

signal submitcount(submitcounter)
signal submittedvalue(submit, hardsubmit, submitcorrect)

func _ready() -> void:
	start_progress_bar()
	get_tree().create_timer(60).timeout
	kharmapoints = 100000
	
func start_progress_bar():
	$ProgressBar.value = 10800
	
func _on_button_pressed() -> void:
	$LineEdit.insert_text_at_caret("1")
	inputcheck(1)

func _on_button_2_pressed() -> void:
	$LineEdit.insert_text_at_caret("2")
	inputcheck(2)

func _on_button_3_pressed() -> void:
	$LineEdit.insert_text_at_caret("3")
	inputcheck(3)

func _on_button_4_pressed() -> void:
	$LineEdit.insert_text_at_caret("4")
	inputcheck(4)

func _on_button_5_pressed() -> void:
	$LineEdit.insert_text_at_caret("5")
	inputcheck(5)

func _on_button_6_pressed() -> void:
	$LineEdit.insert_text_at_caret("6")
	inputcheck(6)

func _on_button_7_pressed() -> void:
	$LineEdit.insert_text_at_caret("7")
	inputcheck(7)

func _on_button_8_pressed() -> void:
	$LineEdit.insert_text_at_caret("8")
	inputcheck(8)

func _on_button_9_pressed() -> void:
	$LineEdit.insert_text_at_caret("9")
	inputcheck(9)

func _on_button_10_pressed() -> void:
	$LineEdit.clear()
	input1 = 99
	input2 = 99

func _on_button_11_pressed() -> void:
	$LineEdit.insert_text_at_caret("0")
	

func _on_button_12_pressed() -> void:
	submit = $LineEdit.text
	if input3 != 99:
		submittedinput = (input1*100) + (input2*10) + input3
		input1 = 99
		input2= 99
		input3 = 99
		print(submittedinput)
	elif input3 == 99:
		submittedinput = (input1*10) + input2
		input1 = 99
		input2 = 99
		print(submittedinput)
	hardsubmit = submittedinput
	submitcounter += 1
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
	await get_tree().create_timer(1).timeout
	$LineEdit.clear()
	$LineEdit.set_text(" MINUTES LEFT")
	emit_signal("submittedvalue", submit, hardsubmit, submitcorrect)



func check_entry(station):
	if station == 0:
		if ("0" in submit) or ("ARRIVED" in submit) or (hardsubmit <= 1):
			kharmapoints += 1
			submitcorrect = true
		else:
			kharmapoints -= 1
			submitcorrect = false
	if station == 21:
		if "21" in submit or 10 <= hardsubmit and hardsubmit <= 21:
			kharmapoints += 1
			submitcorrect = true
		else:
			kharmapoints -= 1
			submitcorrect = false
	if station == 38:
		if "38" in submit or 21 <= hardsubmit and hardsubmit <= 38:
			kharmapoints += 1
			submitcorrect = true
		else:
			kharmapoints -= 1
			submitcorrect = false
	if station == 60:
		if "60" in submit or 38 <= hardsubmit and hardsubmit <= 60:
			kharmapoints += 1
			submitcorrect = true
		else:
			kharmapoints -= 1
			submitcorrect = false
	if station == 404:
		kharmapoints -= 1
		submitcorrect = false



func _physics_process(delta: float) -> void:
	$ProgressBar.value -= 1
	currentframe = $ProgressBar.value 
	if 0 < currentframe and currentframe < 3149:
		check_entry(0)
	elif 3151 < currentframe and currentframe < 8099:
		check_entry(21)
	elif 8101 < currentframe and currentframe < 13499:
		check_entry(38)
	elif 13501 < currentframe and currentframe < 18000:
		check_entry(60)
	else:
		check_entry(404)
		
	
	if kharmapoints % 100 == 0:
		print(kharmapoints)
	
	
	
	
	if currentframe == 600:
		$"../../../Train/AnimationPlayer".play_backwards("Train Animations/new_train_arrive_4")
		await get_tree().create_timer(20).timeout
		$"../../../Train/AnimationPlayer".play("Train Animations/new_train_arrive_4")
	
	
	

func inputcheck(newinput):
	if input1 == 99:
		input1 = newinput
	elif input1 != 99:
		if input2 == 99:
			input2 = newinput
		elif input2 != 99:
			input3 = newinput









	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	#if !correct:
		#$ProgressBar.value -= 1
	#if submit != null:
		#if submit >=17 and $ProgressBar.value >= 61200:
			#print("correct")
			#correct = true
		#if (submit >= 16 and submit < 17) and ($ProgressBar.value >= 57600 and $ProgressBar.value < 61200):
			#print("correct")
			#correct = true
		#if (submit >=15 and submit < 16) and ($ProgressBar.value >= 54000 and $ProgressBar.value < 57600):
			#print("correct")
			#correct = true
		#if (submit >= 14 and submit < 15) and ($ProgressBar.value >= 50400 and $ProgressBar.value < 54000):
			#print("correct")
			#correct = true
		#if (submit >= 13 and submit < 14) and ($ProgressBar.value >= 46800 and $ProgressBar.value < 50400):
			#print("correct")
			#correct = true
		#if (submit >= 12 and submit < 13) and ($ProgressBar.value >= 43200 and $ProgressBar.value < 46800):
			#print("correct")
			#correct = true
		#if (submit >= 11 and submit < 12) and ($ProgressBar.value >= 39600 and $ProgressBar.value < 43200):
			#print("correct")
			#correct = true
		#if (submit >= 10 and submit < 11) and ($ProgressBar.value >= 36000 and $ProgressBar.value < 39600):
			#print("correct")
			#correct = true
		#if (submit >= 9 and submit < 10) and ($ProgressBar.value >= 32400 and $ProgressBar.value < 36000):
			#print("correct")
			#correct = true
		#if (submit >= 8 and submit < 9) and ($ProgressBar.value >= 28800 and $ProgressBar.value < 32400):
			#print("correct")
			#correct = true
		#if (submit >= 7 and submit < 8) and ($ProgressBar.value >= 25200 and $ProgressBar.value < 28800):
			#print("correct")
			#correct = true
		#if (submit >= 6 and submit < 7) and ($ProgressBar.value >= 21600 and $ProgressBar.value < 25200):
			#print("correct")
			#correct = true
		#if (submit >= 5 and submit < 6) and ($ProgressBar.value >= 18000 and $ProgressBar.value < 21600):
			#print("correct")
			#correct = true
		#if (submit >= 4 and submit < 5) and ($ProgressBar.value >= 14400 and $ProgressBar.value < 21600):
			#print("correct")
			#correct = true
		#if (submit >= 3 and submit < 4) and ($ProgressBar.value >= 10800 and $ProgressBar.value < 14400):
			#print("correct")
			#correct = true
		#if (submit >= 2 and submit < 3) and ($ProgressBar.value >= 7200 and $ProgressBar.value < 10800):
			#print("correct")
			#correct = true
		#if (submit >= 1 and submit < 2) and ($ProgressBar.value >= 3600 and $ProgressBar.value < 7200):
			#print("correct")
			#correct = true
		#if (submit == "ARR") and ($ProgressBar.value >= 0 and $ProgressBar.value < 3600):
			#print("correct")
			#correct = true
		#else: print("incorrect")
