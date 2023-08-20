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

nbTEXTES	ds	2
nbTEXTES2	ds	2	; nombre de textes indiqué dans le fichier .TEX

tblTEXTES	ds	4*NB_TEXTES

*--- Pour la sauvegarde

C1	ds	1
P	ds	1

*--- Variables Atari ST

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

aventure	ds	2
nombre_scenes ds	2
scene_actuelle ds	2
scene_nouvelle ds	2
deplacement	ds	2	; BOOL - TRUE (new scene) or FALSE (same scene)
mot	ds	128	; le mot à chercher (jusqu'au caractère espace)
option_mot	ds	128	; le mot est enregistré s'il est dans la liste
image_chargee ds	2	; WORD - TRUE or FALSE
escape	ds	2	; BOOL - TRUE or FALSE
fgSUITEFORCEE ds	2	; BOOL - TRUE or FALSE

* Le texte à afficher

LES_TEXTES	=	*

	asc	"LIGNE_MAX"
ligne_max	ds	max_colonnes	; une ligne du texte
	asc	"TEXTE"
texte	ds	max_colonnes*max_lignes	; the text from the .TXT file
	asc	"TEXTE_FINAL"
texte_final	ds	max_colonnes*max_lignes	; the final text - known as b$ in Atari ST
	ds	2
	asc	"TEXTE_LIENS"
texte_liens	ds	max_colonnes*max_lignes	; FALSE: not a link, TRUE est un mot cliquable
	asc	"TEXTE_INDEX"
texte_index	ds	max_colonnes*max_lignes	; numéro du mot

* Toujours en décalé : index 1 démarre à 0 (NB_TEXTES est toujours > au nombre de scènes)

	asc	"SUITE_DATA"
SUITE_DATA	=	*	; C'est vachement pratique pour tout effacer (encore) !

	asc	"FONCTION_MOTS"
fonction_mots ds	NB_TEXTES*NB_MOTS*2	; PNTR - mots qui vont "réagir"
	asc	"AIGUILLAGE"
aiguillage	ds	NB_TEXTES*NB_MOTS	; BYTE - scene correspondant au mot
	asc	"CONDITION"
condition	ds	NB_TEXTES*NB_MOTS*2	; WORD - scene devant avoir ete vue (ou non si négatif)
	asc	"POINTEUR_MOTS"
pointeur_mots ds	NB_TEXTES		; BYTE - nombre de mots pour chaque scene
	asc	"SCENE_VISITEE"
scene_visitee ds	NB_TEXTES		; BOOL - le joueur est-il passé par cette scène ?
	asc	"PHRASE"
phrase	ds	NB_TEXTES*NB_MOTS*2	; PNTR - phrases explicatives de chaque mot
	asc	"IMAGE_A_CHARGER"
image_a_charger ds	NB_TEXTES*2		; PNTR - nom des fichiers image à charger à chaque scène
	asc	"ROUGE1"
rouge1	ds	NB_TEXTES		; les composants RVB pour le fond
	asc	"VERT1"
vert1	ds	NB_TEXTES
	asc	"BLEU1"
bleu1	ds	NB_TEXTES
	asc	"ROUGE2"
rouge2	ds	NB_TEXTES
	asc	"VERT2"
vert2	ds	NB_TEXTES
	asc	"BLEU2"
bleu2	ds	NB_TEXTES
	asc	"FIN_DATA"
FIN_DATA	=	*	; Ben, ouais !

	ds	2	; padding, we never know :-)

