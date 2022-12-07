extends ECG

func _ready():
	pattern = [0, -40, 70, -200, 70, -40, 0]
	interval     = 0.5
	trail_length = 783
	back_length  = 50
	default()
