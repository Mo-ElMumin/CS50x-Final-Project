extends Note

signal submit

onready var button = $Fields/VBoxContainer/Button
onready var checkboxes = get_tree().get_nodes_in_group("Checkbox")
onready var pressed = null 

func _ready():
# warning-ignore:return_value_discarded
	title = "Prosecution Report"
	connect("submit", case, "_on_report_submit")
	button.disabled = true 

func _deactivate():
	button.disabled = true
	block.visible   = true
	
func _activate():
	raise()
	block.visible   = false
	if pressed != null:
		button.disabled = false
	else:
		button.disabled = true 
		
func _on_CheckBox_pressed(index):
	for i in checkboxes:
		i.pressed = false
	checkboxes[index].pressed = true
	pressed = index
	button.disabled = false 

func _on_submit_pressed():
	emit_signal("submit", pressed)
