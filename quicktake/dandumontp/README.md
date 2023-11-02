# QuickTake200
Un programme basique en Python pour récupérer les photos d'un QuickTake 200

ce petit programme en Python peut récupérer les images d'un Apple QuickTake 200, un appareil photo des années 90 qui se connecte sur un bus série.

Le code a été testé sous macOS avec un adaptateur série vers USB (https://amzn.to/2XRSdva) et un câble DE9 vers mini jack pour l'appareil photo.

Le programme en Python, très basique, se connecte à l'appareil, passe la connexion à 57 600 bauds, récupère le nombre de photos, sauve les miniatures en TIFF et demande s'il doit sauver les versions JPEG. Si oui, il récupère les fichiers JPEG - en série, c'est lent, comptez 20 secondes par image - et demande ensuite s'il doit effacer les photos.

Le code est commenté, et mon site web contient quelques explications sur le protocole. 

Le code fonctionne aussi avec un Fujifilm DX-7 et sûrement d'autres appareils. 

L'usage est basique : python QuickTake.py 
Les images sont sauvées dans le dossier courant
