extends Node2D

signal start 

onready var start = $Start
onready var options = $Options
onready var credits = $Credits
onready var fade = $Fade
onready var ecg = $Background/ECG
onready var main_theme = $MainTheme

func _ready():
	start.visible = true
	options.visible = false 
	credits.visible = false 
	
func _on_Start_pressed():
	emit_signal("start")
	main_theme.fade()

func _on_Options_pressed():
	fade.fade_in()
	ecg.switch_display()
	yield(fade,"fade_done")
	start.visible = false
	options.visible = true 
	fade.fade_out()
	
func _on_Credits_pressed():
	fade.fade_in()
	ecg.switch_display()
	yield(fade,"fade_done")
	start.visible = false 
	credits.visible = true 
	fade.fade_out()
	
func _on_Back_pressed():
	fade.fade_in()
	yield(fade,"fade_done")
	start.visible = true 
	options.visible = false 
	options.reset_test()
	credits.visible = false
	fade.fade_out()
	ecg.switch_display()
	
func _on_background_value_changed(value):
	System.volume.change_background(value)
	main_theme.update_volume(value)

func _on_heartbeat_value_changed(value):
	System.volume.change_heartbeat(value)
	ecg.heartbeat.update_volume(value)

func _on_typewriter_value_changed(value):
	System.volume.change_typewriter(value)
	options.typewriter.update_volume(value)

func _on_MainTheme_finished():
	main_theme.play()

func _on_TypewriterSpeedSlider_value_changed(value):
	System.type_speed = 10 + value*3
	options.reset_button()
