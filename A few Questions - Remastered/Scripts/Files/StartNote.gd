extends Note

onready var button = $Fields/VBoxContainer/Button
onready var report_added : bool = false 
onready var check_boxes  : Array

func _ready():
	title = "Letter to Detective"
	check_boxes = get_tree().get_nodes_in_group("CheckBox")

func _deactivate():
	button.disabled = true
	block.visible = true
	
func _activate():
	raise()
	block.visible = false
	var t = 0
	if report_added:
		button.disabled = true
	else:
		for i in System.suspects_array:
			if i.interrogations > 0:
				t += 1
		if t >= 3:
			button.disabled = false 
		else:
			button.disabled = true 
			
func _on_Button_pressed():
	case.add_report()
	report_added = true

func update_checkboxes():
	var suspects = System.suspects_array
	for i in suspects.size():
		if suspects[i].interrogations > 0:
			check_boxes[i + 1].text = "X"
	
