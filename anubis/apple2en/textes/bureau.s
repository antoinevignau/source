*
* Le secret d'Anubis
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

* PEN 2 -> 6
* PEN 3 -> 9

bureau_str100	ent
*	dfb	eMODE,1
*	dfb	eINK,0,0
*	dfb	eINK,1,6
*	dfb	eINK,2,15
*	dfb	eINK,3,25
*	dfb	eBORDER,0
*	dfb	ePAPER,0
*	dfb	eCLS
	dfb	ePEN,3*3	; 3
*	asc	'12345678901'
	asc	''0d
	asc	'You are'0d
	asc	'in your'0d
	asc	'small'0d
	asc	'office...'0d
	asc	''0d
	asc	''0d
	asc	'The smell'0d
	asc	'of old'0d
	asc	'paper'0d
	asc	'feels'0d
	asc	'familiar.'
	dfb	eEOD

bureau_str200	ent
*	dfb	eMODE,1
*	dfb	eINK,0,0
*	dfb	eINK,1,6
*	dfb	eINK,2,15
*	dfb	eINK,3,25
*	dfb	eBORDER,0
*	dfb	ePAPER,0
*	dfb	eCLS
	dfb	eLOCATE,13,20
	dfb	ePEN,2*3	; 2
	asc	'WHAT DO YOU DO?'
	dfb	ePEN,3*3	; 3
	dfb	eLOCATE,4,21
	asc	'1-Examine        2-Read the letter'
	dfb	ePEN,6	; 2
	dfb	eLOCATE,4,22
	asc	'3-Look at the map'
	dfb	ePEN,9	; 3
	dfb	eLOCATE,4,23
	asc	'4-Open the drawer'
	dfb	ePEN,6	; 2
	dfb	eLOCATE,4,24
	asc	'5-Search the bookcase'
	dfb	eEOD

bureau_str300	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,3
	asc	'You are in your office, where the'0d
	asc	'light has struggled to enter since 1947.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'A sagging bookcase,'0d
	asc	'full of tired books,'0d
	asc	'looks like it wants to collapse...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'An old Egypt map hangs on the wall,'0d
	asc	'as if to remind you that lately'0d
	asc	'you only travel by proxy...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'The dust is so thick,'0d
	asc	'it could demand a salary.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'On the desk, a spotless letter'0d
	asc	'clashes with this funeral decor...'0d
	asc	''0d
	asc	'Probably a casting mistake.'0d
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

bureau_str400	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,3
	asc	'You unfold the letter with the'0d
	asc	'solemnity of a man hoping for'0d
	asc	'a check...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'           ...and you find a code.'0d
	dfb	ePEN,1
	dfb	eLOCATE,30,5
	asc	'code'0d
	dfb	ePEN,3
	dfb	eLOCATE,1,7
	asc	'As usual, your patron gives you'0d
	asc	'the destination of your next'0d
	asc	'expedition.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'But this time, he thought it wise'0d
	asc	'to encrypt it as if you were at'0d
	asc	'war.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'The place name?'0d
	dfb	ePEN,1
	asc	''0d
	asc	'               JZGGZIZ'0d
	dfb	ePEN,2
	asc	'Charming...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'      Why all this drama?'0d
	dfb	ePEN,3
	asc	''0d
	asc	'What could scare him enough'0d
	asc	'to encrypt a simple place name?'0d
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

bureau_str500	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,3
	asc	'You read the letter carefully.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'As usual, your patron tells you'0d
	asc	'the destination of your next'0d
	asc	'expedition by mail.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Usually, he just scribbles the'0d
	asc	'name of the next remote place'0d
	asc	'to send you.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'But this time, he brought out the'0d
	asc	'big cryptographic guns, like if you'0d
	asc	'were infiltrating Berlin in 1943.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'The place name?'0d
	dfb	ePEN,1
	asc	''0d
	asc	'               JZGGZIZ'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Sounds like a pharaoh sneezing'0d
	asc	'with a bad cold...'0d
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

