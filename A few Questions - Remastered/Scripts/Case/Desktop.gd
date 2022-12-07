extends Node2D

signal call 

onready var files   = $Files
onready var checker = get_parent().get_child(2)
onready var button  = get_parent().get_child(3)
onready var files_array  = files.get_children()
onready var mouse_pos    : Vector2 = Vector2.ZERO
onready var active_sheet : Node2D 
onready var input_active : bool = true 

func _ready():
	files_array.invert()
	set_up_active(files_array[0])
	System.files = files_array.duplicate()
	self.connect("call", System.main, "_call_interrogation")

func _process(_delta):
	checker.position = get_viewport().get_mouse_position() 
	if active_sheet.drag == true:
		var pre_pos = get_viewport().get_mouse_position()
		var new_pos = Vector2(clamp(pre_pos.x, 0, 1280), clamp(pre_pos.y, 0, 720))
		var old_pos = active_sheet.get_position()
		active_sheet.set_position(old_pos + (new_pos - mouse_pos))
		mouse_pos = new_pos

func _input(event):
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
	self.remove_child(active_sheet)
	files.add_child(active_sheet)
	set_up_active(sheet)
	
func set_up_active(sheet):
	files.remove_child(sheet)
	self.add_child(sheet)
	self.move_child(sheet, 1)
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
			
func _on_call_interrogation():
	emit_signal("call")
