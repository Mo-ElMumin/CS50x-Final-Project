extends Node2D

class_name ECG

onready var path   = $ECGPath 
onready var follow = $ECGPath/ECGfollow
onready var line   = $ECGPath/ECGfollow/ECGline
onready var fade   = $ECGPath/ECGfollow/ECGline/Fade
onready var heartbeat = $ECGPath/Heartbeat

onready var dia     : float = 0
onready var sys     : bool = false
onready var display : bool = true 
onready var point   : Vector2

onready var pattern : Array 
onready var default_interval : int = 0.5
export (float) var interval    
export (int)   var trail_length 
export (int)   var back_length  

func default():
	path.curve.clear_points()
	for i in pattern:
		path.curve.add_point(Vector2(0, i), Vector2.ZERO, Vector2.ZERO)
	follow.set_offset(0)
	line.set_as_toplevel(true)

func _physics_process(delta):
	# Display ECG Line
	if display == true:
		# Systolic Phase
		if sys == true:
			if follow.get_unit_offset() >= 0.99:
				sys = false
				follow.set_unit_offset(0)
			else:
				follow.set_unit_offset(follow.get_unit_offset() + delta) 
		# Diastolic Phase
		else:
			dia += interval * delta 
			if dia > 1:
				sys = true 
				dia = 0 
				heartbeat.play()
				
		# Trail Line
		point = follow.global_position
		line.add_point(point)
		for i in line.get_point_count():
			var pos_x = line.get_point_position(i).x - back_length * delta
			var pos_y = line.get_point_position(i).y
			line.set_point_position(i, Vector2(pos_x, pos_y))
		if line.get_point_count() > trail_length:
			line.remove_point(0)
	else:
		pass 

func switch_display():
	display = !display
	if display == false:
		fade.play("Fade")
		yield(fade, "animation_finished")
		sys = false
		dia = 0 
		point = Vector2.ZERO
		follow.set_unit_offset(0)
		line.clear_points()
		line.visible = !line.visible
	else:
		fade.play_backwards("Fade")
		line.visible = !line.visible
	
