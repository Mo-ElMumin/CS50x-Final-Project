extends Node2D

onready var textbox = $RichTextLabel
onready var tween_text = $RichTextLabel/Tween
onready var animation = $AnimationPlayer
onready var speed = 20

func _ready():
	textbox.bbcode_text = """Dear Detective Malan,
	
Here are the files for the case. 
Thank you for taking this on such short notice. Interrogate the suspects and prepare a report for the chief Prosecutor with who you think commited the murder...
"""
	textbox.percent_visible = 0
	start()
	pass 

func start():
	var time = textbox.bbcode_text.length() / speed 
	tween_text.interpolate_property (
		textbox, "percent_visible", 0, 1, time, 
		Tween.TRANS_LINEAR, Tween.EASE_IN ) 
	tween_text.start()
	yield(tween_text, "tween_completed")
	yield(get_tree().create_timer(1), "timeout")
	animation.play("Fade")
	yield(animation, "animation_finished")
	self.visible = false
	queue_free()