bureau_str600	ent
*	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,3
	dfb	eLOCATE,1,6
	asc	'This strange word, JZGGZIZ, teases'0d
	asc	'your mind like a mosquito in the'0d
	asc	'middle of the desert.'0d
	dfb	eLOCATE,20,6
	dfb	ePEN,1
	asc	'JZGGZIZ'0d
	dfb	ePEN,2
	dfb	eLOCATE,1,10
	asc	'You feel the solution is close,'0d
	asc	'somewhere between intuition'0d
	asc	'and pure luck.'0d
	dfb	ePEN,1
	dfb	eLOCATE,3,17
	asc	'Do you want to try to decode it'0d
	dfb	eLOCATE,12,18
	asc	'(Y/N) 'a5
	dfb	eEOD

bureau_str700	ent
*	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,3
	dfb	eLOCATE,1,1
	asc	'What is the decoded word '
	dfb	eEOD

bureau_str720	ent
*	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,1
	asc	''0d
	asc	'Bravo, Sherlock!'0d
	asc	'You solved the mystery!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'The word QATTARA now shines like'0d
	asc	'a beacon in the night.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Time to swap your worn-out chair'0d
	asc	'for an epic adventure.'0d
	dfb	ePEN,1
 	asc	''0d
	asc	'Grab your hat, your boots,'0d
	asc	'and plenty of sunscreen,'0d
	asc	'because you'27're leaving your'0d
	asc	'loser'27's den.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Off to QATTARA!'0d
	dfb	ePEN,3
	dfb	eLOCATE,8,16
	asc	'QATTARA'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Oh, by the way... When putting the'0d
	asc	'letter back, you see the word '22' SWWN '220d
	asc	'on the back.'0d
	dfb	eLOCATE,33,20
	dfb	ePEN,1
	asc	'SWWN'0d
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

bureau_str800	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,3
	asc	'You reread the letter, now with'0d
	asc	'renewed attention.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'This strange word, JZGGZIZ, pricks'0d
	asc	'your mind like a mosquito in'0d
	asc	'the desert.'0d
	dfb	ePEN,1
	dfb	eLOCATE,20,4
	asc	'JZGGZIZ'0d
	dfb	ePEN,3
	dfb	eLOCATE,1,8
	asc	'You feel the solution is within'0d
	asc	'reach, somewhere between'0d
	asc	'intuition and luck.'0d
	dfb	ePEN,1
	dfb	eLOCATE,7,17
	asc	'Do you want to try decoding'0d
	dfb	eLOCATE,12,18
	asc	'this word (Y/N) 'a5
	dfb	eEOD

bureau_str900	ent
*	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,3
	asc	'Oh no, that'27's not it!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Unless you'27're using a very avant-garde'0d
	asc	'Egyptian dialect, it doesn'27't fit...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Maybe a book could help you'0d
	asc	'use both your neurons.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Or simply learn the alphabet'0d
	asc	'before playing detective...'0d
	dfb	ePEN,3
	dfb	eLOCATE,4,15
	asc	'Do you want to try again (Y/N)? 'a5
	dfb	eEOD

bureau_str1000	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,3
	asc	'The map shows Egypt in all'0d
	asc	'its glory:'0d
	dfb	ePEN,2
	asc	'From the majestic Nile to pyramids'0d
	asc	'sharp as thesis critiques.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'At one exact spot, a place name'0d
	asc	'was carefully erased, as if'0d
	asc	'someone wanted to stop a tourist'0d
	asc	'from going there.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Only one letter remains: a '22'Q'220d
	asc	'It evokes a place...'0d
	dfb	ePEN,1
	dfb	eLOCATE,29,11
	asc	'Q'0d
	dfb	ePEN,2
	dfb	eLOCATE,1,14
	asc	'At the bottom of the map, a handwritten'0d
	asc	'note, crossed out, says:'0d
	dfb	ePEN,1
	asc	''0d
	asc	22'Caesar'27's military techniques'0d
	asc	'never worked in Egypt'0d
	asc	'DO NOT USE THEM!'220d
	dfb	ePEN,2
	asc	''0d
	asc	'Apparently, even Roman generals'0d
	asc	'have off days.'0d
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

