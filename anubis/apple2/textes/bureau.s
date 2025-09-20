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
	asc	''0d
	asc	'Vous '90'tes'0d
	asc	'dans votre'0d
	asc	'petit'0d
	asc	'bureau...'0d
	asc	''0d
	asc	''0d
	asc	'L'27'odeur'0d
	asc	'du papier'0d
	asc	'ancien'0d
	asc	'y est'0d
	asc	'famili'8f're.'0d
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
	asc	'QUE FAITES-VOUS ?'
	dfb	ePEN,3*3	; 3
	dfb	eLOCATE,4,21
	asc	'1-Examiner        2-Lire la lettre'
	dfb	ePEN,6	; 2
	dfb	eLOCATE,4,22
	asc	'3-Parcourir la carte'
	dfb	ePEN,9	; 3
	dfb	eLOCATE,4,23
	asc	'4-Ouvrir le tiroir'
	dfb	ePEN,6	; 2
	dfb	eLOCATE,4,24
	asc	'5-Fouiller la biblioth'8f'que'
	dfb	eEOD

bureau_str300	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,3
	asc	'Vous '90'tes dans votre bureau, o'9d' la '0d
	asc	'lumi'8f're h'8e'site '88' entrer depuis 1947.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Une biblioth'8f'que croulante,'0d
	asc	'garnie de livres fatigu'8e's,'0d
	asc	'semble attendre qu'27'on l'27'ach'8f've...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Une vieille carte de l'27'Egypte tr'99'ne au'0d
	asc	'mur, comme pour rappeler que depuis'0d
	asc	'quelques temps,vous ne voyagez plus'0d
	asc	'que par procuration...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'La poussi'8f're y est si pr'8e'sente,'0d
	asc	'qu'27'elle pourrait r'8e'clamer un salaire.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Sur le bureau, une lettre toute propre'0d
	asc	'd'8e'tonne dans ce d'8e'cor mortuaire...'0d
	asc	''0d
	asc	'Probablement une erreur de casting.'0d
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
	asc	'Vous d'8e'pliez la lettre avec la'0d
	asc	'solennit'8e' d'27'un homme qui esp'8f're'0d
	asc	'un ch'8f'que...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'           ...et obtenez un code.'0d
	dfb	ePEN,1
	dfb	eLOCATE,29,5
	asc	'code'0d
	dfb	ePEN,3
	dfb	eLOCATE,1,7
	asc	'Comme '88' son habitude, votre m'8e'c'8f'ne vous'0d
	asc	'indique la destination de votre'0d
	asc	'prochaine exp'8e'dition.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Sauf que cette fois, il a jug'8e' bon'0d
	asc	'de la chiffrer comme si vous '8e'tiez'0d
	asc	'en guerre.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Le nom du lieu ?'0d
	dfb	ePEN,1
	asc	''0d
	asc	'               JZGGZIZ'0d
	dfb	ePEN,2
	asc	'Charmant...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'      Pourquoi tout ce cin'8e'ma ?'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Qu'27'est-ce qui pouvait bien l'27'effrayer'0d

	asc	'au point de chiffrer un simple nom de'0d
	asc	'lieu ?'0d
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
	asc	'Vous lisez la lettre avec attention.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Comme '88' son habitude, votre m'8e'c'8f'ne vous'0d
	asc	'indique la destination de votre'0d
	asc	'prochaine exp'8e'dition par voie postale.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'D'27'ordinaire, il se contente de'0d
	asc	'griffonner le nom du prochain coin'0d
	asc	'paume o'9d' vous envoyer.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Mais l'88', il a sorti l'27'artillerie'0d
	asc	'cryptographique, comme si vous deviez'0d
	asc	'infiltrer Berlin en 1943.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Le nom du lieu ?'0d
	dfb	ePEN,1
	asc	''0d
	asc	'               JZGGZIZ'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Ca sonne comme l'278e'ternuement d'27'un'0d
	asc	'pharaon enrhum'8e'...'0d
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
	asc	'Ce mot '8e'trange, JZGGZIZ, vous titille'0d
	asc	'l'27'esprit comme un moustique en'0d
	asc	'plein d'8e'sert.'0d
	dfb	eLOCATE,17,6
	dfb	ePEN,1
	asc	'JZGGZIZ'0d
	dfb	ePEN,2
	dfb	eLOCATE,1,10
	asc	'Vous sentez que la solution est '880d
	asc	'port'8e'e de r'8e'flexion, quelque part'0d
	asc	'entre intuition et coup de chance.'0d
	dfb	ePEN,1
	dfb	eLOCATE,3,17
	asc	'Souhaitez-vous tenter de d'8e'chiffrer'0d
	dfb	eLOCATE,12,18
	asc	'ce mot (O/N) 'a5
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
	asc	'Quel est le mot d'8e'cod'8e' '
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
	asc	''0d
	asc	'Bravo, Sherlock !'0d
	asc	'Vous avez perc'8e' le myst'8f're !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Le mot QATTARA brille maintenant comme'0d
	asc	'un phare dans la nuit.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Il est temps de troquer votre chaise'0d
	asc	'miteuse contre une aventure bien'0d
	asc	'plus '8e'pique.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Pr'8e'parez votre chapeau, vos bottes,'0d
	asc	'et un bon stock de creme solaire,'0d
	asc	'parce que vous quittez votre tani'8f're'0d
	asc	'de loser.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'En route pour QATTARA !'0d
	dfb	ePEN,3
	dfb	eLOCATE,15,18
	asc	'QATTARA'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Ha, au fait... En reposant la lettre,'0d
	asc	'vous lisez le mot '22' SOON '22' au dos.'0d
	dfb	eLOCATE,21,21
	dfb	ePEN,1
	asc	'SOON'0d
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
	asc	'Vous relisez la lettre, cette fois avec'0d
	asc	'une attention renouvel'8e'e.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Ce mot '8e'trange, JZGGZIZ, vous titille'0d
	asc	'l'27'esprit comme un moustique en plein'0d
	asc	'd'8e'sert.'0d
	dfb	ePEN,1
	dfb	eLOCATE,17,4
	asc	'JZGGZIZ'0d
	dfb	ePEN,3
	dfb	eLOCATE,1,8
	asc	'Vous sentez que la solution est '880d
	asc	'port'8e'e de r'8e'flexion, quelque part'0d
	asc	'entre intuition et coup de chance.'0d
	dfb	ePEN,1
	dfb	eLOCATE,3,17
	asc	'Souhaitez-vous tenter de d'8e'chiffrer'0d
	dfb	eLOCATE,12,18
	asc	'ce mot (O/N) 'a5
	dfb	eEOD

