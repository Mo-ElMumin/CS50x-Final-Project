extends Node

onready var conforntations : int = 0 
onready var detect  := "Detective: \n   "
onready var endline := "\n \n"

onready var greeting = [
	"Good afternoon ",
	"Hello again ",
	"My apologies ",
]

onready var opening = [
	", I want to ask you a few questions about last night..",
	", I have a few more questions...",
	", It seems there are still more questions...",
]

onready var evid_script = [
	"How did you know Jane?",
	"I have the Autopsy report here... Says cause of death was blunt force trauma to the head...",
	"Take a look at these photos. Tell me what you see...",
	"The Crime Scene report suggests that there was no break in...",
	"This a picture of the murder weapon, A solid Vase that was used to hit her over the head...",
	"Can you tell me about this? Jane's Phone... It's Smashed...",
]

onready var psych_script = [
	"I had you fill out this personality assessment form earlier, have a look. Would you agree with the conclusions?",
	"Tell me a little bit about your past. Where did you grow up? What was family like? Did you have a happy childhood?",
	"How are you feeling at the moment?",
	"Our resident pyschiatrist completed their profile of the perpatrator. Says \"Killer Very likely knew the victim intimately\". What do you think about that? ",
]

onready var time_script = [
	"Where were you at midnight last night?",
	"Where were you at 30 past midnight last night?",
	"Where were you around 1:00 am last night?", 
	"Where were you around 1:30 am last night?", 
	"Where were you around 2:00 am last night?",
	"Where were you around 2:30 am last night?",
	"Where were you around 3:00 am last night?", 
	"Where were you around 3:30 am last night?", 
	"Where were you around 4:00 am last night?",
	"Where were you around 4:30 am last night?",
	"Where were you around 5:00 am last night?", 
	"Where were you around 5:30 am last night?", 
	"Where were you around 6:00 am last night?",
]

onready var confront_script = [
	"DID YOU KILL JANE?",
	"STOP LYING! DID YOU KILL HER?",
	"TELL ME THE TRUTH! TELL ME YOU KILLED HER!",
	"This will go very badly for you if you don't tell me the truth.",
	"I know you did it, so talk. Why did you kill her?",
	"Do you really think you can get away with it? Really?",
	"Lying won't help you. Only the truth. Tell me the turth. Why did you kill Jane?",
	"You will pay for this, I've seen a jury convict on less, so now's the time to talk...",
	"Why? Just Why... I'm not even interested in how. I Just want to know why you did it... tell me!",
	"Time is running out, confess and this will all be over.",
	"If you confess things will go much easier for in the future, trust me, so tell me why you killed her.",
	"I can't do this forever. I will have to submit a report and your name will be on it...",
	"This is your last chance to confess...",
]

func start_interrogation():
	conforntations = 0 
	var times    = System.suspect.interrogations
	var sus_name = System.suspect.intero_name
	if times > 2:
		return detect + greeting[2] + sus_name + opening[2] + endline
	else:
		return detect + greeting[times] + sus_name + opening[times] + endline

func asked_evid(index):
	return detect + evid_script[index]  + endline

func asked_psych(index):
	return detect + psych_script[index] + endline

func asked_time(index):
	return detect + time_script[index]  + endline

func confronting():
	if conforntations < 13:
		conforntations += 1
	return detect + confront_script[conforntations - 1] + endline
