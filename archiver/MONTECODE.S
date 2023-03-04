*
* Archiver GS
*
* (c) 1992, Apple Computer, Inc.
* (s) 2023, Antoine Vignau
*

	mx	%00
	rel
	lst	off

*-----------------------------------

	use	MONTECODE.X
	
	use	4/SANE.Macs
	use	4/Util.Macs
	
*-----------------------------------

GSOS2       EQU   $E100B0

*-----------------------------------

L070000     ENT
            PHD
            TSC
            CLC
            ADC   #$FFFC
            TCS
            TCD
            PEA   $0001
            LDAL  L050B1C
            PHA
            LDAL  L050B1A
            PHA
            JSL   L03AA55
            PLY
            PLY
            PLD
            RTL

L07001D     ENT
            PHD
            TSC
            CLC
            ADC   #$FEF8
            TCS
            ADC   #$0019
            TCD
            PEA   $0000
            TDC
            CLC
            ADC   #$FFE7
            PHA
            PEI   $F6
            PEI   $F4
            PEA   $0100
            JSL   L03B108
            LDAL  L050038
            TAX
            LDAL  L050036
            STA   $E7
            STX   $E9
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFE7
            STAL  L050036
            TXA
            STAL  L050038
            PHY
            PEA   $00A5
            PEA   ^L050026
            PEA   L050026
            PEI   $FA
            PEI   $F8
            JSL   L03AA67
            PLA
            STA   $FC
            LDA   $E7
            LDX   $E9
            STAL  L050036
            TXA
            STAL  L050038
            LDA   $F2
            STA   $FA
            LDA   $F1
            STA   $F9
            LDA   $EF
            TCD
            TSC
            CLC
            ADC   #$0112
            TCS
            RTL

L07008E     PHD
            TSC
            CLC
            ADC   #$FEE0
            TCS
            ADC   #$0029
            TCD
            LDA   L0600A6
            LDX   L0600A8
            STA   $D7
            STX   $D9
            LDA   #$0006
            STA   [$D7]
            LDA   #L05081E
            LDX   #^L05081E
            LDY   #$0002
            STA   [$D7],Y
            INY
            INY
            TXA
            STA   [$D7],Y
            LDA   #L0507D8
            LDX   #^L0507D8
            LDY   #$0006
            STA   [$D7],Y
            INY
            INY
            TXA
            STA   [$D7],Y
            LDA   L0600A6
            LDX   L0600A8
            PHX
            PHA
            PEA   $2008
            JSL   GSOS2
            STAL  L0612ED
            LDAL  L0612ED
            BNE   L07013D
            PEA   ^L05047C
            PEA   L05047C
            PEA   $0000
            TDC
            CLC
            ADC   #$FFD7
            PHA
            PEA   ^L0507DA
            PEA   L0507DA
            JSL   L0399E0
            PEA   $0100
            JSL   L03B108
            LDA   #$00FF
            ANDL  L05047C
            SEC
            SBC   #$000F
            BEQ   L070128
            BVS   L070113
            EOR   #$8000
L070113     BPL   L070128
            PEA   ^L050B4C
            PEA   L050B4C
            PEA   ^L05047C
            PEA   L05047C
            PEA   $0010
            JSL   L03AAE2
L070128     PEA   ^L050AB1
            PEA   L050AB1
            PEA   ^L05047C
            PEA   L05047C
            PEA   $0029
            JSL   L03B108
            BRA   L070150
L07013D     PEA   ^L050AB1
            PEA   L050AB1
            PEA   ^L050B4E
            PEA   L050B4E
            PEA   $000A
            JSL   L03B108
L070150     LDA   #$0020
            CMP   L06008E
            BNE   L0701CC
            LDA   #$0001
            STA   $E1
            LDA   L0600C6
            STA   $DD
            LDA   L06008E
            STA   $DF
            LDA   #L050992
            LDX   #^L050992
            STA   $E3
            STX   $E5
            LDA   #L050168
            LDX   #^L050168
            STA   $ED
            STX   $EF
            TDC
            CLC
            ADC   #$00DB
            PEA   $0000
            PHA
            LDA   L0600DC
            PHA
            LDA   L0600D8
            LDX   L0600DA
            STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHA
            JSL   L035931
            LDX   #$0000
            LDA   $DB
            BNE   L0701A7
            INX
L0701A7     PHX
            LDX   #$0000
            LDA   $E1
            DEC
            DEC
            BNE   L0701B2
            INX
L0701B2     TXA
            AND   $01,S
            PLX
            LSR
            BCC   L0701CC
            PEA   ^L050AB1
            PEA   L050AB1
            PEA   ^L050B58
            PEA   L050B58
            PEA   $000E
            JSL   L03B108
L0701CC     TSC
            CLC
            ADC   #$0120
            TCS
            PLD
            RTL

L0701D4     PHD
            TSC
            CLC
            ADC   #$FDDC
            TCS
            ADC   #$012F
            TCD
            LDA   $FA
            STA   $DB
            LDA   L0600C6
            STA   $D7
            LDA   L06008E
            STA   $D9
            LDA   #L050992
            LDX   #^L050992
            STA   $DD
            STX   $DF
            LDA   #L050168
            LDX   #^L050168
            STA   $E7
            STX   $E9
            TDC
            CLC
            ADC   #$00D5
            PEA   $0000
            PHA
            LDA   L0600DC
            PHA
            LDA   L0600D8
            LDX   L0600DA
            STA   $F1
            STX   $F3
            LDY   #$0002
            LDA   [$F1],Y
            TAX
            LDA   [$F1]
            PHA
            JSL   L035931
            LDA   $D5
            STA   $ED
            LDA   #$7FFF
            AND   $ED
            BEQ   L070247
            PHY
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEI   $ED
            JSL   L03B358
            PLA
            STA   L06006C
            BRL   L0705DA
L070247     LDA   $DB
            BPL   L07024E
            BRL   L0705DA
L07024E     CMP   #$0003
            BMI   L070256
            BRL   L0705DA
L070256     SEC
            SBC   #$0000
            BEQ   L070265
            DEC
            BEQ   L070268
            DEC
            BEQ   L070268
            BRL   L0705DA
L070265     BRL   L0705DA
L070268     LDA   L0600C6
            BEQ   L070285
            PHY
            PHY
            LDA   #$2000
            CLC
            ADC   L060014
            PHA
            LDA   L0600C6
            PHA
            JSL   L03B352
            PLA
            STA   $D1
            PLX
            STX   $D3
L070285     LDA   $DB
            DEC
            BEQ   L07028D
            BRL   L070316
L07028D     STZ   L0600D6
            LDA   L0600C6
            BNE   L0702AA
            PEA   ^L050840
            PEA   L050840
            PEA   ^L050B66
            PEA   L050B66
            PEA   $0019
            JSL   L03B108
            BRA   L0702F7
L0702AA     LDA   #$0004
            AND   L060092
            BNE   L0702C7
            PEA   ^L050840
            PEA   L050840
            PEA   ^L050B7F
            PEA   L050B7F
            PEA   $0019
            JSL   L03B108
            BRA   L0702F7
L0702C7     LDA   #$0020
            CMP   L06008E
            BNE   L0702E4
            PEA   ^L050840
            PEA   L050840
            PEA   ^L050B98
            PEA   L050B98
            PEA   $001A
            JSL   L03B108
            BRA   L0702F7
L0702E4     PEA   ^L050840
            PEA   L050840
            PEA   ^L050BB2
            PEA   L050BB2
            PEA   $001A
            JSL   L03B108
L0702F7     LDAL  L050BCC
            SEP   #$20
            STAL  L050378
            REP   #$20
            LDAL  L050BCD
            SEP   #$20
            STAL  L050969
            REP   #$20
            JSL   L07008E
            BRL   L070584
L070316     LDA   #$0001
            STA   L0600D6
            PEA   ^L050840
            PEA   L050840
            PEA   ^L050992
            PEA   L050992
            PEA   $0029
            JSL   L03B108
            LDA   $E1
            STA   L060038
            LDA   L060038
            BEQ   L07035C
            PEA   ^L050378
            PEA   L050378
            PEA   $0000
            TDC
            CLC
            ADC   #$FED1
            PHA
            LDA   L060038
            PHA
            PEA   $0005
            JSL   L03985B
            PEA   $0009
            JSL   L03B108
            BRA   L07036F
L07035C     PEA   ^L050378
            PEA   L050378
            PEA   ^L050BCE
            PEA   L050BCE
            PEA   $0009
            JSL   L03B108
L07036F     LDA   #$0020
            CMP   L06008E
            BNE   L07038C
            PEA   ^L050AB1
            PEA   L050AB1
            PEA   ^L050BD7
            PEA   L050BD7
            PEA   $000E
            JSL   L03B108
            BRA   L07039F
L07038C     PEA   ^L050AB1
            PEA   L050AB1
            PEA   ^L050BE5
            PEA   L050BE5
            PEA   $000E
            JSL   L03B108
L07039F     LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B165
            LDA   L0612C9
            LDX   L0612CB
            PHX
            PHA
            JSL   L03B17F
            LDA   #$8000
            AND   $EB
            BNE   L0703C3
            STZ   L06001E
            BRA   L0703C9
L0703C3     LDA   #$0001
            STA   L06001E
L0703C9     LDA   #$0004
            AND   $EB
            BEQ   L0703D3
            BRL   L0704D3
L0703D3     LDA   #$0001
            STA   L060008
            LDA   $E3
            LDX   $E5
            STA   L060082
            STX   L060084
            PEA   ^L050969
            PEA   L050969
            PEA   $0000
            TDC
            CLC
            ADC   #$FED1
            PHA
            LDA   L060082
            LDX   L060084
            PHX
            PHA
            JSL   L0398EF
            PEA   ^L050BF3
            PEA   L050BF3
            PEA   $0000
            TDC
            CLC
            ADC   #$FFD1
            PHA
            PEA   $0002
            JSL   L03A8DC
            PEA   $0029
            JSL   L03B108
            LDA   L0600C8
            BEQ   L070426
            LDA   L0600C8
            STA   L0600CC
L070426     STZ   L0600C8
            LDA   #$14B2
            LDX   #$0000
            PHX
            PHA
            LDA   L06004C
            LDX   L06004E
            PHX
            PHA
            JSL   L03B208
            LDA   #$02AD
            LDX   #$0000
            PHX
            PHA
            LDA   L060068
            LDX   L06006A
            PHX
            PHA
            JSL   L03B208
            PHY
            LDA   L06004C
            LDX   L06004E
            PHX
            PHA
            JSL   L03A481
            PLA
            AND   #$DFFF
            PHA
            LDA   L06004C
            LDX   L06004E
            PHX
            PHA
            JSL   L03A47B
            LDA   #L05067C
            STAL  L050026
            LDA   #^L05067C
            STAL  L050028
            PEA   $04A6
            JSL   L039EA9
            LDA   #$00FF
            ANDL  L05067C
            BEQ   L0704CA
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B165
            LDA   #L060582
            LDX   #^L060582
            STA   L0612D1
            STX   L0612D3
            LDA   L0612C9
            LDX   L0612CB
            PHX
            PHA
            JSL   L03B17F
            LDA   L0612D1
            LDX   L0612D3
            PHX
            PHA
            PEA   $F000
            LDA   L0612C5
            PHA
            LDA   L0612C7
            PHA
            JSL   L03A5ED
            BRA   L0704D0
L0704CA     STZ   L0612D1
            STZ   L0612D3
L0704D0     BRL   L070584
L0704D3     LDA   #$0002
            STA   L060008
            LDA   L0600CC
            STA   L0600C8
            LDA   $E3
            LDX   $E5
            STA   L060082
            STX   L060084
            PEA   ^L050969
            PEA   L050969
            PEA   $0000
            TDC
            CLC
            ADC   #$FED1
            PHA
            LDA   L060082
            LDX   L060084
            PHX
            PHA
            PEA   $0000
            PEA   $0002
            JSL   L03A3B4
            PLY
            PLY
            PLY
            PLY
            PHX
            PHA
            JSL   L0398EF
            PEA   ^L050BFA
            PEA   L050BFA
            PEA   $0000
            TDC
            CLC
            ADC   #$FFD1
            PHA
            PEA   $0002
            JSL   L03A8DC
            PEA   $0029
            JSL   L03B108
            LDA   #$02A1
            LDX   #$0000
            PHX
            PHA
            LDA   L060068
            LDX   L06006A
            PHX
            PHA
            JSL   L03B208
            LDA   #$04A2
            LDX   #$0000
            PHX
            PHA
            LDA   L06004C
            LDX   L06004E
            PHX
            PHA
            JSL   L03B208
            PHY
            LDA   L06004C
            LDX   L06004E
            PHX
            PHA
            JSL   L03A481
            PLA
            ORA   #$2000
            PHA
            LDA   L06004C
            LDX   L06004E
            PHX
            PHA
            JSL   L03A47B
            LDA   L0600C8
            BNE   L070580
            JSL   L0705EC
L070580     JSL   L070D25
L070584     LDA   #L050840
            STAL  L050042
            LDA   #^L050840
            STAL  L050044
            LDA   #L050378
            STAL  L050046
            LDA   #^L050378
            STAL  L050048
            LDA   #L050969
            STAL  L05004A
            LDA   #^L050969
            STAL  L05004C
            LDA   #L050AB1
            STAL  L05003E
            LDA   #^L050AB1
            STAL  L050040
            PEA   $1586
            JSL   L039EA9
            PEA   $0496
            JSL   L039EA9
            PEA   $0497
            JSL   L039EA9
            PEA   $0453
            JSL   L039EA9
            BRA   L0705DA
L0705DA     LDA   $F8
            STA   $FA
            LDA   $F7
            STA   $F9
            LDA   $F5
            TCD
            TSC
            CLC
            ADC   #$0228
            TCS
            RTL

L0705EC     PHD
            TSC
            CLC
            ADC   #$FECA
            TCS
            ADC   #$003F
            TCD
            LDA   L0600C8
            STA   L0600C2
            LDA   #$0022
            STAL  L0507D8
            JSL   L03ABBC
L070608     STZ   $F1
            LDA   #L05004E
            LDX   #^L05004E
            STA   L0600AE
            STX   L0600B0
            LDA   L0600C8
            INC
            STA   L0600C8
            LDA   L0600AE
            LDX   L0600B0
            STA   $C5
            STX   $C7
            LDA   #$0008
            STA   [$C5]
            LDA   L0600C8
            LDY   #$0002
            STA   [$C5],Y
            LDA   #L0507D8
            LDX   #^L0507D8
            LDY   #$0004
            STA   [$C5],Y
            INY
            INY
            TXA
            STA   [$C5],Y
            LDA   L0600AE
            LDX   L0600B0
            PHX
            PHA
            PEA   $202C
            JSL   GSOS2
            STAL  L0612ED
            PEA   ^L0507FC
            PEA   L0507FC
            PEA   ^L0507DA
            PEA   L0507DA
            PEA   $0022
            JSL   L03B108
            LDA   L0600AE
            LDX   L0600B0
            CLC
            ADC   #$0014
            BCC   L070677
            INX
L070677     STA   $F3
            STX   $F5
            LDA   [$F3]
            STA   L0612D9
            LDA   L0600AE
            LDX   L0600B0
            CLC
            ADC   #$000A
            BCC   L07068D
            INX
L07068D     STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            STA   L06002E
            STX   L060030
            LDA   #$0011
            CMPL  L0612ED
            BNE   L0706AB
            STZ   L0600C8
L0706AB     LDX   #$0000
            LDAL  L0612ED
            BNE   L0706B5
            INX
L0706B5     PHX
            LDA   L0600AE
            LDX   L0600B0
            CLC
            ADC   #$0008
            BCC   L0706C3
            INX
L0706C3     STA   $F3
            STX   $F5
            LDA   #$0080
            AND   [$F3]
            BEQ   L0706D1
            LDA   #$0001
L0706D1     AND   $01,S
            PLX
            LSR
            BCS   L0706DA
            BRL   L070608
L0706DA     LDA   L0600A6
            LDX   L0600A8
            STA   $C1
            STX   $C3
            LDA   #$0006
            STA   [$C1]
            LDA   #L0507FC
            LDX   #^L0507FC
            LDY   #$0002
            STA   [$C1],Y
            INY
            INY
            TXA
            STA   [$C1],Y
            LDA   #L0507D8
            LDX   #^L0507D8
            LDY   #$0006
            STA   [$C1],Y
            INY
            INY
            TXA
            STA   [$C1],Y
            LDA   L0600A6
            LDX   L0600A8
            PHX
            PHA
            PEA   $2008
            JSL   GSOS2
            STAL  L0612ED
            LDAL  L0612ED
            BNE   L070727
            LDA   #$0001
            STA   $F1
L070727     LDX   #$0000
            LDA   $F1
            DEC
            BNE   L070730
            INX
L070730     PHX
            LDX   #$0000
            LDA   $F1
            BNE   L070739
            INX
L070739     PHX
            LDX   #$0000
            LDA   L0600C8
            CMP   L0600C2
            BNE   L070746
            INX
L070746     TXA
            AND   $01,S
            PLX
            ORA   $01,S
            PLX
            LSR
            BCS   L070753
            BRL   L070608
L070753     LDA   $F1
            DEC
            BEQ   L07075B
            BRL   L070876
L07075B     LDA   L0600C8
            STA   L0600C2
            PEA   ^L05009E
            PEA   L05009E
            PEA   $0000
            TDC
            CLC
            ADC   #$FFC1
            PHA
            PEA   ^L0507DA
            PEA   L0507DA
            JSL   L0399E0
            PEA   $0029
            JSL   L03B108
            LDA   #$00FF
            ANDL  L05009E
            TAX
            LDA   #$00FF
            ANDL  L05009E,X
            AND   #$00FF
            CMP   #$003A
            BNE   L0707AB
            LDA   #$00FF
            ANDL  L05009E
            AND   #$00FF
            DEC
            SEP   #$20
            STAL  L05009E
            REP   #$20
L0707AB     LDA   L0600A6
            LDX   L0600A8
            CLC
            ADC   #$0012
            BCC   L0707B8
            INX
L0707B8     STA   $F3
            STX   $F5
            LDA   [$F3]
            STA   L060032
            LDA   L0600A6
            LDX   L0600A8
            CLC
            ADC   #$0014
            BCC   L0707CE
            INX
L0707CE     STA   $F3
            STX   $F5
            LDA   [$F3]
            STA   $C9
            LDA   $C9
            SEC
            SBC   #$0200
            BVS   L0707E1
            EOR   #$8000
L0707E1     BMI   L07081F
            LDA   L0600A6
            LDX   L0600A8
            CLC
            ADC   #$000A
            BCC   L0707F0
            INX
L0707F0     STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHX
            PHA
            PEA   $0200
            PEI   $C9
            JSL   L03A181
            PLX
            PLX
            JSL   L03A5FF
            PHX
            PHA
            JSL   L03A3B4
            PLY
            PLY
            PLY
            PLY
            STA   L06002A
            STX   L06002C
            BRA   L070855
L07081F     LDA   L0600A6
            LDX   L0600A8
            CLC
            ADC   #$000A
            BCC   L07082C
            INX
L07082C     STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHX
            PHA
            PEI   $C9
            PEA   $0200
            JSL   L03A181
            PLX
            PLX
            JSL   L03A5FF
            JSL   L03ABC2
            PLA
            STA   L06002A
            PLA
            STA   L06002C
L070855     LDA   L0600A6
            LDX   L0600A8
            CLC
            ADC   #$000E
            BCC   L070862
            INX
L070862     STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            STA   L060026
            STX   L060028
            BRA   L07088C
L070876     STZ   L0600C8
            PEA   ^L05009E
            PEA   L05009E
            PEA   ^L050BFD
            PEA   L050BFD
            PEA   $000C
            JSL   L03B108
L07088C     LDA   L0600C8
            STA   L0600CC
            JSL   L03B396
            TSC
            CLC
            ADC   #$0136
            TCS
            PLD
            RTL

L07089E     PHD
            TSC
            CLC
            ADC   #$FEEE
            TCS
            ADC   #$001B
            TCD
            LDA   L0600C6
            STA   L0600C2
            LDA   #$0022
            STAL  L0507D8
            LDA   #L05004E
            LDX   #^L05004E
            STA   L0600AE
            STX   L0600B0
            LDA   #L05004E
            LDX   #^L05004E
            STA   L0600AA
            STX   L0600AC
            PHY
            PHY
            JSL   L03B226
            PLA
            STA   $E9
            PLX
            STX   $EB
            LDA   L06001A
            LDX   L06001C
            CMP   $E9
            BNE   L0708E6
            CPX   $EB