bureau_str900	ent
*	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,3
	asc	'Ah non, ce n'27'est pas ca !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'A moins que vous ne tentiez un'0d
	asc	'nouveau dialecte '8e'gyptien tr'8f's'0d
	asc	'avant-gardiste, '8d'a ne colle pas...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Peut-'90'tre qu'27'un livre saura faire'0d
	asc	'travailler vos deux neurones.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Ou simplement apprendre l'27'alphabet'0d
	asc	'avant de jouer au d'8e'tective...'0d
	dfb	ePEN,3
	dfb	eLOCATE,4,15
	asc	'Voulez-vous r'8e'essayer (O/N) ? 'a5
	dfb	eEOD

bureau_str1000	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,3
	asc	'La carte repr'8e'sente l'27'Egypte dans'0d
	asc	'toute sa splendeur :'0d
	dfb	ePEN,2
	asc	'du Nil majestueux, aux pyramides'0d
	asc	'pointues comme des critiques de th'8f'se.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'A un endroit pr'8e'cis, le nom d'27'un'0d
	asc	'lieu a '8e't'8e' soigneusement gratt'8e','0d
	asc	'comme si quelqu'27'un avait voulu emp'90'cher'0d
	asc	'un touriste de s'27'y rendre.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Il ne reste qu'27'une lettre : un '22'Q'220d
	asc	'Cela '8e'voque un lieu...'0d
	dfb	ePEN,1
	dfb	eLOCATE,33,11
	asc	'Q'0d
	dfb	ePEN,2
	dfb	eLOCATE,1,14
	asc	'En bas de la carte, une note'0d
	asc	'manuscrite ratur'8e'e indique :'0d
	dfb	ePEN,1
	asc	''0d
	asc	22'Les techniques militaires de C'8e'sar'0d
	asc	'n'27'ont jamais '8e't'8e' fructueuses en Egypte'0d
	asc	'NE PAS LES UTILISER !'220d
	dfb	ePEN,2
	asc	''0d
	asc	'Il faut croire que m'90'me les g'8e'n'8e'raux'0d
	asc	'romains ont leurs jours sans.'0d
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
	asc	'Vous ouvrez le tiroir du bureau,'0d
	asc	'esp'8e'rant y trouver un indice myst'8e'rieux.'0d
	dfb	ePEN,1
	asc	'A la place, c'27'est une v'8e'ritable bo'94'te'0d
	asc	88' bazar intergalactique :'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Une cuill'8f're en plastique douteuse,'0d
	asc	'une collection de cailloux tri'8e's par'0d
	asc	'taille et couleur, un vieux poster'0d
	asc	'de chat d'8e'guis'8e' en pharaon, et une'0d
	asc	'ampoule grill'8e'e... sans douille.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Oh, et une gomme en forme de banane,'0d
	asc	'qui colle plus qu'27'elle n'27'efface...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Vous trouvez m'90'me un mini scarab'8e'e'0d
	asc	'en plastique qui clignote.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Bref, vous repoussez d'8e'licatement'0d
	asc	'le tiroir, sifflez, et priez pour que'0d
	asc	'personne ne pose de questions.'0d
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
	asc	'Vous vous penchez sur la biblioth'8f'que,'0d
	asc	'esp'8e'rant y d'8e'nicher un secret'0d
	asc	'ou au moins un marque-page oubli'8e'.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Parmi les volumes poussi'8e'reux sur'0d
	asc	'l'27'Egypte, 3 tomes tranchent '8e'trangement'0d
	asc	'car ils parlent tous de la guerre 39-45'0d
	dfb	ePEN,3
	asc	''0d
	asc	'- Premier tome :'0d
	dfb	ePEN,2
	asc	'Les astuces de cryptage des messages.'0d
	asc	'parce que, visiblement, d'8e'coder des'0d
	asc	'messages, '8d'a se ma'94'trise.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'- Deuxi'8f'me tome :'0d
	dfb	ePEN,2
	asc	'Les pi'8f'ges inattendus de la guerre.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'- Troisi'8f'me tome :'0d
	dfb	ePEN,2
	asc	'Les astuces de cryptage des'0d
	asc	'd'8e'placements des troupes.'0d
	dfb	ePEN,3
	dfb	eLOCATE,2,23
	asc	'Quel tome voulez-vous lire (1/2/3/0) ?'
	dfb	eEOD

