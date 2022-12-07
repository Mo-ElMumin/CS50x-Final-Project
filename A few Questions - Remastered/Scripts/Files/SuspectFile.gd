extends Note

class_name SuspectFile

signal call (sus)

onready var suspect 
onready var name_label = $Fields/Name
onready var call_button = $Fields/Button

onready var sus_name  = $Fields/Grid/NameValue
onready var sus_age   = $Fields/Grid/AgeValue
onready var sus_resid = $Fields/Grid/ResidenceValue
onready var sus_occup = $Fields/Grid/OccupationValue
onready var sus_educ  = $Fields/Grid/EducationValue
onready var sus_notes = $Fields/Notes
onready var value_labels = [sus_name, sus_age, sus_resid, sus_occup, sus_educ]

func load_info():
# warning-ignore:return_value_discarded
	call_button.connect("pressed", self,"_on_call_interrogation"  )
	self.connect("call", case, "_on_call_interrogation" )
	title = "Suspect File: " + suspect.full_name
	name_label.bbcode_text = "[u]Suspect: " + suspect.reverse_name + "[/u]"
	call_button.text = "Call " + suspect.first_name + " For Interrogation"
	for i in value_labels.size():
		value_labels[i].text = suspect.file_array[i]
	sus_notes.bbcode_text = suspect.notes

func _deactivate():
	call_button.disabled = true
	block.visible = true

func _activate():
	self.raise()
	call_button.disabled = false
	block.visible = false
	System.suspect = suspect

func _on_call_interrogation():
	emit_signal("call", suspect)
