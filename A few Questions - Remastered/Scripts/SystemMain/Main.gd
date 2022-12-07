extends Node2D

onready var fade  := $Fade
onready var title := $Title
onready var case          := preload("res://Scenes/Case.tscn")
onready var interrogation := preload("res://Scenes/Interrogation.tscn")
onready var ending        := preload("res://Scenes/Ending.tscn")

func _on_start_game():
	fade.fade_in()
	title.ecg.switch_display()
	yield(fade,"fade_done")
	var new_game = case.instance()
	new_game.visible = false
	add_child(new_game)
	move_child(new_game, 0)
	new_game.visible = true
	title.queue_free()
	fade.fade_out()
	
func _call_interrogation():
	fade.fade_in()
	yield(fade,"fade_done")
	var scene = interrogation.instance()
	add_child(scene)
	move_child(scene, 1)
	scene.ecg.fade.play_backwards("Fade")
	scene.visible = true
	fade.fade_out()

func _end_interrogation():
	fade.fade_in()
	yield(fade,"fade_done")
	get_child(1).queue_free()
	fade.fade_out()

func _start_ending():
	fade.fade_in()
	yield(fade,"fade_done")
	get_child(0).queue_free()
	var end = ending.instance()
	add_child(end)
	move_child(end, 0)
	fade.fade_out()
	yield(fade,"fade_done")
