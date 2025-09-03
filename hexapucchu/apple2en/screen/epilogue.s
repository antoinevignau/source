*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

EPILOGUE	@LOAD	#pEPILOGUE
	@PRINT	#epilogue_str10
	@INKEY

	@MODE	#2
	@SHOWPIC
	@PRINT	#epilogue_str20
	@INKEY
	@SHOWPIC
	@PRINT	#epilogue_str30
	@INKEY
	@SHOWPIC
	@PRINT	#epilogue_str40
	@INKEY
	@SHOWPIC
	@PRINT	#epilogue_str50
	@INKEY

	@PRINT	#epilogue_str60
	@INKEY

	@MODE	#2
	@SHOWPIC
	@PRINT	#epilogue_str70
	@INKEY

	jmp	QUIT

*---

pEPILOGUE	strl	'@/data/epilogue'

epilogue_str10	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,4
	dfb	ePEN,1
	asc	'Well done, explorer!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'You survived all the traps,'0d
	asc	'solved the riddles and revealed'0d
	asc	'the Incas'27' best-kept secret.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Not bad for a vacation, huh?'0d
	dfb	ePEN,3
	asc	''0d
	asc	'But no time to rest:'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Your notebook is calling.'0d
	asc	'Humanity must learn'0d
	asc	'what you'27've just seen!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'You sit down,'0d
	asc	'pen in hand...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

epilogue_str20
*	dfb	eMODE,2
	dfb	eLOCATE,1,4
	dfb	ePAPER,3
	dfb	eINK,0,0
	dfb	eINK,4,0	; for 640-dithered
	dfb	eINK,8,0	; 
	dfb	eINK,12,0	; 
	dfb	ePEN,0
	asc	'INCREDIBLE: I FOUND THE INCAS'27' COMPUTER... AND SAVED HUMANITY!'0d
	asc	'============================================================================='0d
	asc	''0d
	asc	'                             By your very special reporter from deep in Peru.'0d
	asc	''0d
	asc	'Lost in the Peruvian jungle, between kamikaze mosquitoes and deadly rocks,'0d
	asc	'I wasn'27't expecting to stumble upon the story of my life.'0d
	asc	''0d
	asc	'And yet...'0d
	asc	''0d
	asc	'Year 984:'0d
	asc	''0d
	asc	'The Incas, thought to be busy carving llamas, weaving ponchos'0d
	asc	'and inventing quinoa, were in fact tech geniuses beyond belief.'0d
	asc	'Their masterpiece? Incatrad, a computer capable of massive calculations.'0d
	asc	'A creation so extraordinary they chose to protect it'0d
	asc	'with a radical solution:'0d
	asc	''0d
	asc	'Any intrusion triggers a countdown to the end of the world!'0d
	asc	'Yes, the Incas had a flair for drama.'0d
	dfb	eLOCATE,34,25
	asc	' ENTER  'a5
	dfb	eEOD

epilogue_str30
*	dfb	eMODE,2
	dfb	eLOCATE,1,5
	dfb	ePAPER,3
	dfb	eINK,0,0
	dfb	eINK,4,0	; for 640-dithered
	dfb	eINK,8,0	; 
	dfb	eINK,12,0	; 
	dfb	ePEN,0
	asc	'Fast forward to 1984.'0d
	asc	''0d
	asc	'During a tourist trip to Peru, one Alan Michael Sugar'0d
	asc	'(sounds familiar?) stumbles upon Hexapucchu and steals'0d
	asc	'the blueprints of the Incatrad.'0d
	asc	''0d
	asc	'These documents became the foundation of his future Amstrad CPC machines.'0d
	asc	''0d
	asc	'Result: the countdown starts ticking.'0d
	asc	''0d
	asc	'End of the world scheduled 44 years later: in 2028!'0d
	asc	''0d
	asc	'But during his escape, the businessman drops a gear on the beach.'0d
	asc	''0d
	asc	'Fun fact: its many teeth would later inspire'0d
	asc	'those famous Amstrad ads... with crocodiles.'0d
	dfb	eLOCATE,34,25
	asc	' ENTER  'a5
	dfb	eEOD

