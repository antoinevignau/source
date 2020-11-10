*
* GS/Paint
* version 1.2
*
* (c) 1986-1987, Version Soft
* (s) 2020, Brutal Deluxe Software
*
	 
*-------------------------------

L01012B  ENT
         ASC   '>L@\XN1'0D
         ASC   ' LA propos de'
         ASC   "I"
         ASC   '\N256'0D
         ASC   ' LAide'
         ASC   "I"
         ASC   '\VN257'0D
L010155  ENT
         ASC   '>L Fichier \N2'0D
         ASC   ' LNouveau\*NnN258'0D
         ASC   ' LOuvrir'
         ASC   "I"
         ASC   '\*OoN259'0D
         ASC   ' LFermer\N260'0D
         ASC   ' LEnregistrer'
         ASC   "I"
         ASC   '\*EeN261'0D
         ASC   ' LEnregistrer sous'
         ASC   "I"
         ASC   '\N262'0D
         ASC   ' LVersion enregistr'8E
         ASC   'e'
         ASC   "I"
         ASC   '\VN263'0D
         ASC   ' LType d'27'imprimante'
         ASC   "I"
         ASC   '\N264'0D
         ASC   ' LFormat d'27'impression'
         ASC   "I"
         ASC   '\N265'0D
         ASC   ' LImprimer'
         ASC   "I"
         ASC   '\V*IiN266'0D
         ASC   ' LQuitter\*QqN267'0D
L01023E  ENT
         ASC   '>L Edition \N3'0D
         ASC   ' LAnnuler\V*ZzN268'0D
         ASC   ' LCouper\*XxDN269'0D
         ASC   ' LCopier\*CcDN270'0D
         ASC   ' LColler\*VvDN271'0D
         ASC   ' LEffacer\VDN272'0D
         ASC   ' LInverser\DN273'0D
         ASC   ' LRetourner horiz.\DN274'0D
         ASC   ' LRetourner vert.\DN275'0D
         ASC   ' LFaire pivoter\DN276'0D
L0102FE  ENT
         ASC   '>L Outils \N4'0D
         ASC   ' LGrille\N277'0D
         ASC   ' LLoupe\N278'0D
         ASC   ' LPleine page\N279'0D
         ASC   ' LPlein '8E
         ASC   'cran\N280'0D
         ASC   ' LPinceaux'
         ASC   "I"
         ASC   '\N281'0D
         ASC   ' LMiroirs'
         ASC   "I"
         ASC   '\N282'0D
         ASC   ' LEditer motif'
         ASC   "I"
         ASC   '\DVN283'0D
         ASC   ' LCompresser'
         ASC   "I"
         ASC   '\DN284'0D
         ASC   ' LAnimer'
         ASC   "I"
         ASC   '\DN285'0D
L0103A8  ENT
         ASC   '>L Couleur \N5'0D
         ASC   ' LChercher\N286'0D
         ASC   ' LLib'8E
         ASC   'rer\VN287'0D
         ASC   ' LEditer palette'
         ASC   "I"
         ASC   '\N288'0D
         ASC   ' LChanger palette'
         ASC   "I"
         ASC   '\N289'0D
L010405  ENT
         ASC   '>L Texte \N6'0D
         ASC   ' LCaract'8F
         ASC   'res'
         ASC   "I"
         ASC   '\VN290'0D
         ASC   ' LCadrer '88
         ASC   ' gauche\C'12
         ASC   '*Gg\N291'0D
         ASC   ' LCentrer\*TtN292'0D
         ASC   ' LCadrer '88
         ASC   ' droite\*DdN293'0D
         ASC   '.'

L01046F  ENT
         STR   'OK'
L010472  ENT
         STR   'Annuler'
L01047A  STR   'Oui'
L01047E  STR   'Non'
L010482  ENT
         STR   'Aucun'
L010488  STR   'Lecteur'
L010490  STR   'Fermer'
L010497  STR   'fermer'
L01049E  STR   'Ouvrir'
L0104A5  STR   'Sauver'
L0104AC  STR   'Libre : ^0/^1 K'0D
L0104BD  STR   'Dossier'
L0104C5  STR   'quitter'
L0104CD  DW    $0004
L0104CF  DW    $0005
L0104D1  DW    $001C
L0104D3  DW    $00FA
L0104D5  STR   'Voulez-vous enregistrer les '0D'modifications avant de ^0 ?'0D
L01050F  DW    $000A
L010511  DW    $0005
L010513  DW    $001E
L010515  DW    $00FA
L010517  STR   'Voulez-vous revenir '88' la'0D'derni'8F're version enregistr'8E'e ?'0D
L010550  STR   'Ins'8E'rez le disque syst'8F'me'
L01056A  STR   'Ins'8E'rez le disque programme'
L010586  STR   'Impossible d'27'imprimer.'
L01059D  DW    $0014
L01059F  DW    $000A
L0105A1  DW    $0022
L0105A3  DW    $00FA
L0105A5  STR   'GS/Paint ne pourra pas annuler!'
L0105C5  STR   'Avez-vous un ruban couleur ?'
L0105E2  STR   'Enregistrer sous :'
L0105F5  STR   'Ouvrir :'
L0105FE  STR   ' Format '8E'cran'
L01060C  STR   ' Format paint'
L01061A  STR   ' Format Apple '
L010629  STR   'Erreur E/S No $^0'0D
L01063C  STR   'Erreur m'8E'moire No $^0'0D
L010653  STR   'Erreur No $^0'0D
L010662  STR   'Erreur Systeme No $'
L010676  ENT
         STR   'Sans.titre'
L010681  ENT
         STR   'Tempo : '
L01068A  ENT
         STR   'S'8E'lectionnez une des images : '
L0106A9  ENT
         STR   'Sauver l'27'animation :'
L0106BE  ENT
         STR   'Lancer l'27'animation :'
L0106D3  STR   'Ecran0'
L0106DA  ENT
         STR   'Recuperation'
L0106E7  STR   '?'
L0106E9  STR   'GS/Paint V1.2'
L0106F7  STR   'par'
L0106FB  STR   'H. Lamiraux'
L010707  STR   'et'
L01070A  STR   'B. Gallet, L. Barthelet'
L010722  STR   'R. Danais, S. Cavril'
L010737  STR   'Copyright 1986, Version Soft.'
L010755  STR   'Disque prot'8E'g'8E' en '8E'criture.'
L010771  STR   'Fichier non trouv'8E'.'
L010785  STR   'Nom de fichier en double.'
L01079F  STR   'Volume plein.'
L0107AD  STR   'Catalogue plein.'
L0107BE  STR   'Acc'8F's r'8E'serv'8E'.'
L0107CD  STR   'Pas assez de m'8E'moire.'
