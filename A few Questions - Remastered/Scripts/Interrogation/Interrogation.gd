extends Node2D

signal end

onready var typewriter   = $Typewriter
onready var mute         = $SuspectBox/Mute
onready var speechbox    = $SuspectBox/Hbox/Speechbox
onready var tween        = $SuspectBox/Hbox/Speechbox/Tween
onready var block        = $PlayerBox/Block
onready var tabs         = $PlayerBox/HBox/Tabs
onready var time_slider  = $PlayerBox/HBox/Tabs/Timeline/TimeSlider
onready var transcript   = $PlayerBox/HBox/Tabs/Transcript/Text
onready var ask          = $PlayerBox/HBox/SideButtons/Ask
onready var confront     = $PlayerBox/HBox/SideButtons/Confront
onready var ecg          = $ECGCRT/ECG
onready var heart_volume = $ECGCRT/CRT/HeartbeatSlider
onready var bgm          = $BackgroundMusic

onready var current_tab = 0
onready var speed       = 30
onready var base_speed  = 30
onready var in_bpm      : int 
onready var ask_index   : int 
onready var evid_pressed  = null
onready var psych_pressed = null 

onready var evid_nodes  = get_tree().get_nodes_in_group("Evidence") 
onready var psych_nodes = get_tree().get_nodes_in_group("Psychology")

func _ready():
	var _c = self.connect("end", get_parent().get_child(0), "_on_end_interrogation")
	heart_volume.value = System.volume.heartbeat
	load_suspect()
	start_interrogation()

func load_suspect():
	var nodes = get_tree().get_nodes_in_group("Values")
	for i in nodes.size():
		nodes[i].text = System.suspect.display[i]
	
func start_interrogation():
	var open_dec_text = Detective.start_interrogation()
	var open_sus_text = System.suspect.start_interrogation()
	start_text(open_dec_text + open_sus_text)
	pass  

func start_text(text):
	speechbox.bbcode_text = text
	speechbox.percent_visible = 0
	var time = text.length() / speed 
	tween.interpolate_property (
		speechbox, "percent_visible", 0, 1, time, 
		Tween.TRANS_LINEAR, Tween.EASE_IN ) 
	tween.start()
	typewriter.play()
	block.visible = true
	yield(tween, "tween_all_completed")
	typewriter.playing = false 
	block.visible = false
	update_transcript_tab(text)
	
func update_transcript_tab(text):
	System.suspect.update_statement(text)
	transcript.text = System.suspect.statement
	
func parse_ask(tab):
	if tab == 1: 
		return Detective.asked_evid(evid_pressed) 
	elif tab == 2:
		return Detective.asked_psych(psych_pressed) 
	elif tab == 3:
		return Detective.asked_time(time_slider.value) 

func parse_response(tab):
	if tab == 1: 
		return ( [ System.suspect.asked_evid(evid_pressed), System.suspect.evid_bpm[evid_pressed], ]  )
	elif tab == 2:
		return ( [ System.suspect.asked_psych(psych_pressed), System.suspect.psych_bpm[psych_pressed], ] )
	elif tab == 3:
		return ( [ System.suspect.asked_time(time_slider.value), System.suspect.time_bpm[time_slider.value], ] )
func post_ask():
	if tabs.current_tab == 1:
		ask.disabled = true 
		evid_nodes[evid_pressed].disabled = true
		evid_pressed = null 
	elif tabs.current_tab == 2:
		ask.disabled = true 
		psych_nodes[psych_pressed].disabled = true
		psych_pressed = null 
	elif tabs.current_tab == 3:
		ask.disabled = false 

func _on_evidence_selected(index):
	ask.disabled = false
	evid_pressed = index
	for i in evid_nodes:
		i.pressed = false
	evid_nodes[index].pressed = true
	
func _on_psychology_selected(index):
	ask.disabled = false
	psych_pressed = index
	for i in psych_nodes:
		i.pressed = false
	psych_nodes[index].pressed = true

func _on_tab_changed(index):
	if index == 0 or index == 4:
		ask.disabled = true 
	elif index == 1:
		if !evid_pressed == null:
			ask.disabled = false
		else:
			ask.disabled = true  
	elif index == 2:
		if !psych_pressed == null:
			ask.disabled = false
		else:
			ask.disabled = true  
	elif index == 3:
		ask.disabled = false
	
func _on_HeartbeatSlider_value_changed(value):
	System.volume.change_heartbeat(value)
	ecg.heartbeat.update_volume(value)

func _on_Ask_pressed():
	ask.disabled = true
	if System.suspect.unresponsive:
		var d_response : String =  parse_ask(tabs.current_tab)
		var s_response : String =  System.suspect.asked_unresponsive()
		start_text(d_response + s_response)
	else:
		var d_response : String = parse_ask(tabs.current_tab)
		var s_response : Array  = parse_response(tabs.current_tab)
		start_text(d_response + s_response[0])
		ecg.set_bpm(s_response[1])
	yield(tween, "tween_all_completed")
	post_ask()
	
func _on_Confront_pressed():
	confront.disabled = true 
	if System.suspect.unresponsive:
		var d_response : String = Detective.confronting()
		var s_response : String = System.suspect.asked_unresponsive()
		start_text(d_response + s_response)
	else:
		var emotion = assess_bpm()
		var d_response : String = Detective.confronting()
		var s_response : String = System.suspect.confronted(emotion)
		start_text(d_response + s_response)
	yield(tween, "tween_all_completed")
	confront.disabled = false 
	
func assess_bpm():
	if ecg.interval   > 3.0: 
		return 3
	elif ecg.interval > 2.0:
		return 2
	elif ecg.interval > 1.0:
		return 1
	else:
		return 0 

func _on_EndInterrogation_pressed():
	ecg.switch_display()
	bgm.pause()
	emit_signal("end")

func _on_Mute_pressed():
	if System.volume.typewriter == 0:
		System.volume.typewriter = 5
		typewriter.update_volume(5)
	else:
		System.volume.typewriter = 0
		typewriter.update_volume(0)