L0708E6     BEQ   L0708EC
            JSL   L03ABBC
L0708EC     STZ   $F1
            LDA   L0600C6
            INC
            STA   L0600C6
            LDA   L0600AE
            LDX   L0600B0
            STA   $E5
            STX   $E7
            LDA   #$0008
            STA   [$E5]
            LDA   L0600C6
            LDY   #$0002
            STA   [$E5],Y
            LDA   #L0507D8
            LDX   #^L0507D8
            LDY   #$0004
            STA   [$E5],Y
            INY
            INY
            TXA
            STA   [$E5],Y
            LDA   L0600AE
            LDX   L0600B0
            PHX
            PHA
            PEA   $202C
            JSL   GSOS2
            STAL  L0612ED
            PEA   ^L05081E
            PEA   L05081E
            PEA   ^L0507DA
            PEA   L0507DA
            PEA   $0022
            JSL   L03B108
            LDA   L0600AE
            LDX   L0600B0
            CLC
            ADC   #$0014
            BCC   L07094F
            INX
L07094F     STA   $F3
            STX   $F5
            LDA   [$F3]
            STA   L06008E
            LDA   L0600AE
            LDX   L0600B0
            CLC
            ADC   #$000A
            BCC   L070965
            INX
L070965     STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            STA   L06008A
            STX   L06008C
            LDA   L0600AE
            LDX   L0600B0
            CLC
            ADC   #$0008
            BCC   L070984
            INX
L070984     STA   $F3
            STX   $F5
            LDA   [$F3]
            STA   L060092
            LDA   L06008E
            ASL
            TAX
            LDAL  L0600E0,X
            STA   L060090
            LDA   #$0011
            CMPL  L0612ED
            BNE   L0709A5
            STZ   L0600C6
L0709A5     LDX   #$0000
            LDAL  L0612ED
            BNE   L0709AF
            INX
L0709AF     PHX
            LDA   L06008E
            SEC
            SBCL  L060122
            BEQ   L0709C6
            BVS   L0709BF
            EOR   #$8000
L0709BF     BPL   L0709C6
            LDA   #$0000
            BRA   L0709C9
L0709C6     LDA   #$0001
L0709C9     AND   $01,S
            PLX
            PHA
            LDA   L060090
            BEQ   L0709D5
            LDA   #$0001
L0709D5     AND   $01,S
            PLX
            LSR
            BCC   L0709E0
            LDA   #$0001
            STA   $F1
L0709E0     LDX   #$0000
            LDA   $F1
            DEC
            BNE   L0709E9
            INX
L0709E9     PHX
            LDX   #$0000
            LDA   $F1
            BNE   L0709F2
            INX
L0709F2     PHX
            LDX   #$0000
            LDA   L0600C6
            CMP   L0600C2
            BNE   L0709FF
            INX
L0709FF     TXA
            AND   $01,S
            PLX
            ORA   $01,S
            PLX
            LSR
            BCS   L070A0C
            BRL   L0708EC
L070A0C     LDA   $F1
            DEC
            BNE   L070A86
            PEA   ^L050A0D
            PEA   L050A0D
            PEA   $0000
            TDC
            CLC
            ADC   #$FFE5
            PHA
            PEA   ^L05081E
            PEA   L05081E
            JSL   L0399E0
            PEA   $0029
            JSL   L03B108
            PEA   ^L06006E
            PEA   L06006E
            PEA   ^L060086
            PEA   L060086
            LDA   L0600C6
            PHA
            LDA   L0600D8
            LDX   L0600DA
            STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHA
            JSL   L031FA9
            LDA   L06006E
            BEQ   L070A60
            LDA   #$0001
L070A60     PHA
            LDX   #$0000
            LDA   L060086
            ORA   L060088
            BNE   L070A6D
            INX
L070A6D     TXA
            ORA   $01,S
            PLX
            LSR
            BCC   L070A80
            LDA   #$0320
            LDX   #$0000
            STA   L060086
            STX   L060088
L070A80     JSL   L07008E
            BRA   L070AA8
L070A86     STZ   L0600C6
            PEA   ^L050A0D
            PEA   L050A0D
            PEA   ^L050C09
            PEA   L050C09
            PEA   $000C
            JSL   L03B108
            LDAL  L050C15
            SEP   #$20
            STAL  L050AB1
            REP   #$20
L070AA8     LDA   L0600C6
            STA   L0600CA
            LDA   L06001A
            LDX   L06001C
            CMP   $E9
            BNE   L070ABA
            CPX   $EB
L070ABA     BEQ   L070AC4
            PEI   $EB
            PEI   $E9
            JSL   L03ABB6
L070AC4     TSC
            CLC
            ADC   #$0112
            TCS
            PLD
            RTL

L070ACC     PHD
            TSC
            CLC
            ADC   #$FFFC
            TCS
            TCD
            PHY
            PHY
            LDA   L0612DB
            LDX   L0612DD
            PHX
            PHA
            PHY
            PHY
            PEA   $0000
            PEA   $1FE9
            JSL   L03A8AE
            JSL   L03A1A0
            PLA
            STA   L0612DB
            PLA
            STA   L0612DD
            PHY
            PHY
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $03E7
            PEA   ^L039A84
            PEA   L039A84
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $03E7
            PEA   $800E
            JSL   L03A627
            PLA
            STA   L0612BD
            PLA
            STA   L0612BF
            PLY
            PLY
            PLD
            RTL

L070B2C     PHD
            TSC
            CLC
            ADC   #$FFF4
            TCS
            TCD
            PHY
            PHY
            LDA   L0612DB
            LDX   L0612DD
            PHX
            PHA
            PHY
            PHY
            PEA   $0000
            PEA   $1FE9
            JSL   L03A8AE
            JSL   L03A1A0
            PLA
            STA   L0612DB
            PLA
            STA   L0612DD
            PHY
            PHY
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $000C
            PEA   ^L039A84
            PEA   L039A84
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $000C
            PEA   $800E
            JSL   L03A627
            PLA
            STA   L0612BD
            PLA
            STA   L0612BF
            LDA   #$04C8
            LDX   #$0000
            STA   $05
            STX   $07
L070B92     PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEI   $07
            PEI   $05
            JSL   L03B1DE
            PLA
            PLX
            STA   $09
            STX   $0B
            LDY   #$0002
            LDA   [$09],Y
            TAX
            LDA   [$09]
            STA   $01
            STX   $03
            PHY
            PHY
            LDA   L060002
            LDX   L060004
            PHX
            PHA
            LDY   #$0022
            LDA   [$01],Y
            PHA
            DEY
            DEY
            LDA   [$01],Y
            PHA
            JSL   L03A1A0
            PLA
            PLX
            STX   $09
            ORA   $09
            BEQ   L070BDF
            LDA   #$0001
            LDY   #$0012
            STA   [$01],Y
L070BDF     LDA   $05
            LDX   $07
            CMP   #$04CE
            BNE   L070BEB
            CPX   #$0000
L070BEB     BEQ   L070BF5
            INC   $05
            BNE   L070BF3
            INC   $07
L070BF3     BRA   L070B92
L070BF5     TSC
            CLC
            ADC   #$000C
            TCS
            PLD
            RTL

L070BFD     PHD
            TSC
            CLC
            ADC   #$FEFC
            TCS
            ADC   #$0011
            TCD
            PEA   $0000
            TDC
            CLC
            ADC   #$FFEF
            PHA
            PEI   $FA
            PEI   $F8
            PEA   $0100
            JSL   L03B108
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFEF
            STAL  L05002E
            TXA
            STAL  L050030
            PHY
            PHY
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L039A84
            PEA   L039A84
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0005
            PEA   $800E
            JSL   L03A627
            PLA
            STA   L0612BD
            PLA
            STA   L0612BF
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B390
            LDA   $F6
            STA   $FA
            LDA   $F5
            STA   $F9
            LDA   $F3
            TCD
            TSC
            CLC
            ADC   #$010A
            TCS
            RTL

L070C7D     PHD
            TSC
            CLC
            ADC   #$FFFC
            TCS
            TCD
            JSL   L03ABBC
            JSL   L07089E
            LDA   #L050A0D
            STAL  L050032
            LDA   #^L050A0D
            STAL  L050034
            LDA   #L050AB1
            STAL  L05003E
            LDA   #^L050AB1
            STAL  L050040
            PEA   $1584
            JSL   L039EA9
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B165
            LDA   L0612CD
            LDX   L0612CF
            PHX
            PHA
            JSL   L03B17F
            LDA   L0600C6
            BEQ   L070D17
            LDA   L06008E
            ASL
            ASL
            TAX
            LDAL  L0604DE+2,X
            PHA
            LDAL  L0604DE,X
            PLX
            STA   L0612D5
            STX   L0612D7
            LDA   L0612D5
            ORA   L0612D7
            BEQ   L070D02
            LDA   L0612D5
            LDX   L0612D7
            PHX
            PHA
            PEA   $F000
            LDA   L0612C1
            PHA
            LDA   L0612C3
            PHA
            JSL   L03A5ED
L070D02     LDA   #$0020
            CMP   L06008E
            BNE   L070D12
            LDA   #$0200
            STA   L060014
            BRA   L070D15
L070D12     STZ   L060014
L070D15     BRA   L070D1D
L070D17     STZ   L0612D5
            STZ   L0612D7
L070D1D     JSL   L03B396
            PLY
            PLY
            PLD
            RTL

L070D25     PHD
            TSC
            CLC
            ADC   #$FFFC
            TCS
            TCD
            LDA   #L05009E
            STAL  L050026
            LDA   #^L05009E
            STAL  L050028
            PEA   $04A6
            JSL   L039EA9
            LDA   L0600C8
            BEQ   L070D96
            LDA   L0612D9
            ASL
            ASL
            TAX
            LDAL  L06045A+2,X
            PHA
            LDAL  L06045A,X
            PLX
            STA   L0612D1
            STX   L0612D3
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B165
            LDA   L0612C9
            LDX   L0612CB
            PHX
            PHA
            JSL   L03B17F
            LDA   L0612D1
            ORA   L0612D3
            BEQ   L070D94
            LDA   L0612D1
            LDX   L0612D3
            PHX
            PHA
            PEA   $F000
            LDA   L0612C5
            PHA
            LDA   L0612C7
            PHA
            JSL   L03A5ED
L070D94     BRA   L070D9C
L070D96     STZ   L0612D1
            STZ   L0612D3
L070D9C     PLY
            PLY
            PLD
            RTL

L070DA0     PHD
            TSC
            CLC
            ADC   #$FEDA
            TCS
            ADC   #$002F
            TCD
            LDA   #$0001
            STA   $FC
            LDA   L060006
            DEC
            BPL   L070DB9
            BRL   L07122D
L070DB9     CMP   #$0003
            BMI   L070DC1
            BRL   L07122D
L070DC1     SEC
            SBC   #$0000
            BNE   L070DCA
            BRL   L071073
L070DCA     DEC
            BNE   L070DD0
            BRL   L071073
L070DD0     DEC
            BEQ   L070DD6
            BRL   L07122D
L070DD6     LDA   L0600D6
            EOR   #$0001
            AND   #$00FF
            PHA
            LDA   L060038
            SEC
            SBC   #$0001
            BEQ   L070DF0
            BVS   L070DEE
            EOR   #$8000
L070DEE     BMI   L070DF5
L070DF0     LDA   #$0000
            BRA   L070DF8
L070DF5     LDA   #$0001
L070DF8     AND   L0600D6
            ORA   $01,S
            PLX
            LSR
            BCC   L070E35
            LDA   L0600C6
            BNE   L070E1C
            PHY
            PEA   $0000
            PEA   $0002
            PEA   ^L050C16
            PEA   L050C16
            JSL   L07001D
            PLA
            STA   $ED
            BRA   L070E30
L070E1C     PHY
            PEA   $0000
            PEA   $0002
            PEA   ^L050C47
            PEA   L050C47
            JSL   L07001D
            PLA
            STA   $ED
L070E30     STZ   $FC
            BRL   L07122D
L070E35     LDX   #$0000
            LDA   L060008
            DEC
            BNE   L070E3F
            INX
L070E3F     PHX
            LDX   #$0000
            LDAL  L050269
            BNE   L070E4A
            INX
L070E4A     TXA
            AND   $01,S
            PLX
            LSR
            BCC   L070E6A
            PHY
            PEA   $0000
            PEA   $0002
            PEA   ^L050C8E
            PEA   L050C8E
            JSL   L07001D
            PLA
            STA   $ED
            STZ   $FC
            BRL   L07122D
L070E6A     LDA   L06001E
            BNE   L070E88
            PHY
            PEA   $0000
            PEA   $0002
            PEA   ^L050CDC
            PEA   L050CDC
            JSL   L07001D
            PLA
            STA   $ED
            STZ   $FC
            BRL   L07122D
L070E88     LDX   #$0000
            LDA   L060008
            DEC
            BNE   L070E92
            INX
L070E92     PHX
            LDX   #$0000
            LDA   L0600C6
            BNE   L070E9C
            INX
L070E9C     TXA
            AND   $01,S
            PLX
            LSR
            BCS   L070EA6
            BRL   L070F92
L070EA6     LDA   #L05004E
            LDX   #^L05004E
            STA   $E9
            STX   $EB
            LDA   $E9
            LDX   $EB
            STA   $DD
            STX   $DF
            LDA   #$0003
            STA   [$DD]
            LDA   #L050168
            LDX   #^L050168
            LDY   #$0004
            STA   [$DD],Y
            INY
            INY
            TXA
            STA   [$DD],Y
            LDA   #$0001
            LDY   #$0008
            STA   [$DD],Y
            PEI   $EB
            PEI   $E9
            PEA   $2010
            JSL   GSOS2
            STAL  L0612ED
            LDAL  L0612ED
            BEQ   L070F05
            PHY
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDAL  L0612ED
            PHA
            JSL   L03B358
            PLA
            STA   $ED
            STZ   $FC
            BRL   L07122D
L070F05     LDY   #$0002
            LDA   [$E9],Y
            STA   $EF
            LDA   #L05004E
            LDX   #^L05004E
            STA   $E1
            STX   $E3
            LDA   $E1
            LDX   $E3
            STA   $D9
            STX   $DB
            LDA   #$0002
            STA   [$D9]
            LDA   #L050269
            LDX   #^L050269
            LDY   #$0002
            STA   [$D9],Y
            INY
            INY
            TXA
            STA   [$D9],Y
            PEI   $E3
            PEI   $E1
            PEA   $2038
            JSL   GSOS2
            STAL  L0612ED
            LDAL  L0612ED
            STA   $F1
            LDA   #L05004E
            LDX   #^L05004E
            STA   $E5
            STX   $E7
            LDA   $E5
            LDX   $E7
            STA   $D5
            STX   $D7
            LDA   #$0001
            STA   [$D5]
            LDA   $EF
            LDY   #$0002
            STA   [$D5],Y
            PEI   $E7
            PEI   $E5
            PEA   $2014
            JSL   GSOS2
            STAL  L0612ED
            LDA   $F1
            BNE   L070F92
            PHY
            PEA   $0000
            PEA   $0002
            PEA   ^L050D23
            PEA   L050D23
            JSL   L07001D
            PLA
            STA   $ED
            STZ   $FC
            BRL   L07122D
L070F92     LDX   #$0000
            LDA   L060008
            DEC
            DEC
            BNE   L070F9D
            INX
L070F9D     PHX
            LDA   L060082
            LDX   L060084
            PHX
            PHA
            LDA   L06002E
            LDX   L060030
            JSL   L03AA18
            BEQ   L070FB9
            BVS   L070FB7
            EOR   #$8000
L070FB7     BMI   L070FBE
L070FB9     LDA   #$0000
            BRA   L070FC1
L070FBE     LDA   #$0001
L070FC1     AND   $01,S
            PLX
            LSR
            BCC   L070FE0
            PHY
            PEA   $0000
            PEA   $0002
            PEA   ^L050D86
            PEA   L050D86
            JSL   L07001D
            PLA
            STA   $ED
            STZ   $FC
            BRL   L07122D
L070FE0     LDX   #$0000
            LDA   L060008
            DEC
            DEC
            BNE   L070FEB
            INX
L070FEB     PHX
            LDX   #$0000
            LDA   L0600C6
            BNE   L070FF5
            INX
L070FF5     TXA
            AND   $01,S
            PLX
            LSR
            BCC   L071070
            PEA   ^L05047C
            PEA   L05047C
            PEA   $0000
            TDC
            CLC
            ADC   #$FFD1
            PHA
            PEA   ^L050168
            PEA   L050168
            JSL   L0399E0
            PEA   $0100
            JSL   L03B108
            LDA   #$0002
            STA   $F1
L071021     LDA   $F1
            INC
            STA   $F1
            LDX   $F1
            LDA   #$00FF
            ANDL  L05047C,X
            AND   #$00FF
            CMP   #$003A
            BNE   L071021
            LDA   $F1
            DEC
            SEP   #$20
            STAL  L05047C
            REP   #$20
            PHA
            PEA   ^L05047C
            PEA   L05047C
            PEA   ^L05009E
            PEA   L05009E
            JSL   L03A487
            PLA
            LSR
            BCC   L071070
            PHY
            PEA   $0000
            PEA   $0002
            PEA   ^L050DCB
            PEA   L050DCB
            JSL   L07001D
            PLA
            STA   $ED
            STZ   $FC
            BRL   L07122D
L071070     BRL   L07122D
L071073     LDX   #$0000
            LDA   L060006
            DEC
            BNE   L07107D
            INX
L07107D     PHX
            LDX   #$0000
            LDA   #$000D
            CMP   L060032
            BNE   L07108A
            INX
L07108A     TXA
            AND   $01,S
            PLX
            LSR
            BCC   L0710AA
            PHY
            PEA   $0000
            PEA   $0002
            PEA   ^L050E11
            PEA   L050E11
            JSL   L07001D
            PLA
            STA   $ED
            STZ   $FC
            BRL   L07122D
L0710AA     LDX   #$0000
            LDA   L060006
            DEC
            BNE   L0710B4
            INX
L0710B4     PHX
            LDX   #$0000
            LDA   L0600C6
            BNE   L0710BE
            INX
L0710BE     TXA
            AND   $01,S
            PLX
            LSR
            BCC   L071139
            PEA   ^L05047C
            PEA   L05047C
            PEA   $0000
            TDC
            CLC
            ADC   #$FFD1
            PHA
            PEA   ^L050168
            PEA   L050168
            JSL   L0399E0
            PEA   $0100
            JSL   L03B108
            LDA   #$0002
            STA   $F1
L0710EA     LDA   $F1
            INC
            STA   $F1
            LDX   $F1
            LDA   #$00FF
            ANDL  L05047C,X
            AND   #$00FF
            CMP   #$003A
            BNE   L0710EA
            LDA   $F1
            DEC
            SEP   #$20
            STAL  L05047C
            REP   #$20
            PHA
            PEA   ^L05047C
            PEA   L05047C
            PEA   ^L05009E
            PEA   L05009E
            JSL   L03A487
            PLA
            LSR
            BCC   L071139
            PHY
            PEA   $0000
            PEA   $0002
            PEA   ^L050E5C
            PEA   L050E5C
            JSL   L07001D
            PLA
            STA   $ED
            STZ   $FC
            BRL   L07122D
L071139     LDA   L0600C6
            BNE   L071141
            BRL   L07122B
L071141     LDA   #$0004
            AND   L060092
            BEQ   L07114C
            BRL   L07122B
L07114C     LDA   #$0022
            STAL  L0507D8
            LDA   L0600A6
            LDX   L0600A8
            STA   $D1
            STX   $D3
            LDA   #$0006
            STA   [$D1]
            LDA   #L05081E
            LDX   #^L05081E
            LDY   #$0002
            STA   [$D1],Y
            INY
            INY
            TXA
            STA   [$D1],Y
            LDA   #L0507D8
            LDX   #^L0507D8
            LDY   #$0006
            STA   [$D1],Y
            INY
            INY
            TXA
            STA   [$D1],Y
            LDA   L0600A6
            LDX   L0600A8
            PHX
            PHA
            PEA   $2008
            JSL   GSOS2
            STAL  L0612ED
            PEA   ^L05047C
            PEA   L05047C
            PEA   $0000
            TDC
            CLC
            ADC   #$FFD1
            PHA
            PEA   ^L0507DA
            PEA   L0507DA
            JSL   L0399E0
            PEA   $0100
            JSL   L03B108
            LDX   #$0000
            LDAL  L0612ED
            BNE   L0711BF
            INX
