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

aventure	ds	2
nombre_scenes ds	2
scene_actuelle ds	2
i	ds	2
j	ds	2
scene	ds	2
deplacement	ds	2
fichier	ds	2
espace	ds	2
longueur	ds	2
index	ds	2
pointeur	ds	2
numero_mot	ds	2	; WORD
mot	ds	128	; le mot à chercher (jusqu'au caractère espace)
option_mot	ds	128	; le mot est enregistré s'il est dans la liste
image_chargee ds	2	; WORD - TRUE or FALSE
escape	ds	2	; WORD - TRUE or FALSE

* Toujours en décalé : index 1 démarre à 0 (NB_TEXTES est toujours > au nombre de scènes)

	asc	"SUITE_DATA"
SUITE_DATA	=	*	; C'est vachement pratique pour tout effacer !

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

