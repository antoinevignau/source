*
* affiche le logo brutal.deluxe
*
* (c) Zardos, 22/07/92
* v1.00 def
*
            org   $1000
            lst   off
            dsk   a.image
            typ   #$00

DES0        EQU   $E19E00
DES1        EQU   $E19E20

ECR1L       EQU   $E15A66     ; ECRAN LOGO
ECR2L       EQU   $E15A68
ECR3L       EQU   $E15A6A
ECR4L       EQU   $E15A6C
ECR5L       EQU   $E15A6E
ECR6L       EQU   $E15A70
ECR7L       EQU   $E15A72
ECR8L       EQU   $E15A74
ECR9L       EQU   $E15A76

ECR1        EQU   $E18432     ; ECRAN BRUTAL
ECR2        EQU   $E184D2
ECR3        EQU   $E18572
ECR4        EQU   $E18612
ECR5        EQU   $E186B2
ECR6        EQU   $E18752
ECR7        EQU   $E187F2

            CLC
            XCE               ; 16 BIT
            REP   #$30

            STZ   PT
            LDA   #$0000
            LDX   #$7FFE
:2          STAL  $E12000,X   ; ON EFFACE LA MEM GRAPH
            DEX
            DEX
            BPL   :2

            LDX   #$0020
PA0         LDA   PAL0,X      ; PALETTE 0
            STAL  DES0,X
            lda   PAL1,x
            stal  DES1,x
            DEX
            DEX
            BPL   PA0

SCB1        LDA   #$0101      ; PALETTE 1, 320 MODE, NO FILL, NO INTER
            LDX   #$0030      ; 46 LIGNES
:SC1        STAL  $E19D5C,X   ; DEBUT LIGNE 104
            DEX
            DEX
            BPL   :SC1

***********    BRUTAL DELUXE     *****************

            LDX   #$0000
:3          LDA   BRU1,X
            STAL  ECR1,X
            INX
            INX
            CPX   #$0038
            BNE   :3

            LDX   #$0000
:4          LDA   BRU2,X
            STAL  ECR2,X
            INX
            INX
            CPX   #$0038
            BNE   :4

            LDX   #$0000
:5          LDA   BRU3,X
            STAL  ECR3,X
            INX
            INX
            CPX   #$0038
            BNE   :5

            LDX   #$0000
:6          LDA   BRU4,X
            STAL  ECR4,X
            INX
            INX
            CPX   #$0038
            BNE   :6

            LDX   #$0000
:7          LDA   BRU5,X
            STAL  ECR5,X
            INX
            INX
            CPX   #$0038
            BNE   :7

            LDX   #$0000
:8          LDA   BRU6,X
            STAL  ECR6,X
            INX
            INX
            CPX   #$0038
            BNE   :8

            LDX   #$0000
:9          LDA   BRU7,X
            STAL  ECR7,X
            INX
            INX
            CPX   #$0038
            BNE   :9

**************      LOGO      **************

            STZ   PT

            LDY   #$0000
:C1         LDA   C1,Y
            LDX   PT
            STAL  ECR1L,X
            LDA   PT
            CLC               ; PT=PT+#$A0
            ADC   #$A0
            STA   PT
            INY
            INY
            CPY   #$005C
            BNE   :C1

            STZ   PT

            LDY   #$0000
:C2         LDA   C2,Y
            LDX   PT
            STAL  ECR2L,X
            LDA   PT
            CLC               ; PT=PT+#$A0
            ADC   #$A0
            STA   PT
            INY
            INY
            CPY   #$005C
            BNE   :C2

            STZ   PT

            LDY   #$0000
:C3         LDA   C3,Y
            LDX   PT
            STAL  ECR3L,X
            LDA   PT
            CLC               ; PT=PT+#$A0
            ADC   #$A0
            STA   PT
            INY
            INY
            CPY   #$005C
            BNE   :C3

            STZ   PT

            LDY   #$0000
:C4         LDA   C4,Y
            LDX   PT
            STAL  ECR4L,X
            LDA   PT
            CLC               ; PT=PT+#$A0
            ADC   #$A0
            STA   PT
            INY
            INY
            CPY   #$005C
            BNE   :C4

            STZ   PT

            LDY   #$0000
:C5         LDA   C5,Y
            LDX   PT
            STAL  ECR5L,X
            LDA   PT
            CLC               ; PT=PT+#$A0
            ADC   #$A0
            STA   PT
            INY
            INY
            CPY   #$005C
            BNE   :C5

            STZ   PT

            LDY   #$0000
:C6         LDA   C6,Y
            LDX   PT
            STAL  ECR6L,X
            LDA   PT
            CLC               ; PT=PT+#$A0
            ADC   #$A0
            STA   PT
            INY
            INY
            CPY   #$005C
            BNE   :C6

            STZ   PT

            LDY   #$0000
:C7         LDA   C7,Y
            LDX   PT
            STAL  ECR7L,X
            LDA   PT
            CLC               ; PT=PT+#$A0
            ADC   #$00A0
            STA   PT
            INY
            INY
            CPY   #$005C
            BNE   :C7

            STZ   PT

            LDY   #$0000
