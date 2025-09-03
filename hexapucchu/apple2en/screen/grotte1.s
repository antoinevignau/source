*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

GROTTE1	@LOAD	#pGROTTE1
GROTTE1_60	@SHOWPIC
GROTTE1_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	GROTTE1_110
	cmp	#'2'
	beq	GROTTE1_120
	cmp	#'3'
	beq	GROTTE1_200
	cmp	#'4'
	beq	GROTTE1_300
	cmp	#'5'
	beq	GROTTE1_400
	cmp	#'6'
	beq	GROTTE1_500
	bne	GROTTE1_LOOP

GROTTE1_110	jmp	CASCADE

GROTTE1_120	jmp	GROTTE2

GROTTE1_200	@PRINT	#grotte1_str200
	@INKEY
	jmp	GROTTE1_60

GROTTE1_300	@PRINT	#grotte1_str300
	@INKEY
	jmp	MORT

GROTTE1_400	@PRINT	#grotte1_str400
	@INKEY
	jmp	GROTTE1_60

GROTTE1_500	@PRINT	#grotte1_str500
	@INKEY
	jmp	GROTTE1_60

*---

pGROTTE1	strl	'@/data/grotte1'

grotte1_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'The cave mouth looks like a gaping'0d
	asc	'jaw, hungry to swallow the next'0d
	asc	'fool brave enough to step in.'0d
	dfb	ePEN,2
	asc	0d
	asc	'On the damp rock, you spot'0d
	asc	'several graffiti.'0d
	dfb	ePEN,1
	asc	0d
	asc	'Among the classics:'0d
	dfb	ePEN,3
	asc	0d
	asc	''0d
	asc	22'Enter at your own risk'22', '
	asc	22'Go away'22', '
	asc	22'No trespassing'22', and '
	asc	22'Cuidado con el oso!'220d
	dfb	ePEN,2
	asc	0d
	asc	'... one message stands out :'0d
	dfb	ePEN,3
	asc	0d
	asc	'           '22'Alan was here'220d
	dfb	ePEN,2
	dfb	ePEN,1
	asc	0d
	asc	'seems to be staring at you insistently.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte1_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Great explorer that you are,'0d
	asc	'you decide it'27's time for a break...'0d
	asc	'After what, three minutes of effort?'0d
	dfb	ePEN,2
	asc	0d
	asc	'You sit grandly on a rock,'0d
	asc	'seeking wisdom and inspiration.'0d
	dfb	ePEN,1
	asc	0d
	asc	'The sound of the waterfall,'0d
	asc	'the distant call of an exotic bird,'0d
	asc	'the quiet trickle of water'0d
	asc	'into your soaked socks..'0d
	dfb	ePEN,2
	asc	0d
	asc	'A near-zen moment...'0d
	dfb	ePEN,3
	asc	0d
	asc	'Until a curious (and deadly) ant'0d
	asc	'decides your butt is'0d
	asc	'a perfect climbing wall!'0d
	dfb	ePEN,1
	asc	0d
	asc	'       Its bite is fatal.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

grotte1_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You sit cross-legged, close your'0d
	asc	'eyes, and let your mind drift...'0d
	dfb	ePEN,2
	asc	0d
	asc	'During your meditation, you'0d
	asc	'feel your spirit lift...'0d
	dfb	ePEN,3
	asc	0d
	asc	'Until it decides to pop out'0d
	asc	'for a drink without telling you.'0d
	dfb	ePEN,1
	asc	0d
	asc	'You'27're left behind, wondering'0d
	asc	'how spiritual abandonment feels.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

grotte1_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Braving the humidity, you slip'0d
	asc	'behind the curtain of water.'0d
	dfb	ePEN,2
	asc	0d
	asc	'A powerful feeling:'0d
	dfb	ePEN,3
	asc	0d
	asc	'It'27's like Mother Nature'0d
	asc	'hosing you down herself.'0d
	dfb	ePEN,1
	asc	0d
	asc	'You come out drenched,'0d
	asc	'like a used tea bag, but also'0d
	asc	'with a sense of purpose.'0d
	dfb	ePEN,3
	asc	0d
	asc	'(Not sure what purpose, though.)'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
