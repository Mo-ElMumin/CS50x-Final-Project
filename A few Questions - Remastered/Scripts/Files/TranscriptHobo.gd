extends Transcript

func _ready():
	suspect = Hobo
	title = "Transcript: " + str(suspect.full_name)
	title_label.text = "Transcript: " + str(suspect.full_name)