bureau_str1400	ent
*	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,3
	asc	'Vous ouvrez le premier tome,'0d
	asc	'pr'90't '88' plonger dans les myst'8f'res'0d
	asc	'du cryptage militaire.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'A votre grande surprise,'0d
	asc	'le livre d'8e'taille la fameuse technique'0d
	asc	'de l'27'alphabet invers'8e'.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Oui, ce bon vieux A qui devient Z,'0d
	asc	'B qui devient Y, et ainsi de suite...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Le tome explique aussi le fameux'0d
	asc	'chiffre de C'8e'sar.'0d
	asc	'Une m'8e'thode o'9d' chaque lettre est'0d
	asc	'd'8e'cal'8e'e d'27'un certain nombre dans'0d
	asc	'l'27'alphabet.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Par exemple, avec un d'8e'calage de 3,'0d
	asc	'A devient D, B devient E, etc.'0d
	dfb	ePEN,3
	dfb	eLOCATE,2,23
	asc	'Quel tome voulez-vous lire (1/2/3/0) ?'
	dfb	eEOD

bureau_str1500	ent
*	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,3
	asc	'Vous ouvrez le deuxi'8f'me tome,'0d
	asc	'pr'90't '88' '8e'tudier les pi'8f'ges de la'0d
	asc	'guerre avec s'8e'rieux.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Mais '88' votre grande surprise,'0d
	asc	'plusieurs pages ont '8e't'8e' arrach'8e'es et'0d
	asc	'remplac'8e'es par des planches..'0d
	asc	'd'27'une bande dessin'8e'e de Picsou !'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Visiblement, quelqu'27'un a d'8e'cid'8e0d
	asc	'que la strat'8e'gie militaire m'8e'ritait'0d
	asc	'une touche un peu plus p'8e'cuniaire'0d
	asc	'et canardesque !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Pas s'9e'r que cette lecture vous aide'0d
	asc	88' d'8e'jouer des pi'8f'ges, mais au moins,'0d
	asc	'vous avez droit '88' une pause d'8e'tente'0d
	asc	'inattendue.'0d
	dfb	ePEN,3
	dfb	eLOCATE,2,23
	asc	'Quel tome voulez-vous lire (1/2/3/0) ?'
	dfb	eEOD

bureau_str1600	ent
*	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eCLS
	dfb	ePEN,3
	asc	'Vous ouvrez le troisi'8f'me tome,'0d
	asc	'plein d'27'espoir pour percer un secret'0d
	asc	'militaire bien ficel'8e'.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Il explique que les g'8e'n'8e'raux'0d
	asc	'codifiaient les d'8e'placements des'0d
	asc	'troupes en assemblant les initiales'0d
	asc	'des points cardinaux :'0d
	dfb	ePEN,1
	asc	''0d
	asc	'S pour Sud, O pour Ouest,'0d
	asc	'N pour Nord, E pour Est'0d
	dfb	ePEN,3
	asc	'Et hop, un mot myst'8e'rieux naissait !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Par exemple, le mot NES,'0d
	asc	'qui pourrait '8e'voquer une console,'0d
	asc	'signifiait en r'8e'alit'8e' Nord-Est-Sud !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Une technique aussi simple'0d
	asc	'qu'27'ing'8e'nieuse, parfaite pour'0d
	asc	'transmettre des ordres sans se faire'0d
	asc	'griller par l'27'ennemi.'0d
	dfb	ePEN,3
	dfb	eLOCATE,2,23
	asc	'Quel tome voulez-vous lire (1/2/3/0) ?'
	dfb	eEOD
	
