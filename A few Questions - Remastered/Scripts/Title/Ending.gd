extends Node2D

onready var ending    : String
onready var speed     = 20
onready var textbox   = $Textbox
onready var tweener   = $Tween
onready var animation = $AnimationPlayer
onready var credits   = $Credits
onready var timer     = $Timer
onready var typing    = $Typing
onready var theme     = $MainTheme

func _ready():
	determine_ending()
	yield(get_tree().create_timer(1), "timeout")
	start()

func determine_ending():
	if System.suspect.unresponsive:  
		ending = System.suspect.endings[int(true)]
	else:
		ending = System.suspect.endings[int(false)]
	textbox.bbcode_text = ending 
	textbox.percent_visible = 0
	
func start():
	var time = ending.length() / speed 
	tweener.interpolate_property (
		textbox, "percent_visible", 0, 1, time, 
		Tween.TRANS_LINEAR, Tween.EASE_IN ) 
	tweener.interpolate_property(
		typing,  "volume_db", 0, -80, time * 1.5, 
		Tween.TRANS_LINEAR, Tween.EASE_IN)
	tweener.start()
	typing.play()
	theme.play()
	yield(tweener, "tween_all_completed")
	typing.playing = false 
	timer.start()
	yield(timer,"timeout")
	animation.play("Fade")
	yield(animation, "animation_finished")
	animation.play("Credits")
	yield(animation, "animation_finished")
