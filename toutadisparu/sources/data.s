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
phrase	ds	2
longueur	ds	2
index	ds	2
pointeur	ds	2
fonction_mots ds	2
aiguillage	ds	2
conditions	ds	2
numero_mot	ds	2	; WORD
mot	ds	128	; le mot à chercher (jusqu'au caractère espace)
option_mot	ds	128	; le mot est enregistré s'il est dans la liste
image_chargee ds	2	; WORD - TRUE or FALSE
escape	ds	2	; WORD - TRUE or FALSE

* Toujours en décalé : index 1 démarre à 0 (NB_TEXTES est toujours > au nombre de scènes)

rouge1	ds	NB_TEXTES	; les composants RVB pour le fond
vert1	ds	NB_TEXTES
bleu1	ds	NB_TEXTES
rouge2	ds	NB_TEXTES
vert2	ds	NB_TEXTES
bleu2	ds	NB_TEXTES

scene_visitee ds	NB_TEXTES	; BYTE - par scene, on met true ou false
image_a_charger ds	NB_TEXTES*2	; WORD - par scene, on y met le pointeur vers le nom de l'image
pointeur_mots ds	NB_TEXTES	; BYTE - par scene, nombre de mots

texte$	ds	2
b$	ds	2

FIN_DATA	=	*	; Ben, ouais !

	ds	2	; padding, we never know :-)

