extends AudioStreamPlayer

func update_volume(value):
	if value == 0:
		volume_db = -80
	elif value >= 5:
		volume_db = ((value-5)*2)
	else:
		volume_db = ((value-5)*8)
