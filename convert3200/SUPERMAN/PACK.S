
              LST   OFF
              ORG   $1000

              CLC
              XCE                   ; 8 BIT
              SEP   #$30

              LDA   #$41
              STA   $C029
              STZ   $C035
              LDA   #$A1
              STA   $C029

              CLC
              XCE                   ; 16 BIT
              REP   #$30


************ UNPACKED PACKBYTES

UNPACK        STZ   UNPACKINDEX     ; INIT
              LDX   #$0000
UNPACKBEGIN   LDAL  $040000,X
              PHX                   ; SAUV
              TAY
              AND   #$003F          ; REPET
              STA   UNPACKREPET
              TYA                   ; CODE
              AND   #$00C0          ; TEL QUEL
              BEQ   UNPACK10
              CMP   #$0040          ; 3,5,6,7
              BEQ   UNPACK20
              CMP   #$0080          ; REPET NEXT
              BEQ   UNPACK30
              BRA   UNPACK40        ; REPET 4 NEXT

UNPACK10      INC   UNPACKREPET
              PLX
              INX                   ; SAUTE L'OCTET CODE
              LDY   #$0000
UNPACK11      LDAL  $040000,X       ; RECOPIE DANS LE BUFFER
              STA   UNPACKBUFFER,Y
              INX
              INY
              CPY   UNPACKREPET
              BNE   UNPACK11
              PHX
              LDY   #$0000          ; RECOPIE VERS L'IMAGE
              LDX   UNPACKINDEX
UNPACK12      LDA   UNPACKBUFFER,Y
              STAL  $050000,X
              INX
              INY
              CPY   UNPACKREPET
              BNE   UNPACK12
              STX   UNPACKINDEX
              BRA   UNPACKFIN

UNPACK20      LDX   UNPACKINDEX     ; REPETE L'OCTET SUIVANT
              TYA
              XBA
              LDY   UNPACKREPET
UNPACK21      STAL  $050000,X       ; ZONE DECOMPRE
              INX
              DEY
              BPL   UNPACK21
              STX   UNPACKINDEX
              PLX
              INX
              INX
              PHX
              BRA   UNPACKFIN

UNPACK30      INX                   ; REPET LES 4 SUIVANTS
              LDAL  $040000,X
              STA   UNPACK31+1      ; 1 ET 2
              LDAL  $040002,X
              STA   UNPACK32+1      ; 3 ET 4
              LDX   UNPACKINDEX
              LDY   UNPACKREPET
UNPACK31      LDA   #$A0A0
              STAL  $050000,X
UNPACK32      LDA   #$A0A0
              STAL  $050002,X
              INX
              INX
              INX
              INX
              DEY
              BPL   UNPACK31
              STX   UNPACKINDEX
              PLA                   ; INDICE IMAGE COMP
              CLC
              ADC   #$0005
              PHA
              BRA   UNPACKFIN

UNPACK40      TYA                   ; REPET 4*LE SUIVANT
              AND   #$FF00
              STA   UNPACK41+1
              XBA
UNPACK41      ORA   #$0A0A
              LDX   UNPACKINDEX
              LDY   UNPACKREPET
UNPACK42      STAL  $050000,X
              STAL  $050002,X
              INX
              INX
              INX
              INX
              DEY
              BPL   UNPACK42
              STX   UNPACKINDEX
              PLX                   ; INDICE IMAGE COMP
              INX
              INX
              PHX
***********

UNPACKFIN     LDX   UNPACKINDEX     ; FIN DE TRAITEMENT CODE
              CPX   #$8000
              BCS   UNPACKFINI      ; BPL
              NOP                   ; FADE OUT
              PLX
              JMP   UNPACKBEGIN
UNPACKFINI    PLA
              CLC
              XCE
              SEP   #$30
              RTS

UNPACKINDEX   HEX   0000            ;
UNPACKREPET   HEX   0000            ; FACTEUR DE REPETITION
UNPACKBUFFER  DS    66

*******************************

