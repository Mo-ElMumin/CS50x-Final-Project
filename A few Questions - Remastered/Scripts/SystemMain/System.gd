extends Node

onready var volume
onready var type_speed 
onready var suspects_array : Array = [ James, Lisa, Hobo ]
onready var suspect = suspects_array[0]

class sound: 
	var background : int  = 5
	var heartbeat  : int  = 5 
	var typewriter : int  = 5 
	
	func change_background(new_volume): 
		background = new_volume
		
	func change_heartbeat(new_volume): 
		heartbeat = new_volume
		
	func change_typewriter(new_volume): 
		typewriter = new_volume
		
func _ready():
	volume = sound.new()
	type_speed = 25
