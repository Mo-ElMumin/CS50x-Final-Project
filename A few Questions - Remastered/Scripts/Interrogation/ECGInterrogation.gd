extends ECG

onready var decay_rate = 0.075

func _ready():
	pattern      = [0, -20, 45, -115, 45, -20, 0]
	interval     = 0.5
	trail_length = 500
	back_length  = 40
	default()

func _physics_process(delta):
	decay_bpm(delta)
	
func set_bpm(bpm):
	interval = clamp(interval + (bpm * 0.5), 0.5, 4)

func decay_bpm(delta):
	interval = clamp(interval - ( decay_rate * delta), 0.5, 4)

	
