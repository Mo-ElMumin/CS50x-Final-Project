extends Suspect

func _ready():
	set_values()
	form_arrays()
	transcript = preload("res://Scenes/Files/TranscriptJames.tscn")
	
func set_values():
	full_name    = "James McAvoy"
	reverse_name = "McAvoy, James"
	first_name   = "James"
	intero_name  = "James"
	last_name    = "McAvoy"
	age          = "23"
	residence    = "Downtown"
	occupation   = "Student" 
	education    = "College" 
	info         = "Tall"
	notes        = "[u] Notes: [/u]\nVictim's Boyfriend. He was found at the scene of the crime alongside the flatmate when police arrived. Claims to have last seen the Victim alive at around 01:00.\n\nActively refused to cooperate with officers and was brought in under force. Pay close attention to him, Majority of murders of passion are committed by a known partner of the victim.\n"
	
	opening = [
		"What do you want to know?",
		"What more do you want to know?",
		"What else do you have to ask?",
	]
	
	evidence = [
		"She was my girlfriend, we had been dating for like 8 month. It was a bit on and off at the start but we got over it. ", 
		"Why would someone do that to her? The place looked completely normal, nothing was taken and the door was still locked...", 
		"It's Janes' Apartment... We'd occassionaly spend nights there together. Lisa lived there too.", 
		"I know. The place looked like it always did when we went in. How did the killer get in? What did they want? Why would they kill her?", 
		"That vase was a present from her mother... It's sickening that someone could do that to her.", 
		"I guess that's why she wasn't answering my calls... I don't know how it ended up like that... ", ]
	
	psychology = [
		"\"Low overall neuroticism but high volatility, High in Exterversion, low overall agreeableness but high in compassion.\".\nI don't know what any of this means but I guess that sounds like me...", 
		"I had a happy childhood, went to a good school. Did well in sports. Everyone Knew me, Everyone Liked me.", 
		"What do you mean? I'm Furious! I'm Distraught! My girlfriend is dead and I'm sitting here in handcuffs. What am I supposed to feel?", 
		"Is that all the proof you have? Is that why I'm here?! That won't stand up in court and you know it! ", 
	]
	
	timeline = [
		"I was at my place, Jane was supposed to come over but I had a feeling she would be late.", 
		"Waiting at my place for Jane, she was already late.",
		"Jane arrived at my place, I made a comment about how she's always late and she got angry about that. We had an arguement. It started small but she got angry, then I got angry, then she took her things and left.", 
		"I was broding over what to do. Is it wrong to expect your girlfriend to be on time, sometimes?. I don't know. Now I wish I hadn't gotten angry at her.",
		"I was still at my place, I tried to call Jane to get her to come back but she wouldn't pick up.", 
		"At that point, I figured if she'd get over it eventually and call me. We'd always gotten over our little fights before. ",
		"I went for a walk to collect my thoughts. I do that sometimes. Realised I probably shouldn't have shouted at her.  ", 
		"I went back to my place. I had hoped she'd have returned while I was out but she hadn't.",
		"Sitting at my place, trying to call Jane but she still wouldn't pick up. I tried to call Lisa too but she didn't pick up either.", 
		"I was so worried that I decided that I'd go to Jane's place, I knew she'd be there. Where else would she be?", 
		"I arrived at Jane's place. The door was locked and she wouldn't answer. Then Lisa showed up and opened the door. That's when we found her...", 
		"I didn't know what to do, we panicked, but Lisa calmed me down and we called the police.",
		"I was waiting with Lisa outside the apartment for the police to arrive. they did, took one look at the scene and put me in handcuffs. Now here I am...",  ]	
	
	confront = [
		[ # Low 
		"Me? Are you Serious? What is Wrong with you? I didn't kill Jane",
		"First you arrest me, then you leave me here in handcuffs and now you're saying I killed her? ",
		"I'm not a killer and I didn't kill Jane. ",
		"It wasn't me, simple as.", ], 
		[ # Medium
		"I know what you are trying to do and it's not going to work. I didn't kill Jane.",
		"How many times do i have to say it before it gets into your thick head? I. Did not. Kill. Jane!",
		"I loved her! I didnt kill her. I loved her.",
		"I can't handle your bullshit allegations", ],
		[ # High 
		"Come on! You don't even believe that yourself! I didn't kill her and you know that!",
		"You are wasting your time. I DID NOT KILL JANE!",
		"STOP SAYING I KILLED HER. IT WASN'T ME!",
		"STOP WITH THIS CRAP! She's died and you're wasting your time trying to pin it on me! ", ],
		[ # Very High 
		"Fuck you! I'm not going to sit and listen to your bullshit! I didn't kill her!",],
	]
	
	non_respnse = "Fuck off... I'm not going to speak to you anymore.."
	
	endings = [ 
		# false
		"""
		James was trailed and charged with murder in the first degree. A grand jury convicted him after a week of deliberation. 
		His family sought an appeal and a later retrail over turned the conviction after 2 years. 
		He is a free man, but is still haunted that the killer of his girlfriend was not caught.
		""",
		# true,
		"""
		James was trailed and charged with murder in the first degree. A grand jury convicted him after a week of deliberation. 
		His family sought an appeal and a later retrail over turned the conviction after 2 years. 
		He is a free man, but is still haunted that the killer of his girlfriend was not caught.
		"""
		]
	
	time_bpm = [
		2, # 00:00
		2, # 00:30
		3, # 01:00
		2, # 01:30
		2, # 02:00
		3, # 02:30
		2, # 03:00
		2, # 03:30
		2, # 04:00
		3, # 04:30
		6, # 05:00
		4, # 05:30
		3, # 06:00
	]
	
	evid_bpm = [
		4, # Victim File
		7, # Autopsy Report 
		4, # Crime Scene Photos
		5, # Crime Scene Report 
		2, # Bloody Vase
		3, # Victim Phone 
	]

	psych_bpm = [
		2, # Personality
		2, # FamilyHistory 
		6, # Crisis
		7, # Profile 
	]
