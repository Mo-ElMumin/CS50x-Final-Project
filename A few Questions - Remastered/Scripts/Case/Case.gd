extends Node2D

signal call 
signal end
signal close

onready var main    = get_parent()
onready var desktop = $Desktop
onready var files   = $Desktop/Files
onready var checker = $CheckOverLap
onready var button  = $Button
onready var bgm     = $BackgroundMusic
onready var files_array  = files.get_children()
onready var mouse_pos    : Vector2 = Vector2.ZERO
onready var active_sheet : Node2D 
onready var start_note   : Node2D
onready var input_active : bool = true 
onready var report = preload("res://Scenes/Files/Report.tscn")

func _ready():

	files_array.invert()
	start_note = files_array[0]
	set_up_active(files_array[0])
	# warning-ignore:return_value_discarded
	self.connect("call", main, "_call_interrogation")
	# warning-ignore:return_value_discarded
	self.connect("end",  main, "_end_interrogation")
	# warning-ignore:return_value_discarded
	self.connect("close", main, "_start_ending")
	button.set_up(files_array) 

func _process(_delta):
	checker.position = get_viewport().get_mouse_position() 
	if active_sheet.drag == true:
		var pre_pos = get_viewport().get_mouse_position()
		var new_pos = Vector2(clamp(pre_pos.x, 0, 1280), clamp(pre_pos.y, 0, 720))
		var old_pos = active_sheet.get_position()
		active_sheet.set_position(old_pos + (new_pos - mouse_pos))
		mouse_pos = new_pos

func _input(event):
	if input_active:
		handle_click(event)

func handle_click(event):
	if event.is_action_pressed("click") and !button.get_rect().has_point(checker.position):
		var overlap_areas = checker.get_overlapping_areas()
		if overlap_areas.size() == 1:
			if !overlap_areas[0].get_parent() == active_sheet:
				new_active(overlap_areas[0].get_parent())
			active_sheet.drag = true
			mouse_pos = get_viewport().get_mouse_position()
		elif overlap_areas.size() > 1: 
			overlap_areas.invert()
			var all_papers = files.get_children()
			all_papers.append(active_sheet)
			var all_areas : Array = []
			for i in all_papers:
				all_areas.append(i.get_area())
			all_areas.invert()
			var top_area = check_order(all_areas, overlap_areas)
			if !top_area.get_parent() == active_sheet:
				new_active(top_area.get_parent())
			active_sheet.drag = true
			mouse_pos = get_viewport().get_mouse_position()
	elif event.is_action_released("click"):
		active_sheet.drag = false
func check_order(areas, overlaps ):
	for i in areas:
		if overlaps.has(i):
			return i

func new_active(sheet):
	desktop.remove_child(active_sheet)
	files.add_child(active_sheet)
	set_up_active(sheet)
	
func set_up_active(sheet):
	files.remove_child(sheet)
	desktop.add_child(sheet)
	desktop.move_child(sheet, 1)
	active_sheet = sheet 
	for i in files_array:
		i._deactivate()
	active_sheet._activate()

func default_active():
	set_up_active(files.get_child(files.get_child_count()-1))
	
func _on_file_selected(index):
	if !files_array[index] == active_sheet: 
		if !files_array[index].is_inside_tree():
			files.add_child(files_array[index])
			files_array[index].visible  = true
			files_array[index].position = Vector2(50,50)
		new_active(files_array[index])
	var count = 0
	for i in active_sheet.points:
		if Rect2(0,0,1280,720).has_point(i.global_position):
			count += 1
	if count < 4: 
		active_sheet.position = Vector2(50,50)
			
func _on_call_interrogation(sus):
	emit_signal("call")
	toggle_input()
	bgm.pause()
	System.suspect = sus

func _on_end_interrogation():
	emit_signal("end")
	toggle_input()
	bgm.resume()
	start_note.update_checkboxes()
	if !System.suspect.transcript_added: 
		add_file(System.suspect.transcript.instance())
		System.suspect.transcript_added = true 
	for i in files_array:
		if i is Transcript:
			i.update_text()

func toggle_input():
	input_active = !input_active

func add_file(file):
	var scene = file
	files.add_child(scene)
	button.add_file(scene)
	files_array.append(scene)
	new_active(scene)
	scene.position = Vector2(50,50)

func add_report():
	add_file(report.instance())

func _on_report_submit(index):
	System.suspect = System.suspects_array[index]
	emit_signal("close")
	

