extends Node

class_name Suspect

onready var full_name    : String
onready var reverse_name : String
onready var first_name   : String 
onready var intero_name  : String
onready var last_name    : String 
onready var age          : String
onready var residence    : String
onready var occupation   : String 
onready var education    : String 
onready var info         : String
onready var notes        : String 
onready var statement    : String 
onready var non_respnse  : String 


onready var talkline     : String = ":\n   "
onready var newline      : String = "\n "
onready var endline      : String = "\n \n"

onready var display        : Array 
onready var file_array     : Array 
onready var opening        : Array
onready var evidence       : Array 
onready var psychology     : Array
onready var timeline       : Array
onready var confront       : Array
onready var evid_bpm       : Array
onready var psych_bpm      : Array 
onready var time_bpm       : Array 
onready var confront_bpm   : Array 
onready var confrontations : Array 
onready var endings        : Array

onready var transcript     : PackedScene

onready var interrogations   : int  = 0 
onready var transcript_added : bool = false
onready var unresponsive     : bool = false 

func form_arrays():
	display = [full_name, occupation, age, education, residence, info]
	file_array = [full_name, age, residence, occupation, education]
	confrontations = [0, 0, 0, 0]

func update_statement(text):
	if statement.empty():
		statement = text 
	else:
		statement = statement + endline + text 
	
func start_interrogation():
	if interrogations > 2:
		return first_name + talkline + opening[2]
	else:
		var text = first_name + talkline + opening[interrogations]
		interrogations += 1
		return text 

func asked_evid(index):
	return (first_name + talkline + evidence[index] )

func asked_psych(index):
	return (first_name + talkline + psychology[index] )
	
func asked_time(index):
	return (first_name + talkline + timeline[index] )

func asked_unresponsive():
	return (first_name + talkline + non_respnse)

func confronted(emotion):
	var response = confrontations[emotion]
	if emotion == 3:
		unresponsive = true
	elif confrontations[emotion] < 3:
		 confrontations[emotion] += 1 
	return (first_name + talkline + confront[emotion][response])
