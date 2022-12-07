extends Node2D

class_name Note

onready var area = $Area2D
onready var block = $Block
onready var drag = false
onready var title : String 
onready var points = $Points.get_children()
onready var files  = get_parent()
onready var desktop = files.get_parent()
onready var case = desktop.get_parent()

func _on_Close_pressed():
	visible = false 
	block.visible = false
	case.default_active()
	desktop.remove_child(self)

func get_area():
	return area

func _deactivate():
	pass 

func _activate():
	pass 