bureau_str1100	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,3
	asc	'You open the office drawer,'0d
	asc	'hoping to find a mysterious clue.'0d
	dfb	ePEN,1
	asc	'Instead, it'27's a real intergalactic'0d
	asc	'mess box:'0d
	dfb	ePEN,2
	asc	''0d
	asc	'A dubious plastic spoon,'0d
	asc	'a collection of stones sorted by'0d
	asc	'size and color, an old poster'0d
	asc	'of a cat dressed as a pharaoh, and'0d
	asc	'a burnt-out bulb... without socket.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Oh, and a banana-shaped eraser,'0d
	asc	'that sticks more than it erases...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'You even find a small plastic scarab'0d
	asc	'that blinks.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Carefully, you push the drawer back,'0d
	asc	'whistle, and pray nobody asks questions.'0d
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

bureau_str1200	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,3
	asc	'You lean over the bookshelf,'0d
	asc	'hoping to find a secret'0d
	asc	'or at least a forgotten bookmark.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Among the dusty volumes on Egypt,'0d
	asc	'3 tomes stand out strangely'0d
	asc	'because they all talk about the'0d
	asc	'war 39-45'0d
	dfb	ePEN,3
	asc	''0d
	asc	'- First tome:'0d
	dfb	ePEN,2
	asc	'Message encryption tricks.'0d
	asc	'Because, apparently, decoding'0d
	asc	'messages requires skill.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'- Second tome:'0d
	dfb	ePEN,2
	asc	'Unexpected war traps.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'- Third tome:'0d
	dfb	ePEN,2
	asc	'Troop movement encryption tricks.'0d
	dfb	ePEN,3
	dfb	eLOCATE,8,23
	asc	'Choose a Tome (1/2/3/0)'0d
	dfb	eEOD

bureau_str1400	ent
*	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,3
	asc	'You open the first tome,'0d
	asc	'ready to dive into military'0d
	asc	'encryption mysteries.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'To your surprise,'0d
	asc	'the book details the famous inverse'0d
	asc	'alphabet technique.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Yes, that old A becomes Z,'0d
	asc	'B becomes Y, and so on...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'The tome also explains the Caesar cipher'0d
	asc	'A method where each letter'0d
	asc	'is shifted by a set number'0d
	asc	'along the alphabet.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'For example, with a shift of 3,'0d
	asc	'A becomes D, B becomes E, etc...'0d
	dfb	ePEN,3
	dfb	eLOCATE,8,23
	asc	'Choose a Tome (1/2/3/0)'0d
	dfb	eEOD

bureau_str1500	ent
*	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,3
	asc	'You open the second tome,'0d
	asc	'ready to study the war traps'0d
	asc	'seriously.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'To your surprise,'0d
	asc	'several pages were torn out and'0d
	asc	'replaced by comic strips of Donald Duck!'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Apparently, someone decided'0d
	asc	'military strategy needed'0d
	asc	'a more pecuniary, duckish touch!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Not sure this helps you avoid traps,'0d
	asc	'but at least you get an unexpected'0d
	asc	'relaxing break.'0d
	dfb	ePEN,3
	dfb	eLOCATE,8,23
	asc	'Choose a Tome (1/2/3/0)'0d
	dfb	eEOD

bureau_str1600	ent
*	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,3
	asc	'You open the third tome,'0d
	asc	'full of hope to uncover a well-'0d
	asc	'crafted military secret.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'It explains that generals'0d
	asc	'coded troop movements by'0d
	asc	'assembling the initials of'0d
	asc	'the cardinal points:'0d
	dfb	ePEN,1
	asc	''0d
	asc	'S for South, W for West,'0d
	asc	'N for North, E for East'0d
	dfb	ePEN,3
	asc	'And thus, a mysterious word was born!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'For example, the word NES,'0d
	asc	'which might suggest a console,'0d
	asc	'actually meant North-East-South!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'A technique as simple'0d
	asc	'as ingenious, perfect to'0d
	asc	'transmit orders without being'0d
	asc	'caught by the enemy.'0d
	dfb	ePEN,3
	dfb	eLOCATE,8,23
	asc	'Choose a Tome (1/2/3/0)'0d
	dfb	eEOD
	