:C8         LDA   C8,Y
            LDX   PT
            STAL  ECR8L,X
            LDA   PT
            CLC               ; PT=PT+#$A0
            ADC   #$00A0
            STA   PT
            INY
            INY
            CPY   #$005C
            BNE   :C8

            STZ   PT

            LDY   #$0000
:C9         LDA   C9,Y
            LDX   PT
            STAL  ECR9L,X
            LDA   PT
            CLC               ; PT=PT+#$A0
            ADC   #$00A0
            STA   PT
            INY
            INY
            CPY   #$005C
            BNE   :C9
            rts

*****************************************************

PT          ds    1
PAL0        HEX   00000000000000000000000000006409960BB90D000069069B09BD0BDF0D0000
PAL1        HEX   00002200FF0FDD0D9909460424020002DB0FB90D960D640B4409440222046906

BRU1        HEX   BBBBBBB0000000000000000000000000000000000000000000BBB00000000BBBBBB0000000000000BBB00000000000000000000000000000
BRU2        HEX   CC0000CC00000000000000000000000CC000000000000000000CC00000000CC000CC0000000000000CC00000000000000000000000000000
BRU3        HEX   DD0000DD00DDDDDDD000DD0000DD00DDDDDDDD000DDDDDD0000DD00000000DD000DD000DDDDDD0000DD00DD0000DD00DD000DD000DDDDDD0
BRU4        HEX   EEEEEEE000EE0000EE00EE0000EE000EE0000000000000EE000EE00000000EE000EE00EE0000EE000EE00EE0000EE000EE0EE000EE0000EE
BRU5        HEX   7700007700770000000077000077000770000000077777770007700000000770007700777777770007700770000770000777000077777777
BRU6        HEX   8800008800880000000088000088000880008800880000880008800000000880008800880000000008800880000880008808800088000000
BRU7        HEX   9999999000990000000009999999000099999000099999990009900000000999999000099999990009900099999990099000990009999999

C1          HEX   000000000000000000000000000000000000000000000000000000000000000000000000000000000EE0EA8ACCBA77ECEE7EECE70BC70CBE0ECB00EC
            HEX   0000000000000000000000000000000000000000000000000000000000000000
C2          HEX   00000016016D06DF1D0D65D6D565556A55D955B95FB955B95FBA55B95FBA5FFA5FB95FBA5FBB5BFB5FBBBBBBABCCAACCAAAABAAACA99EAA99AA9BCBA
            HEX   0CCB0EEC0EEE0ECE0ECC07BB07CB00EB007C007E000700000000000000000000
C3          HEX   16D5D5FFFF5FD66D65CB5A92A9889898998999999999A9A99A9AA9A9AAAAAAAA99999888BBBBE777CCE7BBAAE777E3EEA999BCCC9AAA888888889999
            HEX   AAAABAAACBBBECBBEEBABEB9BEB9BEB9BECACECAEECB7ECC07EC000E00000000
C4          HEX   F4F4FF4F5F5FDD66AABC229A28899898898999999999A9A99A9AA9A9AAAAAABB99888222AA987ECB777CABCC77EC3CEBABBBCBBA9889889A89BC9ACB
            HEX   ABC9BCECCEEEAABC999A99999BBCBCE7CBA9BABCAAAAAAAABAAACBAAECBB07EC
C5          HEX   F4F44F4F5F5F6666E6ECBCBAAAA99A989A999A999A99AAA9ABAAABA9ACAACCCB9A988A829C98BEBBEEECCBCCA22AA88AA88AA88A999AA99AA8899229
            HEX   A22ABAAB7777EEEEBCCBAAAACCCB77EE8888CCCCBBBAAAAAAAAAAAAABBBBCCCC
C6          HEX   F4F54FFF5F5F6DDDBAAB922288289898898999999999A9A99A9AA9A9AAAABAAA899922889AABCE777777CBAAE777EC3EBBA9ABCC99999888A9888B99
            HEX   8CAACCBAECCBBBCCBBBCAABBAAABEB9A999ABA9AA99BA9ACAABCABCEBCE0E700
C7          HEX   D610F5D65FFD66DFC56D9A5689A5989A899999999999A9A99A9AA9A9AAAAAAAA9999889ABBBB77EBECCBABBB77ECE3EC99AABBCAAAA988898899999A
            HEX   AAABAABCBBCEBCEEBEECBEBBBEBBBEBBCEBCCECECEE7CE70E700000000000000
C8          HEX   000010006100D600FD10D56065D06550D550B550BF50B550BF50B550BF50FF50BF50FB50BF50FB50BF50BBBACBAACAACAAAEAAB79AC7AAEEAA9BBCBC
            HEX   CC00EE00EE00CE00CE00B700C700E00070007000000000000000000000000000
C9          HEX   00000000000000000000000000000000000000000000000000000000000000000000000000000000EE008AE0BCC0E7707EE0ECE0CB00BC00CE00E000
            HEX   0000000000000000000000000000000000000000000000000000000000000000

