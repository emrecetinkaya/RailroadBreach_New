extends Node3D
var counter = 0
var handson = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()

func _on_timer_timeout():
	counter += 1
	if counter % 4 == 0:
		print("istasyonda")
		if counter == 4:
			$Label3D.text = ("01:00")
		if counter == 8:
			$Label3D.text = ("02:00")
			$Timer.set_paused(true)
			 
			
			
		if counter == 12:
			$Label3D.text = ("03:00")
		if counter == 16:
			$Label3D.text = ("04:00")
	elif counter % 4 == 1:
		print("3 durak kaldı")
		
	elif counter % 4 == 2:
		print("2 durak kaldı")
		
	elif counter % 4 == 3:
		print("1 durak kaldı")
		

func _physics_process(_delta : float):
	if handson == true:
		print("oldu")
		$Timer.set_paused(false)
		handson = false

func _on_character_interacted():
	print("görmüyom amq")
	if counter == 8:
		handson = true
		print("zamanı geldi")
