class_name BackgroundMusic 
extends    AudioStreamPlayer

onready var tween = $Tween

func _ready() -> void:
	var init_volume = System.volume.background
	update_volume(init_volume)
	# comment this out // 
	connect("finished", self, "loop_music")
	play()

func loop_music():
	play()

func update_volume(value):
	if value == 0:
		volume_db = -80
	elif value >= 5:
		volume_db = ((value-5)*2)
	else:
		volume_db = ((value-5)*8)

func pause():
	tween.interpolate_property(self,"volume_db", volume_db, -80,1)
	tween.start()
	yield(tween, "tween_all_completed") 
	tween.remove_all()
	stream_paused = true

func resume():
	stream_paused = false
	play()
	tween.interpolate_property(self,"volume_db", volume_db, System.volume.background, 1.5)
	tween.start()
	yield(tween, "tween_all_completed") 
	tween.remove_all()
