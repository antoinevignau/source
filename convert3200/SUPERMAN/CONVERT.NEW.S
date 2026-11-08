
            ORG   $800
            LST   OFF

            PHK               ; TRAVAIL AILLEURS QU'EN BANC 00
            PLB

            LDAL  $01C034     ; BORDURE
            AND   #$FFF1
            STAL  $01C034

            RTL

