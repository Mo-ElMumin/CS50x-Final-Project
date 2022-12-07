extends Control

onready var button = $MenuButton
onready var shadow = $Shadow
onready var menu = button.get_popup() 
onready var case = get_parent()

func _ready():
	menu.connect("about_to_show", self, "_on_popup")
	menu.connect("hide", self, "_on_hide")
	menu.connect("index_pressed", case, "_on_file_selected")
	
func set_up(file_array):
	for i in file_array:
		menu.add_item(i.title)

func add_file(file):
	menu.add_item(file.title)

func _on_popup():
	shadow.rect_size.y = rect_size.y + menu.rect_size.y
	rect_size.y = rect_size.y + menu.rect_size.y

func _on_hide():
	rect_size = rect_min_size
	shadow.rect_size = rect_min_size

