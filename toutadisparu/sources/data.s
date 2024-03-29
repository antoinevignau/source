*
* Tout a disparu
*
* (c) 1992, Fran�ois Coulon
* (c) 2022, Antoine Vignau & Olivier Zardini
*

	mx	%00

*-----------------------
* LES VARIABLES
*-----------------------

DEBUT_DATA	=	*	; C'est vachement pratique pour tout effacer !

*--- Variables Apple IIgs

tblTEXTES	ds	4*NB_TEXTES

*--- Variables Atari ST

nbTEXTES	ds	2
i	ds	2	; un index
nb_lignes	ds	2	; nombre de lignes de texte (c'est pour centrer)
localOFFSET	ds	2	; offset de chaque rang�e
localPOINT	ds	2	; index du mot
len_max	ds	2	; longueur de ligne_max
longueur_texte ds	2	; nombre de caracteres du texte d'origine
return	ds	2	; premier RC dans une ligne
rvb1	ds	2	; index 1/5/9/D
rvb2	ds	2	; index 2/6/A/E
index_mot	ds	2	; un autre index qui pointe
nb_mots	ds	2	; nombre de mots dans la scene
numero_mot	ds	2	; index du mot cliqu� apr�s condition
valeur_condition ds	2	; valeur condition 2B xx ou 2D yy
aventure	ds	2
nombre_scenes ds	2
scene_actuelle ds	2
scene_ancienne ds	2
deplacement	ds	2	; BOOL - TRUE (new scene) or FALSE (same scene)
image_chargee ds	2	; WORD - TRUE or FALSE
escape	ds	2	; BOOL - TRUE or FALSE
fgSUITEFORCEE ds	2	; BOOL - TRUE or FALSE

mot	ds	128	; le mot � chercher (jusqu'au caract�re espace)
mot_upper	ds	128	; le m�me mot mais en IIgs majusculanis�
option_mot	ds	128	; la copie du premier mot cherch�
ligne_commentaire		; la phrase de commentaire "mot" : explication
	ds	128
	
* Le texte � afficher

ligne_max	ds	max_colonnes	; une ligne du texte
texte	ds	max_colonnes*max_lignes	; the text from the .TXT file
texte_color	ds	max_colonnes*max_lignes	; FALSE: not a link, TRUE est un mot cliquable
texte_final	ds	max_colonnes*max_lignes	; the final text - known as b$ in Atari ST
	ds	2

* Toujours en d�cal� : index 1 d�marre � 0 (NB_TEXTES est toujours > au nombre de sc�nes)

SUITE_DATA	=	*	; C'est vachement pratique pour tout effacer (encore) !

fonction_mots ds	NB_TEXTES*NB_MOTS*2	; PNTR - mots qui vont "r�agir"
aiguillage	ds	NB_TEXTES*NB_MOTS	; BYTE - scene correspondant au mot
condition	ds	NB_TEXTES*NB_MOTS*2	; WORD - scene devant avoir ete vue (ou non si n�gatif)
pointeur_mots ds	NB_TEXTES		; BYTE - nombre de mots pour chaque scene
scene_visitee ds	NB_TEXTES		; BOOL - le joueur est-il pass� par cette sc�ne ?
phrase	ds	NB_TEXTES*NB_MOTS*2	; PNTR - phrases explicatives de chaque mot
image_a_charger ds	NB_TEXTES*2		; PNTR - nom des fichiers image � charger � chaque sc�ne
rouge1	ds	NB_TEXTES		; les composants RVB pour le fond
vert1	ds	NB_TEXTES
bleu1	ds	NB_TEXTES
rouge2	ds	NB_TEXTES
vert2	ds	NB_TEXTES
bleu2	ds	NB_TEXTES

FIN_DATA	=	*	; Ben, ouais !

	ds	2	; padding, we never know :-)

* Donn�es des fichiers de sauvegarde

fiAVENTURE	ds	2
fiSCENEACTUELLE	ds	2
fiSCENEVISITEE	ds	NB_TEXTES

