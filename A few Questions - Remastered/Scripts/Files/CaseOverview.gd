extends Note

func _ready():
	title = "Case Overview"
	pass # Replace with function body.

func _deactivate():
	block.visible = true
	pass

func _activate():
	block.visible = false
	raise()
