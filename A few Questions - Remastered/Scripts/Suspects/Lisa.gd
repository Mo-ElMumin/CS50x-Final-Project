extends Suspect

func _ready():
	set_values()
	form_arrays()
	transcript = preload("res://Scenes/Files/TranscriptLisa.tscn")
	
func set_values():
	full_name    = "Lisa Pinker"
	reverse_name = "Pinker, Lisa"
	first_name   = "Lisa"
	intero_name  = "Lisa"
	last_name    = "Pinker"
	age          = "20"
	residence    = "West Avenue"
	occupation   = "Part-Time Waitress" 
	education    = "College" 
	info         = "Flatmate of Victim"
	notes        = "[u] Notes: [/u]\nVictim's Flatmate. She called police dispatch and was found at the scene of the crime with the boyfriend. There was no mention of the boyfriend during the call. Claims to have last seen the victim alive at roughly 00:30.\n\nCooperated willingly with officers and brought in for questioning.\n"
	
	opening = [
		"Anything to help you catch who ever did this to Jane.",
		"I hope you're making progress.",
		"What? More? Why are you so unorangnised?",
	]
		
	timeline = [
		"I was at my place getting ready, I had plans for that night. Jane was there too, she was meant to be going to James' place.", 
		"I had just left my place, I had a date that night, Jane was still home when I left.",
		"I was waiting outside the restaurant where we had agreed to meet but my date didn't show up.. ", 
		"Still at the restuarant, waiting...",
		"My date hadn't shown up so I left. I was going to wait all night for him.", 
		"I was walking home, after having been stood up. I was taking the long way home because I wanted time to think, I don't remember exactly which way I went.", 
		"I went to the park next to Main street and sat by the lake for a while. I don't remember for how long. ", 
		"I think i was sitting by the lake in park by myself.",
		"I walked through the park and After maybe thirty minutes", 
		"I had enough sulking around and set off for home for real this time.", 
		"That's when I came home. As I was walking up the stair, James was at the door knocking. He was angry 'cos Jane wasn't answering his calls. I opened the door and thats when we found her laying on the floor, covered in blood.", 
		"We had called the police and we waiting for the them to show up. James was crying and pacing back and forth in the hallway. ", 
		"The police had arrived, they looked around abit, they put james in handcuff and dragged him off. Then they asked me to come with them to the station."
		] 
	
	evidence = [
		"She was my roommate. We've been living together for about 8 month, she moved in about the same time she started dating James. He spent alot of time in our place at the start.", 
		"Buy why would someone do that? She was such a sweet innocent girl. She wouldn't hurt a fly...", 
		"It's my apartment. I mean our apartment. We shared it. James lived with us for a while at the start too. ", 
		"I don't know how... I don't want to think about it but... James Had a key to our place too...", 
		"Can I be honest... I always hated that vase... But to think that someone would kill her with it. Its... It's just to much.", 
		"She was always a clumsy girl, she must have just dropped it somewhere.  ", 
	]
	
	psychology = [
		"\"Highly Disagreeable...\"\n\"High in Neuroticism...\"\n\"Low in Extroversion...\"\n No offence to you but this is bullshit", 
		"Whats to say, i grow up in ..., my parents divorced when i was 7. i lived with mother after that", 
		"Im shaken, I still can't belive she's died. That she died like that... ", 
		"What are you implying? That you think i did it? James knew her more \"intmately\" than I did. It must have been him...", 
	]
		
	confront = [
		[ # Low 
		"Me? Are you Serious? What is Wrong with you? I didn't kill Jane",
		"I'm certain it was James, they would argue often whenever he came over! I know it was him!",
		"Why are you doing this to me? I didn't kill my best friend.",
		"Don't you have anything meaningful to say?", ], 
		[ # Medium
		"Is that what you are going to do? play bad cop until I confess to a crime I did not commit. Good luck with that.",
		"Do you think that if you repeat your false allegations enough times that will magically make it true?",
		"If you really believe that I killed Jane, you wouldn't be here. You'd have me in front of a judge in no time flat. Stop lying to yourself. It's not going to work.",
		"Stop this. Its not working.", ],
		[ # High  
		"What is Wrong with you! My Friend is died and I'm trying to help you! Why are you doing this to me?",
		"Why are you doing this? some sick desire to see me in pain? you disgust me!",
		"You heartless bastard. Just go away.",
		"Just go away...", ],
		[ # Very High 
		"I can't do this anymore, I can't... Leave me alone, just go away.",],
	]
	
	non_respnse = "I'm not saying anything else without a lawyer present."
	
	endings = [
		# False
		"""
		Lisa was put on trail for the murder of her roommate Jane. 
		The grand jury refused to convict her citing insufficient evidence. 
		She was acquitted but the events of that night had ruined her life. She now lives in a small town in the middle of nowhere and refuses to speak of that night. 
		""",
		# True
		"""
		Lisa was put on trail for the murder of her roommate Jane. 
		During the trail, she broke down into tears and confessed to the murder. 
		The grand jury convicted her with minimal deliberation and she was sentenced to life inprisonment for murder in the first degree.
		""", 
		]

	time_bpm = [
		1, # 00:00
		1, # 00:30
		1, # 01:00
		1, # 01:30
		1, # 02:00
		1, # 02:30
		1, # 03:00
		1, # 03:30
		1, # 04:00
		1, # 04:30
		1, # 05:00
		1, # 05:30
		1, # 06:00
	]
	
	evid_bpm = [
		2, # Victim File
		4, # Autopsy Report 
		3, # Crime Scene Photos
		3, # Crime Scene Report 
		8, # Bloody Vase
		5, # Victim Phone 
	]

	psych_bpm = [
		5, # Personality
		4, # FamilyHistory 
		5, # Crisis
		6, # Profile 
	]
