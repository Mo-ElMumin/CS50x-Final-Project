extends Node2D

onready var typewriter = $Typewriter
onready var button     = $Control/TestButton
onready var textbox    = $Control/TestText
onready var tween      = $Control/TestText/Tween

func _ready():
	textbox.percent_visible = 0 

func reset_test():
	tween.stop_all()
	textbox.percent_visible = 0 
	typewriter.playing = false 
	reset_button()
	
func reset_button():
	button.disabled = false
	button.pressed  = false

func start_test():
	textbox.percent_visible = 0 
	button.disabled = true
	button.pressed  = true 
	var time = textbox.text.length() / System.type_speed
	tween.interpolate_property (
		textbox, "percent_visible", 0, 1, time, 
		Tween.TRANS_LINEAR, Tween.EASE_IN ) 
	tween.start()
	typewriter.play()
	yield(tween, "tween_all_completed") 
	reset_button()
	typewriter.playing = false 


