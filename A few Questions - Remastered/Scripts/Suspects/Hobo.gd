extends Suspect

func _ready():
	set_values()
	form_arrays()
	transcript = preload("res://Scenes/Files/TranscriptHobo.tscn")

func set_values():
	full_name    = "Fred 'Hobo' Johns"
	reverse_name = "Johns, Fred (Hobo)"
	first_name   = "Hobo"
	intero_name  = "Fred"
	last_name    = "Johns"
	age          = "42"
	residence    = "Homeless"
	occupation   = "Unemployed" 
	education    = "None" 
	info         = "Smelly"
	notes        = "[u] Notes: [/u]\nHomeless man who lives in the area. Prefers to be called \"Hobo\". Arrived on the scene after police had arrested the boyfriend and secured the site for forsenic invetigation. Claims to have seen the victim alive around 02:30. He was asked to come in for questioning and readily agreed."
	
	opening = [
		"What do ya wanna know? Thanks for the coffee by the way.",
		"Doesn't bother me, Its nice and warm in here.",
		"Sure! Whatcha' wanna know? Can I get another Cup of coffee too?",
	]

	timeline = [
		"I don't know, walkin' around main street I guess. I don't remember. Its not like I have anything to do.", 
		"Stopped next to a dump in an alley along main street for... things.. ya know. Just cos I'm homeless don't mean my bladder don't fill up.",
		"Walkin' from main street to Kings Road, There's a pizza shop there, I found half pizza in the trash. That was my dinner.",  
		"I walked to the Park, there's a bench thats not too uncomfortable. Half way decent place to sleep for the night. I settled in for the night.",
		"Asleep on that bench. Some idiot was walking their dogs in the park without a leash. Those dogs came up to me and barked right in my face. Scared the shit out of me. I left the park after that.",
		"I went back to main street, that's when I saw the girl, she was runnning, speaking on her phone, looking a little flussed, I asked her if she needed help but then she ran away even faster.",
		"Still on main street. There was something about that girl, I figured something was really wrong but I didn't follow her or nothing. Eventually figured that it was none of my business and I wondered off." ,
		"Still walkin' about the area, I think..., I don't remember exactly. I was still quite tired. ", 
		"I don't really remember, Walking around the area. I don't have a home, you know.", 
		"I found a dollar on the ground, so I went to the store for a coke. They told me to go away.", 
		"I found another store that would let me buy something, The shopkeeper was nice, she gave me a candybar for free.",
		"Went back to main street to find a place to get a few hours of sleep, maybe under the bridge or somewhere...",
		"I heard the sirens around West Avenue so I went to see what was happening. They had picture of the girl, I said i'd seen her earlier and the police brought me here.",  
		]
	
	evidence = [
		"I didn't. Saw her for the first time running down main street, asked if she needed help and she just ran off. ", 
		"Absoluetly heartless, Just between us.. who do you think dunnit? It was the Boyfriend, wasn't it? he kinda looks like a guy I knew who used to beat his misses.", 
		"Nice place she had there, maybe she had some enemies too? Her flatmate looked shifty to me, bet cha' she done it. She was awefully calm for someone who had her home broken into and her friend killed.", 
		"Maybe she stumbled into something someone didn't want her to see. Maybe she was dealin' drugs outta that place, ya never know what kids are up to these days.", 
		"A vase...? Odd. Wasn't there anything else to hit her with? A Vase isn't a particularly good weapon if ya ask me. Makes you think was the killer was really up to.", 
		"I Don't Know. It looked like it was working fine when I saw her, she was calling someone with it.", 
	]
	
	psychology = [
		"\"Low in Conctiousness\", What does that mean? meh. Doesn't bother me. I am what I am, ya know. No matter what a shrink says.", 
		"Ran away from home when I was 15, Not much of a family history to talk about. Worked odd for a couple years then gave up on all that. Why stuggle, huh?", 
		"How I'm feeling? Well, quite good actually. It's been a while since I was in a warm and had a good cup of coffee. I mean shame about the dead girl but it's not like I had anything to do with that so can't be too bother about that.", 
		"Ya don't say! So it was the boyfriend! I knew it in my bones! Angry fellow. He threw such a fit when they tried to arrest him, took 3 men to get him in the car.",
	]	
	confront = [
		[ # Low 
		"Are you joking? Of course I didn't kill her! I was no where near that place.",
		"You can't belive I did it! you have no evidence agaisnt me, cos I didnt do it!",
		"Is that it, yeah? Can't find the killer so you gonna pin it on the homeless man just tryin' to do right.",
		"I ain't confessing to no crime I ain't commit." ],
		[ # Medium
		"This is some kinda joke. Must be, except you guys ain't funny, I ain't killed nobody.",
		"Ya terrible at your jobs. The big fellow, the boyfriend, he obviously done it. Think about it!",
		"Im'ma do your job for you. The big angry boyfriend killed the girl. I'm not the smartest but atleast I'm not as blind you.",
		"Not even coffee is worth sitting through this crap", ],
		[ # High 
		"You're a pig, you know that. and you live up to ya name. I ain't kill no girl.",
		"Try again pig. I ain't kill no girl.",
		"I. Ain't. Killed. No one. Period.",
		"Give up piggy.",],
		[ # Very High 
		"I knew helping ya pigs was a mistake... Shoulda just kept to myself.", ],
	]
	
	non_respnse = "I ain't saying nothing no more."
	
	endings = [ 
		# False
		"""
		The Hobo was trailed for murder in the first degree. 
		His defence attorny successfully managed to get him acquitted by convicing the jury that there were more likely suspects than the man on trail and other inconsistencies in the police investigation. 
		The failure of this case was a severe setback for the career of Detective X.
		""",
		# True 
		"""
		The Hobo was charged for murder in the first degree by a grand jury.
		He served 15 Years until CCTV footage from the night of the murder surfaced showing the Hobo outside during the time of the muder.
		Despite this, he was not released for another three years... 
		When asked about the Events, he said he regrets trying to help.
		""", 
		]

	time_bpm = [
		1, # 00:00
		2, # 00:30
		3, # 01:00
		2, # 01:30
		6, # 02:00
		7, # 02:30
		6, # 03:00
		5, # 03:30
		4, # 04:00
		3, # 04:30
		2, # 05:00
		3, # 05:30
		2, # 06:00
	]
	
	evid_bpm = [
		2, # Victim File
		4, # Autopsy Report 
		2, # Crime Scene Photos
		1, # Crime Scene Report 
		2, # Bloody Vase
		5, # Victim Phone 
	]

	psych_bpm = [
		3, # Personality
		6, # FamilyHistory 
		2, # Crisis
		2, # Profile 
	]