L0711BF     PHX
            PHA
            PEA   ^L05047C
            PEA   L05047C
            PEA   ^L050425
            PEA   L050425
            JSL   L03A487
            PLA
            STA   $F3
            PLA
            AND   $F3
            BEQ   L0711F1
            PHY
            PEA   $0000
            PEA   $0002
            PEA   ^L050E96
            PEA   L050E96
            JSL   L07001D
            PLA
            STA   $ED
            STZ   $ED
            BRA   L071225
L0711F1     LDA   L0600C8
            CMP   L0600C6
            BNE   L071211
            PHY
            PEA   $0000
            PEA   $0002
            PEA   ^L050F03
            PEA   L050F03
            JSL   L07001D
            PLA
            STA   $ED
            STZ   $ED
            BRA   L071225
L071211     PHY
            PEA   $0000
            PEA   $0004
            PEA   ^L050F85
            PEA   L050F85
            JSL   L07001D
            PLA
            STA   $ED
L071225     LDA   $ED
            BNE   L07122B
            STZ   $FC
L07122B     BRA   L07122D
L07122D     TSC
            CLC
            ADC   #$0126
            TCS
            PLD
            RTL

L071235     PHD
            TSC
            CLC
            ADC   #$FFF2
            TCS
            TCD
            LDA   $14
            SEC
            SBC   #$0136
            STA   $09
            LDA   $09
            ASL
            ASL
            TAX
            LDAL  L061224,X
            PHA
            LDAL  L061222,X
            PLX
            STA   $01
            STX   $03
            LDA   #$0000
            STAL  L0601BE
            LDA   $09
            ASL
            TAX
            LDAL  L061242,X
            STAL  L0601C0
            LDA   $09
            ASL
            ASL
            TAX
            LDAL  L06124C,X
            PHA
            LDAL  L06124A,X
            PLX
            STAL  L0601C2
            TXA
            STAL  L0601C4
            LDX   #$0000
            LDA   #$0136
            CMP   $14
            BNE   L07128E
            INX
L07128E     PHX
            LDX   #$0000
            LDA   #$0138
            CMP   $14
            BNE   L07129A
            INX
L07129A     TXA
            ORA   $01,S
            PLX
            LSR
            BCC   L0712C6
            PEA   $0064
            PEA   $001E
            PEA   $0002
            PEI   $03
            PEI   $01
            PEA   $0000
            PEA   $0000
            PEA   ^L0601BC
            PEA   L0601BC
            PEA   ^L0601C6
            PEA   L0601C6
            JSL   L03B346
            BRA   L0712F7
L0712C6     LDA   $09
            ASL
            ASL
            TAX
            LDAL  L061234,X
            PHA
            LDAL  L061232,X
            PLX
            STA   $05
            STX   $07
            PEA   $0064
            PEA   $001E
            PEA   $0002
            PEI   $03
            PEI   $01
            PEA   $0002
            PEI   $07
            PEI   $05
            PEA   ^L0601C6
            PEA   L0601C6
            JSL   L03A5F9
L0712F7     LDAL  L0601C6
            BEQ   L071355
            JSL   L03ABBC
            PEA   ^L0500C7
            PEA   L0500C7
            PEA   ^L06006E
            PEA   L06006E
            PEI   $09
            PEA   ^L060208
            PEA   L060208
            PEA   ^L05044E
            PEA   L05044E
            LDA   L0600DC
            PHA
            LDA   L0600D8
            LDX   L0600DA
            STA   $0B
            STX   $0D
            LDY   #$0002
            LDA   [$0B],Y
            TAX
            LDA   [$0B]
            PHA
            JSL   L031CE7
            JSL   L03B396
            LDA   L06006E
            BEQ   L071355
            PHY
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   L06006E
            PHA
            JSL   L03B358
            PLA
            STA   L06006C
L071355     LDAL  L0601C6
            STA   $16
            LDA   #$0137
            CMP   $14
            BNE   L07136D
            PEA   $0000
            LDA   L060012
            PHA
            JSL   L03A62D
L07136D     LDA   $12
            STA   $14
            LDA   $11
            STA   $13
            LDA   $0F
            TCD
            TSC
            CLC
            ADC   #$0012
            TCS
            RTL

L07137F     PHD
            TSC
            CLC
            ADC   #$FFAE
            TCS
            TCD
            PHY
            PEA   $0000
            PEA   $0009
            PEA   ^L05101A
            PEA   L05101A
            JSL   L07001D
            PLA
            STA   L06006C
            LDA   L06006C
            BNE   L0713AA
            LDA   #$8010
            STA   L0600C4
            BRL   L0714F5
L0713AA     LDA   L06006C
            DEC
            DEC
            BNE   L071416
            PHY
            PEA   $0136
            JSL   L071235
            PLA
            LSR
            BCS   L0713BF
            BRA   L07141B
L0713BF     JSL   L03B396
            LDA   L06006E
            BNE   L071416
            PHA
            PEA   ^L05009E
            PEA   L05009E
            PEA   ^L05044E
            PEA   L05044E
            JSL   L03A5AB
            PLA
            LSR
            BCC   L0713F4
            PHY
            PEA   $0000
            PEA   $0008
            PEA   ^L05101B
            PEA   L05101B
            JSL   L07001D
            PLA
            STA   L06006C
            BRA   L0713FA
L0713F4     LDA   #$0001
            STA   L06006C
L0713FA     LDA   L06006C
            DEC
            BNE   L071405
            STZ   L06000E
            BRA   L071416
L071405     LDA   #$0001
            STA   L06000E
            LDA   #$0600
            ORA   L0600DC
            PHA
            JSL   L03B1D8
L071416     LDA   L06000E
            BEQ   L071483
L07141B     PEA   ^L051063
            PEA   L051063
            PEA   ^L05009E
            PEA   L05009E
            PEA   ^L051082
            PEA   L051082
            TDC
            CLC
            ADC   #$0001
            PEA   $0000
            PHA
            PEA   $0003
            JSL   L03A8DC
            JSL   L070BFD
            JSL   L03ABBC
            PEA   ^L0500C7
            PEA   L0500C7
            LDA   L0600DC
            PHA
            LDA   L0600D8
            LDX   L0600DA
            STA   $4F
            STX   $51
            LDY   #$0002
            LDA   [$4F],Y
            TAX
            LDA   [$4F]
            PHA
            JSL   L0306C6
            LDAL  L0500C7
            STA   L0600C4
            JSL   L03B396
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B1E4
            STZ   L0612BD
            STZ   L0612BF
L071483     LDAL  L0500C9
            STA   L06009E
            LDAL  L0500CD
            TAX
            LDAL  L0500CB
            STA   L06007A
            STX   L06007C
            LDAL  L0500D3
            STA   L0600A0
            LDAL  L0500D1
            TAX
            LDAL  L0500CF
            STA   L06007E
            STX   L060080
            LDA   L0600C4
            BEQ   L0714F5
            LDA   #$7FFF
            AND   L0600C4
            SEC
            SBC   #$0054
            CMP   #$0001
            SEC
            SBC   #$0000
            BEQ   L0714C9
            BRA   L0714E0
L0714C9     PHY
            PEA   $0000
            PEA   $0002
            PEA   ^L051086
            PEA   L051086
            JSL   L07001D
            PLA
            STA   L06006C
            BRA   L0714F5
L0714E0     PHY
            PEA   $0000
            PEA   $0002
            PEA   ^L0510B5
            PEA   L0510B5
            JSL   L07001D
            PLA
            STA   L06006C
L0714F5     TSC
            CLC
            ADC   #$0052
            TCS
            PLD
            RTL

L0714FD     PHD
            TSC
            CLC
            ADC   #$FDB0
            TCS
            ADC   #$0159
            TCD
            TDC
            CLC
            ADC   #$00C9
            PEA   $0000
            PHA
            PEA   ^L05110C
            PEA   L05110C
            PEA   $000E
            JSL   L03B108
            LDA   L0600A0
            DEC
            BNE   L071537
            TDC
            CLC
            ADC   #$00C9
            PEA   $0000
            PHA
            PEA   $0006
            PEA   $0001
            JSL   L03A96C
L071537     PEA   ^L050ADA
            PEA   L050ADA
            PEA   $0000
            TDC
            CLC
            ADC   #$FEC9
            PHA
            LDA   L0600A0
            PHA
            PEA   $0005
            JSL   L03985B
            TDC
            CLC
            ADC   #$00C9
            PEA   $0000
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$FFC9
            PHA
            PEA   $0002
            JSL   L03A8DC
            PEA   $0029
            JSL   L03B108
            PEA   ^L050B03
            PEA   L050B03
            PEA   $0000
            TDC
            CLC
            ADC   #$FEC9
            PHA
            PHY
            PHY
            PEA   $0000
            TDC
            CLC
            ADC   #$FEB1
            PHA
            LDA   L06007E
            LDX   L060080
            TXY
            LDX   #$FEC5
            STA   $00,X
            TYA
            STA   $02,X
            PEA   $0000
            TDC
            CLC
            ADC   #$FEC5
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$FEBB
            PHA
            PEA   $030E
            _SANEFP816
            PEA   $0000
            TDC
            CLC
            ADC   #$FEBB
            PHA
            PEA   $000A
            JSL   L03B108
            PEA   $0000
            TDC
            CLC
            ADC   #$FEA7
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$FEA7
            PHA
            PEA   ^L05111A
            PEA   L05111A
            PEA   $000A
            JSL   L03B108
            PEA   $0000
            TDC
            CLC
            ADC   #$FEB1
            PHA
            PEA   $0006
            _SANEFP816
            PEA   $0000
            TDC
            CLC
            ADC   #$FEB1
            PHA
            JSL   L03B238
            JSL   L0398EF
            PEA   $0010
            JSL   L03B108
            LDX   #$0000
            LDA   #$0003
            CMP   L060006
            BEQ   L07161C
            INX
L07161C     PHX
            LDA   L0600C6
            BEQ   L071625
            LDA   #$0001
L071625     AND   $01,S
            PLX
            LSR
            BCS   L07162E
            BRL   L07176A
L07162E     PHY
            PHY
            PEA   $0000
            TDC
            CLC
            ADC   #$FFB1
            PHA
            LDA   L06007E
            LDX   L060080
            PHX
            PHA
            LDA   L0600A0
            PEA   $008C
            JSL   L03AA73
            PLA
            LDX   #$0000
            BIT   #$8000
            BEQ   L071655
            DEX
L071655     JSL   L03ADB9
            TXY
            LDX   #$FFC5
            STA   $00,X
            TYA
            STA   $02,X
            PEA   $0000
            TDC
            CLC
            ADC   #$FFC5
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$FFBB
            PHA
            PEA   $030E
            _SANEFP816
            PEA   $0000
            TDC
            CLC
            ADC   #$FFBB
            PHA
            PEA   $000A
            JSL   L03B108
            PEA   $0000
            TDC
            CLC
            ADC   #$FFAD
            PHA
            LDA   L060086
            LDX   L060088
            PEA   $0000
            PEA   $0400
            JSL   L03ABC2
            LDX   #$FFAD
            PLA
            STA   $00,X
            PLA
            STA   $02,X
            PEA   $0000
            TDC
            CLC
            ADC   #$FFB1
            PHA
            PEA   $0306
            _SANEFP816
            PEA   $0000
            TDC
            CLC
            ADC   #$FFB1
            PHA
            JSL   L03A0CE
            PLA
            PLX
            INC
            BNE   L0716D6
            INX
L0716D6     STA   L0600A4
            LDA   #$0020
            CMP   L06008E
            BNE   L0716F9
            TDC
            CLC
            ADC   #$00DE
            PEA   $0000
            PHA
            PEA   ^L051124
            PEA   L051124
            PEA   $000E
            JSL   L03B108
            BRA   L07170F
L0716F9     TDC
            CLC
            ADC   #$00DE
            PEA   $0000
            PHA
            PEA   ^L051132
            PEA   L051132
            PEA   $000E
            JSL   L03B108
L07170F     LDA   L0600A4
            DEC
            BNE   L071728
            TDC
            CLC
            ADC   #$00DE
            PEA   $0000
            PHA
            PEA   $0006
            PEA   $0001
            JSL   L03A96C
L071728     PEA   ^L050A88
            PEA   L050A88
            PEA   ^L051140
            PEA   L051140
            PEA   $0000
            TDC
            CLC
            ADC   #$FEC9
            PHA
            LDA   L0600A4
            PHA
            PEA   $0005
            JSL   L03985B
            TDC
            CLC
            ADC   #$00DE
            PEA   $0000
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$FFC9
            PHA
            PEA   $0003
            JSL   L03A8DC
            PEA   $0029
            JSL   L03B108
            BRA   L071776
L07176A     LDAL  L051149
            SEP   #$20
            STAL  L050A88
            REP   #$20
L071776     PEA   $0446
            JSL   L039EA9
            TSC
            CLC
            ADC   #$0250
            TCS
            PLD
            RTL

L071785     PHD
            TSC
            CLC
            ADC   #$FFFC
            TCS
            TCD
            LDA   #L06040C
            STAL  L050042
            LDA   #^L06040C
            STAL  L050044
            LDA   #L06040C
            STAL  L050046
            LDA   #^L06040C
            STAL  L050048
            LDA   #L06040C
            STAL  L05004A
            LDA   #^L06040C
            STAL  L05004C
            PEA   $0001
            JSL   L0701D4
            LDA   #$0001
            STA   L0600D0
            PLY
            PLY
            PLD
            RTL

L0717C8     PHD
            TSC
            CLC
            ADC   #$FFF2
            TCS
            TCD
            STZ   L06003A
            PHY
            PHY
            LDA   L0612DB
            LDX   L0612DD
            PHX
            PHA
            PHY
            PHY
            PEA   $0000
            PEA   $1FE9
            JSL   L03A8AE
            JSL   L03A1A0
            PLA
            STA   L0612DB
            PLA
            STA   L0612DD
            PHY
            PHY
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L039A84
            PEA   L039A84
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0008
            PEA   $800E
            JSL   L03A627
            PLA
            STA   L0612BD
            PLA
            STA   L0612BF
            LDA   #$0460
            STA   $09
L07182C     LDA   $09
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            TXA
            CLC
            ADC   #L050784
            LDX   #^L050784
            BCC   L071840
            INX
L071840     STA   $0B
            STX   $0D
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            LDA   $09
            JSL   L03A5FF
            PHX
            PHA
            JSL   L03B1DE
            PLA
            STA   [$0B]
            PLA
            LDY   #$0002
            STA   [$0B],Y
            LDA   #$0472
            CMP   $09
            BEQ   L07186E
            INC   $09
            BRA   L07182C
L07186E     PHY
            PHY
            JSL   L03A475
            PLA
            STA   $01
            PLX
            STX   $03
            STZ   $09
L07187C     LDA   #$0467
            CLC
            ADC   $09
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            JSL   L03A46F
            PEA   $0000
            PEA   $0000
            PEA   $0467
            JSL   L03A63F
            LDA   $09
            INC
            DEC
            ASL
            TAX
            LDA   #$0464
            CLC
            ADC   $09
            STAL  L050372,X
            LDA   $09
            ASL
            TAX
            LDA   #$0004
            STAL  L0500D5,X
            LDA   #$0002
            CMP   $09
            BEQ   L0718CA
            INC   $09
            BRA   L07187C
L0718CA     PEI   $03
            PEI   $01
            JSL   L03A46F
            TSC
            CLC
            ADC   #$000E
            TCS
            PLD
            RTL

L0718DA     PHD
            TSC
            CLC
            ADC   #$FFFC
            TCS
            TCD
            LDAL  L050B3A
            DEC
            BNE   L071946
            PEA   $0002
            PEA   ^L060072
            PEA   L060072
            PEA   ^L060022
            PEA   L060022
            PEA   ^L0507D0
            PEA   L0507D0
            PEA   ^L060070
            PEA   L060070
            LDA   L0600D8
            LDX   L0600DA
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            PHA
            JSL   L0313CC
            LDA   L060070
            BNE   L071930
            LDA   #L06040C
            STAL  L050042
            LDA   #^L06040C
            STAL  L050044
            BRA   L07193F
L071930     LDA   L060022
            LDX   L060024
            STAL  L050042
            TXA
            STAL  L050044
L07193F     PEA   $0605
            JSL   L039EA9
L071946     PLY
            PLY
            PLD
            RTL

L07194A     PHD
            TSC
            CLC
            ADC   #$FDF3
            TCS
            ADC   #$0118
            TCD
            PEI   $FA
            PEA   ^L060072
            PEA   L060072
            PEA   ^L060076
            PEA   L060076
            PEA   ^L0507D0
            PEA   L0507D0
            PEA   ^L060070
            PEA   L060070
            LDA   L0600D8
            LDX   L0600DA
            STA   $F1
            STX   $F3
            LDY   #$0002
            LDA   [$F1],Y
            TAX
            LDA   [$F1]
            PHA
            JSL   L0313CC
            LDA   L060072
            BEQ   L0719B2
            LDAL  L05114A
            SEP   #$20
            STAL  L050940
            REP   #$20
            LDAL  L05114B
            SEP   #$20
            STAL  L050A5F
            REP   #$20
            LDAL  L05114C
            SEP   #$20
            STAL  L050A36
            REP   #$20
            BRL   L071AAB
L0719B2     LDA   $FA
            DEC
            BEQ   L0719BA
            BRL   L071A68
L0719BA     LDA   L060070
            PHA
            TDC
            CLC
            ADC   #$00ED
            PEA   $0000
            PHA
            PEA   $0004
            JSL   L03AA0C
            SEP   #$20
            LDA   #$04
            STA   $EC
            REP   #$20
            TDC
            CLC
            ADC   #$00E8
            PEA   $0000
            PHA
            LDA   L060070
            PHA
            LDA   L0600D8
            LDX   L0600DA
            STA   $F1
            STX   $F3
            LDY   #$0002
            LDA   [$F1],Y
            TAX
            LDA   [$F1]
            PHA
            JSL   L03291B
            PEA   ^L050A5F
            PEA   L050A5F
            PEI   $EA
            PEI   $E8
            PEA   ^L05114D
            PEA   L05114D
            TDC
            CLC
            ADC   #$00EC
            PEA   $0000
            PHA
            PEA   ^L051151
            PEA   L051151
            PEA   $0000
            TDC
            CLC
            ADC   #$FFE8
            PHA
            PEA   $0004
            JSL   L03A8DC
            PEA   $0029
            JSL   L03B108
            PEA   ^L050A36
            PEA   L050A36
            PEA   ^L051153
            PEA   L051153
            PEA   $0000
            TDC
            CLC
            ADC   #$FEE8
            PHA
            PEA   ^L0507D0
            PEA   L0507D0
            JSL   L0396ED
            PEA   $0000
            TDC
            CLC
            ADC   #$FFE8
            PHA
            PEA   $0002
            JSL   L03A8DC
            PEA   $0029
            JSL   L03B108
            BRA   L071AAB
L071A68     PEA   ^L050A5F
            PEA   L050A5F
            PEA   $0000
            TDC
            CLC
            ADC   #$FEE8
            PHA
            LDA   L060070
            PHA
            PEA   $0005
            JSL   L03985B
            PEA   ^L051160
            PEA   L051160
            PEA   $0000
            TDC
            CLC
            ADC   #$FFE8
            PHA
            PEA   $0002
            JSL   L03A8DC
            PEA   $0029
            JSL   L03B108
            LDAL  L051167
            SEP   #$20
            STAL  L050A36
            REP   #$20
L071AAB     LDA   L060072
            BNE   L071AEA
            PEA   ^L050940
            PEA   L050940
            PEA   $0000
            TDC
            CLC
            ADC   #$FEE8
            PHA
            LDA   L060076
            LDX   L060078
            PHX
            PHA
            JSL   L0398EF
            PEA   ^L051168
            PEA   L051168
            PEA   $0000
            TDC
            CLC
            ADC   #$FFE8
            PHA
            PEA   $0002
            JSL   L03A8DC
            PEA   $0029
            JSL   L03B108
            BRA   L071AF6
L071AEA     LDAL  L05116F
            SEP   #$20
            STAL  L050940
            REP   #$20
L071AF6     LDA   #L050940
            STAL  L05003E
            LDA   #^L050940
            STAL  L050040
            LDA   #L050A5F
            STAL  L050042
            LDA   #^L050A5F
            STAL  L050044
            LDA   #L050A36
            STAL  L050046
            LDA   #^L050A36
            STAL  L050048
            PEA   $0270
            JSL   L039EA9
            LDA   $F8
            STA   $FA
            LDA   $F7
            STA   $F9
            LDA   $F5
            TCD
            TSC
            CLC
            ADC   #$0211
            TCS
            RTL

