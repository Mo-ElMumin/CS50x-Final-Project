extends Tabs

onready var time = $TimeLabel
onready var desc = $DescLabel
onready var label_pos = 10
onready var time_array : Array = [
	"00:00", "00:30", "01:00", "01:30", "02:00", "02:30", "03:00",
	"03:30", "04:00", "04:30", "05:00", "05:30", "06:00",
	]
onready var desc_array :  Array = [
	"Midnight - Victim last seen alive on CCTV", 
	"00:30", 
	"01:00", 
	"01:30", 
	"02:00", 
	"02:30", 
	"Approximate Time of Death",
	"03:30", 
	"04:00", 
	"04:30", 
	"05:00", 
	"05:30", 
	"Police Arrive at Crime Scene, Body in Evidence",
	]
	
func _ready():
	time.text = time_array[0]
	desc.text = desc_array[0]
	pass
	
func _on_HSlider_value_changed(value):
	time.rect_position.x = (74 * value)  
	time.text = time_array[value]
	desc.text = desc_array[value]
	pass 
