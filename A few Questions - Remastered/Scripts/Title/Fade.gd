extends ColorRect

signal fade_done
onready var fade = $Animation

func _ready():
	self.visible = false
	
func fade_in():
	self.visible = true 
	fade.play("Fade")
	yield(fade,"animation_finished")
	emit_signal("fade_done")

func fade_out():
	fade.play_backwards("Fade")
	yield(fade,"animation_finished")
	self.visible = false 
	emit_signal("fade_done")