L071B39     PHD
            TSC
            CLC
            ADC   #$FDD6
            TCS
            ADC   #$0133
            TCD
            PEA   ^L050B13
            PEA   L050B13
            PEA   $0000
            TDC
            CLC
            ADC   #$FEEF
            PHA
            LDA   L06009E
            PHA
            PEA   $0005
            JSL   L03985B
            PEA   $0007
            JSL   L03B108
            LDA   L060006
            DEC
            DEC
            BEQ   L071B6F
            BRL   L071C24
L071B6F     PEA   ^L050969
            PEA   L050969
            PEA   $0000
            TDC
            CLC
            ADC   #$FEEF
            PHA
            PHY
            PHY
            PEA   $0000
            TDC
            CLC
            ADC   #$FED7
            PHA
            LDA   L06007A
            LDX   L06007C
            TXY
            LDX   #$FEEB
            STA   $00,X
            TYA
            STA   $02,X
            PEA   $0000
            TDC
            CLC
            ADC   #$FEEB
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$FEE1
            PHA
            PEA   $030E
            _SANEFP816
            PEA   $0000
            TDC
            CLC
            ADC   #$FEE1
            PHA
            PEA   $000A
            JSL   L03B108
            PEA   $0000
            TDC
            CLC
            ADC   #$FECD
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$FECD
            PHA
            PEA   ^L051170
            PEA   L051170
            PEA   $000A
            JSL   L03B108
            PEA   $0000
            TDC
            CLC
            ADC   #$FED7
            PHA
            PEA   $0006
            _SANEFP816
            PEA   $0000
            TDC
            CLC
            ADC   #$FED7
            PHA
            JSL   L03B238
            JSL   L0398EF
            PEA   ^L05117A
            PEA   L05117A
            PEA   $0000
            TDC
            CLC
            ADC   #$FFEF
            PHA
            PEA   $0002
            JSL   L03A8DC
            PEA   $0029
            JSL   L03B108
L071C24     LDA   #$0003
            CMP   L060006
            BNE   L071C9C
            LDA   #L050840
            STAL  L050026
            LDA   #^L050840
            STAL  L050028
            LDA   #L050A0D
            STAL  L05002E
            LDA   #^L050A0D
            STAL  L050030
            LDA   L060008
            DEC
            DEC
            BNE   L071C5F
            LDA   #L05009E
            STAL  L05004A
            LDA   #^L05009E
            STAL  L05004C
            BRA   L071C9A
L071C5F     PEA   ^L05067C
            PEA   L05067C
            PEA   $0000
            TDC
            CLC
            ADC   #$FEEF
            PHA
            PEA   ^L050269
            PEA   L050269
            JSL   L0399E0
            PEA   $0100
            JSL   L03B108
            PEA   $01C2
            PEA   ^L05067C
            PEA   L05067C
            JSL   L039F3E
            LDA   #L05067C
            STAL  L05004A
            LDA   #^L05067C
            STAL  L05004C
L071C9A     BRA   L071D08
L071C9C     LDA   #L05009E
            STAL  L050026
            LDA   #^L05009E
            STAL  L050028
            LDA   #L050B13
            STAL  L05002E
            LDA   #^L050B13
            STAL  L050030
            LDA   L0600C6
            BEQ   L071CCD
            LDA   #L050A0D
            STAL  L05004A
            LDA   #^L050A0D
            STAL  L05004C
            BRA   L071D08
L071CCD     PEA   ^L05057C
            PEA   L05057C
            PEA   $0000
            TDC
            CLC
            ADC   #$FEEF
            PHA
            PEA   ^L050168
            PEA   L050168
            JSL   L0399E0
            PEA   $0100
            JSL   L03B108
            PEA   $01C2
            PEA   ^L05057C
            PEA   L05057C
            JSL   L039F3E
            LDA   #L05057C
            STAL  L05004A
            LDA   #^L05057C
            STAL  L05004C
L071D08     LDA   #L050969
            STAL  L05002A
            LDA   #^L050969
            STAL  L05002C
            LDA   #L050940
            STAL  L05003E
            LDA   #^L050940
            STAL  L050040
            LDA   #L050A5F
            STAL  L050042
            LDA   #^L050A5F
            STAL  L050044
            LDA   #L050A36
            STAL  L050046
            LDA   #^L050A36
            STAL  L050048
            LDA   #L050ADA
            STAL  L050032
            LDA   #^L050ADA
            STAL  L050034
            LDA   #L050B03
            STAL  L050036
            LDA   #^L050B03
            STAL  L050038
            LDA   #L050A88
            STAL  L05003A
            LDA   #^L050A88
            STAL  L05003C
            LDAL  L051182
            SEP   #$20
            STAL  L050940
            REP   #$20
            LDAL  L051183
            SEP   #$20
            STAL  L050A5F
            REP   #$20
            LDAL  L051184
            SEP   #$20
            STAL  L050A36
            REP   #$20
            PHY
            PHY
            LDA   L0612DB
            LDX   L0612DD
            PHX
            PHA
            PEA   $0000
            PEA   $1FE9
            JSL   L03A39B
            PLA
            STA   L0612DB
            PLA
            STA   L0612DD
            PHY
            PHY
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0006
            PEA   ^L039A84
            PEA   L039A84
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0006
            PEA   $800E
            JSL   L03A627
            PLA
            STA   L0612BD
            PLA
            STA   L0612BF
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B165
            LDA   #$0003
            CMP   L060006
            BNE   L071E3E
            LDA   #$0274
            LDX   #$0000
            PHX
            PHA
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $0273
            JSL   L03B1DE
            JSL   L03B208
            PEA   $0273
            JSL   L039E39
            LDA   #$02AF
            LDX   #$0000
            PHX
            PHA
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $0443
            JSL   L03B1DE
            JSL   L03B208
            PEA   $0443
            JSL   L039E39
L071E3E     JSL   L0714FD
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $0440
            JSL   L03B1DE
            PLA
            STA   L060060
            PLA
            STA   L060062
            PEA   $0000
            PEA   ^L0600BA
            PEA   L0600BA
            PEA   ^L0600BC
            PEA   L0600BC
            PEA   ^L0600B2
            PEA   L0600B2
            LDA   L0600DC
            PHA
            LDA   L0600D8
            LDX   L0600DA
            STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHA
            JSL   L030E24
            PEA   ^L0321C0
            PEA   L0321C0
            PEA   $0001
            LDA   L0600B2
            LDX   L0600B4
            PHX
            PHA
            PEA   $0000
            LDA   L0600BC
            PHA
            LDA   L060060
            LDX   L060062
            PHX
            PHA
            JSL   L03A5E7
            PEA   ^L06006E
            PEA   L06006E
            LDA   L0600DC
            PHA
            LDA   L0600D8
            LDX   L0600DA
            STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHA
            JSL   L032A71
            LDA   L06006E
            BEQ   L071EED
            PHY
            PEA   $0000
            PEA   $0003
            PEA   ^L051185
            PEA   L051185
            JSL   L07001D
            PLA
            STA   L06006C
L071EED     PEA   $0001
            JSL   L07194A
            TSC
            CLC
            ADC   #$022A
            TCS
            PLD
            RTL

L071EFC     PHD
            TSC
            CLC
            ADC   #$FEEA
            TCS
            ADC   #$001F
            TCD
            LDA   L0600C6
            BNE   L071F58
            PEA   ^L05057C
            PEA   L05057C
            PEA   $0000
            TDC
            CLC
            ADC   #$FFE1
            PHA
            PEA   ^L050168
            PEA   L050168
            JSL   L0399E0
            PEA   $0100
            JSL   L03B108
            LDA   #$0003
            CMP   L060006
            BNE   L071F3B
            LDA   #$00B4
            STA   $E1
            BRA   L071F40
L071F3B     LDA   #$0136
            STA   $E1
L071F40     PEI   $E1
            PEA   ^L05057C
            PEA   L05057C
            JSL   L039F3E
            LDA   #L05057C
            LDX   #^L05057C
            STA   $E3
            STX   $E5
            BRA   L071F62
L071F58     LDA   #L050A0D
            LDX   #^L050A0D
            STA   $E3
            STX   $E5
L071F62     LDA   #$0003
            CMP   L060006
            BEQ   L071F6D
            BRL   L072012
L071F6D     LDA   L060008
            DEC
            DEC
            BNE   L071F84
            LDA   #L05009E
            STAL  L050032
            LDA   #^L05009E
            STAL  L050034
            BRA   L071FBF
L071F84     PEA   ^L05067C
            PEA   L05067C
            PEA   $0000
            TDC
            CLC
            ADC   #$FFE1
            PHA
            PEA   ^L050269
            PEA   L050269
            JSL   L0399E0
            PEA   $0100
            JSL   L03B108
            PEA   $0136
            PEA   ^L05067C
            PEA   L05067C
            JSL   L039F3E
            LDA   #L05067C
            STAL  L050032
            LDA   #^L05067C
            STAL  L050034
L071FBF     LDA   $E3
            LDX   $E5
            STAL  L050026
            TXA
            STAL  L050028
            LDA   #L06040D
            LDX   #^L06040D
            STA   $E7
            STX   $E9
            LDA   L060008
            DEC
            DEC
            BNE   L07200F
            PEA   ^L050B03
            PEA   L050B03
            PEA   $0000
            TDC
            CLC
            ADC   #$FFE1
            PHA
            LDA   L060082
            LDX   L060084
            PHX
            PHA
            PEA   $0000
            PEA   $0002
            JSL   L03A3B4
            PLY
            PLY
            PLY
            PLY
            PHX
            PHA
            JSL   L0398EF
            PEA   $0010
            JSL   L03B108
L07200F     BRL   L0720D9
L072012     LDA   #L05009E
            STAL  L050026
            LDA   #^L05009E
            STAL  L050028
            LDA   $E3
            LDX   $E5
            STAL  L050032
            TXA
            STAL  L050034
            LDA   L060006
            DEC
            BEQ   L072036
            BRL   L0720D5
L072036     LDA   #L060415
            LDX   #^L060415
            STA   $E7
            STX   $E9
            LDA   L06002A
            LDX   L06002C
            PHX
            PHA
            PEA   $0000
            PEA   $0002
            JSL   L03A3B4
            PLY
            PLY
            PLY
            PLY
            STA   L060082
            STX   L060084
            LDA   #$0200
            AND   L060002
            BEQ   L072067
            LDA   #$0001
L072067     PHA
            LDX   #$0000
            LDA   L060032
            DEC
            BNE   L072072
            INX
L072072     PHX
            LDX   #$0000
            LDA   #$0006
            CMP   L060032
            BNE   L07207F
            INX
L07207F     TXA
            ORA   $01,S
            PLX
            AND   $01,S
            PLX
            LSR
            BCC   L0720B1
            LDA   L060082
            LDX   L060084
            PHX
            PHA
            LDA   L060026
            LDX   L060028
            PHX
            PHA
            PEA   $0000
            PEA   $0002
            JSL   L03A3B4
            PLY
            PLY
            PLY
            PLY
            JSL   L03B1AC
            STA   L060082
            STX   L060084
L0720B1     PEA   ^L050B03
            PEA   L050B03
            PEA   $0000
            TDC
            CLC
            ADC   #$FFE1
            PHA
            LDA   L060082
            LDX   L060084
            PHX
            PHA
            JSL   L0398EF
            PEA   $0010
            JSL   L03B108
            BRA   L0720D9
L0720D5     STZ   $E7
            STZ   $E9
L0720D9     PEA   ^L050840
            PEA   L050840
            PEA   ^L050992
            PEA   L050992
            PEA   $0029
            JSL   L03B108
            PEA   $0140
            PHY
            PEI   $E5
            PEI   $E3
            JSL   L03A8A1
            PLA
            STA   $F3
            PLA
            SEC
            SBC   $F3
            PHA
            PEA   ^L050840
            PEA   L050840
            JSL   L039F3E
            LDA   #L050840
            STAL  L050042
            LDA   #^L050840
            STAL  L050044
            LDA   #L050B03
            STAL  L05002E
            LDA   #^L050B03
            STAL  L050030
            LDA   #L06040C
            STAL  L05002A
            LDA   #^L06040C
            STAL  L05002C
            PHY
            PHY
            LDA   L0612DB
            LDX   L0612DD
            PHX
            PHA
            PEA   $0000
            PEA   $1FE9
            JSL   L03A39B
            PLA
            STA   L0612DB
            PLA
            STA   L0612DD
            PHY
            PHY
            PEI   $E9
            PEI   $E7
            PEA   $0000
            PEA   $0009
            PEA   ^L039A84
            PEA   L039A84
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0009
            PEA   $800E
            JSL   L03A627
            PLA
            STA   L0612BD
            PLA
            STA   L0612BF
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B165
            LDA   L060006
            DEC
            BPL   L072195
            BRL   L0722BC
L072195     CMP   #$0003
            BMI   L07219D
            BRL   L0722BC
L07219D     SEC
            SBC   #$0000
            BEQ   L0721AC
            DEC
            BEQ   L0721AC
            DEC
            BEQ   L0721AF
            BRL   L0722BC
L0721AC     BRL   L0722BC
L0721AF     PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $0290
            JSL   L03B1DE
            JSL   L03AA06
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $0480
            JSL   L03B1DE
            JSL   L03AA06
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $0484
            JSL   L03B1DE
            PLA
            STA   $EF
            PLX
            STX   $F1
            LDY   #$0002
            LDA   [$EF],Y
            TAX
            LDA   [$EF]
            STA   $EB
            STX   $ED
            LDA   #$0008
            CLC
            ADC   $EB
            LDX   $ED
            BCC   L072210
            INX
L072210     CLC
            ADC   #$0002
            BCC   L072217
            INX
L072217     STA   $F3
            STX   $F5
            LDA   [$F3]
            PHA
            LDY   #$0008
            LDA   [$EB],Y
            SEC
            SBC   #$0019
            PHA
            PEI   $F1
            PEI   $EF
            JSL   L03AA00
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $0487
            JSL   L03B1DE
            PLA
            STA   $EF
            PLX
            STX   $F1
            LDY   #$0002
            LDA   [$EF],Y
            TAX
            LDA   [$EF]
            STA   $EB
            STX   $ED
            LDA   #$0008
            CLC
            ADC   $EB
            LDX   $ED
            BCC   L072261
            INX
L072261     CLC
            ADC   #$0002
            BCC   L072268
            INX
L072268     STA   $F3
            STX   $F5
            LDA   [$F3]
            PHA
            LDY   #$0008
            LDA   [$EB],Y
            SEC
            SBC   #$0019
            PHA
            PEI   $F1
            PEI   $EF
            JSL   L03AA00
            LDA   #$008D
            LDX   #$0000
            PHX
            PHA
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $0483
            JSL   L03B1DE
            JSL   L03B208
            PEA   $0483
            JSL   L039E39
            PEA   ^L06040D
            PEA   L06040D
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03ADCD
            BRA   L0722BC
L0722BC     TSC
            CLC
            ADC   #$0116
            TCS
            PLD
            RTL

L0722C4     PHD
            TSC
            CLC
            ADC   #$FFD3
            TCS
            TCD
            JSL   L03ABBC
            PEA   ^L0600BA
            PEA   L0600BA
            PEA   ^L0600BE
            PEA   L0600BE
            PEA   ^L0600B6
            PEA   L0600B6
            LDA   L0600DC
            PHA
            LDA   L0600D8
            LDX   L0600DA
            STA   $2A
            STX   $2C
            LDY   #$0002
            LDA   [$2A],Y
            TAX
            LDA   [$2A]
            PHA
            JSL   L032603
            JSL   L03B396
            LDA   L0600BA
            BEQ   L07231F
            PHY
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   L0600BA
            PHA
            JSL   L03B358
            PLA
            STA   L06006C
            BRL   L072455
L07231F     PHY
            PHY
            LDA   L0612DB
            LDX   L0612DD
            PHX
            PHA
            PHY
            PHY
            PEA   $0000
            PEA   $1FE9
            JSL   L03A8AE
            JSL   L03A1A0
            PLA
            STA   L0612DB
            PLA
            STA   L0612DD
            PHY
            PHY
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L039A84
            PEA   L039A84
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $000E
            PEA   $800E
            JSL   L03A627
            PLA
            STA   L0612BD
            PLA
            STA   L0612BF
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B165
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $04E0
            JSL   L03B1DE
            PLA
            STA   L060054
            PLA
            STA   L060056
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $04E3
            JSL   L03B1DE
            PLA
            STA   L060058
            PLA
            STA   L06005A
            LDA   L060058
            LDX   L06005A
            STA   $2A
            STX   $2C
            LDY   #$0002
            LDA   [$2A],Y
            TAX
            LDA   [$2A]
            CLC
            ADC   #$001C
            BCC   L0723D0
            INX
L0723D0     STA   $2A
            STX   $2C
            LDY   #$0002
            LDA   [$2A],Y
            TAX
            LDA   [$2A]
            STA   L06003C
            STX   L06003E
            PEA   ^L032561
            PEA   L032561
            PEA   $0001
            LDA   L0600B6
            LDX   L0600B8
            PHX
            PHA
            PEA   $0000
            LDA   L0600BE
            PHA
            LDA   L060054
            LDX   L060056
            PHX
            PHA
            JSL   L03A5E7
            PEA   ^L0503FC
            PEA   L0503FC
            PEA   ^L060036
            PEA   L060036
            LDA   L0600D8
            LDX   L0600DA
            STA   $2A
            STX   $2C
            LDY   #$0002
            LDA   [$2A],Y
            TAX
            LDA   [$2A]
            PHA
            JSL   L03288D
            PEA   ^L050477
            PEA   L050477
            PEA   ^L0503FC
            PEA   L0503FC
            PEA   $0002
            PEA   $0004
            TDC
            CLC
            ADC   #$0001
            PEA   $0000
            PHA
            JSL   L03A1B9
            PEA   $0005
            JSL   L03B108
            LDA   #$0001
            STA   L0600D4
L072455     LDA   $31
            STA   $35
            LDA   $30
            STA   $34
            LDA   $2E
            TCD
            TSC
            CLC
            ADC   #$0033
            TCS
            RTL

L072467     PHD
            TSC
            CLC
            ADC   #$FEFC
            TCS
            ADC   #$000D
            TCD
            PEA   ^L050B13
            PEA   L050B13
            PEA   $0000
            TDC
            CLC
            ADC   #$FFF3
            PHA
            LDA   L060034
            PHA
            PEA   $0005
            JSL   L03985B
            PEA   $0007
            JSL   L03B108
            LDA   #L05009E
            STAL  L050026
            LDA   #^L05009E
            STAL  L050028
            LDA   #L050B13
            STAL  L05002E
            LDA   #^L050B13
            STAL  L050030
            PHY
            PHY
            LDA   L0612DB
            LDX   L0612DD
            PHX
            PHA
            PEA   $0000
            PEA   $1FE9
            JSL   L03A39B
            PLA
            STA   L0612DB
            PLA
            STA   L0612DD
            PHY
            PHY
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0013
            PEA   ^L039A84
            PEA   L039A84
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0013
            PEA   $800E
            JSL   L03A627
            PLA
            STA   L0612BD
            PLA
            STA   L0612BF
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $0602
            JSL   L03B1DE
            PLA
            STA   L060064
            PLA
            STA   L060066
            PEA   $8000
            PEA   ^L0600BA
            PEA   L0600BA
            PEA   ^L0600BC
            PEA   L0600BC
            PEA   ^L0600B2
            PEA   L0600B2
            LDA   L0600DC
            PHA
            LDA   L0600D8
            LDX   L0600DA
            STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHA
            JSL   L030E24
            PEA   ^L0321C0
            PEA   L0321C0
            PEA   $0001
            LDA   L0600B2
            LDX   L0600B4
            PHX
            PHA
            PEA   $0000
            LDA   L0600BC
            PHA
            LDA   L060064
            LDX   L060066
            PHX
            PHA
            JSL   L03A5E7
            JSL   L0718DA
            TSC
            CLC
            ADC   #$0104
            TCS
            PLD
            RTL

L072579     PHD
            TSC
            CLC
            ADC   #$FF55
            TCS
            TCD
            PHY
            PHY
            LDA   L0612DB
            LDX   L0612DD
            PHX
            PHA
            PHY
            PHY
            PEA   $0000
            PEA   $1FE9
            JSL   L03A8AE
            JSL   L03A1A0
            PLA
            STA   L0612DB
            PLA
            STA   L0612DD
            JSL   L03ABBC
            LDA   #$0001
            STA   L0600D2
            STZ   L060034
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $0487
            JSL   L03B1DE
            JSL   L03A9FA
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $0484
            JSL   L03B1DE
            JSL   L03A9FA
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $048A
            JSL   L03B1DE
            JSL   L03A9FA
            PEA   $00FF
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $0482
            JSL   L03B1DE
            JSL   L03A9F4
            LDA   L060006
            DEC
            BPL   L07261C
            BRL   L0727D1
