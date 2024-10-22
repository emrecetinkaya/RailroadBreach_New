extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".play_backwards("train_arrive_peron1_baketrial")
	$"../TrainAudio".play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