epilogue_str40
*	dfb	eMODE,2
	dfb	eLOCATE,1,5
	dfb	ePAPER,3
	dfb	eINK,0,0
	dfb	eINK,4,0	; for 640-dithered
	dfb	eINK,8,0	; 
	dfb	eINK,12,0	; 
	dfb	ePEN,0
	asc	'2026, present day:'0d
	asc	'I, a thrill-seeking reporter, stumble upon this cursed gear'0d
	asc	'and venture into a trap-ridden Inca pyramid.'0d
	asc	''0d
	asc	'Killer statues, bottomless pits, treacherous palm trees:'0d
	asc	'I too faced everything to reach the Incatrad.'0d
	asc	''0d
	asc	'And then... a miracle: with only two years'0d
	asc	'left before the cataclysm, I hacked the system.'0d
	asc	''0d
	asc	'Sure, I didn'27't stop the countdown (I'27'm no magician),'0d
	asc	'but I gained 255 years.'0d
	asc	''0d
	asc	'Humanity can finally breathe.'0d
	dfb	eLOCATE,34,25
	asc	' ENTER  'a5
	dfb	eEOD

epilogue_str50
*	dfb	eMODE,2
	dfb	eLOCATE,1,12
	dfb	ePAPER,3
	dfb	eINK,0,0
	dfb	eINK,4,0	; for 640-dithered
	dfb	eINK,8,0	; 
	dfb	eINK,12,0	; 
	dfb	ePEN,0
	asc	'    So tonight, while sipping my Jack Daniel'27's Whiskey, one thought lingers:'0d
	asc	''0d
	asc	'                        Who will save the world next time?'0d
	dfb	eLOCATE,34,25
	asc	' ENTER  'a5
	dfb	eEOD

epilogue_str60	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,9
	dfb	ePEN,1
	asc	''0d
	dfb	ePEN,3
	asc	''0d
	asc	'               HEXAPUCCHU'0d
	dfb	ePEN,2
	asc	''0d
	asc	'      The Lost City of Patchucca'0d
	dfb	ePEN,1
	dfb	eLOCATE,10,20
	asc	'Eric Cubizolle (TITAN)'0d
	dfb	eEOD

epilogue_str70
*	dfb	eMODE,2
	dfb	eLOCATE,1,5
	dfb	ePAPER,3
	dfb	eINK,0,0
	dfb	eINK,4,0	; for 640-dithered
	dfb	eINK,8,0	; 
	dfb	eINK,12,0	; 
	dfb	ePEN,0
	asc	'Hexapucchu was created in just 15 days.'0d
	asc	'This game came from an old wish to create an adventure'0d
	asc	'in the spirit of Devilry II, which I coded in my youth, back in 1989.'0d
	asc	''0d
	asc	'Graphics were drawn using Multipaint for pixel art,'0d
	asc	'and compressed with ConvImgCPC.'0d
	asc	''0d
	asc	'The whole thing was programmed in BASIC, using my modest skills.'0d
	asc	''0d
	asc	'DSK structure and file handling were crafted with ManageDSK.'0d
	asc	''0d
	asc	'Special thanks to Pulsophonic for the music,'0d
	asc	'Roudoudou for his tips and Demoniak for precious help.'0d
	asc	'Dlfrsilver, Lizard and Renaud Guerin for their help with the English translation'0d
	asc	'I hope you enjoyed this little adventure game.'0d
	asc	''0d
	asc	'To my family: Cindy, Lana, Ellie, Oki.'0d
	asc	'Tender thoughts to my Dad.'0d
	asc	''0d
	asc	'                              Long live the CPC!'0d
	dfb	eEOD