L07261C     CMP   #$0003
            BMI   L072624
            BRL   L0727D1
L072624     SEC
            SBC   #$0000
            BNE   L07262D
            BRL   L0726C3
L07262D     DEC
            BNE   L072633
            BRL   L0726C3
L072633     DEC
            BEQ   L072639
            BRL   L0727D1
L072639     LDA   L0600C6
            STA   $6B
            LDA   #L050269
            LDX   #^L050269
            STA   $6F
            STX   $71
            LDA   #L050168
            LDX   #^L050168
            STA   $73
            STX   $75
            LDA   L06007E
            LDX   L060080
            STA   $77
            STX   $79
            LDA   L060008
            DEC
            BNE   L07268C
            TDC
            CLC
            ADC   #$0069
            PEA   $0000
            PHA
            LDA   L0600DC
            PHA
            LDA   L0600D8
            LDX   L0600DA
            STA   $A8
            STX   $AA
            LDY   #$0002
            LDA   [$A8],Y
            TAX
            LDA   [$A8]
            PHA
            JSL   L0366AD
            LDA   $69
            STA   $67
            BRA   L0726C0
L07268C     PEA   ^L050168
            PEA   L050168
            PEA   ^L05009E
            PEA   L05009E
            LDA   L0600C6
            PHA
            TDC
            CLC
            ADC   #$0067
            PEA   $0000
            PHA
            LDA   L0600DC
            PHA
            LDA   L0600D8
            LDX   L0600DA
            STA   $A8
            STX   $AA
            LDY   #$0002
            LDA   [$A8],Y
            TAX
            LDA   [$A8]
            PHA
            JSL   L039161
L0726C0     BRL   L0727D1
L0726C3     PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $0480
            JSL   L03B1DE
            PLA
            STA   $A4
            PLX
            STX   $A6
            PEA   $00FF
            PEI   $A6
            PEI   $A4
            JSL   L03A9F4
            LDY   #$0002
            LDA   [$A4],Y
            TAX
            LDA   [$A4]
            CLC
            ADC   #$001C
            BCC   L0726F7
            INX
L0726F7     STA   $A8
            STX   $AA
            LDY   #$0002
            LDA   [$A8],Y
            TAX
            LDA   [$A8]
            STA   $A0
            STX   $A2
            LDY   #$0002
            LDA   [$A0],Y
            TAX
            LDA   [$A0]
            STA   $A8
            STX   $AA
            LDY   #$0002
            LDA   [$A8],Y
            TAX
            LDA   [$A8]
            STA   $9C
            STX   $9E
            LDY   #$0002
            LDA   [$A0],Y
            TAX
            LDA   [$A0]
            CLC
            ADC   #$0004
            BCC   L07272E
            INX
L07272E     STA   $A8
            STX   $AA
            LDA   [$A8]
            STA   $9A
            LDA   L060006
            DEC
            DEC
            BNE   L07277D
            PEA   ^L060034
            PEA   L060034
            PEA   ^L050168
            PEA   L050168
            TDC
            CLC
            ADC   #$0067
            PEA   $0000
            PHA
            PEI   $9A
            PEI   $9E
            PEI   $9C
            LDA   L060092
            PHA
            LDA   L0600C6
            PHA
            LDA   L0600DC
            PHA
            LDA   L0600D8
            LDX   L0600DA
            STA   $A8
            STX   $AA
            LDY   #$0002
            LDA   [$A8],Y
            TAX
            LDA   [$A8]
            PHA
            JSL   L03547E
            BRA   L0727CF
L07277D     LDA   L060026
            LDX   L060028
            PHX
            PHA
            LDA   L06002A
            LDX   L06002C
            PHX
            PHA
            LDA   L060032
            PHA
            PEA   ^L05009E
            PEA   L05009E
            PEA   ^L050168
            PEA   L050168
            TDC
            CLC
            ADC   #$0067
            PEA   $0000
            PHA
            PEI   $9A
            PEI   $9E
            PEI   $9C
            LDA   L060092
            PHA
            LDA   L0600C6
            PHA
            LDA   L0600DC
            PHA
            LDA   L0600D8
            LDX   L0600DA
            STA   $A8
            STX   $AA
            LDY   #$0002
            LDA   [$A8],Y
            TAX
            LDA   [$A8]
            PHA
            JSL   L03861B
L0727CF     BRA   L0727D1
L0727D1     STZ   L0600D2
            JSL   L03B396
            LDX   #$0000
            LDA   $67
            BNE   L0727E0
            INX
L0727E0     PHX
            LDA   L060034
            BEQ   L0727E9
            LDA   #$0001
L0727E9     AND   $01,S
            PLX
            LSR
            BCC   L07282A
            PEA   $4005
            JSL   L03A5E1
            PHY
            PEA   $0000
            PEA   $0008
            PEA   ^L0511D1
            PEA   L0511D1
            JSL   L07001D
            PLA
            STA   L06006C
            LDA   L06006C
            DEC
            BNE   L07282A
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B1E4
            STZ   L0612BD
            STZ   L0612BF
            JSL   L072467
            BRL   L0729F1
L07282A     LDA   $67
            BNE   L072874
            PEA   $4005
            JSL   L03A5E1
            PHY
            PEA   $0000
            PEA   $0005
            PEA   ^L05121B
            PEA   L05121B
            JSL   L07001D
            PLA
            STA   L06006C
            LDA   L06006C
            BNE   L072857
            LDA   #$0001
            STA   L0600CE
            BRA   L072871
L072857     LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B1E4
            STZ   L0612BD
            STZ   L0612BF
            JSL   L074AF9
            JSL   L074538
L072871     BRL   L0729F1
L072874     LDA   #$8000
            AND   $67
            BEQ   L07287E
            BRL   L0729E9
L07287E     PEA   $400C
            JSL   L03A5E1
            LDAL  L0370C6
            BNE   L0728A3
            TDC
            CLC
            ADC   #$007B
            PEA   $0000
            PHA
            PEA   ^L05121C
            PEA   L05121C
            PEA   $0007
            JSL   L03B108
            BRA   L0728B9
L0728A3     TDC
            CLC
            ADC   #$007B
            PEA   $0000
            PHA
            PEA   ^L051223
            PEA   L051223
            PEA   $000C
            JSL   L03B108
L0728B9     LDA   $67
            SEC
            SBC   #$0027
            BPL   L0728C4
            BRL   L0729D5
L0728C4     CMP   #$002E
            BMI   L0728CC
            BRL   L0729D5
L0728CC     SEC
            SBC   #$0000
            BEQ   L072904
            DEC
            BEQ   L07293B
            SEC
            SBC   #$0007
            BEQ   L07293B
            SEC
            SBC   #$0016
            BEQ   L07293B
            DEC
            DEC
            DEC
            BNE   L0728E9
            BRL   L072971
L0728E9     DEC
            BNE   L0728EF
            BRL   L072971
L0728EF     SEC
            SBC   #$0005
            BNE   L0728F8
            BRL   L072988
L0728F8     SEC
            SBC   #$0006
            BNE   L072901
            BRL   L0729BE
L072901     BRL   L0729D5
L072904     PHY
            PEA   $0000
            PEA   $0002
            PEA   ^L05122F
            PEA   L05122F
            TDC
            CLC
            ADC   #$007B
            PEA   $0000
            PHA
            PEA   ^L051262
            PEA   L051262
            TDC
            CLC
            ADC   #$000D
            PEA   $0000
            PHA
            PEA   $0003
            JSL   L03A8DC
            JSL   L07001D
            PLA
            STA   L06006C
            BRL   L0729E9
L07293B     PHY
            PEA   $0000
            PEA   $0002
            PEA   ^L05126B
            PEA   L05126B
            TDC
            CLC
            ADC   #$007B
            PEA   $0000
            PHA
            PEA   ^L05128F
            PEA   L05128F
            TDC
            CLC
            ADC   #$0007
            PEA   $0000
            PHA
            PEA   $0003
            JSL   L03A8DC
            JSL   L07001D
            PLA
            STA   L06006C
            BRA   L0729E9
L072971     PHY
            PEA   $0000
            PEA   $0002
            PEA   ^L0512AD
            PEA   L0512AD
            JSL   L07001D
            PLA
            STA   L06006C
            BRA   L0729E9
L072988     PHY
            PEA   $0000
            PEA   $0002
            PEA   ^L0512F3
            PEA   L0512F3
            TDC
            CLC
            ADC   #$007B
            PEA   $0000
            PHA
            PEA   ^L0512FF
            PEA   L0512FF
            TDC
            CLC
            ADC   #$0001
            PEA   $0000
            PHA
            PEA   $0003
            JSL   L03A8DC
            JSL   L07001D
            PLA
            STA   L06006C
            BRA   L0729E9
L0729BE     PHY
            PEA   $0000
            PEA   $0002
            PEA   ^L05133C
            PEA   L05133C
            JSL   L07001D
            PLA
            STA   L06006C
            BRA   L0729E9
L0729D5     PHY
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEI   $67
            JSL   L03B358
            PLA
            STA   L06006C
L0729E9     JSL   L074AF9
            JSL   L074538
L0729F1     TSC
            CLC
            ADC   #$00AB
            TCS
            PLD
            RTL

L0729F9     PHD
            TSC
            CLC
            ADC   #$FFF2
            TCS
            TCD
            LDA   #$0001
            STA   $05
L072A06     PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            LDA   $05
            DEC
            ASL
            TAX
            LDAL  L050372,X
            JSL   L03A5FF
            PHX
            PHA
            JSL   L03B1DE
            PLA
            STA   $01
            PLX
            STX   $03
            LDA   #$0004
            STA   $07
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            CLC
            ADC   #$0011
            BCC   L072A3D
            INX
L072A3D     STA   $0B
            STX   $0D
            LDA   [$0B]
            AND   #$00FF
            CMP   #$00FF
            BNE   L072A52
            LDA   $05
            STA   $07
            BRL   L072BC1
L072A52     PHY
            LDA   $05
            DEC
            CLC
            ADC   #$0461
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            JSL   L03B1D2
            PLA
            STA   $09
            LDA   $05
            DEC
            ASL
            TAX
            TXA
            CLC
            ADC   #L050162
            LDX   #^L050162
            BCC   L072A82
            INX
L072A82     STA   $0B
            STX   $0D
            LDA   $09
            SEC
            SBC   #$0600
            ASL
            TAX
            LDAL  L061216,X
            STA   [$0B]
            LDA   $09
            SEC
            SBC   #$0600
            BPL   L072A9F
            BRL   L072BB5
L072A9F     CMP   #$0006
            BMI   L072AA7
            BRL   L072BB5
L072AA7     ASL
            TAX
            LDAL  L072AAF,X
            PHA
            RTS

L072AAF     DA    L072AB9+1
            DA    L072AB9+1
            DA    L072AB9+1
            DA    L072B35+1
            DA    L072B61+1
L072AB9     DA    L072B61+1
            LDA   $05
            DEC
            PEA   $0029
            JSL   L03AA73
            PLX
            TXA
            CLC
            ADC   #L0500DB
            LDX   #^L0500DB
            BCC   L072AD1
            INX
L072AD1     PHX
            PHA
            LDA   $05
            DEC
            CLC
            ADC   #$0464
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            LDA   L0600D8
            LDX   L0600DA
            STA   $0B
            STX   $0D
            LDY   #$0002
            LDA   [$0B],Y
            TAX
            LDA   [$0B]
            PHA
            JSL   L031C6A
            LDA   $05
            DEC
            ASL
            ASL
            TAX
            TXA
            CLC
            ADC   #L050156
            LDX   #^L050156
            BCC   L072B13
            INX
L072B13     STA   $0B
            STX   $0D
            LDA   $05
            DEC
            PEA   $0029
            JSL   L03AA73
            PLX
            TXA
            CLC
            ADC   #L0500DB
            LDX   #^L0500DB
            BCC   L072B2D
            INX
L072B2D     STA   [$0B]
            TXA
            LDY   #$0002
            STA   [$0B],Y
L072B35     BRA   L072BB5
            LDA   $05
            DEC
            ASL
            ASL
            TAX
            TXA
            CLC
            ADC   #L050156
            LDX   #^L050156
            BCC   L072B48
            INX
L072B48     STA   $0B
            STX   $0D
            LDA   $05
            DEC
            ASL
            TAX
            LDAL  L0500D5,X
            JSL   L03A5FF
            STA   [$0B]
            TXA
            LDY   #$0002
            STA   [$0B],Y
L072B61     BRA   L072BB5
            LDA   $05
            DEC
            ASL
            ASL
            TAX
            TXA
            CLC
            ADC   #L050156
            LDX   #^L050156
            BCC   L072B74
            INX
L072B74     PHX
            PHA
            LDA   $05
            DEC
            CLC
            ADC   #$046C
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PLX
            STA   $0B
            STX   $0D
            LDY   #$0002
            LDA   [$0B],Y
            TAX
            LDA   [$0B]
            CLC
            ADC   #$0040
            BCC   L072BA1
            INX
L072BA1     PHX
            PHA
            PLA
            PLY
            PLX
            STX   $0B
            PLX
            STX   $0D
            STA   [$0B]
            TYA
            LDY   #$0002
            STA   [$0B],Y
            BRA   L072BB5
L072BB5     LDA   #$0003
            CMP   $05
            BEQ   L072BC1
            INC   $05
            BRL   L072A06
L072BC1     LDA   $07
            SEC
            SBC   #$0004
            BVS   L072BCC
            EOR   #$8000
L072BCC     BMI   L072BE1
            LDA   $07
            DEC
            ASL
            TAX
            LDA   #$0000
            STAL  L050162,X
            LDA   $07
            INC
            STA   $07
            BRA   L072BC1
L072BE1     PHY
            LDAL  L050786
            PHA
            LDAL  L050784
            PHA
            JSL   L03B1D2
            PLA
            CMP   #$060D
            BNE   L072C01
            LDA   #$0001
            ORA   L06003A
            STA   L06003A
            BRA   L072C0A
L072C01     LDA   #$FFFE
            AND   L06003A
            STA   L06003A
L072C0A     PEA   ^L0600A0
            PEA   L0600A0
            PEA   ^L06007E
            PEA   L06007E
            PEA   ^L050156
            PEA   L050156
            PEA   ^L050162
            PEA   L050162
            LDA   L06003A
            PHA
            LDA   L0600D8
            LDX   L0600DA
            STA   $0B
            STX   $0D
            LDY   #$0002
            LDA   [$0B],Y
            TAX
            LDA   [$0B]
            PHA
            JSL   L03172D
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            JSL   L039CC3
            PLA
            STA   L0612BD
            PLA
            STA   L0612BF
            PHY
            PHY
            JSL   L03AA61
            JSL   L03B165
            PEA   $0000
            LDA   L060060
            LDX   L060062
            PHX
            PHA
            JSL   L03ADE5
            PEA   $0440
            JSL   L039E39
            JSL   L0714FD
            TSC
            CLC
            ADC   #$000E
            TCS
            PLD
            RTL

L072C82     PHD
            TSC
            CLC
            ADC   #$FFFA
            TCS
            TCD
            LDA   $0E
            SEC
            SBC   #$0461
            STA   $01
            LDA   $0C
            SEC
            SBC   #$0600
            BPL   L072C9D
            BRL   L072DE3
L072C9D     CMP   #$0006
            BMI   L072CA5
            BRL   L072DE3
L072CA5     ASL
            TAX
            LDAL  L072CAD,X
            PHA
            RTS

L072CAD     DA    L072CB7+1
            DA    L072CB7+1
            DA    L072CB7+1
            DA    L072D1A+2
            DA    L072D7E+1
L072CB7     DA    L072D7E+1
            LDA   #$0467
            CLC
            ADC   $01
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            JSL   L03AA06
            LDA   #$046C
            CLC
            ADC   $01
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            JSL   L03AA06
            LDA   #$0464
            CLC
            ADC   $01
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            JSL   L03A9FA
            LDA   $01
            INC
            DEC
            ASL
            TAX
            LDA   #$0464
            CLC
            ADC   $01
            STAL  L050372,X
L072D1A     BRL   L072DE3
            LDA   #$0464
            CLC
            ADC   $01
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            JSL   L03AA06
            LDA   #$046C
            CLC
            ADC   $01
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            JSL   L03AA06
            LDA   #$0467
            CLC
            ADC   $01
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            JSL   L03A9FA
            LDA   $01
            INC
            DEC
            ASL
            TAX
            LDA   #$0467
            CLC
            ADC   $01
            STAL  L050372,X
L072D7E     BRA   L072DE3
            LDA   #$0464
            CLC
            ADC   $01
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            JSL   L03AA06
            LDA   #$0467
            CLC
            ADC   $01
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            JSL   L03AA06
            LDA   #$046C
            CLC
            ADC   $01
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            JSL   L03A9FA
            LDA   $01
            INC
            DEC
            ASL
            TAX
            LDA   #$046C
            CLC
            ADC   $01
            STAL  L050372,X
            BRA   L072DE3
L072DE3     LDA   $0A
            STA   $0E
            LDA   $09
            STA   $0D
            LDA   $07
            TCD
            TSC
            CLC
            ADC   #$000C
            TCS
            RTL

L072DF5     PHD
            TSC
            CLC
            ADC   #$FFF4
            TCS
            TCD
            LDX   #$0000
            LDA   #$046F
            CMP   $12
            BNE   L072E08
            INX
L072E08     PHX
            LDX   #$0000
            LDA   #$0471
            CMP   $12
            BNE   L072E14
            INX
L072E14     TXA
            ORA   $01,S
            PLX
            LSR
            BCC   L072E3D
            LDA   $12
            INC
            STA   $05
            LDA   #$046F
            CMP   $12
            BNE   L072E2E
            LDA   #$8000
            STA   $07
            BRA   L072E33
L072E2E     LDA   #$4000
            STA   $07
L072E33     LDA   $07
            ORA   L06003A
            STA   L06003A
            BRA   L072E5D
L072E3D     LDA   $12
            DEC
            STA   $05
            LDA   #$0470
            CMP   $12
            BNE   L072E50
            LDA   #$7FFF
            STA   $07
            BRA   L072E55
L072E50     LDA   #$BFFF
            STA   $07
L072E55     LDA   $07
            AND   L06003A
            STA   L06003A
L072E5D     LDA   $05
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PLX
            STA   $01
            STX   $03
            LDA   $12
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PLX
            STA   $09
            STX   $0B
            LDY   #$0002
            LDA   [$09],Y
            TAX
            LDA   [$09]
            CLC
            ADC   #$0012
            BCC   L072E9A
            INX
L072E9A     STA   $09
            STX   $0B
            LDA   [$09]
            BEQ   L072EA5
            BRL   L072F65
L072EA5     PEA   $00FF
            LDAL  L050376
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            JSL   L03A9F4
            PEA   $00FF
            LDAL  L050792
            PHA
            LDAL  L050790
            PHA
            JSL   L03A9F4
            LDA   $12
            SEC
            SBC   #$0471
            BVS   L072EDD
            EOR   #$8000
L072EDD     BMI   L072F49
            PEA   $00FF
            LDAL  L050374
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            JSL   L03A9F4
            PEA   $00FF
            LDAL  L05078E
            PHA
            LDAL  L05078C
            PHA
            JSL   L03A9F4
            PEA   $00FF
            LDAL  L0507CA
            PHA
            LDAL  L0507C8
            PHA
            JSL   L03A9F4
            PEA   $00FF
            LDAL  L0507CE
            PHA
            LDAL  L0507CC
            PHA
            JSL   L03A9F4
            LDAL  L050372
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            JSL   L03ADD3
            BRA   L072F62
L072F49     LDAL  L050374
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            JSL   L03ADD3
L072F62     BRL   L07309C
L072F65     LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            CLC
            ADC   #$0012
            BCC   L072F74
            INX
L072F74     STA   $09
            STX   $0B
            LDA   [$09]
            BEQ   L072F7F
            BRL   L073091
L072F7F     LDA   $12
            SEC
            SBC   #$0471
            BVS   L072F8A
            EOR   #$8000
