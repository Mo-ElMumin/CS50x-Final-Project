extends Note

class_name Transcript

onready var suspect 
onready var textbox = $Fields/Text
onready var title_label = $Fields/Title

func _deactivate():
	block.visible = true

func _activate():
	block.visible = false
	raise()

func update_text():
	textbox.text = suspect.statement
