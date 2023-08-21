*
* Tout a disparu
*
* (c) 1992, François Coulon
* (c) 2022, Antoine Vignau & Olivier Zardini
*

	mx	%00

*-----------------------
* LES VARIABLES
*-----------------------

DEBUT_DATA	=	*	; C'est vachement pratique pour tout effacer !

*--- Variables Apple IIgs

tblTEXTES	ds	4*NB_TEXTES

*--- Pour la sauvegarde

C1	ds	1
P	ds	1

*--- Variables Atari ST

nbTEXTES	ds	2
nbTEXTES2	ds	2	; nombre de textes indiqué dans le fichier .TEX
i	ds	2	; un index
localOFFSET	ds	2	; offset de chaque rangée
localPOINT	ds	2	; index du mot
len_max	ds	2	; longueur de ligne_max
longueur_texte ds	2	; nombre de caracteres du texte d'origine
return	ds	2	; premier RC dans une ligne
rvb5	ds	2
rvbA	ds	2
index_mot	ds	2	; un autre index qui pointe
nb_mots	ds	2	; nombre de mots dans la scene
mot_clique	ds	2	; index du mot cliqué
mot_ancien	ds	2	; index du mot précédemment cliqué
valeur_condition ds	2	; valeur condition 2B xx ou 2D yy
aventure	ds	2
nombre_scenes ds	2
scene_actuelle ds	2
scene_ancienne ds	2
deplacement	ds	2	; BOOL - TRUE (new scene) or FALSE (same scene)
image_chargee ds	2	; WORD - TRUE or FALSE
escape	ds	2	; BOOL - TRUE or FALSE
fgSUITEFORCEE ds	2	; BOOL - TRUE or FALSE

mot	ds	128	; le mot à chercher (jusqu'au caractère espace)
ligne_commentaire		; la phrase de commentaire "mot" : explication
	asc	D2	; on démarre avec le "
	ds	127
	
* Le texte à afficher

ligne_max	ds	max_colonnes	; une ligne du texte
texte	ds	max_colonnes*max_lignes	; the text from the .TXT file
texte_final	ds	max_colonnes*max_lignes	; the final text - known as b$ in Atari ST
	ds	2
texte_liens	ds	max_colonnes*max_lignes	; FALSE: not a link, TRUE est un mot cliquable
texte_index	ds	max_colonnes*max_lignes	; numéro du mot

* Toujours en décalé : index 1 démarre à 0 (NB_TEXTES est toujours > au nombre de scènes)

SUITE_DATA	=	*	; C'est vachement pratique pour tout effacer (encore) !

fonction_mots ds	NB_TEXTES*NB_MOTS*2	; PNTR - mots qui vont "réagir"
aiguillage	ds	NB_TEXTES*NB_MOTS	; BYTE - scene correspondant au mot
condition	ds	NB_TEXTES*NB_MOTS*2	; WORD - scene devant avoir ete vue (ou non si négatif)
pointeur_mots ds	NB_TEXTES		; BYTE - nombre de mots pour chaque scene
scene_visitee ds	NB_TEXTES		; BOOL - le joueur est-il passé par cette scène ?
phrase	ds	NB_TEXTES*NB_MOTS*2	; PNTR - phrases explicatives de chaque mot
image_a_charger ds	NB_TEXTES*2		; PNTR - nom des fichiers image à charger à chaque scène
rouge1	ds	NB_TEXTES		; les composants RVB pour le fond
vert1	ds	NB_TEXTES
bleu1	ds	NB_TEXTES
rouge2	ds	NB_TEXTES
vert2	ds	NB_TEXTES
bleu2	ds	NB_TEXTES

FIN_DATA	=	*	; Ben, ouais !

	ds	2	; padding, we never know :-)