L072F8A     BMI   L072FF4
            PEA   $0000
            LDAL  L0507CA
            PHA
            LDAL  L0507C8
            PHA
            JSL   L03A9F4
            PEA   $0000
            LDAL  L0507CE
            PHA
            LDAL  L0507CC
            PHA
            JSL   L03A9F4
            PEA   $0000
            LDAL  L050374
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            JSL   L03A9F4
            PEA   $0000
            LDAL  L05078E
            PHA
            LDAL  L05078C
            PHA
            JSL   L03A9F4
            LDAL  L050374
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            JSL   L03ADD3
L072FF4     LDAL  L0507CA
            TAX
            LDAL  L0507C8
            STA   $09
            STX   $0B
            LDY   #$0002
            LDA   [$09],Y
            TAX
            LDA   [$09]
            CLC
            ADC   #$0012
            BCC   L073010
            INX
L073010     STA   $09
            STX   $0B
            LDA   [$09]
            BEQ   L07301B
            LDA   #$0001
L07301B     PHA
            LDAL  L0507CE
            TAX
            LDAL  L0507CC
            STA   $09
            STX   $0B
            LDY   #$0002
            LDA   [$09],Y
            TAX
            LDA   [$09]
            CLC
            ADC   #$0012
            BCC   L073038
            INX
L073038     STA   $09
            STX   $0B
            LDA   [$09]
            BEQ   L073043
            LDA   #$0001
L073043     ORA   $01,S
            PLX
            LSR
            BCC   L07308F
            PEA   $0000
            LDAL  L050376
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            JSL   L03A9F4
            PEA   $0000
            LDAL  L050792
            PHA
            LDAL  L050790
            PHA
            JSL   L03A9F4
            LDAL  L050376
            SEC
            SBC   #$0460
            ASL
            ASL
            TAX
            LDAL  L050786,X
            PHA
            LDAL  L050784,X
            PHA
            JSL   L03ADD3
L07308F     BRA   L07309C
L073091     PEA   $0000
            PEI   $03
            PEI   $01
            JSL   L03B1CC
L07309C     LDA   $10
            STA   $12
            LDA   $0F
            STA   $11
            LDA   $0D
            TCD
            TSC
            CLC
            ADC   #$0010
            TCS
            RTL

L0730AE     PHD
            TSC
            CLC
            ADC   #$FFFC
            TCS
            TCD
            LDX   #$0000
            LDAL  L050B3A
            DEC
            DEC
            BNE   L0730C2
            INX
L0730C2     PHX
            LDX   #$0000
            LDA   #$1B00
            ANDL  L050B2C
            BNE   L0730D0
            INX
L0730D0     TXA
            AND   $01,S
            PLX
            LSR
            BCS   L0730DA
            BRL   L07315A
L0730DA     PEA   ^L0600BA
            PEA   L0600BA
            PEA   ^L0600BC
            PEA   L0600BC
            PEA   ^L0600B2
            PEA   L0600B2
            LDA   L0600D8
            LDX   L0600DA
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            PHA
            JSL   L030D83
            LDA   L0600BA
            BNE   L07312E
            PEA   ^L0321C0
            PEA   L0321C0
            PEA   $FFFF
            LDA   L0600B2
            LDX   L0600B4
            PHX
            PHA
            PEA   $0000
            LDA   L0600BC
            PHA
            LDA   L060060
            LDX   L060062
            PHX
            PHA
            JSL   L03A5E7
            BRA   L07315A
L07312E     LDA   #$7FFF
            AND   L0600C4
            SEC
            SBC   #$0054
            CMP   #$0001
            SEC
            SBC   #$0000
            BEQ   L073143
            BRA   L07315A
L073143     PHY
            PEA   $0000
            PEA   $0003
            PEA   ^L0513AE
            PEA   L0513AE
            JSL   L07001D
            PLA
            STA   L06006C
            BRA   L07315A
L07315A     LDAL  L050B3A
            DEC
            BNE   L07317A
            LDA   #$1B00
            ANDL  L050B2C
            BNE   L073173
            PEA   $0001
            JSL   L07194A
            BRA   L07317A
L073173     PEA   $0000
            JSL   L07194A
L07317A     PLY
            PLY
            PLD
            RTL

L07317E     PHD
            TSC
            CLC
            ADC   #$FE7C
            TCS
            ADC   #$008D
            TCD
            LDAL  L050B3E
            TAX
            LDAL  L050B3C
            STA   $EF
            STX   $F1
            LDAL  L050B44
            STA   $E9
            LDA   $E9
            SEC
            SBC   #$0440
            BPL   L0731A7
            BRL   L073F69
L0731A7     CMP   #$1146
            BMI   L0731AF
            BRL   L073F69
L0731AF     SEC
            SBC   #$0000
            BNE   L0731B8
            BRL   L073D15
L0731B8     DEC
            BNE   L0731BE
            BRL   L073D9E
L0731BE     DEC
            BNE   L0731C4
            BRL   L073D9E
L0731C4     DEC
            BNE   L0731CA
            BRL   L073D1C
L0731CA     DEC
            DEC
            BNE   L0731D1
            BRL   L073E08
L0731D1     DEC
            DEC
            BNE   L0731D8
            BRL   L073E01
L0731D8     SEC
            SBC   #$001A
            BNE   L0731E1
            BRL   L073E9D
L0731E1     DEC
            BNE   L0731E7
            BRL   L073E9D
L0731E7     DEC
            BNE   L0731ED
            BRL   L073E9D
L0731ED     SEC
            SBC   #$0004
            BNE   L0731F6
            BRL   L073EAF
L0731F6     DEC
            BNE   L0731FC
            BRL   L073EAF
L0731FC     DEC
            BNE   L073202
            BRL   L073EAF
L073202     SEC
            SBC   #$0006
            BNE   L07320B
            BRL   L073EE2
L07320B     DEC
            BNE   L073211
            BRL   L073EE2
L073211     DEC
            BNE   L073217
            BRL   L073EE2
L073217     DEC
            BNE   L07321D
            BRL   L073EE2
L07321D     DEC
            DEC
            DEC
            BNE   L073225
            BRL   L073EEA
L073225     DEC
            BNE   L07322B
            BRL   L073EF0
L07322B     SEC
            SBC   #$000B
            BNE   L073234
            BRL   L073F11
L073234     DEC
            BNE   L07323A
            BRL   L073F0B
L07323A     SEC
            SBC   #$0020
            BNE   L073243
            BRL   L073C27
L073243     SEC
            SBC   #$000E
            BNE   L07324C
            BRL   L07381B
L07324C     DEC
            BNE   L073252
            BRL   L07381B
L073252     DEC
            BNE   L073258
            BRL   L073833
L073258     SEC
            SBC   #$0005
            BNE   L073261
            BRL   L07383C
L073261     DEC
            DEC
            BNE   L073268
            BRL   L0739BA
L073268     DEC
            BNE   L07326E
            BRL   L0738D4
L07326E     DEC
            BNE   L073274
            BRL   L0739BA
L073274     SEC
            SBC   #$0009
            BNE   L07327D
            BRL   L0736C3
L07327D     DEC
            BNE   L073283
            BRL   L0736C3
L073283     SEC
            SBC   #$000C
            BNE   L07328C
            BRL   L073802
L07328C     SEC
            SBC   #$000F
            BNE   L073295
            BRL   L07354E
L073295     DEC
            BNE   L07329B
            BRL   L07335B
L07329B     DEC
            BNE   L0732A1
            BRL   L07335B
L0732A1     DEC
            BNE   L0732A7
            BRL   L07369B
L0732A7     SEC
            SBC   #$0020
            BNE   L0732B0
            BRL   L073346
L0732B0     DEC
            BNE   L0732B6
            BRL   L073346
L0732B6     DEC
            BNE   L0732BC
            BRL   L073346
L0732BC     DEC
            BNE   L0732C2
            BRL   L073346
L0732C2     SEC
            SBC   #$00FC
            BEQ   L07332B
            DEC
            BEQ   L073332
            DEC
            DEC
            DEC
            BEQ   L07333D
            SEC
            SBC   #$09F9
            BEQ   L073304
            SEC
            SBC   #$04B3
            BNE   L0732DF
            BRL   L073C32
L0732DF     SEC
            SBC   #$00CE
            BNE   L0732E8
            BRL   L073ACF
L0732E8     DEC
            BNE   L0732EE
            BRL   L073B8C
L0732EE     DEC
            BNE   L0732F4
            BRL   L073E13
L0732F4     DEC
            BNE   L0732FA
            BRL   L073E3E
L0732FA     DEC
            DEC
            BNE   L073301
            BRL   L0739D6
L073301     BRL   L073F69
L073304     PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            JSL   L039CC3
            PLA
            STA   L0612BD
            PLA
            STA   L0612BF
            PEA   $0000
            LDA   L060012
            PHA
            JSL   L03A62D
            BRL   L073F69
L07332B     JSL   L0718DA
            BRL   L073F69
L073332     JSL   L074AF9
            JSL   L074538
            BRL   L073F69
L07333D     LDA   #$0001
            STA   L0600CE
            BRL   L073F69
L073346     LDA   $E9
            STA   L06000A
            LDA   #$0503
            CMP   $E9
            BNE   L073358
            LDA   #$0001
            STA   L06000C
L073358     BRL   L073F69
L07335B     LDA   #$0001
            STA   $D7
            LDA   L0600D4
            EOR   #$0001
            AND   #$00FF
            PHA
            LDX   #$0000
            LDA   #$04E1
            CMP   $E9
            BNE   L073375
            INX
L073375     TXA
            AND   $01,S
            PLX
            LSR
            BCS   L07337F
            BRL   L073487
L07337F     LDA   L06003C
            LDX   L06003E
            STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            CLC
            ADC   #$0004
            BCC   L073398
            INX
L073398     STA   $F3
            STX   $F5
            LDA   [$F3]
            STA   $ED
            PHY
            LDA   L06003C
            LDX   L06003E
            STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHX
            PHA
            LDA   L06003C
            LDX   L06003E
            STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            CLC
            ADC   #$0004
            BCC   L0733E6
            INX
L0733E6     STA   $F3
            STX   $F5
            LDA   [$F3]
            PHA
            JSL   L03B232
            PLA
            STA   L060036
            LDAL  L0612ED
            BEQ   L073463
            STZ   $D7
            JSL   L03ADB3
            LDA   #$0001
            STA   $ED
L073406     PEA   $0000
            PEA   $0000
            LDA   L06003C
            LDX   L06003E
            PHX
            PHA
            JSL   L03B1C6
            LDA   L06003C
            LDX   L06003E
            PHX
            PHA
            JSL   L03AA6D
            PEA   $0000
            PEA   $0006
            JSL   L03969E
            PEA   $0000
            PEA   $0004
            LDA   L06003C
            LDX   L06003E
            PHX
            PHA
            JSL   L03B1C6
            LDA   L06003C
            LDX   L06003E
            PHX
            PHA
            JSL   L03AA6D
            PEA   $0000
            PEA   $0006
            JSL   L03969E
            LDA   #$0002
            CMP   $ED
            BEQ   L073461
            INC   $ED
            BRA   L073406
L073461     BRA   L073487
L073463     PEA   ^L0503FC
            PEA   L0503FC
            PEA   ^L0513DA
            PEA   L0513DA
            PEA   $0006
            JSL   L03B108
            LDA   L060036
            PHA
            PEA   ^L0503FE
            PEA   L0503FE
            PEA   $0004
            JSL   L03AA0C
L073487     LDA   $D7
            BNE   L07348E
            BRL   L07354B
L07348E     PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0001
            JSL   L039CC3
            PLA
            STA   L0612BD
            PLA
            STA   L0612BF
            LDA   #$0400
            ORA   L0600DC
            PHA
            JSL   L03B1D8
            LDA   #$04E1
            CMP   $E9
            BEQ   L0734BC
            BRL   L07353C
L0734BC     PHY
            PHY
            JSL   L03A475
            PLA
            STA   $DD
            PLX
            STX   $DF
            LDA   L06005C
            LDX   L06005E
            PHX
            PHA
            JSL   L03A46F
            LDA   L0600C0
            PEA   $0029
            JSL   L03AA73
            PLX
            TXA
            CLC
            ADC   #L050381
            LDX   #^L050381
            BCC   L0734EA
            INX
L0734EA     PHX
            PHA
            PEA   ^L0503FC
            PEA   L0503FC
            PEA   $0029
            JSL   L03B108
            LDA   L0600C0
            ASL
            TAX
            LDA   L060036
            STAL  L0500D5,X
            PEA   $0000
            LDA   L0600C0
            PEA   $0029
            JSL   L03AA73
            PLX
            TXA
            CLC
            ADC   #L050381
            LDX   #^L050381
            BCC   L07351E
            INX
L07351E     PHX
            PHA
            PEA   $0610
            JSL   L03A8D6
            PEA   $0000
            PEA   $0000
            PEA   $0467
            JSL   L03A63F
            PEI   $DF
            PEI   $DD
            JSL   L03A46F
L07353C     PEA   $0610
            LDA   L06005C
            LDX   L06005E
            PHX
            PHA
            JSL   L03B1CC
L07354B     BRL   L073F69
L07354E     LDAL  L050B3A
            DEC
            BEQ   L073558
            BRL   L0735DA
L073558     PEA   ^L0503FC
            PEA   L0503FC
            PEA   ^L060036
            PEA   L060036
            LDA   L0600D8
            LDX   L0600DA
            STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHA
            JSL   L03288D
            PEA   ^L050477
            PEA   L050477
            PEA   ^L0503FC
            PEA   L0503FC
            PEA   $0002
            PEA   $0004
            TDC
            CLC
            ADC   #$00AE
            PEA   $0000
            PHA
            JSL   L03A1B9
            PEA   $0005
            JSL   L03B108
            PEA   ^L050478
            PEA   L050478
            PEA   $0004
            LDA   L06003C
            LDX   L06003E
            PHX
            PHA
            JSL   L03B34C
            PEA   $0000
            PEA   $0004
            LDA   L06003C
            LDX   L06003E
            PHX
            PHA
            JSL   L03B1C6
            LDA   L06003C
            LDX   L06003E
            PHX
            PHA
            JSL   L03AA6D
            LDA   #$0001
            STA   L0600D4
L0735DA     LDAL  L050B3A
            DEC
            DEC
            BEQ   L0735E5
            BRL   L073698
L0735E5     PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0001
            JSL   L039CC3
            PLA
            STA   L0612BD
            PLA
            STA   L0612BF
            LDA   #$0400
            ORA   L0600DC
            PHA
            JSL   L03B1D8
            PHY
            PHY
            JSL   L03A475
            PLA
            STA   $DD
            PLX
            STX   $DF
            LDA   L06005C
            LDX   L06005E
            PHX
            PHA
            JSL   L03A46F
            LDA   L0600C0
            PEA   $0029
            JSL   L03AA73
            PLX
            TXA
            CLC
            ADC   #L050381
            LDX   #^L050381
            BCC   L073637
            INX
L073637     PHX
            PHA
            PEA   ^L0503FC
            PEA   L0503FC
            PEA   $0029
            JSL   L03B108
            LDA   L0600C0
            ASL
            TAX
            LDA   L060036
            STAL  L0500D5,X
            PEA   $0000
            LDA   L0600C0
            PEA   $0029
            JSL   L03AA73
            PLX
            TXA
            CLC
            ADC   #L050381
            LDX   #^L050381
            BCC   L07366B
            INX
L07366B     PHX
            PHA
            PEA   $0610
            JSL   L03A8D6
            PEA   $0000
            PEA   $0000
            PEA   $0467
            JSL   L03A63F
            PEI   $DF
            PEI   $DD
            JSL   L03A46F
            PEA   $0610
            LDA   L06005C
            LDX   L06005E
            PHX
            PHA
            JSL   L03B1CC
L073698     BRL   L073F69
L07369B     PHY
            LDA   L060054
            LDX   L060056
            PHX
            PHA
            JSL   L03B1F0
            PLA
            STA   $ED
            LDA   $ED
            BEQ   L0736BD
            PEI   $ED
            LDA   L060054
            LDX   L060056
            PHX
            PHA
            JSL   L03ADE5
L0736BD     STZ   L0600D4
            BRL   L073F69
L0736C3     LDA   #$04C4
            CMP   $E9
            BEQ   L0736CD
            BRL   L0737D8
L0736CD     LDA   #$04C8
            LDX   #$0000
            STA   $E1
            STX   $E3
L0736D7     PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEI   $E3
            PEI   $E1
            JSL   L03B1DE
            PLA
            PLX
            STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            STA   $D9
            STX   $DB
            LDY   #$0012
            LDA   [$D9],Y
            BNE   L07372B
            PHY
            PHY
            LDA   L060002
            LDX   L060004
            PHX
            PHA
            PHY
            PHY
            LDY   #$0022
            LDA   [$D9],Y
            PHA
            DEY
            DEY
            LDA   [$D9],Y
            PHA
            JSL   L03A8AE
            JSL   L03A1A0
            PLA
            STA   L060002
            PLA
            STA   L060004
            BRA   L07374C
L07372B     PHY
            PHY
            LDA   L060002
            LDX   L060004
            PHX
            PHA
            LDY   #$0022
            LDA   [$D9],Y
            PHA
            DEY
            DEY
            LDA   [$D9],Y
            PHA
            JSL   L03A39B
            PLA
            STA   L060002
            PLA
            STA   L060004
L07374C     LDA   $E1
            LDX   $E3
            CMP   #$04CE
            BNE   L073758
            CPX   #$0000
L073758     BEQ   L073763
            INC   $E1
            BNE   L073760
            INC   $E3
L073760     BRL   L0736D7
L073763     PHY
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $14C2
            JSL   L03B1DE
            JSL   L03B1D2
            PLA
            BEQ   L0737D8
            JSL   L03ABBC
            PEA   $0000
            PEA   $0000
            PEA   ^L06006E
            PEA   L06006E
            PEA   $0003
            PEA   ^L060436
            PEA   L060436
            PEA   $0000
            PEA   $0000
            LDA   L0600DC
            PHA
            LDA   L0600D8
            LDX   L0600DA
            STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHA
            JSL   L031CE7
            JSL   L03B396
            LDA   L06006E
            BEQ   L0737D8
            PHY
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   L06006E
            PHA
            JSL   L03B358
            PLA
            STA   L06006C
L0737D8     PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            JSL   L039CC3
            PLA
            STA   L0612BD
            PLA
            STA   L0612BF
            PEA   $0000
            LDA   L060012
            PHA
            JSL   L03A62D
            STZ   L060010
            BRL   L073F69
L073802     LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B1E4
            STZ   L0612BD
            STZ   L0612BF
            JSL   L074598
            BRL   L073F69
L07381B     LDA   #$04B0
            CMP   $E9
            BNE   L07382A
            LDA   #$0001
            STA   L060006
            BRA   L073830
L07382A     LDA   #$0002
            STA   L060006
L073830     BRL   L073F69
L073833     LDA   #$0003
            STA   L060006
            BRL   L073F69
L07383C     LDA   L060006
            DEC
            BPL   L073845
            BRL   L0738D1
L073845     CMP   #$0002
            BMI   L07384D
            BRL   L0738D1
L07384D     SEC
            SBC   #$0000
            BEQ   L0738AC
            DEC
            BEQ   L073858
            BRA   L0738D1
L073858     STZ   $D7
            LDA   L0600C6
            BNE   L073866
            LDA   #$0001
            STA   $D7
            BRA   L07386E
L073866     PHY
            JSL   L070DA0
            PLA
            STA   $D7
L07386E     LDA   $D7
            DEC
            BNE   L0738AA
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B1E4
            STZ   L0612BD
            STZ   L0612BF
            JSL   L07137F
            LDA   L0600C4
            BNE   L073894
            JSL   L071B39
            BRA   L0738AA
L073894     LDA   #$8010
            CMP   L0600C4
            BNE   L0738A2
            JSL   L074598
            BRA   L0738AA
L0738A2     JSL   L074AF9
            JSL   L074538
L0738AA     BRA   L0738D1
L0738AC     PHY
            JSL   L070DA0
            PLA
            STA   $D7
            LDA   $D7
            DEC
            BNE   L0738CF
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B1E4
            STZ   L0612BD
            STZ   L0612BF
            JSL   L071EFC
L0738CF     BRA   L0738D1
L0738D1     BRL   L073F69
L0738D4     PHY
            JSL   L070DA0
            PLA
            LSR
            BCS   L0738E0
            BRL   L0739B7
L0738E0     LDA   L060008
            DEC
            BNE   L073954
            STZ   L0600D0
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B1E4
            STZ   L0612BD
            STZ   L0612BF
            PEA   ^L050168
            PEA   L050168
            LDA   L0600C6
            PHA
            PEA   ^L06006E
            PEA   L06006E
            LDA   L0600DC
            PHA
            LDA   L0600D8
            LDX   L0600DA
            STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHA
            JSL   L035B16
            LDA   L06006E
            BNE   L073931
            JSL   L071B39
            BRA   L073952
