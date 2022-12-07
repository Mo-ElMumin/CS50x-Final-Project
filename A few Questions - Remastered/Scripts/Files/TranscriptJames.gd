extends Transcript

func _ready():
	suspect = James
	title = "Transcript: " + str(suspect.full_name)
	title_label.text = "Transcript: " + str(suspect.full_name)
