extends AudioStreamPlayer

onready var tween = $Tween

func update_volume(value):
	if value == 0:
		volume_db = -80
	elif value >= 5:
		volume_db = ((value-5)*2)
	else:
		volume_db = ((value-5)*8)

func fade():
	tween.interpolate_property(self,"volume_db", volume_db, -80,1)
	tween.start()
	yield(tween, "tween_all_completed") 