L073931     LDA   #$8000
            AND   L06006E
            BNE   L07394E
            PHY
            PEA   $0000
            PEA   $0002
            PEA   ^L0513E0
            PEA   L0513E0
            JSL   L07001D
            PLA
            STA   L06006C
L07394E     JSL   L074598
L073952     BRA   L0739B7
L073954     PEA   ^L05047C
            PEA   L05047C
            PEA   ^L05141A
            PEA   L05141A
            PEA   ^L05009E
            PEA   L05009E
            PEA   ^L05143B
            PEA   L05143B
            TDC
            CLC
            ADC   #$0073
            PEA   $0000
            PHA
            PEA   $0003
            JSL   L03A8DC
            PEA   $0063
            JSL   L03B108
            PHY
            PEA   $0000
            PEA   $0004
            PEA   ^L05047C
            PEA   L05047C
            JSL   L07001D
            PLA
            STA   L06006C
            LDA   L06006C
            DEC
            BNE   L0739B7
            STZ   L0600D0
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B1E4
            STZ   L0612BD
            STZ   L0612BF
            JSL   L071EFC
L0739B7     BRL   L073F69
L0739BA     STZ   L0600D0
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B1E4
            STZ   L0612BD
            STZ   L0612BF
            JSL   L074538
            BRL   L073F69
L0739D6     LDA   L060006
            DEC
            BMI   L073A56
            CMP   #$0003
            BPL   L073A56
            SEC
            SBC   #$0000
            BEQ   L073A32
            DEC
            BEQ   L073A32
            DEC
            BEQ   L0739EF
            BRA   L073A56
L0739EF     LDA   #$0000
            STAL  L0601BE
            LDA   #$00E0
            STAL  L0601C0
            LDA   #$0004
            STAL  L0601C2
            LDA   #$0000
            STAL  L0601C4
            PEA   $0064
            PEA   $001E
            PEA   $0002
            PEA   $0000
            PEA   $02A3
            PEA   $0000
            PEA   $0000
            PEA   ^L0601BC
            PEA   L0601BC
            PEA   ^L0601C6
            PEA   L0601C6
            JSL   L03B346
            BRA   L073A56
L073A32     PEA   $0064
            PEA   $001E
            PEA   $0002
            PEA   $0000
            PEA   $02AA
            PEA   $0002
            PEA   $0000
            PEA   $02AB
            PEA   ^L0601C6
            PEA   L0601C6
            JSL   L03A5F9
            BRA   L073A56
L073A56     LDAL  L0601C6
            BEQ   L073ACC
            PEA   ^L050168
            PEA   L050168
            PEA   ^L060208
            PEA   L060208
            PEA   $0101
            JSL   L03B108
            LDA   #$0003
            CMP   L060006
            BNE   L073A7E
            PEA   $0001
            JSL   L0701D4
L073A7E     PEA   ^L05057C
            PEA   L05057C
            PEA   $0000
            TDC
            CLC
            ADC   #$FF73
            PHA
            PEA   ^L050168
            PEA   L050168
            JSL   L0399E0
            PEA   $0100
            JSL   L03B108
            PEA   $00D2
            PEA   ^L05057C
            PEA   L05057C
            JSL   L039F3E
            LDA   L060098
            LDX   L06009A
            PHX
            PHA
            JSL   L03AA06
            LDA   #L05057C
            STAL  L050032
            LDA   #^L05057C
            STAL  L050034
            PEA   $1584
            JSL   L039EA9
L073ACC     BRL   L073F69
L073ACF     LDA   L0600CA
            STA   L0600C6
            LDA   #$0003
            CMP   L060006
            BNE   L073AE3
            LDA   #$0001
            STA   L0600D0
L073AE3     LDA   L060040
            LDX   L060042
            PHX
            PHA
            JSL   L03AA06
            LDA   L060044
            LDX   L060046
            PHX
            PHA
            JSL   L03A9FA
            LDA   L060048
            LDX   L06004A
            PHX
            PHA
            JSL   L03A9FA
            LDA   L060098
            LDX   L06009A
            PHX
            PHA
            JSL   L03A9FA
            LDA   #L050A0D
            STAL  L050032
            LDA   #^L050A0D
            STAL  L050034
            PEA   $1584
            JSL   L039EA9
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B165
            LDA   L0612CD
            LDX   L0612CF
            PHX
            PHA
            JSL   L03B17F
            LDA   L0600C6
            BEQ   L073B7C
            LDA   L06008E
            ASL
            ASL
            TAX
            LDAL  L0604DE+2,X
            PHA
            LDAL  L0604DE,X
            PLX
            STA   L0612D5
            STX   L0612D7
            LDA   L0612D5
            ORA   L0612D7
            BEQ   L073B7A
            LDA   L0612D5
            LDX   L0612D7
            PHX
            PHA
            PEA   $F000
            LDA   L0612C1
            PHA
            LDA   L0612C3
            PHA
            JSL   L03A5ED
L073B7A     BRA   L073B82
L073B7C     STZ   L0612D5
            STZ   L0612D7
L073B82     PEA   $0001
            JSL   L0701D4
            BRL   L073F69
L073B8C     LDA   L0600C6
            BEQ   L073B97
            LDA   L0600C6
            STA   L0600CA
L073B97     STZ   L0600C6
            STZ   L0600D0
            LDA   L060044
            LDX   L060046
            PHX
            PHA
            JSL   L03AA06
            LDA   L060048
            LDX   L06004A
            PHX
            PHA
            JSL   L03AA06
            LDA   L060098
            LDX   L06009A
            PHX
            PHA
            JSL   L03AA06
            LDA   L060040
            LDX   L060042
            PHX
            PHA
            JSL   L03A9FA
            LDA   #L05057C
            STAL  L050032
            LDA   #^L05057C
            STAL  L050034
            PEA   $1584
            JSL   L039EA9
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B165
            LDA   L0612CD
            LDX   L0612CF
            PHX
            PHA
            JSL   L03B17F
            LDA   #L060F22
            LDX   #^L060F22
            STA   L0612D5
            STX   L0612D7
            LDA   L0612D5
            LDX   L0612D7
            PHX
            PHA
            PEA   $F000
            LDA   L0612C1
            PHA
            LDA   L0612C3
            PHA
            JSL   L03A5ED
            PEA   $0001
            JSL   L0701D4
            BRL   L073F69
L073C27     JSL   L0705EC
            JSL   L070D25
            BRL   L073F69
L073C32     LDA   L060008
            DEC
            BEQ   L073C3B
            BRL   L073D0A
L073C3B     PEA   $0064
            PEA   $001E
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $02A2
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L032D01
            PEA   L032D01
            PEA   $0000
            PEA   $0000
            PEA   ^L0601C6
            PEA   L0601C6
            JSL   L03A5F3
            LDAL  L0601C6
            BNE   L073C78
            BRL   L073D08
L073C78     PEA   ^L050269
            PEA   L050269
            PEA   ^L060208
            PEA   L060208
            PEA   $0101
            JSL   L03B108
            PEA   ^L05067C
            PEA   L05067C
            PEA   $0000
            TDC
            CLC
            ADC   #$FF73
            PHA
            PEA   ^L050269
            PEA   L050269
            JSL   L0399E0
            PEA   $0100
            JSL   L03B108
            PEA   $00FA
            PEA   ^L05067C
            PEA   L05067C
            JSL   L039F3E
            LDA   #L05067C
            STAL  L050026
            LDA   #^L05067C
            STAL  L050028
            PEA   $04A6
            JSL   L039EA9
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B165
            LDA   #L060582
            LDX   #^L060582
            STA   L0612D1
            STX   L0612D3
            LDA   L0612C9
            LDX   L0612CB
            PHX
            PHA
            JSL   L03B17F
            LDA   L0612D1
            LDX   L0612D3
            PHX
            PHA
            PEA   $F000
            LDA   L0612C5
            PHA
            LDA   L0612C7
            PHA
            JSL   L03A5ED
L073D08     BRA   L073D12
L073D0A     JSL   L0705EC
            JSL   L070D25
L073D12     BRL   L073F69
L073D15     JSL   L0730AE
            BRL   L073F69
L073D1C     LDA   #$0001
            STA   $EB
            LDA   L0600A0
            BNE   L073D6A
            LDA   #$0003
            CMP   L060006
            BNE   L073D43
            PEA   ^L05047C
            PEA   L05047C
            PEA   ^L051456
            PEA   L051456
            PEA   $0027
            JSL   L03B108
            BRA   L073D56
L073D43     PEA   ^L05047C
            PEA   L05047C
            PEA   ^L05147D
            PEA   L05147D
            PEA   $0026
            JSL   L03B108
L073D56     PHY
            PEA   $0000
            PEA   $0004
            PEA   ^L05047C
            PEA   L05047C
            JSL   L07001D
            PLA
            STA   $EB
L073D6A     LDA   $EB
            DEC
            BNE   L073D9B
            LDA   #$0500
            ORA   L0600DC
            PHA
            JSL   L03B1D8
            LDA   #$0200
            ORA   L0600DC
            PHA
            JSL   L03B1D8
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B1E4
            STZ   L0612BD
            STZ   L0612BF
            JSL   L071EFC
L073D9B     BRL   L073F69
L073D9E     LDA   #$0442
            SEC
            SBC   $E9
            STA   L060096
            PEA   ^L0600BA
            PEA   L0600BA
            PEA   ^L0600A0
            PEA   L0600A0
            PEA   ^L06007E
            PEA   L06007E
            LDA   L060096
            PHA
            PEA   ^L0600B2
            PEA   L0600B2
            LDA   L0600D8
            LDX   L0600DA
            STA   $F3
            STX   $F5
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHA
            JSL   L031200
            LDA   L0600BA
            BNE   L073DFE
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B165
            PEA   $0000
            LDA   L060060
            LDX   L060062
            PHX
            PHA
            JSL   L03ADE5
            JSL   L0714FD
L073DFE     BRL   L073F69
L073E01     JSL   L0717C8
            BRL   L073F69
L073E08     JSL   L074AF9
            JSL   L074598
            BRL   L073F69
L073E13     JSL   L070C7D
            LDA   #$0003
            CMP   L060006
            BNE   L073E34
            LDA   L060098
            LDX   L06009A
            PHX
            PHA
            JSL   L03A9FA
            PEA   $0001
            JSL   L0701D4
            BRA   L073E3B
L073E34     PEA   $1586
            JSL   L039EA9
L073E3B     BRL   L073F69
L073E3E     LDA   L0600C6
            STAL  L060446
            LDA   #$0200
            STAL  L06044C
            LDA   #$0000
            STAL  L06044E
            LDA   #$0200
            STAL  L060454
            PHY
            PHY
            JSL   L03A45D
            PLA
            STA   $E5
            PLX
            STX   $E7
L073E66     PEA   ^L060444
            PEA   L060444
            PEA   $202F       ; DRead
            JSL   GSOS2
            STAL  L0612ED
            PHY
            PHY
            JSL   L03A45D
            LDA   $E5
            LDX   $E7
            JSL   L03B1AC
            PHX
            PHA
            LDA   #$0028
            LDX   #$0000
            JSL   L03AA18
            BEQ   L073E66
            BVS   L073E98
            EOR   #$8000
L073E98     BPL   L073E66
            BRL   L073F69
L073E9D     PEI   $E9
            PHY
            PEI   $F1
            PEI   $EF
            JSL   L03B1D2
            JSL   L072C82
            BRL   L073F69
L073EAF     LDA   $E9
            SEC
            SBC   #$0467
            STA   L0600C0
            LDA   $EF
            LDX   $F1
            STA   L06005C
            STX   L06005E
            PHY
            PEI   $F1
            PEI   $EF
            JSL   L03B1D2
            PLA
            STA   L0600A2
            LDA   #$060A
            CMP   L0600A2
            BNE   L073EDF
            PEI   $F1
            PEI   $EF
            JSL   L0722C4
L073EDF     BRL   L073F69
L073EE2     PEI   $E9
            JSL   L072DF5
            BRA   L073F69
L073EEA     JSL   L0729F9
            BRA   L073F69
L073EF0     PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            JSL   L039CC3
            PLA
            STA   L0612BD
            PLA
            STA   L0612BF
            BRA   L073F69
L073F0B     JSL   L072579
            BRA   L073F69
L073F11     LDA   L0600D2
            BNE   L073F61
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L03B1E4
            STZ   L0612BD
            STZ   L0612BF
            LDX   #$0000
            LDA   L060006
            DEC
            DEC
            BNE   L073F33
            INX
L073F33     PHX
            LDX   #$0000
            LDA   #$0003
            CMP   L060006
            BNE   L073F40
            INX
L073F40     PHX
            LDX   #$0000
            LDA   L060008
            DEC
            BNE   L073F4B
            INX
L073F4B     TXA
            AND   $01,S
            PLX
            ORA   $01,S
            PLX
            LSR
            BCC   L073F5B
            JSL   L071B39
            BRA   L073F5F
L073F5B     JSL   L074598
L073F5F     BRA   L073F67
L073F61     LDA   #$0001
            STA   L06000C
L073F67     BRA   L073F69
L073F69     TSC
            CLC
            ADC   #$0184
            TCS
            PLD
            RTL

L073F71     PHD
            TSC
            CLC
            ADC   #$FFF8
            TCS
            TCD
            LDA   $10
            STA   L060012
            LDA   $0E
            STA   $03
            LDA   $03
            SEC
            SBC   #$012C
            BPL   L073F8D
            BRL   L074045
L073F8D     CMP   #$0064
            BMI   L073F95
            BRL   L074045
L073F95     SEC
            SBC   #$0000
            BEQ   L073FCD
            DEC
            BEQ   L073FC3
            SEC
            SBC   #$000A
            BEQ   L073FD5
            SEC
            SBC   #$000A
            BEQ   L073FE3
            DEC
            BNE   L073FB0
            BRL   L074037
L073FB0     SEC
            SBC   #$004D
            BEQ   L073FB9
            BRL   L074045
L073FB9     JSL   L070ACC
            BRL   L074050
            BRL   L074045
L073FC3     JSL   L074AF9
            JSL   L074538
            BRA   L074045
L073FCD     LDA   #$0001
            STA   L0600CE
            BRA   L074045
L073FD5     PHY
            PEI   $03
            JSL   L071235
            PLA
            STA   $01
            BRA   L074050
            BRA   L074045
L073FE3     PHY
            PHY
            JSL   L03AA61
            JSL   L03B165
            PEA   ^L0600BA
            PEA   L0600BA
            PEA   ^L0600A0
            PEA   L0600A0
            PEA   ^L06007E
            PEA   L06007E
            PEA   $0003
            PEA   ^L0600B2
            PEA   L0600B2
            LDA   L0600D8
            LDX   L0600DA
            STA   $05
            STX   $07
            LDY   #$0002
            LDA   [$05],Y
            TAX
            LDA   [$05]
            PHA
            JSL   L031200
            PEA   $0000
            LDA   L060060
            LDX   L060062
            PHX
            PHA
            JSL   L03ADE5
            PEA   $0000
            JSL   L07194A
            BRA   L074045
L074037     JSL   L070B2C
            LDA   #$0001
            STA   L060010
            BRA   L074050
            BRA   L074045
L074045     PEA   $0000
            LDA   L060012
            PHA
            JSL   L03A62D
L074050     LDA   $0C
            STA   $10
            LDA   $0B
            STA   $0F
            LDA   $09
            TCD
            TSC
            CLC
            ADC   #$000E
            TCS
            RTL

L074062     PHD
            TSC
            CLC
            ADC   #$FFEC
            TCS
            TCD
            PHY
            PHY
            JSL   L03AA61
            PLA
            STA   $0D
            PLX
            STX   $0F
            LDY   #$00B0
            LDA   [$0D],Y
            TAX
            DEY
            DEY
            LDA   [$0D],Y
            STA   $09
            STX   $0B
            LDA   $1A
            DEC
            DEC
            DEC
            BPL   L07408E
            BRL   L0743EC
L07408E     CMP   #$001F
            BMI   L074096
            BRL   L0743EC
L074096     SEC
            SBC   #$0000
            BNE   L07409F
            BRL   L0742AA
L07409F     SEC
            SBC   #$0005
            BEQ   L0740F2
            SEC
            SBC   #$0008
            BNE   L0740AE
            BRL   L074237
L0740AE     DEC
            BNE   L0740B4
            BRL   L0741FD
L0740B4     DEC
            DEC
            BNE   L0740BB
            BRL   L07425A
L0740BB     DEC
            BNE   L0740C1
            BRL   L07425A
L0740C1     DEC
            BNE   L0740C7
            BRL   L07425A
L0740C7     DEC
            BNE   L0740CD
            BRL   L07425A
L0740CD     DEC
            BNE   L0740D3
            BRL   L07425A
L0740D3     DEC
            BNE   L0740D9
            BRL   L07425A
L0740D9     DEC
            BNE   L0740DF
            BRL   L0741FD
L0740DF     DEC
            DEC
            BNE   L0740E6
            BRL   L07425A
L0740E6     SEC
            SBC   #$0006
            BNE   L0740EF
            BRL   L074230
L0740EF     BRL   L0743EC
L0740F2     LDA   $0D
            ORA   $0F
            BNE   L0740FB
            BRL   L0741FA
L0740FB     PHY
            PEI   $0F
            PEI   $0D
            JSL   L03ADAD
            PLA
            AND   #$8000
            BEQ   L07410D
            BRL   L0741C3
L07410D     PEA   $0080
            PEA   $0003
            JSL   L03AAB9
            PEA   $00FF
            JSL   L03AA4F
            PEA   $012D
            JSL   L03AA49
            PEA   $FF7F
            PEA   $0005
            JSL   L03AAB9
            PEA   $0000
            PEA   $0003
            JSL   L03A62D
            LDA   L060010
            PHA
            PEA   $0005
            JSL   L03A62D
            LDA   #$000F
            LDX   #$0000
            CMP   $09
            BNE   L074150
            CPX   $0B
L074150     BEQ   L074157
            LDA   #$0000
            BRA   L07415A
L074157     LDA   #$0001
L07415A     PHA
            LDA   #$000B
            LDX   #$0000
            CMP   $09
            BNE   L074167
            CPX   $0B
L074167     BEQ   L07416E
            LDA   #$0000
            BRA   L074171
L07416E     LDA   #$0001
L074171     ORA   $01,S
            PLX
            LSR
            BCC   L074180
            PEA   $0136
            JSL   L03AA49
            BRA   L074187
L074180     PEA   $0136
            JSL   L03AA4F
L074187     LDA   #$0006
            LDX   #$0000
            CMP   $09
            BNE   L074193
            CPX   $0B
L074193     BNE   L0741AC
            PEA   $0137
            JSL   L03AA49
            PEA   $0140
            JSL   L03AA49
            PEA   $0141
            JSL   L03AA49
            BRA   L0741C1
L0741AC     PEA   $0137
            JSL   L03AA4F
            PEA   $0140
            JSL   L03AA4F
            PEA   $0141
            JSL   L03AA4F
L0741C1     BRA   L0741FA
L0741C3     PEA   $FF7F
            PEA   $0003
            JSL   L03AAB9
            PEA   $00FF
            JSL   L03AA49
            PEA   $012D
            JSL   L03AA4F
            PEA   $0080
            PEA   $0005
            JSL   L03AAB9
            PEA   $0000
            PEA   $0003
            JSL   L03A62D
            LDA   L060010
            PHA
            PEA   $0005
            JSL   L03A62D
L0741FA     BRL   L0743EC
L0741FD     PHY
            PHY
            LDA   L0612DB
            LDX   L0612DD
            PHX
            PHA
            PEA   $0000
            PEA   $1FE9
            JSL   L03A1A0
            PLA
            PLX
            STX   $11
            ORA   $11
            BNE   L07421F
            JSL   L03ADB3
            BRA   L07422D
L07421F     LDAL  L050B30
            PHA
            LDAL  L050B2E
            PHA
            JSL   L073F71
L07422D     BRL   L0743EC
L074230     JSL   L07317E
            BRL   L0743EC
L074237     PHY
            PHY
            LDA   L0612DB
            LDX   L0612DD
            PHX
            PHA
            PEA   $0000
            PEA   $1FE9
            JSL   L03A1A0
            PLA
            PLX
            STX   $11
            ORA   $11
            BNE   L074257
            JSL   L03ADB3
L074257     BRL   L0743EC
L07425A     LDAL  L050B30
            PHA
            LDAL  L050B2E
            PHA
            PHY
            PHY
            JSL   L03AA61
            PLA
            PLX
            JSL   L03AA18
            BNE   L074277
            LDA   #$0000
            BRA   L07427A
L074277     LDA   #$0001
L07427A     PHA
            PHY
            PHY
            LDA   L0612DB
            LDX   L0612DD
            PHX
            PHA
            PEA   $0000
            PEA   $1FE9
            JSL   L03A1A0
            PLA
            PLX
            STX   $11
            ORA   $11
            BEQ   L07429A
            LDA   #$0001
L07429A     EOR   #$0001
            AND   $01,S
            PLX
            LSR
            BCC   L0742A7
            JSL   L03ADB3
L0742A7     BRL   L0743EC
L0742AA     LDA   #$002E
            LDX   #$0000
            CMPL  L050B20
            BNE   L0742BB
            TXA
            CMPL  L050B22
L0742BB     BEQ   L0742C2
            LDA   #$0000
            BRA   L0742C5
L0742C2     LDA   #$0001
L0742C5     PHA
            LDA   #$0100
            ANDL  L050B2C
            BEQ   L0742D2
            LDA   #$0001
L0742D2     AND   $01,S
            PLX
            LSR
            BCC   L074309
            LDA   #$001B
            STAL  L050B20
            LDA   #$0000
            STAL  L050B22
            LDA   #$0000
            STAL  L050B2C
            PHY
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L050B1E
            PEA   L050B1E
            JSL   L03A463
            PLA
            LSR
            BCC   L074309
            JSL   L07317E
L074309     PHY
            PEI   $0F
            PEI   $0D
            JSL   L03ADAD
            PLA
            AND   #$8000
            BEQ   L07431B
            LDA   #$0001
L07431B     EOR   #$0001
            PHA
            LDA   #$000D
            LDX   #$0000
            CMP   $09
            BNE   L07432B
            CPX   $0B
L07432B     BEQ   L074332
            LDA   #$0000
            BRA   L074335
L074332     LDA   #$0001
L074335     AND   $01,S
            PLX
            LSR
            BCS   L07433E
            BRL   L0743EA
L07433E     LDAL  L050B20
            STA   $05
            STZ   $07
            LDX   #$0000
            LDA   #$000A
            CMP   $05
            BNE   L074351
            INX
L074351     PHX
            LDX   #$0000
            LDA   #$0003
            CMP   L060006
            BEQ   L07435E
            INX
L07435E     TXA
            AND   $01,S
            PLX
            LSR
            BCC   L07436A
            LDA   #$0001
            STA   $07
L07436A     LDX   #$0000
            LDA   #$000B
            CMP   $05
            BNE   L074375
            INX
L074375     PHX
            LDX   #$0000
            LDA   L060006
            DEC
            BEQ   L074380
            INX
L074380     TXA
            AND   $01,S
            PLX
            LSR
            BCC   L07438C
            LDA   #$FFFF
            STA   $07
L07438C     LDA   $07
            BEQ   L0743EA
            LDA   #$04B0
            CLC
            ADC   L060006
            DEC
            JSL   L03A5FF
            STA   $01
            STX   $03
            PEA   $0000
            PHY
            PHY
            PEI   $0F
            PEI   $0D
            PEI   $03
            PEI   $01
            JSL   L03B1DE
            JSL   L03B1CC
            PEI   $03
            PEI   $01
            LDA   $07
            JSL   L03A5FF
            JSL   L03ADB9
            STA   $01
            STX   $03
            PEA   $0001
            PHY
            PHY
            PEI   $0F
            PEI   $0D
            PEI   $03
            PEI   $01
            JSL   L03B1DE
            JSL   L03B1CC
            LDA   $01
            LDX   $03
            SEC
            SBC   #$04AF
            BCS   L0743E7
            DEX
L0743E7     STA   L060006
L0743EA     BRA   L0743EC
L0743EC     LDA   $18
            STA   $1A
            LDA   $17
            STA   $19
            LDA   $15
            TCD
            TSC
            CLC
            ADC   #$0018
            TCS
            RTL

L0743FE     ENT
            PHD
            TSC
            CLC
            ADC   #$FFF2
            TCS
            TCD
            LDA   L0612DB
            LDX   L0612DD
            STAL  L050B32
            TXA
            STAL  L050B34
            PHY
            PEA   $FFFF
            PEA   ^L050B1E
            PEA   L050B1E
            JSL   L03B202
            PLA
            STA   $07
            LDA   $07
            BEQ   L074434
            LDA   #$7FFF
            AND   $07
            PHA
            JSL   L074062
L074434     LDA   L0600D2
            BEQ   L07443C
            BRL   L074530
L07443C     LDA   L0612BD
            LDX   L0612BF
            CLC
            ADC   #$00AE
            BCC   L074449
            INX
L074449     STA   $0B
            STX   $0D
            LDY   #$0002
            LDA   [$0B],Y
            TAX
            LDA   [$0B]
            STA   $09
            LDX   #$0000
            LDA   #$000F
            CMP   $09
            BNE   L074462
            INX
L074462     PHX
            LDX   #$0000
            LDA   #$000B
            CMP   $09
            BNE   L07446E
            INX
L07446E     TXA
            ORA   $01,S
            PLX
            STA   $01
            LDA   L0600D0
            DEC
            BNE   L0744A8
            PHY
            PHY
            LDA   #$9000
            CLC
            ADC   L060014
            PHA
            PEA   $0000
            JSL   L03B352
            PLA
            STA   $03
            PLX
            STX   $05
            LDA   $03
            BNE   L074498
            BRL   L074530
L074498     LDA   L0600C6
            CMP   $03
            BNE   L0744A6
            PEA   $0001
            JSL   L0701D4
L0744A6     BRA   L0744DE
L0744A8     PHY
            PHY
            LDA   #$D000
            CLC
            ADC   L060014
            PHA
            PEA   $0000
            JSL   L03B352
            PLA
            STA   $03
            PLX
            STX   $05
            LDA   $03
            BEQ   L074530
            LDX   #$0000
            LDA   L0600C6
            CMP   $03
            BNE   L0744CE
            INX
L0744CE     TXA
            AND   $01
            BEQ   L0744DE
            JSL   L07008E
            PEA   $1586
            JSL   L039EA9
L0744DE     LDA   $01
            BEQ   L074530
            LDX   #$0000
            LDA   L0600C6
            CMP   $03
            BEQ   L0744ED
            INX
L0744ED     PHX
            LDX   #$0000
            LDA   L0600C8
            CMP   $03
            BEQ   L0744F9
            INX
L0744F9     TXA
            AND   $01,S
            PLX
            LSR
            BCC   L074511
            PHY
            PHY
            PEA   $4000
            PEI   $03
            JSL   L03B352
            PLA
            STA   $03
            PLX
            STX   $05
L074511     LDX   #$0000
            LDA   L0600CC
            CMP   $03
            BNE   L07451C
            INX
L07451C     PHX
            LDX   #$0000
            LDA   L0600C8
            BNE   L074526
            INX
L074526     TXA
            AND   $01,S
            PLX
            LSR
            BCC   L074530
            STZ   L0600CC
L074530     TSC
            CLC
            ADC   #$000E
            TCS
            PLD
            RTL

L074538     ENT
            PHD
            TSC
            CLC
            ADC   #$FFFC
            TCS
            TCD
            PHY
            PHY
            LDA   L0612DB
            LDX   L0612DD
            PHX
            PHA
            PEA   $0000
            PEA   $1FE9
            JSL   L03A39B
            PLA
            STA   L0612DB
            PLA
            STA   L0612DD
            PHY
            PHY
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $000D
            PEA   ^L039A84
            PEA   L039A84
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $000D
            PEA   $800E
            JSL   L03A627
            PLA
            STA   L0612BD
            PLA
            STA   L0612BF
            LDA   #$0002
            STA   L060006
            PLY
            PLY
            PLD
            RTL

L074598     PHD
            TSC
            CLC
            ADC   #$FEE4
            TCS
            ADC   #$0025
            TCD
            STZ   L0600C6
            STZ   L0600C8
            PHY
            PHY
            LDA   L0612DB
            LDX   L0612DD
            PHX
            PHA
            PEA   $0000
            PEA   $1FE9
            JSL   L03A39B
            PLA
            STA   L0612DB
            PLA
            STA   L0612DD
            LDA   #$0003
            CMP   L060006
            BNE   L0745D9
            LDA   #$000F
            LDX   #$0000
            STA   $DF
            STX   $E1
            BRA   L0745E3
L0745D9     LDA   #$000B
            LDX   #$0000
            STA   $DF
            STX   $E1
L0745E3     PHY
            PHY
            PEA   $0000
            PEA   $0000
            PEI   $E1
            PEI   $DF
            PEA   ^L039A84
            PEA   L039A84
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEI   $E1
            PEI   $DF
            PEA   $800E
            JSL   L03A627
            PLA
            STA   L0612BD
            PLA
            STA   L0612BF
            LDA   #$0003
            CMP   L060006
            BNE   L07463E
            LDA   #L06056A
            LDX   #^L06056A
            STA   L0612C9
            STX   L0612CB
            LDA   #L060562
            LDX   #^L060562
            STA   L0612CD
            STX   L0612CF
            LDA   #$04BA
            LDX   #$0000
            STA   $E3
            STX   $E5
            BRL   L0746DB
L07463E     PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $04B8
            JSL   L03B1DE
            PLA
            STA   $E7
            PLX
            STX   $E9
            LDA   L060006
            DEC
            BNE   L07466A
            LDA   #$0082
            LDX   #$0000
            STA   $DB
            STX   $DD
            BRA   L074674
L07466A     LDA   #$0083
            LDX   #$0000
            STA   $DB
            STX   $DD
L074674     PEI   $DD
            PEI   $DB
            PEI   $E9
            PEI   $E7
            JSL   L03B208
            LDA   #L06057A
            LDX   #^L06057A
            STA   L0612C9
            STX   L0612CB
            LDA   #L060572
            LDX   #^L060572
            STA   L0612CD
            STX   L0612CF
            PEA   $04A6
            PEA   $FFA6
            PEA   $0000
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L039D36
            LDA   #$1580
            STA   $F1
L0746B2     PEI   $F1
            PEA   $0024
            PEA   $0000
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            JSL   L039D36
            LDA   #$1586
            CMP   $F1
            BEQ   L0746D1
            INC   $F1
            BRA   L0746B2
L0746D1     LDA   #$04B7
            LDX   #$0000
            STA   $E3
            STX   $E5
L0746DB     LDA   L0612C9
            LDX   L0612CB
            CLC
            ADC   #$0002
            BCC   L0746E8
            INX
L0746E8     STA   $F3
            STX   $F5
            LDA   [$F3]
            STA   L0612C5
            LDA   L0612C9
            LDX   L0612CB
            STA   $F3
            STX   $F5
            LDA   [$F3]
            STA   L0612C7
            LDA   L0612CD
            LDX   L0612CF
            CLC
            ADC   #$0002
            BCC   L07470D
            INX
L07470D     STA   $F3
            STX   $F5
            LDA   [$F3]
            STA   L0612C1
            LDA   L0612CD
            LDX   L0612CF
            STA   $F3
            STX   $F5
            LDA   [$F3]
            STA   L0612C3
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEI   $E5
            PEI   $E3
            JSL   L03B1DE
            PLA
            STA   L060068
            PLA
            STA   L06006A
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $14B2
            JSL   L03B1DE
            PLA
            STA   L06004C
            PLA
            STA   L06004E
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $1585
            JSL   L03B1DE
            PLA
            STA   L060040
            PLA
            STA   L060042
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $1583
            JSL   L03B1DE
            PLA
            STA   L060044
            PLA
            STA   L060046
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $1582
            JSL   L03B1DE
            PLA
            STA   L060048
            PLA
            STA   L06004A
            LDA   #$0003
            CMP   L060006
            BNE   L07480A
            LDA   #L05067C
            STAL  L050026
            LDA   #^L05067C
            STAL  L050028
            PEA   ^L05067C
            PEA   L05067C
            PEA   $0000
            TDC
            CLC
            ADC   #$FFDB
            PHA
            PEA   ^L050269
            PEA   L050269
            JSL   L0399E0
            PEA   $0100
            JSL   L03B108
            LDA   #$00FF
            ANDL  L05067C
            BEQ   L0747FC
            LDA   #L060582
            LDX   #^L060582
            STA   L0612D1
            STX   L0612D3
            BRA   L074802
L0747FC     STZ   L0612D1
            STZ   L0612D3
L074802     LDA   #$0001
            STA   L060008
            BRA   L074859
L07480A     JSL   L0705EC
            LDA   #L05009E
            STAL  L050026
            LDA   #^L05009E
            STAL  L050028
            LDA   L0600C8
            BEQ   L074839
            LDA   L0612D9
            ASL
            ASL
            TAX
            LDAL  L06045A+2,X
            PHA
            LDAL  L06045A,X
            PLX
            STA   L0612D1
            STX   L0612D3
            BRA   L07483F
L074839     STZ   L0612D1
            STZ   L0612D3
L07483F     LDA   L060006
            DEC
            BNE   L074859
            LDA   #$02AC
            LDX   #$0000
            PHX
            PHA
            LDA   L060068
            LDX   L06006A
            PHX
            PHA
            JSL   L03B208
L074859     PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $1586
            JSL   L03B1DE
            PLA
            STA   L060098
            PLA
            STA   L06009A
            PHY
            PHY
            LDA   L0612BD
            LDX   L0612BF
            PHX
            PHA
            PEA   $0000
            PEA   $1584
            JSL   L03B1DE
            PLA
            STA   L060050
            PLA
            STA   L060052
            JSL   L03ABBC
            STZ   $F1
L074897     LDA   L0600C6
            STA   $EB
            JSL   L07089E
            LDA   $EB
            CMP   L0600C6
            BNE   L0748AC
            LDA   $F1
            INC
            STA   $F1
L0748AC     LDA   #$0004
            AND   L060092
            BEQ   L0748B7
            LDA   #$0001
L0748B7     PHA
            LDX   #$0000
            LDA   L060090
            BNE   L0748C1
            INX
L0748C1     TXA
            ORA   $01,S
            PLX
            PHA
            LDX   #$0000
            LDA   $F1
            DEC
            DEC
            BNE   L0748D0
            INX
L0748D0     TXA
            ORA   $01,S
            PLX
            LSR
            BCC   L074897
            JSL   L03B396
            LDA   #L050A0D
            STAL  L050032
            LDA   #^L050A0D
            STAL  L050034
            LDA   #L050AB1
            STAL  L05003E
            LDA   #^L050AB1
            STAL  L050040
            PEA   ^L05057C
            PEA   L05057C
            PEA   ^L0514A3
            PEA   L0514A3
            PEA   $0012
            JSL   L03B108
            LDA   #$0000
            STAL  L050168
            LDA   L0600C6
            BEQ   L07492E
            LDA   L06008E
            ASL
            ASL
            TAX
            LDAL  L0604DE+2,X
            PHA
            LDAL  L0604DE,X
            PLX
            STA   L0612D5
            STX   L0612D7
            BRA   L074934
L07492E     STZ   L0612D5
            STZ   L0612D7
L074934     LDA   #$0003
            CMP   L060006
            BNE   L074942
            JSL   L071785
            BRA   L074942
L074942     TSC
            CLC
            ADC   #$011C
            TCS
            PLD
            RTL

L07494A     ENT
            PHD
            TSC
            CLC
            ADC   #$FFFA
            TCS
            TCD
            PHY
            PHY
            PEA   $0002
            PEA   $0000
            PEA   $0001
            PEA   $0000
            PEA   $0000
            JSL   L03B220
            JSL   L03AA5B
            PEA   $0000
            PEA   $0000
            JSL   L03A46F
            PEA   $0001
            JSL   L03B0DF
            PHY
            JSL   L03A469
            PLA
            STA   $01
            JSL   L03B22C
            STZ   L060010
            PLY
            PLY
            PLY
            PLD
            RTL

L074990     PHD
            TSC
            CLC
            ADC   #$FFFC
            TCS
            TCD
            LDA   #$FFFF
            LDX   #$001F
            STA   L0612DB
            STX   L0612DD
            STZ   L0600D0
            STZ   L0600D2
            STZ   L06000C
            LDA   #$0001
            STA   L06000E
            STZ   L0600D6
            STZ   L06009E
            STZ   L0600A0
            STZ   L06007E
            STZ   L060080
            LDA   #L05004E
            LDX   #^L05004E
            STA   L0600A6
            STX   L0600A8
            LDA   #$0100
            ORA   L0600DC
            STA   L0600DE
            PHY
            PHY
            PEA   $0000
            PEA   $0100
            LDA   L0600DE
            PHA
            PEA   $C015
            PEA   $0000
            PEA   $0000
            JSL   L03B1F6
            PLA
            STA   L0600D8
            PLA
            STA   L0600DA
            LDA   #$0000
            STAL  L050269
            LDA   #$0000
            STAL  L050168
            STZ   L0600C8
            STZ   L0600CC
            LDA   L0600D8
            LDX   L0600DA
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            PHA
            JSL   L030B5C
            PEA   ^L050026
            PEA   L050026
            JSL   L03ADEB
            PLY
            PLY
            PLD
            RTL

L074A31     ENT
            PHD
            TSC
            CLC
            ADC   #$FFF8
            TCS
            TCD
            PEA   $0000
            JSL   L03A0C8
            JSL   L03A621
            LDA   #$0001
            STA   $0E
            LDA   #L05004E
            LDX   #^L05004E
            STA   $01
            STX   $03
            LDA   #$0001
            STA   [$01]
            PEI   $03
            PEI   $01
            PEA   $202A
            JSL   GSOS2
            STAL  L0612ED
            LDAL  L0612ED
            BEQ   L074A70
            LDA   #$0001
L074A70     PHA
            LDY   #$0002
            LDA   #$7FFF
            AND   [$01],Y
            SEC
            SBC   #$0400
            BVS   L074A82
            EOR   #$8000
L074A82     BPL   L074A89
            LDA   #$0000
            BRA   L074A8C
L074A89     LDA   #$0001
L074A8C     ORA   $01,S
            PLX
            LSR
            BCC   L074A96
            STZ   $0E
            BRA   L074AF3
L074A96     PHY
            JSL   L03B1EA
            PLA
            STA   L0600DC
            PHY
            PHY
            LDA   #$0F00
            ORA   L0600DC
            PHA
            PEA   $0002
            PEA   $0000
            PEA   $0001
            JSL   L03ADD9
            PLA
            STAL  L050B1A
            PLA
            STAL  L050B1C
            LDAL  L0612ED
            BEQ   L074AC7
            STZ   $0E
L074AC7     JSL   L074990
            LDAL  L0612ED
            BEQ   L074AD3
            STZ   $0E
L074AD3     PHY
            PHY
            JSL   L03B226
            PLA
            STA   L06001A
            PLA
            STA   L06001C
            JSL   L03B396
            PHY
            PHY
            JSL   L03B226
            PLA
            STA   L060016
            PLA
            STA   L060018
L074AF3     PLY
            PLY
            PLY
            PLY
            PLD
            RTL

L074AF9     PHD
            TSC
            CLC
            ADC   #$FFF8
            TCS
            TCD
L074B01     PHY
            PHY
            JSL   L03AA61
            PLA
            STA   $01
            PLX
            STX   $03
            LDA   $01
            ORA   $03
            BEQ   L074B34
            PHY
            PEI   $03
            PEI   $01
            JSL   L03ADAD
            PLA
            AND   #$8000
            BNE   L074B2C
            PEI   $03
            PEI   $01
            JSL   L03B1E4
            BRA   L074B34
L074B2C     PEI   $03
            PEI   $01
            JSL   L03A61B
L074B34     LDA   $01
            ORA   $03
            BNE   L074B01
            STZ   L0612BD
            STZ   L0612BF
            LDA   #$0100
            ORA   L0600DC
            PHA
            JSL   L03B1D8
            LDA   #$0200
            ORA   L0600DC
            PHA
            JSL   L03B1D8
            LDA   #$0300
            ORA   L0600DC
            PHA
            JSL   L03B1D8
            LDA   #$0400
            ORA   L0600DC
            PHA
            JSL   L03B1D8
            LDA   #$0500
            ORA   L0600DC
            PHA
            JSL   L03B1D8
            LDA   #$0600
            ORA   L0600DC
            PHA
            JSL   L03B1D8
            LDA   #$0001
            STA   L06000E
            JSL   L070000
            LDA   #$0F00
            ORA   L0600DC
            PHA
            JSL   L03B1D8
            PHY
            JSL   L074A31
            PLA
            EOR   #$0001
            AND   #$00FF
            STA   L0600CE
            PEA   $0000
            JSL   L03A0C8
            JSL   L03A621
            JSL   L07494A
            PLY
            PLY
            PLY
            PLY
            PLD
            RTL


