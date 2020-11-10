*
* Your tour of the Apple IIgs
*
* (c) 1989, Apple Computer
* (s) 2020, Antoine Vignau
*

	mx	%00
	rel
	lst	off

*-------------------------------

	use	CTRICKS.X
	
	use	4/Event.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/QD.Macs
	use	4/QDAux.Macs
	use	4/Util.Macs
	
*-------------------------------

L080000  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$FEBE
         TCS
         LDA   #$0001
         STA   L0B00AA
         LDA   $FF
         BRL   L081F5A
L080016  JSL   L0311DD
         JSL   L06063A
         JSL   L0612B1
         LDA   #L0C1A84
         LDX   #^L0C1A84
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF1C
         PHA
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
L08003F  JSL   L083B83
         LDX   #$FF4E
         STA   $00,X
         TAY
         BNE   L080078
         JSL   L0612DE
         TAY
         BNE   L080078
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF1C
         PHA
         PEA   ^L0C1A84
         PEA   L0C1A84
         _EqualPt
         BCS   L08006E
         LDA   #$0000
L08006E  STAL  L0B0002
         PLA
         TAY
         BEQ   L080078
         BRA   L08003F
L080078  LDX   #$FF4E
         LDA   $00,X
         BEQ   L080082
         BRL   L08016E
L080082  JSL   L0612DE
         TAY
         BEQ   L08008C
         BRL   L08016E
L08008C  LDX   #$0000
         LDA   #$0000
         PHA
         TXA
         STAL  L0C2468
         PLA
         STAL  L0C2466
         PEA   $006E
         PEA   $0000
         PEA   $0037
         PEA   $0012
         PEA   $0004
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C246C
         PLA
         STAL  L0C246A
         PEA   $006E
         PEA   $0000
         PEA   $003C
         PEA   $0012
         PEA   $0004
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C2470
         PLA
         STAL  L0C246E
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000A
         PEA   $0004
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C2474
         PLA
         STAL  L0C2472
         LDX   #$0000
         LDA   #$0002
         PHA
         TXA
         STAL  L0C2478
         PLA
         STAL  L0C2476
         LDX   #$FFFF
         LDA   #$FFFF
         PHA
         TXA
         STAL  L0C247C
         PLA
         STAL  L0C247A
         PEA   ^L0C2466
         PEA   L0C2466
         JSL   L0502A4
         PLY
         PLY
         PEA   $0004
         JSL   L06152C
         PLY
         JSL   L0612B1
L080140  JSL   L083B83
         TAY
         BNE   L08016E
         JSL   L0612DE
         TAY
         BNE   L08016E
         PHA
         PEA   $046E
         PEA   ^L0C1A7A
         PEA   L0C1A7A
         _EventAvail
         BCS   L080164
         LDA   #$0000
L080164  STAL  L0B0002
         PLA
         TAY
         BNE   L08016E
         BRA   L080140
L08016E  JSL   L031208
         BRL   L081F68
L080175  JSL   L0311DD
         JSL   L0612B1
         LDX   #$FF4E
         STZ   $00,X
         LDX   #$FF4C
         STZ   $00,X
         LDX   #$FF4A
         STZ   $00,X
L08018C  LDX   #$FF4E
         LDA   $00,X
         BEQ   L080196
         BRL   L080212
L080196  LDX   #$FF4C
         LDA   $00,X
         BEQ   L0801A0
         BRL   L080212
L0801A0  LDX   #$FF4A
         LDA   $00,X
         BEQ   L0801AA
         BRL   L080212
L0801AA  JSL   L083B83
         LDX   #$FF4E
         STA   $00,X
         LDA   #L0C1A84
         LDX   #^L0C1A84
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF18
         PHA
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF18
         PHA
         LDAL  L0C072F
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         _PtInRect
         BCS   L0801FC
         LDA   #$0000
L0801FC  STAL  L0B0002
         PLA
         LDX   #$FF4C
         STA   $00,X
         JSL   L0612DE
         LDX   #$FF4A
         STA   $00,X
         BRL   L08018C
L080212  LDX   #$FF4E
         LDA   $00,X
         BEQ   L08021C
         BRL   L0802D4
L08021C  STZ   L0B0090
         LDX   #$FF4C
         LDA   $00,X
         BNE   L080229
         BRL   L0802C0
L080229  LDAL  L0C072F
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         _InvertRect
         BCS   L08024B
         LDA   #$0000
L08024B  STAL  L0B0002
         PEA   ^L0C2938
         PEA   L0C2938
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
L080263  JSL   L06063A
         PHA
         PEA   ^L0C1A84
         PEA   L0C1A84
         LDAL  L0C072F
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         _PtInRect
         BCS   L080290
         LDA   #$0000
L080290  STAL  L0B0002
         PLA
         TAY
         BNE   L080263
         LDAL  L0C072F
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         _InvertRect
         BCS   L0802BA
         LDA   #$0000
L0802BA  STAL  L0B0002
         BRA   L0802D4
L0802C0  PEA   ^L0C293A
         PEA   L0C293A
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
L0802D4  JSL   L031208
         BRL   L081F68
L0802DB  PEA   ^L0C293C
         PEA   L0C293C
         PEA   $0000
         TDC
         CLC
         ADC   #$FF2A
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF2A
         PHA
         JSL   L040E53
         PLY
         PLY
         LDX   #$FF22
         STA   $00,X
         LDX   #$FF22
         LDA   $00,X
         PHA
         LDA   #$0022
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C1AB2
         LDX   #^L0C1AB2
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDY   #$0004
         LDA   [$F4],Y
         TAX
         LDY   #$0002
         LDA   [$F4],Y
         TXY
         LDX   #$FF26
         STY   $02,X
         STA   $00,X
         TYX
         PEA   $0000
         TDC
         CLC
         ADC   #$FF58
         PHA
         PEA   $0220
         PEA   $0097
         PEA   $0280
         PEA   $00AE
         _SetRect
         BCS   L08035F
         LDA   #$0000
L08035F  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF60
         PHA
         PEA   $0208
         PEA   $0097
         PEA   $0220
         PEA   $00AE
         _SetRect
         BCS   L080384
         LDA   #$0000
L080384  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF68
         PHA
         PEA   $01F0
         PEA   $0097
         PEA   $0208
         PEA   $00AE
         _SetRect
         BCS   L0803A9
         LDA   #$0000
L0803A9  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF70
         PHA
         PEA   $01D6
         PEA   $0097
         PEA   $01F0
         PEA   $00AE
         _SetRect
         BCS   L0803CE
         LDA   #$0000
L0803CE  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF78
         PHA
         PEA   $01C2
         PEA   $0094
         PEA   $01D6
         PEA   $00AE
         _SetRect
         BCS   L0803F3
         LDA   #$0000
L0803F3  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF80
         PHA
         PEA   $01AA
         PEA   $0091
         PEA   $01C2
         PEA   $00AE
         _SetRect
         BCS   L080418
         LDA   #$0000
L080418  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF88
         PHA
         PEA   $019E
         PEA   $0090
         PEA   $01AA
         PEA   $00AE
         _SetRect
         BCS   L08043D
         LDA   #$0000
L08043D  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF90
         PHA
         PEA   $0190
         PEA   $008D
         PEA   $019E
         PEA   $00AC
         _SetRect
         BCS   L080462
         LDA   #$0000
L080462  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF98
         PHA
         PEA   $016C
         PEA   $008A
         PEA   $0190
         PEA   $00A9
         _SetRect
         BCS   L080487
         LDA   #$0000
L080487  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA0
         PHA
         PEA   $0154
         PEA   $008A
         PEA   $016C
         PEA   $00A7
         _SetRect
         BCS   L0804AC
         LDA   #$0000
L0804AC  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA8
         PHA
         PEA   $0144
         PEA   $0088
         PEA   $0154
         PEA   $00A5
         _SetRect
         BCS   L0804D1
         LDA   #$0000
L0804D1  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FFB0
         PHA
         PEA   $012A
         PEA   $0088
         PEA   $0144
         PEA   $00A3
         _SetRect
         BCS   L0804F6
         LDA   #$0000
L0804F6  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FFB8
         PHA
         PEA   $011A
         PEA   $0088
         PEA   $012A
         PEA   $00A1
         _SetRect
         BCS   L08051B
         LDA   #$0000
L08051B  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC0
         PHA
         PEA   $0102
         PEA   $0088
         PEA   $011A
         PEA   $009F
         _SetRect
         BCS   L080540
         LDA   #$0000
L080540  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC8
         PHA
         PEA   $00F0
         PEA   $0086
         PEA   $0102
         PEA   $009F
         _SetRect
         BCS   L080565
         LDA   #$0000
L080565  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD0
         PHA
         PEA   $00D8
         PEA   $0086
         PEA   $00F0
         PEA   $009F
         _SetRect
         BCS   L08058A
         LDA   #$0000
L08058A  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD8
         PHA
         PEA   $00C6
         PEA   $0086
         PEA   $00D8
         PEA   $009F
         _SetRect
         BCS   L0805AF
         LDA   #$0000
L0805AF  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE0
         PHA
         PEA   $00AC
         PEA   $0089
         PEA   $00C6
         PEA   $009F
         _SetRect
         BCS   L0805D4
         LDA   #$0000
L0805D4  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE8
         PHA
         PEA   $0094
         PEA   $0089
         PEA   $00AC
         PEA   $009F
         _SetRect
         BCS   L0805F9
         LDA   #$0000
L0805F9  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF0
         PHA
         PEA   $0000
         PEA   $005E
         PEA   $0094
         PEA   $009F
         _SetRect
         BCS   L08061E
         LDA   #$0000
L08061E  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC4
         PHA
         PEA   $01E0
         PEA   $0098
         _SetPt
         BCS   L08063D
         LDA   #$0000
L08063D  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC8
         PHA
         PEA   $01CE
         PEA   $0098
         _SetPt
         BCS   L08065C
         LDA   #$0000
L08065C  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FECC
         PHA
         PEA   $01B6
         PEA   $0098
         _SetPt
         BCS   L08067B
         LDA   #$0000
L08067B  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FED0
         PHA
         PEA   $01A0
         PEA   $0095
         _SetPt
         BCS   L08069A
         LDA   #$0000
L08069A  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FED4
         PHA
         PEA   $0188
         PEA   $0092
         _SetPt
         BCS   L0806B9
         LDA   #$0000
L0806B9  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FED8
         PHA
         PEA   $017A
         PEA   $0092
         _SetPt
         BCS   L0806D8
         LDA   #$0000
L0806D8  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEDC
         PHA
         PEA   $0170
         PEA   $008F
         _SetPt
         BCS   L0806F7
         LDA   #$0000
L0806F7  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE0
         PHA
         PEA   $014A
         PEA   $008C
         _SetPt
         BCS   L080716
         LDA   #$0000
L080716  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE4
         PHA
         PEA   $0134
         PEA   $008C
         _SetPt
         BCS   L080735
         LDA   #$0000
L080735  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE8
         PHA
         PEA   $0124
         PEA   $008A
         _SetPt
         BCS   L080754
         LDA   #$0000
L080754  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEEC
         PHA
         PEA   $010C
         PEA   $0088
         _SetPt
         BCS   L080773
         LDA   #$0000
L080773  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEF0
         PHA
         PEA   $00FA
         PEA   $008A
         _SetPt
         BCS   L080792
         LDA   #$0000
L080792  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEF4
         PHA
         PEA   $00E2
         PEA   $008A
         _SetPt
         BCS   L0807B1
         LDA   #$0000
L0807B1  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEF8
         PHA
         PEA   $00D0
         PEA   $0088
         _SetPt
         BCS   L0807D0
         LDA   #$0000
L0807D0  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEFC
         PHA
         PEA   $00B8
         PEA   $0088
         _SetPt
         BCS   L0807EF
         LDA   #$0000
L0807EF  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF00
         PHA
         PEA   $00A6
         PEA   $0086
         _SetPt
         BCS   L08080E
         LDA   #$0000
L08080E  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF04
         PHA
         PEA   $008E
         PEA   $0086
         _SetPt
         BCS   L08082D
         LDA   #$0000
L08082D  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF08
         PHA
         PEA   $008E
         PEA   $0086
         _SetPt
         BCS   L08084C
         LDA   #$0000
L08084C  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF0C
         PHA
         PEA   $008E
         PEA   $0089
         _SetPt
         BCS   L08086B
         LDA   #$0000
L08086B  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$004C
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0082
         PEA   $0011
         _SetRect
         BCS   L080890
         LDA   #$0000
L080890  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$0054
         PHA
         PEA   $0084
         PEA   $0000
         PEA   $0118
         PEA   $0011
         _SetRect
         BCS   L0808B5
         LDA   #$0000
L0808B5  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$005C
         PHA
         PEA   $011A
         PEA   $0000
         PEA   $01AE
         PEA   $0011
         _SetRect
         BCS   L0808DA
         LDA   #$0000
L0808DA  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$0064
         PHA
         PEA   $01B0
         PEA   $0000
         PEA   $0246
         PEA   $0014
         _SetRect
         BCS   L0808FF
         LDA   #$0000
L0808FF  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$006C
         PHA
         PEA   $0000
         PEA   $0011
         PEA   $0098
         PEA   $0028
         _SetRect
         BCS   L080924
         LDA   #$0000
L080924  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$0074
         PHA
         PEA   $009A
         PEA   $0011
         PEA   $012C
         PEA   $0028
         _SetRect
         BCS   L080949
         LDA   #$0000
L080949  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$007C
         PHA
         PEA   $012E
         PEA   $0014
         PEA   $01B4
         PEA   $002D
         _SetRect
         BCS   L08096E
         LDA   #$0000
L08096E  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$0084
         PHA
         PEA   $01B6
         PEA   $0014
         PEA   $024E
         PEA   $0030
         _SetRect
         BCS   L080993
         LDA   #$0000
L080993  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$008C
         PHA
         PEA   $0000
         PEA   $0028
         PEA   $009A
         PEA   $0044
         _SetRect
         BCS   L0809B8
         LDA   #$0000
L0809B8  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$0094
         PHA
         PEA   $009C
         PEA   $0028
         PEA   $0122
         PEA   $0041
         _SetRect
         BCS   L0809DD
         LDA   #$0000
L0809DD  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$009C
         PHA
         PEA   $0124
         PEA   $002D
         PEA   $01B0
         PEA   $0045
         _SetRect
         BCS   L080A02
         LDA   #$0000
L080A02  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00A4
         PHA
         PEA   $01B2
         PEA   $0030
         PEA   $0244
         PEA   $0041
         _SetRect
         BCS   L080A27
         LDA   #$0000
L080A27  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00AC
         PHA
         PEA   $0000
         PEA   $0045
         PEA   $0094
         PEA   $0056
         _SetRect
         BCS   L080A4C
         LDA   #$0000
L080A4C  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00B4
         PHA
         PEA   $0096
         PEA   $0045
         PEA   $0128
         PEA   $0058
         _SetRect
         BCS   L080A71
         LDA   #$0000
L080A71  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00BC
         PHA
         PEA   $012A
         PEA   $0045
         PEA   $01BE
         PEA   $0058
         _SetRect
         BCS   L080A96
         LDA   #$0000
L080A96  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00C4
         PHA
         PEA   $006E
         PEA   $006F
         PEA   $0100
         PEA   $0082
         _SetRect
         BCS   L080ABB
         LDA   #$0000
L080ABB  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00CC
         PHA
         PEA   $0000
         PEA   $0058
         PEA   $0094
         PEA   $006F
         _SetRect
         BCS   L080AE0
         LDA   #$0000
L080AE0  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00D4
         PHA
         PEA   $0096
         PEA   $0058
         PEA   $0118
         PEA   $006F
         _SetRect
         BCS   L080B05
         LDA   #$0000
L080B05  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00DC
         PHA
         PEA   $011A
         PEA   $0058
         PEA   $016C
         PEA   $006C
         _SetRect
         BCS   L080B2A
         LDA   #$0000
L080B2A  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF50
         PHA
         PEA   $0013
         PEA   $0000
         TDC
         CLC
         ADC   #$0044
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC0
         PHA
         LDX   #$FF28
         LDA   $00,X
         TAX
         PHX
         LDX   #$FF26
         LDA   $00,X
         PHA
         JSL   L081F70
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         BRL   L081F68
L080B68  PEA   ^L0C2947
         PEA   L0C2947
         PEA   $0000
         TDC
         CLC
         ADC   #$FF2A
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF2A
         PHA
         JSL   L040E53
         PLY
         PLY
         LDX   #$FF22
         STA   $00,X
         LDX   #$FF22
         LDA   $00,X
         PHA
         LDA   #$0022
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C1AB2
         LDX   #^L0C1AB2
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDY   #$0004
         LDA   [$F4],Y
         TAX
         LDY   #$0002
         LDA   [$F4],Y
         TXY
         LDX   #$FF26
         STY   $02,X
         STA   $00,X
         TYX
         PEA   $0000
         TDC
         CLC
         ADC   #$FF58
         PHA
         PEA   $0064
         PEA   $0049
         PEA   $00BC
         PEA   $006E
         _SetRect
         BCS   L080BEC
         LDA   #$0000
L080BEC  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF60
         PHA
         PEA   $00BC
         PEA   $0059
         PEA   $00D4
         PEA   $006E
         _SetRect
         BCS   L080C11
         LDA   #$0000
L080C11  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF68
         PHA
         PEA   $00D4
         PEA   $0059
         PEA   $00F0
         PEA   $006E
         _SetRect
         BCS   L080C36
         LDA   #$0000
L080C36  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF70
         PHA
         PEA   $00F0
         PEA   $0059
         PEA   $0104
         PEA   $006E
         _SetRect
         BCS   L080C5B
         LDA   #$0000
L080C5B  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF78
         PHA
         PEA   $0104
         PEA   $0058
         PEA   $012E
         PEA   $006E
         _SetRect
         BCS   L080C80
         LDA   #$0000
L080C80  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC4
         PHA
         PEA   $005A
         PEA   $005A
         _SetPt
         BCS   L080C9F
         LDA   #$0000
L080C9F  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC8
         PHA
         PEA   $0072
         PEA   $005B
         _SetPt
         BCS   L080CBE
         LDA   #$0000
L080CBE  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FECC
         PHA
         PEA   $008C
         PEA   $0058
         _SetPt
         BCS   L080CDD
         LDA   #$0000
L080CDD  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FED0
         PHA
         PEA   $00A6
         PEA   $0058
         _SetPt
         BCS   L080CFC
         LDA   #$0000
L080CFC  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$004C
         PHA
         PEA   $00BC
         PEA   $0000
         PEA   $0156
         PEA   $0023
         _SetRect
         BCS   L080D21
         LDA   #$0000
L080D21  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$0054
         PHA
         PEA   $00BA
         PEA   $0023
         PEA   $0158
         PEA   $0035
         _SetRect
         BCS   L080D46
         LDA   #$0000
L080D46  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$005C
         PHA
         PEA   $009C
         PEA   $0038
         PEA   $0150
         PEA   $004C
         _SetRect
         BCS   L080D6B
         LDA   #$0000
L080D6B  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$0064
         PHA
         PEA   $0000
         PEA   $0058
         PEA   $009A
         PEA   $006C
         _SetRect
         BCS   L080D90
         LDA   #$0000
L080D90  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF50
         PHA
         PEA   $0004
         PEA   $0000
         TDC
         CLC
         ADC   #$0044
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC0
         PHA
         LDX   #$FF28
         LDA   $00,X
         TAX
         PHX
         LDX   #$FF26
         LDA   $00,X
         PHA
         JSL   L081F70
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         BRL   L081F68
L080DCE  JSL   L0827A6
         BRL   L081F68
L080DD5  PEA   ^L0C2952
         PEA   L0C2952
         PEA   $0000
         TDC
         CLC
         ADC   #$FF2A
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF2A
         PHA
         JSL   L040E53
         PLY
         PLY
         LDX   #$FF22
         STA   $00,X
         LDX   #$FF22
         LDA   $00,X
         PHA
         LDA   #$0022
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C1AB2
         LDX   #^L0C1AB2
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDY   #$0004
         LDA   [$F4],Y
         TAX
         LDY   #$0002
         LDA   [$F4],Y
         TXY
         LDX   #$FF26
         STY   $02,X
         STA   $00,X
         TYX
         PEA   $0000
         TDC
         CLC
         ADC   #$FF58
         PHA
         PEA   $00E6
         PEA   $005A
         PEA   $014E
         PEA   $0070
         _SetRect
         BCS   L080E59
         LDA   #$0000
L080E59  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF60
         PHA
         PEA   $014E
         PEA   $005A
         PEA   $0166
         PEA   $0074
         _SetRect
         BCS   L080E7E
         LDA   #$0000
L080E7E  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF68
         PHA
         PEA   $0166
         PEA   $005C
         PEA   $017E
         PEA   $0077
         _SetRect
         BCS   L080EA3
         LDA   #$0000
L080EA3  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF70
         PHA
         PEA   $017E
         PEA   $005E
         PEA   $0196
         PEA   $007D
         _SetRect
         BCS   L080EC8
         LDA   #$0000
L080EC8  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF78
         PHA
         PEA   $0196
         PEA   $0063
         PEA   $01A8
         PEA   $0081
         _SetRect
         BCS   L080EED
         LDA   #$0000
L080EED  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF80
         PHA
         PEA   $01A8
         PEA   $006A
         PEA   $01C4
         PEA   $0086
         _SetRect
         BCS   L080F12
         LDA   #$0000
L080F12  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF88
         PHA
         PEA   $01C4
         PEA   $006C
         PEA   $01DA
         PEA   $0086
         _SetRect
         BCS   L080F37
         LDA   #$0000
L080F37  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF90
         PHA
         PEA   $01DA
         PEA   $006D
         PEA   $01F6
         PEA   $0086
         _SetRect
         BCS   L080F5C
         LDA   #$0000
L080F5C  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF98
         PHA
         PEA   $01F6
         PEA   $005D
         PEA   $0226
         PEA   $0080
         _SetRect
         BCS   L080F81
         LDA   #$0000
L080F81  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA0
         PHA
         PEA   $01F4
         PEA   $0054
         PEA   $0226
         PEA   $005D
         _SetRect
         BCS   L080FA6
         LDA   #$0000
L080FA6  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA8
         PHA
         PEA   $01F4
         PEA   $004D
         PEA   $0226
         PEA   $0054
         _SetRect
         BCS   L080FCB
         LDA   #$0000
L080FCB  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FFB0
         PHA
         PEA   $01F4
         PEA   $0047
         PEA   $0226
         PEA   $004D
         _SetRect
         BCS   L080FF0
         LDA   #$0000
L080FF0  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FFB8
         PHA
         PEA   $01F4
         PEA   $0000
         PEA   $0226
         PEA   $0047
         _SetRect
         BCS   L081015
         LDA   #$0000
L081015  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC4
         PHA
         PEA   $0104
         PEA   $005B
         _SetPt
         BCS   L081034
         LDA   #$0000
L081034  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC8
         PHA
         PEA   $0104
         PEA   $005B
         _SetPt
         BCS   L081053
         LDA   #$0000
L081053  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FECC
         PHA
         PEA   $011E
         PEA   $005B
         _SetPt
         BCS   L081072
         LDA   #$0000
L081072  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FED0
         PHA
         PEA   $0136
         PEA   $005F
         _SetPt
         BCS   L081091
         LDA   #$0000
L081091  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FED4
         PHA
         PEA   $0150
         PEA   $0062
         _SetPt
         BCS   L0810B0
         LDA   #$0000
L0810B0  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FED8
         PHA
         PEA   $0166
         PEA   $0068
         _SetPt
         BCS   L0810CF
         LDA   #$0000
L0810CF  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEDC
         PHA
         PEA   $017E
         PEA   $006C
         _SetPt
         BCS   L0810EE
         LDA   #$0000
L0810EE  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE0
         PHA
         PEA   $0194
         PEA   $004D
         _SetPt
         BCS   L08110D
         LDA   #$0000
L08110D  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE4
         PHA
         PEA   $01AE
         PEA   $0048
         _SetPt
         BCS   L08112C
         LDA   #$0000
L08112C  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE8
         PHA
         PEA   $01F8
         PEA   $003F
         _SetPt
         BCS   L08114B
         LDA   #$0000
L08114B  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEEC
         PHA
         PEA   $01F8
         PEA   $003C
         _SetPt
         BCS   L08116A
         LDA   #$0000
L08116A  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEF0
         PHA
         PEA   $01F8
         PEA   $0036
         _SetPt
         BCS   L081189
         LDA   #$0000
L081189  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$004C
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0082
         PEA   $0011
         _SetRect
         BCS   L0811AE
         LDA   #$0000
L0811AE  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$0054
         PHA
         PEA   $0084
         PEA   $0000
         PEA   $0120
         PEA   $0015
         _SetRect
         BCS   L0811D3
         LDA   #$0000
L0811D3  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$005C
         PHA
         PEA   $0122
         PEA   $0000
         PEA   $01A8
         PEA   $001C
         _SetRect
         BCS   L0811F8
         LDA   #$0000
L0811F8  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$0064
         PHA
         PEA   $01AA
         PEA   $0000
         PEA   $023E
         PEA   $001B
         _SetRect
         BCS   L08121D
         LDA   #$0000
L08121D  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$006C
         PHA
         PEA   $0000
         PEA   $0011
         PEA   $0080
         PEA   $0030
         _SetRect
         BCS   L081242
         LDA   #$0000
L081242  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$0074
         PHA
         PEA   $0082
         PEA   $0015
         PEA   $0118
         PEA   $002E
         _SetRect
         BCS   L081267
         LDA   #$0000
L081267  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$007C
         PHA
         PEA   $011A
         PEA   $001C
         PEA   $01B8
         PEA   $0031
         _SetRect
         BCS   L08128C
         LDA   #$0000
L08128C  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$0084
         PHA
         PEA   $0000
         PEA   $0030
         PEA   $008E
         PEA   $0064
         _SetRect
         BCS   L0812B1
         LDA   #$0000
L0812B1  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$008C
         PHA
         PEA   $0090
         PEA   $002E
         PEA   $0104
         PEA   $0067
         _SetRect
         BCS   L0812D6
         LDA   #$0000
L0812D6  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$0094
         PHA
         PEA   $01BA
         PEA   $001B
         PEA   $01E4
         PEA   $005C
         _SetRect
         BCS   L0812FB
         LDA   #$0000
L0812FB  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$009C
         PHA
         PEA   $01E6
         PEA   $001B
         PEA   $0210
         PEA   $0056
         _SetRect
         BCS   L081320
         LDA   #$0000
L081320  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00A4
         PHA
         PEA   $0212
         PEA   $001B
         PEA   $023C
         PEA   $0056
         _SetRect
         BCS   L081345
         LDA   #$0000
L081345  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF50
         PHA
         PEA   $000C
         PEA   $0000
         TDC
         CLC
         ADC   #$0044
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC0
         PHA
         LDX   #$FF28
         LDA   $00,X
         TAX
         PHX
         LDX   #$FF26
         LDA   $00,X
         PHA
         JSL   L081F70
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         BRL   L081F68
L081383  LDX   #$FF24
         STZ   $00,X
         LDX   #$FF4E
         STZ   $00,X
         LDX   #$FF4C
         STZ   $00,X
         LDX   #$FF4A
         STZ   $00,X
L081397  JSL   L0311DD
         PEA   $0001
         JSL   L06078F
         PLY
         LDA   L0B0078
         CMP   #$0002
         BNE   L0813AE
         BRL   L08162E
L0813AE  LDA   L0B0078
         SEC
         SBC   #$0000
         BVS   L0813BA
         EOR   #$8000
L0813BA  BPL   L0813BF
         BRL   L08162C
L0813BF  LDA   L0B0078
         CMP   #$FFFF
         BEQ   L0813CA
         BRL   L081430
L0813CA  LDAL  L0C0747
         PHA
         PEA   $000A
         JSL   L0251CD
         PLY
         PLY
         LDAL  L0C0749
         PHA
         PEA   $000B
         JSL   L0251CD
         PLY
         PLY
         PEA   $0001
         PEA   $0001
         JSL   L0312C8
         PLY
         PLY
         LDAL  L0C1188
         AND   #$00FF
         CMP   #$0031
         BNE   L08142D
         LDA   #$0001
         LDX   #$FF4E
         STA   $00,X
         PEA   ^L0C0EFA
         PEA   L0C0EFA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _SetRect
         BCS   L081424
         LDA   #$0000
L081424  STAL  L0B0002
         LDX   #$FF24
         INC   $00,X
L08142D  BRL   L08150F
L081430  LDA   L0B0078
         CMP   #$FFFE
         BEQ   L08143B
         BRL   L0814A1
L08143B  LDAL  L0C074B
         PHA
         PEA   $000A
         JSL   L0251CD
         PLY
         PLY
         LDAL  L0C074D
         PHA
         PEA   $000B
         JSL   L0251CD
         PLY
         PLY
         PEA   $0001
         PEA   $0001
         JSL   L0312C8
         PLY
         PLY
         LDAL  L0C1188
         AND   #$00FF
         CMP   #$0031
         BNE   L08149E
         LDA   #$0001
         LDX   #$FF4C
         STA   $00,X
         PEA   ^L0C0F02
         PEA   L0C0F02
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _SetRect
         BCS   L081495
         LDA   #$0000
L081495  STAL  L0B0002
         LDX   #$FF24
         INC   $00,X
L08149E  BRL   L08150F
L0814A1  LDA   L0B0078
         CMP   #$FFFD
         BEQ   L0814AC
         BRL   L08150F
L0814AC  LDAL  L0C074F
         PHA
         PEA   $000A
         JSL   L0251CD
         PLY
         PLY
         LDAL  L0C0751
         PHA
         PEA   $000B
         JSL   L0251CD
         PLY
         PLY
         PEA   $0001
         PEA   $0001
         JSL   L0312C8
         PLY
         PLY
         LDAL  L0C1188
         AND   #$00FF
         CMP   #$0031
         BNE   L08150F
         LDA   #$0001
         LDX   #$FF4A
         STA   $00,X
         PEA   ^L0C0F0A
         PEA   L0C0F0A
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _SetRect
         BCS   L081506
         LDA   #$0000
L081506  STAL  L0B0002
         LDX   #$FF24
         INC   $00,X
L08150F  LDX   #$FF24
         LDA   $00,X
         BNE   L081519
         BRL   L08162C
L081519  LDX   #$FF24
         LDA   $00,X
         SEC
         SBC   #$0003
         BVS   L081527
         EOR   #$8000
L081527  BPL   L08152C
         BRL   L08162C
L08152C  LDAL  L0C1188
         AND   #$00FF
         CMP   #$0031
         BEQ   L08153B
         BRL   L08162C
L08153B  LDX   #$0000
         LDA   #$0000
         PHA
         TXA
         STAL  L0C2468
         PLA
         STAL  L0C2466
         PEA   $0078
         PEA   $0000
         PEA   $0037
         PEA   $0012
         PEA   $0004
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C246C
         PLA
         STAL  L0C246A
         PEA   $0078
         PEA   $0000
         PEA   $003C
         PEA   $0012
         PEA   $0004
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C2470
         PLA
         STAL  L0C246E
         PEA   $006E
         PEA   $0000
         PEA   $0000
         PEA   $000A
         PEA   $0004
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C2474
         PLA
         STAL  L0C2472
         LDX   #$0000
         LDA   #$0002
         PHA
         TXA
         STAL  L0C2478
         PLA
         STAL  L0C2476
         LDX   #$FFFF
         LDA   #$FFFF
         PHA
         TXA
         STAL  L0C247C
         PLA
         STAL  L0C247A
         LDX   #$FF24
         LDA   $00,X
         CMP   #$0002
         BEQ   L0815E4
         BRL   L081620
L0815E4  LDAL  L0C246C
         TAX
         LDAL  L0C246A
         PHA
         TXA
         STAL  L0C2480
         PLA
         STAL  L0C247E
         LDAL  L0C2470
         TAX
         LDAL  L0C246E
         PHA
         TXA
         STAL  L0C246C
         PLA
         STAL  L0C246A
         LDAL  L0C2480
         TAX
         LDAL  L0C247E
         PHA
         TXA
         STAL  L0C2470
         PLA
         STAL  L0C246E
L081620  PEA   ^L0C2466
         PEA   L0C2466
         JSL   L0502A4
         PLY
         PLY
L08162C  BRA   L081646
L08162E  LDA   #$0001
         LDX   #$FF4E
         STA   $00,X
         LDA   #$0001
         LDX   #$FF4C
         STA   $00,X
         LDA   #$0001
         LDX   #$FF4A
         STA   $00,X
L081646  LDX   #$FF4E
         LDA   $00,X
         BNE   L081650
         BRL   L081397
L081650  LDX   #$FF4C
         LDA   $00,X
         BNE   L08165A
         BRL   L081397
L08165A  LDX   #$FF4A
         LDA   $00,X
         BNE   L081664
         BRL   L081397
L081664  JSL   L031208
         BRL   L081F68
L08166B  PEA   ^L0C295D
         PEA   L0C295D
         PEA   $0000
         TDC
         CLC
         ADC   #$FF2A
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF2A
         PHA
         JSL   L040E53
         PLY
         PLY
         LDX   #$FF22
         STA   $00,X
         LDX   #$FF22
         LDA   $00,X
         PHA
         LDA   #$0022
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C1AB2
         LDX   #^L0C1AB2
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDY   #$0004
         LDA   [$F4],Y
         TAX
         LDY   #$0002
         LDA   [$F4],Y
         TXY
         LDX   #$FF26
         STY   $02,X
         STA   $00,X
         TYX
         PEA   $0000
         TDC
         CLC
         ADC   #$FF58
         PHA
         PEA   $01C2
         PEA   $0033
         PEA   $0216
         PEA   $0049
         _SetRect
         BCS   L0816EF
         LDA   #$0000
L0816EF  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF60
         PHA
         PEA   $01AC
         PEA   $0033
         PEA   $01C2
         PEA   $0047
         _SetRect
         BCS   L081714
         LDA   #$0000
L081714  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF68
         PHA
         PEA   $019A
         PEA   $002D
         PEA   $01AC
         PEA   $0047
         _SetRect
         BCS   L081739
         LDA   #$0000
L081739  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF70
         PHA
         PEA   $018E
         PEA   $002A
         PEA   $019A
         PEA   $0047
         _SetRect
         BCS   L08175E
         LDA   #$0000
L08175E  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF78
         PHA
         PEA   $016C
         PEA   $0028
         PEA   $018E
         PEA   $0040
         _SetRect
         BCS   L081783
         LDA   #$0000
L081783  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF80
         PHA
         PEA   $00C8
         PEA   $0024
         PEA   $016C
         PEA   $0040
         _SetRect
         BCS   L0817A8
         LDA   #$0000
L0817A8  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC4
         PHA
         PEA   $0186
         PEA   $0033
         _SetPt
         BCS   L0817C7
         LDA   #$0000
L0817C7  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC8
         PHA
         PEA   $0174
         PEA   $002D
         _SetPt
         BCS   L0817E6
         LDA   #$0000
L0817E6  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FECC
         PHA
         PEA   $0168
         PEA   $002A
         _SetPt
         BCS   L081805
         LDA   #$0000
L081805  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FED0
         PHA
         PEA   $014A
         PEA   $0029
         _SetPt
         BCS   L081824
         LDA   #$0000
L081824  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FED4
         PHA
         PEA   $0146
         PEA   $0024
         _SetPt
         BCS   L081843
         LDA   #$0000
L081843  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$004C
         PHA
         PEA   $0000
         PEA   $0051
         PEA   $0094
         PEA   $0071
         _SetRect
         BCS   L081868
         LDA   #$0000
L081868  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$0054
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0094
         PEA   $001B
         _SetRect
         BCS   L08188D
         LDA   #$0000
L08188D  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$005C
         PHA
         PEA   $0096
         PEA   $0000
         PEA   $0122
         PEA   $001E
         _SetRect
         BCS   L0818B2
         LDA   #$0000
L0818B2  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$0064
         PHA
         PEA   $0124
         PEA   $0000
         PEA   $01B2
         PEA   $001E
         _SetRect
         BCS   L0818D7
         LDA   #$0000
L0818D7  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$006C
         PHA
         PEA   $01DC
         PEA   $0000
         PEA   $0260
         PEA   $0023
         _SetRect
         BCS   L0818FC
         LDA   #$0000
L0818FC  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF50
         PHA
         PEA   $0005
         PEA   $0000
         TDC
         CLC
         ADC   #$0044
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC0
         PHA
         LDX   #$FF28
         LDA   $00,X
         TAX
         PHX
         LDX   #$FF26
         LDA   $00,X
         PHA
         JSL   L081F70
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         BRL   L081F68
L08193A  PEA   $0000
         TDC
         CLC
         ADC   #$0044
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC0
         PHA
         JSL   L0822DC
         PLY
         PLY
         PLY
         PLY
         BRL   L081F68
L081957  JSL   L0311DD
         JSL   L0612B1
         LDA   #$0001
         STA   L0B00C7
         LDA   #$0004
         STA   L0B0080
         PEA   ^L0C2968
         PEA   L0C2968
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDAL  L0C072F
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDA   $F4
         LDX   $F6
         TAY
         TSC
         SEC
         SBC   #$0008
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0008
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         PEA   $0000
         JSL   L060C20
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         JSL   L04169A
         TAY
         BEQ   L0819D5
         BRL   L081A24
L0819D5  JSL   L0612DE
         TAY
         BEQ   L0819DF
         BRL   L081A24
L0819DF  PHA
         PEA   ^L0C1A84
         PEA   L0C1A84
         LDAL  L0C072F
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         _PtInRect
         BCS   L081A08
         LDA   #$0000
L081A08  STAL  L0B0002
         PLA
         TAY
         BEQ   L081A24
         PEA   ^L0C296A
         PEA   L0C296A
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
L081A24  JSL   L031208
         STZ   L0B00C7
         BRL   L081F68
L081A2E  PEA   ^L0C296C
         PEA   L0C296C
         PEA   $0000
         TDC
         CLC
         ADC   #$FF2A
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF2A
         PHA
         JSL   L040E53
         PLY
         PLY
         LDX   #$FF22
         STA   $00,X
         LDX   #$FF22
         LDA   $00,X
         PHA
         LDA   #$0022
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C1AB2
         LDX   #^L0C1AB2
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDY   #$0004
         LDA   [$F4],Y
         TAX
         LDY   #$0002
         LDA   [$F4],Y
         TXY
         LDX   #$FF26
         STY   $02,X
         STA   $00,X
         TYX
         PEA   $0000
         TDC
         CLC
         ADC   #$FF58
         PHA
         PEA   $015C
         PEA   $0028
         PEA   $019A
         PEA   $003C
         _SetRect
         BCS   L081AB2
         LDA   #$0000
L081AB2  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF60
         PHA
         PEA   $0144
         PEA   $0027
         PEA   $015C
         PEA   $0039
         _SetRect
         BCS   L081AD7
         LDA   #$0000
L081AD7  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF68
         PHA
         PEA   $012E
         PEA   $0023
         PEA   $0144
         PEA   $0039
         _SetRect
         BCS   L081AFC
         LDA   #$0000
L081AFC  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF70
         PHA
         PEA   $0116
         PEA   $0021
         PEA   $012E
         PEA   $0039
         _SetRect
         BCS   L081B21
         LDA   #$0000
L081B21  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF78
         PHA
         PEA   $0102
         PEA   $001D
         PEA   $0116
         PEA   $0039
         _SetRect
         BCS   L081B46
         LDA   #$0000
L081B46  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF80
         PHA
         PEA   $00F4
         PEA   $001A
         PEA   $0102
         PEA   $0037
         _SetRect
         BCS   L081B6B
         LDA   #$0000
L081B6B  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF88
         PHA
         PEA   $00DA
         PEA   $0016
         PEA   $00F4
         PEA   $0035
         _SetRect
         BCS   L081B90
         LDA   #$0000
L081B90  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF90
         PHA
         PEA   $00BA
         PEA   $0016
         PEA   $00DA
         PEA   $0035
         _SetRect
         BCS   L081BB5
         LDA   #$0000
L081BB5  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF98
         PHA
         PEA   $0064
         PEA   $0016
         PEA   $00BA
         PEA   $0035
         _SetRect
         BCS   L081BDA
         LDA   #$0000
L081BDA  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC4
         PHA
         PEA   $0122
         PEA   $0021
         _SetPt
         BCS   L081BF9
         LDA   #$0000
L081BF9  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC8
         PHA
         PEA   $010A
         PEA   $0021
         _SetPt
         BCS   L081C18
         LDA   #$0000
L081C18  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FECC
         PHA
         PEA   $00F0
         PEA   $0022
         _SetPt
         BCS   L081C37
         LDA   #$0000
L081C37  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FED0
         PHA
         PEA   $00DC
         PEA   $001D
         _SetPt
         BCS   L081C56
         LDA   #$0000
L081C56  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FED4
         PHA
         PEA   $00D2
         PEA   $001A
         _SetPt
         BCS   L081C75
         LDA   #$0000
L081C75  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FED8
         PHA
         PEA   $00B2
         PEA   $0016
         _SetPt
         BCS   L081C94
         LDA   #$0000
L081C94  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEDC
         PHA
         PEA   $0098
         PEA   $0016
         _SetPt
         BCS   L081CB3
         LDA   #$0000
L081CB3  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE0
         PHA
         PEA   $0098
         PEA   $0016
         _SetPt
         BCS   L081CD2
         LDA   #$0000
L081CD2  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$004C
         PHA
         PEA   $00CA
         PEA   $001E
         PEA   $0146
         PEA   $003A
         _SetRect
         BCS   L081CF7
         LDA   #$0000
L081CF7  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$0054
         PHA
         PEA   $0148
         PEA   $001E
         PEA   $01DC
         PEA   $003A
         _SetRect
         BCS   L081D1C
         LDA   #$0000
L081D1C  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$005C
         PHA
         PEA   $01DE
         PEA   $0023
         PEA   $027C
         PEA   $0039
         _SetRect
         BCS   L081D41
         LDA   #$0000
L081D41  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$0064
         PHA
         PEA   $0000
         PEA   $0037
         PEA   $009A
         PEA   $0051
         _SetRect
         BCS   L081D66
         LDA   #$0000
L081D66  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$006C
         PHA
         PEA   $009C
         PEA   $003A
         PEA   $012A
         PEA   $0057
         _SetRect
         BCS   L081D8B
         LDA   #$0000
L081D8B  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$0074
         PHA
         PEA   $012C
         PEA   $003A
         PEA   $01BA
         PEA   $005B
         _SetRect
         BCS   L081DB0
         LDA   #$0000
L081DB0  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$007C
         PHA
         PEA   $01BC
         PEA   $003A
         PEA   $0258
         PEA   $005B
         _SetRect
         BCS   L081DD5
         LDA   #$0000
L081DD5  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$0084
         PHA
         PEA   $0096
         PEA   $0057
         PEA   $0112
         PEA   $0071
         _SetRect
         BCS   L081DFA
         LDA   #$0000
L081DFA  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF50
         PHA
         PEA   $0008
         PEA   $0000
         TDC
         CLC
         ADC   #$0044
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC0
         PHA
         LDX   #$FF28
         LDA   $00,X
         TAX
         PHX
         LDX   #$FF26
         LDA   $00,X
         PHA
         JSL   L081F70
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         BRL   L081F68
L081E38  PEA   $0000
         PEA   $0001
         JSL   L031233
         PLY
         PLY
         BRL   L081F68
L081E47  JSL   L0311DD
         JSL   L0612B1
         LDX   #$FF4E
         STZ   $00,X
         LDX   #$FF4C
         STZ   $00,X
         LDX   #$FF4A
         STZ   $00,X
L081E5E  LDX   #$FF4E
         LDA   $00,X
         BEQ   L081E68
         BRL   L081EE4
L081E68  LDX   #$FF4C
         LDA   $00,X
         BEQ   L081E72
         BRL   L081EE4
L081E72  LDX   #$FF4A
         LDA   $00,X
         BEQ   L081E7C
         BRL   L081EE4
L081E7C  JSL   L083B83
         LDX   #$FF4E
         STA   $00,X
         LDA   #L0C1A84
         LDX   #^L0C1A84
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF18
         PHA
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF18
         PHA
         LDAL  L0C072F
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         _PtInRect
         BCS   L081ECE
         LDA   #$0000
L081ECE  STAL  L0B0002
         PLA
         LDX   #$FF4C
         STA   $00,X
         JSL   L0612DE
         LDX   #$FF4A
         STA   $00,X
         BRL   L081E5E
L081EE4  LDX   #$FF4E
         LDA   $00,X
         BEQ   L081EEE
         BRL   L081F22
L081EEE  STZ   L0B0090
         LDX   #$FF4C
         LDA   $00,X
         BEQ   L081F0E
         PEA   ^L0C2977
         PEA   L0C2977
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         BRA   L081F22
L081F0E  PEA   ^L0C2979
         PEA   L0C2979
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
L081F22  JSL   L031208
         BRL   L081F68
L081F29  BRL   L081F68
L081F2C  DA    L080016
         DA    L080175
         DA    L0802DB
         DA    L080B68
         DA    L080DCE
         DA    L080DD5
         DA    L081383
         DA    L08166B
         DA    L08193A
         DA    L081957
         DA    L081A2E
         DA    L081F29
         DA    L081F29
         DA    L081F29
         DA    L081F29
         DA    L081F29
         DA    L081F29
         DA    L081F29
         DA    L081F29
         DA    L081E38
         DA    L081F29
         DA    L081E47
         DA    L081F29
L081F5A  DEC
         CMP   #$0016
         BCC   L081F63
         LDA   #$0016
L081F63  ASL
         TAX
         JMP   (L081F2C,X)

L081F68  TSC
         CLC
         ADC   #$023A
         TCS
         PLD
         RTL

L081F70  PHD
         TSC
         SEC
         SBC   #$00E9
         TCD
         ADC   #$00D7
         TCS
         STZ   $DA
         STZ   $DC
         BRA   L081FAC
L081F81  LDA   $DC
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2466
         LDX   #^L0C2466
         JSL   L010922
         PLA
         PLX
         STA   $E4
         STX   $E6
         LDX   #$0000
         LDA   #$0000
         LDY   #$0002
         PHA
         TXA
         STA   [$E4],Y
         PLA
         STA   [$E4]
         INC   $DC
L081FAC  LDA   $DC
         SEC
         SBC   #$0020
         BVS   L081FB7
         EOR   #$8000
L081FB7  BPL   L081F81
         LDA   $F7
         CLC
         ADC   #$0008
         TAX
         LDA   $F9
         BCC   L081FC5
         INC
L081FC5  PHA
         PHX
         PEA   $0000
         PEI   $FB
         PEI   $F1
         PEI   $EF
         JSL   L071136
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         LDA   #$0001
         STA   $E0
         JSL   L0311DD
         JSL   L0311AA
         PEA   ^L0C2466
         PEA   L0C2466
         LDA   $E0
         LDX   #$0000
         TAY
         BPL   L081FF8
         DEX
L081FF8  STX   $E8
         ASL
         ROL   $E8
         ASL
         ROL   $E8
         LDX   $E8
         PHX
         PHA
         LDX   $F5
         LDA   $F3
         JSL   L010922
         LDA   $E0
         LDX   #$0000
         TAY
         BPL   L082015
         DEX
L082015  STX   $E8
         ASL
         ROL   $E8
         ASL
         ROL   $E8
         ASL
         ROL   $E8
         LDX   $E8
         PHX
         PHA
         LDX   $F9
         LDA   $F7
         JSL   L010922
         PEA   $0063
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0001
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
L082047  JSL   L06063A
         JSL   L0612DE
         TAY
         BNE   L08205E
         JSL   L04169A
         TAY
         BNE   L08205E
         LDA   #$0000
         BRA   L082061
L08205E  LDA   #$0001
L082061  STA   $DA
         PHA
         PEA   ^L0C1A84
         PEA   L0C1A84
         LDA   $E0
         LDX   #$0000
         TAY
         BPL   L082073
         DEX
L082073  STX   $E8
         ASL
         ROL   $E8
         ASL
         ROL   $E8
         ASL
         ROL   $E8
         LDX   $E8
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         _PtInRect
         BCS   L082096
         LDA   #$0000
L082096  STAL  L0B0002
         PLA
         TAY
         BNE   L0820A2
         LDA   $DA
         BEQ   L082047
L0820A2  LDA   $E0
         SEC
         SBC   $FB
         BEQ   L0820B3
         BVS   L0820AE
         EOR   #$8000
L0820AE  BPL   L0820B3
         BRL   L0822D0
L0820B3  LDA   $DA
         BEQ   L0820BA
         BRL   L0822D0
L0820BA  JSL   L06063A
         JSL   L0612DE
         TAY
         BNE   L0820D1
         JSL   L04169A
         TAY
         BNE   L0820D1
         LDA   #$0000
         BRA   L0820D4
L0820D1  LDA   #$0001
L0820D4  STA   $DA
         PHA
         PEA   ^L0C1A84
         PEA   L0C1A84
         LDA   $E0
         LDX   #$0000
         TAY
         BPL   L0820E6
         DEX
L0820E6  STX   $E8
         ASL
         ROL   $E8
         ASL
         ROL   $E8
         ASL
         ROL   $E8
         LDX   $E8
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         _PtInRect
         BCS   L082109
         LDA   #$0000
L082109  STAL  L0B0002
         PLA
         TAY
         BEQ   L082115
         LDA   $DA
         BEQ   L0820BA
L082115  STZ   $DE
         LDA   #$0001
         STA   $DC
         BRA   L082161
L08211E  PHA
         PEA   ^L0C1A84
         PEA   L0C1A84
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L08212E
         DEX
L08212E  STX   $E8
         ASL
         ROL   $E8
         ASL
         ROL   $E8
         ASL
         ROL   $E8
         LDX   $E8
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         _PtInRect
         BCS   L082151
         LDA   #$0000
L082151  STAL  L0B0002
         PLA
         TAY
         BEQ   L08215F
         LDA   $DC
         STA   $DE
         BRA   L082171
L08215F  INC   $DC
L082161  LDA   $FB
         CLC
         ADC   #$0001
         SEC
         SBC   $DC
         BVS   L08216F
         EOR   #$8000
L08216F  BMI   L08211E
L082171  LDA   $DE
         CMP   #$0000
         BNE   L08217B
         BRL   L082287
L08217B  LDA   $DE
         SEC
         SBC   $E0
         BVS   L082185
         EOR   #$8000
L082185  BPL   L08218A
         BRL   L082208
L08218A  LDA   #$0001
         STA   $DC
         BRA   L0821F7
L082191  PEA   ^L0C2466
         PEA   L0C2466
         LDA   $E0
         SEC
         SBC   $DC
         LDX   #$0000
         TAY
         BPL   L0821A3
         DEX
L0821A3  STX   $E8
         ASL
         ROL   $E8
         ASL
         ROL   $E8
         LDX   $E8
         PHX
         PHA
         LDX   $F5
         LDA   $F3
         JSL   L010922
         LDA   $E0
         SEC
         SBC   $DC
         LDX   #$0000
         TAY
         BPL   L0821C3
         DEX
L0821C3  STX   $E8
         ASL
         ROL   $E8
         ASL
         ROL   $E8
         ASL
         ROL   $E8
         LDX   $E8
         PHX
         PHA
         LDX   $F9
         LDA   $F7
         JSL   L010922
         PEA   $0063
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0001
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         INC   $DC
L0821F7  LDA   $E0
         SEC
         SBC   $DE
         SEC
         SBC   $DC
         BVS   L082204
         EOR   #$8000
L082204  BMI   L082191
         BRA   L082281
L082208  PEA   ^L0C2466
         PEA   L0C2466
         LDA   $E0
         CLC
         ADC   #$0001
         LDX   #$0000
         TAY
         BPL   L08221B
         DEX
L08221B  STX   $E8
         ASL
         ROL   $E8
         ASL
         ROL   $E8
         LDX   $E8
         PHX
         PHA
         LDX   $F5
         LDA   $F3
         JSL   L010922
         LDA   $E0
         CLC
         ADC   #$0001
         LDX   #$0000
         TAY
         BPL   L08223C
         DEX
L08223C  STX   $E8
         ASL
         ROL   $E8
         ASL
         ROL   $E8
         ASL
         ROL   $E8
         LDX   $E8
         PHX
         PHA
         LDX   $F9
         LDA   $F7
         JSL   L010922
         PEA   $0063
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDA   $DE
         SEC
         SBC   $FB
         BVS   L082269
         EOR   #$8000
L082269  BMI   L08226F
         LDA   $DE
         BRA   L082271
L08226F  LDA   $FB
L082271  SEC
         SBC   $E0
         PHA
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
L082281  LDA   $DE
         STA   $E0
         BRA   L0822CD
L082287  JSL   L06063A
         PHA
         PEA   ^L0C1A84
         PEA   L0C1A84
         LDA   $E0
         LDX   #$0000
         TAY
         BPL   L08229B
         DEX
L08229B  STX   $E8
         ASL
         ROL   $E8
         ASL
         ROL   $E8
         ASL
         ROL   $E8
         LDX   $E8
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         _PtInRect
         BCS   L0822BE
         LDA   #$0000
L0822BE  STAL  L0B0002
         PLA
         TAY
         BNE   L0822CD
         JSL   L0612DE
         TAY
         BEQ   L082287
L0822CD  BRL   L0820A2
L0822D0  JSL   L031208
         TSC
         CLC
         ADC   #$0011
         TCS
         PLD
         RTL

L0822DC  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00BD
         TCS
         STZ   $E4
         BRA   L082316
L0822EB  LDA   $E4
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2466
         LDX   #^L0C2466
         JSL   L010922
         PLA
         PLX
         STA   $EE
         STX   $F0
         LDX   #$0000
         LDA   #$0000
         LDY   #$0002
         PHA
         TXA
         STA   [$EE],Y
         PLA
         STA   [$EE]
         INC   $E4
L082316  LDA   $E4
         SEC
         SBC   #$0020
         BVS   L082321
         EOR   #$8000
L082321  BPL   L0822EB
         PEA   ^L0C297B
         PEA   L0C297B
         PEA   $0000
         TDC
         CLC
         ADC   #$00C4
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00C4
         PHA
         JSL   L040E53
         PLY
         PLY
         STA   $E2
         LDA   $E2
         PHA
         LDA   #$0022
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C1AB2
         LDX   #^L0C1AB2
         JSL   L010922
         PLA
         PLX
         STA   $EE
         STX   $F0
         LDY   #$0004
         LDA   [$EE],Y
         TAX
         LDY   #$0002
         LDA   [$EE],Y
         STX   $EC
         STA   $EA
         PEI   $FF
         PEI   $FD
         PEA   $0002
         PEA   $0001
         PEA   $00F4
         PEA   $005E
         _SetRect
         BCS   L082397
         LDA   #$0000
L082397  STAL  L0B0002
         LDA   $FD
         CLC
         ADC   #$0008
         TAX
         LDA   $FF
         BCC   L0823A7
         INC
L0823A7  PHA
         PHX
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _SetRect
         BCS   L0823C1
         LDA   #$0000
L0823C1  STAL  L0B0002
         PEI   $FB
         PEI   $F9
         LDAL  L0C0731
         PHA
         LDAL  L0C0733
         PHA
         _SetPt
         BCS   L0823DF
         LDA   #$0000
L0823DF  STAL  L0B0002
         PEI   $FF
         PEI   $FD
         PEA   $0001
         PEA   $0000
         PEI   $EC
         PEI   $EA
         JSL   L071136
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         JSL   L0311DD
         PEA   $0001
         JSL   L06078F
         PLY
         LDA   L0B0078
         SEC
         SBC   #$0000
         BVS   L082415
         EOR   #$8000
L082415  BPL   L08241A
         BRL   L0825E3
L08241A  PHX
         PHA
         _GetTick
         BCS   L082428
         LDA   #$0000
L082428  STAL  L0B0002
         PLA
         PLX
         STX   $C1
         STA   $BF
         PEA   ^L0C2466
         PEA   L0C2466
         PEI   $FB
         PEI   $F9
         PEI   $FF
         PEI   $FD
         PEA   $0063
         PEA   $0000
         PEA   $0000
         PEA   $0002
         PEA   $0001
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         PHA
         PEA   $0000
         _StillDown
         BCS   L08246B
         LDA   #$0000
L08246B  STAL  L0B0002
         PLA
         TAY
         BEQ   L0824B1
         LDA   L0B0078
         EOR   #$FFFF
         INC
         STA   $E8
         LDA   $E8
         SEC
         SBC   #$0008
         BVS   L082487
         EOR   #$8000
L082487  BMI   L0824B1
         LDA   $E8
         BEQ   L0824B1
         LDA   $E8
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         _InvertRect
         BCS   L0824AD
         LDA   #$0000
L0824AD  STAL  L0B0002
L0824B1  PHA
         PEA   $0000
         _StillDown
         BCS   L0824C1
         LDA   #$0000
L0824C1  STAL  L0B0002
         PLA
         TAY
         BNE   L0824CC
         BRL   L0825C6
L0824CC  JSL   L06063A
         LDA   #L0C1A7A
         LDX   #^L0C1A7A
         TAY
         TSC
         SEC
         SBC   #$0010
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0010
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         JSL   L061079
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         LDA   L0B0078
         EOR   #$FFFF
         INC
         CMP   $E8
         BNE   L08250A
         BRL   L0825C3
L08250A  LDA   L0B0078
         EOR   #$FFFF
         INC
         SEC
         SBC   #$0008
         BVS   L08251A
         EOR   #$8000
L08251A  BPL   L08251F
         BRL   L0825C3
L08251F  LDA   L0B0078
         CMP   #$0000
         BNE   L082561
         LDA   $E8
         SEC
         SBC   #$0008
         BVS   L082532
         EOR   #$8000
L082532  BMI   L08255C
         LDA   $E8
         BEQ   L08255C
         LDA   $E8
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         _InvertRect
         BCS   L082558
         LDA   #$0000
L082558  STAL  L0B0002
L08255C  STZ   $E8
         BRL   L0825C3
L082561  LDA   $E8
         SEC
         SBC   #$0008
         BVS   L08256C
         EOR   #$8000
L08256C  BMI   L082596
         LDA   $E8
         BEQ   L082596
         LDA   $E8
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         _InvertRect
         BCS   L082592
         LDA   #$0000
L082592  STAL  L0B0002
L082596  LDA   L0B0078
         EOR   #$FFFF
         INC
         STA   $E8
         LDA   $E8
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         _InvertRect
         BCS   L0825BF
         LDA   #$0000
L0825BF  STAL  L0B0002
L0825C3  BRL   L0824B1
L0825C6  PEA   $0000
         PEA   ^L0C0E30
         PEA   L0C0E30
         PEI   $FB
         PEI   $F9
         PEI   $FF
         PEI   $FD
         JSL   L08264C
         TAY
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
L0825E3  PHX
         PHA
         _GetTick
         BCS   L0825F1
         LDA   #$0000
L0825F1  STAL  L0B0002
         PLA
         PLX
         SEC
         SBC   $BF
         PHA
         TXA
         SBC   $C1
         TAX
         PLA
         STX   $C1
         STA   $BF
         SEC
         LDA   $BF
         SBC   #$0028
         BNE   L082613
         LDA   $C1
         SBC   #$0000
         BRA   L08261A
L082613  LDA   $C1
         SBC   #$0000
         REP   #$02
L08261A  BVS   L08261F
         EOR   #$8000
L08261F  BMI   L082624
         STZ   L0B0078
L082624  JSL   L031208
         LDX   L0B0048
         LDA   L0B0046
         PHX
         PHA
         JSL   L04023C
         PLY
         PLY
         LDX   L0B0044
         LDA   L0B0042
         PHX
         PHA
         JSL   L04023C
         PLY
         PLY
         TSC
         CLC
         ADC   #$0035
         TCS
         PLD
         RTL

L08264C  PHD
         TSC
         SEC
         SBC   #$00ED
         TCD
         ADC   #$00DE
         TCS
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         PEA   $0000
         PEA   $0000
         LDA   $FF
         LDX   #$0000
         TAY
         BPL   L08266F
         DEX
L08266F  STX   $EC
         ASL
         ROL   $EC
         ASL
         ROL   $EC
         ASL
         ROL   $EC
         LDX   $EC
         PHX
         PHA
         LDX   $F5
         LDA   $F3
         JSL   L010922
         PLA
         PLX
         STA   $E8
         STX   $EA
         LDY   #$0002
         LDA   [$E8],Y
         PHA
         LDA   $FF
         LDX   #$0000
         TAY
         BPL   L08269B
         DEX
L08269B  STX   $EC
         ASL
         ROL   $EC
         ASL
         ROL   $EC
         ASL
         ROL   $EC
         LDX   $EC
         PHX
         PHA
         LDX   $F5
         LDA   $F3
         JSL   L010922
         PLA
         PLX
         STA   $E8
         STX   $EA
         LDY   #$0006
         LDA   [$E8],Y
         PLX
         STX   $EC
         SEC
         SBC   $EC
         PHA
         LDA   $FF
         LDX   #$0000
         TAY
         BPL   L0826CD
         DEX
L0826CD  STX   $EC
         ASL
         ROL   $EC
         ASL
         ROL   $EC
         ASL
         ROL   $EC
         LDX   $EC
         PHX
         PHA
         LDX   $F5
         LDA   $F3
         JSL   L010922
         PLA
         PLX
         STA   $E8
         STX   $EA
         LDA   [$E8]
         PHA
         LDA   $FF
         LDX   #$0000
         TAY
         BPL   L0826F6
         DEX
L0826F6  STX   $EC
         ASL
         ROL   $EC
         ASL
         ROL   $EC
         ASL
         ROL   $EC
         LDX   $EC
         PHX
         PHA
         LDX   $F5
         LDA   $F3
         JSL   L010922
         PLA
         PLX
         STA   $E8
         STX   $EA
         LDY   #$0004
         LDA   [$E8],Y
         PLX
         STX   $EC
         SEC
         SBC   $EC
         PHA
         _SetRect
         BCS   L08272B
         LDA   #$0000
L08272B  STAL  L0B0002
         PEI   $FD
         PEI   $FB
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         LDA   $FF
         LDX   #$0000
         TAY
         BPL   L082745
         DEX
L082745  STX   $EC
         ASL
         ROL   $EC
         ASL
         ROL   $EC
         LDX   $EC
         PHX
         PHA
         LDX   $F9
         LDA   $F7
         JSL   L010922
         PLA
         PLX
         STA   $E8
         STX   $EA
         LDY   #$0002
         LDA   [$E8],Y
         PHA
         LDA   $FF
         LDX   #$0000
         TAY
         BPL   L08276E
         DEX
L08276E  STX   $EC
         ASL
         ROL   $EC
         ASL
         ROL   $EC
         LDX   $EC
         PHX
         PHA
         LDX   $F9
         LDA   $F7
         JSL   L010922
         PLA
         PLX
         STA   $E8
         STX   $EA
         LDA   [$E8]
         PHA
         PEA   $0000
         _PPToPort
         BCS   L08279A
         LDA   #$0000
L08279A  STAL  L0B0002
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L0827A6  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$FF3E
         TCS
         STZ   $C4
         BRA   L0827E0
L0827B5  LDA   $C4
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2466
         LDX   #^L0C2466
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDX   #$0000
         LDA   #$0000
         LDY   #$0002
         PHA
         TXA
         STA   [$F6],Y
         PLA
         STA   [$F6]
         INC   $C4
L0827E0  LDA   $C4
         SEC
         SBC   #$0004
         BVS   L0827EB
         EOR   #$8000
L0827EB  BPL   L0827B5
         STZ   $C4
         BRL   L082875
L0827F2  LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$003C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0074
         LDY   #$0002
         STA   [$F6],Y
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$005A
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$00FC
         LDY   #$0002
         STA   [$F6],Y
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$0078
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0184
         LDY   #$0002
         STA   [$F6],Y
         INC   $C4
L082875  LDA   $C4
         SEC
         SBC   #$0005
         BVS   L082880
         EOR   #$8000
L082880  BMI   L082885
         BRL   L0827F2
L082885  STZ   $C4
         BRL   L0829B5
L08288A  LDA   $C4
         PHA
         LDA   #$001E
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$003C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0015
         LDY   #$0004
         STA   [$F6],Y
         LDA   $C4
         PHA
         LDA   #$001E
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$003C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$002C
         LDY   #$000A
         STA   [$F6],Y
         LDA   $C4
         PHA
         LDA   #$001E
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$003C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0043
         LDY   #$0010
         STA   [$F6],Y
         LDA   $C4
         PHA
         LDA   #$001E
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$003C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$005A
         LDY   #$0016
         STA   [$F6],Y
         LDA   $C4
         PHA
         LDA   #$001E
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$003C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0071
         LDY   #$001C
         STA   [$F6],Y
         STZ   $C2
         BRA   L0829A6
L082965  LDA   $C2
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $C4
         PHA
         LDA   #$001E
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$003C
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0000
         STA   [$F6]
         INC   $C2
L0829A6  LDA   $C2
         SEC
         SBC   #$0005
         BVS   L0829B1
         EOR   #$8000
L0829B1  BPL   L082965
         INC   $C4
L0829B5  LDA   $C4
         SEC
         SBC   #$0003
         BVS   L0829C0
         EOR   #$8000
L0829C0  BMI   L0829C5
         BRL   L08288A
L0829C5  PEA   $0000
         TDC
         CLC
         ADC   #$00D6
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $006C
         PEA   $0017
         _SetRect
         BCS   L0829E6
         LDA   #$0000
L0829E6  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00DE
         PHA
         PEA   $008C
         PEA   $0000
         PEA   $00F6
         PEA   $0017
         _SetRect
         BCS   L082A0B
         LDA   #$0000
L082A0B  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00E6
         PHA
         PEA   $0118
         PEA   $0000
         PEA   $01A2
         PEA   $0012
         _SetRect
         BCS   L082A30
         LDA   #$0000
L082A30  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00EE
         PHA
         PEA   $01A4
         PEA   $0000
         PEA   $022E
         PEA   $0012
         _SetRect
         BCS   L082A55
         LDA   #$0000
L082A55  STAL  L0B0002
         LDA   #L0C0CDC
         LDX   #^L0C0CDC
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF40
         PHA
         PEA   $00AA
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         PEA   $0000
         TDC
         CLC
         ADC   #$00C6
         PHA
         PEA   $0074
         PEA   $0015
         PEA   $020E
         PEA   $0088
         _SetRect
         BCS   L082A97
         LDA   #$0000
L082A97  STAL  L0B0002
         LDA   #$0004
         PHA
         LDA   $CC
         SEC
         SBC   $C8
         SEC
         JSL   L01092D
         PLY
         PHA
         LDA   #$0001
         PLX
         STX   $FA
         CLC
         ADC   $FA
         LDX   #$FF46
         STA   $00,X
         PEA   $C000
         LDA   $CA
         SEC
         SBC   $C6
         LDX   #$0000
         TAY
         BPL   L082AC8
         DEX
L082AC8  PHX
         PHA
         LDX   #$FF46
         LDA   $00,X
         LDX   #$0000
         SEC
         JSL   L010AF3
         LDX   L0B0040
         LDA   L0B003E
         PHX
         PHA
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         PHX
         PHA
         LDX   L0B0040
         LDA   L0B003E
         PHX
         PHA
         _GetHandleSize
         BCS   L082AFE
         LDA   #$0000
L082AFE  STAL  L0B0002
         PLA
         PLX
         STA   $C4
         LDX   L0B0040
         LDA   L0B003E
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         TXY
         LDX   #$FF42
         STY   $02,X
         STA   $00,X
         TYX
         PEA   $0000
         TDC
         CLC
         ADC   #$009A
         PHA
         PEA   $0000
         PEA   $0000
         _SetPt
         BCS   L082B3C
         LDA   #$0000
L082B3C  STAL  L0B0002
         LDA   #L0C0CDC
         LDX   #^L0C0CDC
         TXY
         LDX   #$FFEA
         STY   $02,X
         STA   $00,X
         TYX
         LDX   #$0000
         TDC
         CLC
         ADC   #$FF40
         TXY
         LDX   #$FFEE
         STY   $02,X
         STA   $00,X
         TYX
         LDX   #$0000
         TDC
         CLC
         ADC   #$00C6
         TXY
         LDX   #$FFF2
         STY   $02,X
         STA   $00,X
         TYX
         LDX   #$0000
         TDC
         CLC
         ADC   #$009A
         TXY
         LDX   #$FFF6
         STY   $02,X
         STA   $00,X
         TYX
         LDA   #$0000
         LDX   #$FFFA
         STA   $00,X
         LDAL  L0C0CF6
         TAX
         LDAL  L0C0CF4
         TXY
         LDX   #$FFFC
         STY   $02,X
         STA   $00,X
         TYX
         JSL   L03117F
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEA
         PHA
         _PaintPixels
         BCS   L082BB5
         LDA   #$0000
L082BB5  STAL  L0B0002
         PEA   $0002
         JSL   L021DFD
         PLY
         LDX   #$0000
         TDC
         CLC
         ADC   #$FF40
         TXY
         LDX   #$FFEA
         STY   $02,X
         STA   $00,X
         TYX
         LDA   #L0C0CDC
         LDX   #^L0C0CDC
         TXY
         LDX   #$FFEE
         STY   $02,X
         STA   $00,X
         TYX
         PEA   ^L0C2988
         PEA   L0C2988
         PEA   $0000
         TDC
         CLC
         ADC   #$009E
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$009E
         PHA
         JSL   L040E53
         PLY
         PLY
         STA   $BC
         PEA   $0000
         TDC
         CLC
         ADC   #$00D6
         PHA
         PEA   $0001
         PEA   $0004
         LDA   $BC
         PHA
         LDA   #$0022
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C1AB2
         LDX   #^L0C1AB2
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0004
         LDA   [$F6],Y
         TAX
         LDY   #$0002
         LDA   [$F6],Y
         PHX
         PHA
         JSL   L071136
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PHX
         PHA
         _GetTick
         BCS   L082C60
         LDA   #$0000
L082C60  STAL  L0B0002
         _SetRandSeed
         BCS   L082C70
         LDA   #$0000
L082C70  STAL  L0B0002
         STZ   $C4
         BRL   L08312F
L082C79  PEA   $0003
         JSL   L031FA1
         PLY
         PHA
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         PLA
         STA   [$F6]
         PEA   $0005
         JSL   L031FA1
         PLY
         PHA
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         PLA
         LDY   #$0002
         STA   [$F6],Y
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         PHA
         LDA   #$001E
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$003C
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         BEQ   L082D64
         BRL   L082C79
L082D64  LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0004
         STA   [$F6],Y
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         PHA
         LDA   #$001E
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$003C
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0001
         STA   [$F6]
         PEA   $0000
         TDC
         CLC
         ADC   #$009A
         PHA
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         PHA
         LDA   #$001E
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$003C
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         PHA
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         PHA
         LDA   #$001E
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$003C
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0004
         LDA   [$F6],Y
         PHA
         _SetPt
         BCS   L082F3E
         LDA   #$0000
L082F3E  STAL  L0B0002
         LDA   #$0002
         PHA
         LDA   $C4
         SEC
         JSL   L01092D
         PLA
         TAY
         BNE   L082F86
         PEA   $005F
         PEA   $0000
         PEA   $0007
         JSL   L031FA1
         PLY
         PHA
         LDA   #$0027
         PLX
         STX   $FA
         CLC
         ADC   $FA
         PHA
         PEA   $0011
         PEA   $0005
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C2468
         PLA
         STAL  L0C2466
         BRA   L082FB9
L082F86  PEA   $0057
         PEA   $0000
         PEA   $0007
         JSL   L031FA1
         PLY
         PHA
         LDA   #$0027
         PLX
         STX   $FA
         CLC
         ADC   $FA
         PHA
         PEA   $001A
         PEA   $0005
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C2468
         PLA
         STAL  L0C2466
L082FB9  PEA   ^L0C2466
         PEA   L0C2466
         PEA   $0000
         TDC
         CLC
         ADC   #$009A
         PHA
         LDA   #$0004
         PHA
         LDA   $C4
         SEC
         JSL   L01092D
         PLA
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D6
         JSL   L010922
         PEA   $0063
         PEA   $0000
         PEA   $0000
         PEA   $0001
         PEA   $0001
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         JSL   L0612B1
L083007  LDX   #$0000
         LDA   #$0006
         PHX
         PHA
         PHX
         PHA
         _TickCount
         BCS   L08301D
         LDA   #$0000
L08301D  STAL  L0B0002
         PLA
         PLX
         SEC
         SBC   L0B0062
         PHA
         TXA
         SBC   L0B0064
         TAX
         PLA
         JSL   L010B98
         BCC   L083036
         BRA   L083007
L083036  LDA   $C4
         CLC
         ADC   #$0001
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         PEI   $9C
         PEI   $9A
         LDA   #$0004
         PHA
         LDA   $C4
         SEC
         JSL   L01092D
         PLA
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D6
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         PHA
         LDA   #$0004
         PHA
         LDA   $C4
         SEC
         JSL   L01092D
         PLA
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D6
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0006
         LDA   [$F6],Y
         PLX
         STX   $FA
         SEC
         SBC   $FA
         PHA
         LDA   $9C
         PLX
         STX   $FA
         CLC
         ADC   $FA
         PHA
         LDA   #$0004
         PHA
         LDA   $C4
         SEC
         JSL   L01092D
         PLA
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D6
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         PHA
         LDA   #$0004
         PHA
         LDA   $C4
         SEC
         JSL   L01092D
         PLA
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D6
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0004
         LDA   [$F6],Y
         PLX
         STX   $FA
         SEC
         SBC   $FA
         PHA
         LDA   $9A
         PLX
         STX   $FA
         CLC
         ADC   $FA
         PHA
         _SetRect
         BCS   L083129
         LDA   #$0000
L083129  STAL  L0B0002
         INC   $C4
L08312F  LDA   $C4
         SEC
         SBC   #$0008
         BVS   L08313A
         EOR   #$8000
L08313A  BMI   L08313F
         BRL   L082C79
L08313F  LDA   #$0008
         STA   $BE
         STZ   L0B0078
         JSL   L0612B1
         PHX
         PHA
         _GetTick
         BCS   L083159
         LDA   #$0000
L083159  STAL  L0B0002
         PLA
         PLX
         STX   $98
         STA   $96
         JSL   L0311DD
         JSL   L0311AA
L08316B  JSL   L06063A
         LDAL  L0C1A7A
         CMP   #$0001
         BNE   L0831A4
         LDA   #L0C1A7A
         LDX   #^L0C1A7A
         TAY
         TSC
         SEC
         SBC   #$0010
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0010
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         JSL   L061079
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
L0831A4  LDA   L0B0078
         CMP   #$0002
         BNE   L0831B1
         STZ   $BE
         BRL   L083B0F
L0831B1  LDA   L0B0078
         CMP   #$0000
         BNE   L0831BC
         BRL   L0834A9
L0831BC  LDA   L0B0078
         EOR   #$FFFF
         INC
         SEC
         SBC   #$0001
         STA   $C4
         LDA   L0B0078
         EOR   #$FFFF
         INC
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         _InvertRect
         BCS   L0831EE
         LDA   #$0000
L0831EE  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$009A
         PHA
         LDA   L0B0078
         EOR   #$FFFF
         INC
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         PHA
         LDA   L0B0078
         EOR   #$FFFF
         INC
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         PHA
         _SetPt
         BCS   L08324E
         LDA   #$0000
L08324E  STAL  L0B0002
         LDA   L0B0078
         EOR   #$FFFF
         INC
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   $F6
         LDX   $F8
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00C6
         PHA
         PEA   $0008
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         PEA   $0000
         TDC
         CLC
         ADC   #$00C6
         PHA
         PEA   $FF8C
         PEA   $FFEB
         _OffsetRect
         BCS   L0832A7
         LDA   #$0000
L0832A7  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEA
         PHA
         _PaintPixels
         BCS   L0832C0
         LDA   #$0000
L0832C0  STAL  L0B0002
         PEA   $0003
         JSL   L021DFD
         PLY
         LDA   $BE
         SEC
         SBC   #$0000
         BNE   L0832D7
         BRL   L083366
L0832D7  BVS   L0832DC
         EOR   #$8000
L0832DC  BMI   L0832E1
         BRL   L083366
L0832E1  LDX   #$0000
         LDA   #$0000
         PHA
         TXA
         STAL  L0C2468
         PLA
         STAL  L0C2466
         PEA   $006E
         PEA   $0000
         PEA   $002F
         PEA   $0023
         PEA   $0005
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C246C
         PLA
         STAL  L0C246A
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0005
         PEA   $0005
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C2470
         PLA
         STAL  L0C246E
         LDX   #$0000
         LDA   #$0002
         PHA
         TXA
         STAL  L0C2474
         PLA
         STAL  L0C2472
         LDX   #$FFFF
         LDA   #$FFFF
         PHA
         TXA
         STAL  L0C2478
         PLA
         STAL  L0C2476
         PEA   ^L0C2466
         PEA   L0C2466
         JSL   L0502A4
         PLY
         PLY
L083366  LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         PHA
         LDA   #$001E
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$003C
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0000
         STA   [$F6]
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0000
         STA   [$F6]
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0002
         STA   [$F6],Y
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0004
         STA   [$F6],Y
         LDA   L0B0078
         EOR   #$FFFF
         INC
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _SetRect
         BCS   L08349D
         LDA   #$0000
L08349D  STAL  L0B0002
         DEC   $BE
         STZ   L0B0078
         BRL   L083B0F
L0834A9  LDX   #$0000
         LDA   #$005A
         PHX
         PHA
         PHX
         PHA
         _GetTick
         BCS   L0834BF
         LDA   #$0000
L0834BF  STAL  L0B0002
         PLA
         PLX
         SEC
         SBC   $96
         PHA
         TXA
         SBC   $98
         TAX
         PLA
         JSL   L010B98
         BCC   L0834D7
         BRL   L083B0F
L0834D7  PEA   $0008
         JSL   L031FA1
         PLY
         STA   $C4
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0004
         LDA   [$F6],Y
         BEQ   L0834D7
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         STA   $C2
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         STA   $C0
L08355C  PEA   $0003
         JSL   L031FA1
         PLY
         PHA
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         PLA
         STA   [$F6]
         PEA   $0005
         JSL   L031FA1
         PLY
         PHA
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         PLA
         LDY   #$0002
         STA   [$F6],Y
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         PHA
         LDA   #$001E
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$003C
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         BEQ   L083647
         BRL   L08355C
L083647  LDA   $C0
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $C2
         PHA
         LDA   #$001E
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$003C
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0000
         STA   [$F6]
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         PHA
         LDA   #$001E
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$003C
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0001
         STA   [$F6]
         PEA   $0000
         TDC
         CLC
         ADC   #$009A
         PHA
         LDA   $C0
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $C2
         PHA
         LDA   #$001E
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$003C
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         PHA
         LDA   $C0
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $C2
         PHA
         LDA   #$001E
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$003C
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0004
         LDA   [$F6],Y
         PHA
         _SetPt
         BCS   L0837A3
         LDA   #$0000
L0837A3  STAL  L0B0002
         LDA   $C4
         CLC
         ADC   #$0001
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   $F6
         LDX   $F8
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00C6
         PHA
         PEA   $0008
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   $C4
         CLC
         ADC   #$0001
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _SetRect
         BCS   L083810
         LDA   #$0000
L083810  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00C6
         PHA
         PEA   $FF8C
         PEA   $FFEB
         _OffsetRect
         BCS   L08382F
         LDA   #$0000
L08382F  STAL  L0B0002
         JSL   L03117F
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEA
         PHA
         _PaintPixels
         BCS   L08384C
         LDA   #$0000
L08384C  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$009A
         PHA
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         PHA
         LDA   #$001E
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$003C
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         PHA
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $C4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$000C
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         PHA
         LDA   #$001E
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$003C
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0004
         LDA   [$F6],Y
         PHA
         _SetPt
         BCS   L083977
         LDA   #$0000
L083977  STAL  L0B0002
         PEA   $005F
         PEA   $0000
         PEA   $0007
         JSL   L031FA1
         PLY
         PHA
         LDA   #$0028
         PLX
         STX   $FA
         CLC
         ADC   $FA
         PHA
         PEA   $0025
         PEA   $0005
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C2468
         PLA
         STAL  L0C2466
         PEA   ^L0C2466
         PEA   L0C2466
         PEA   $0000
         TDC
         CLC
         ADC   #$009A
         PHA
         LDA   #$0004
         PHA
         LDA   $C4
         SEC
         JSL   L01092D
         PLA
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D6
         JSL   L010922
         PEA   $0063
         PEA   $0000
         PEA   $0000
         PEA   $0001
         PEA   $0001
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         JSL   L0311DD
         JSL   L0311AA
         LDA   $C4
         CLC
         ADC   #$0001
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         PEI   $9C
         PEI   $9A
         LDA   #$0004
         PHA
         LDA   $C4
         SEC
         JSL   L01092D
         PLA
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D6
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         PHA
         LDA   #$0004
         PHA
         LDA   $C4
         SEC
         JSL   L01092D
         PLA
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D6
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0006
         LDA   [$F6],Y
         PLX
         STX   $FA
         SEC
         SBC   $FA
         PHA
         LDA   $9C
         PLX
         STX   $FA
         CLC
         ADC   $FA
         PHA
         LDA   #$0004
         PHA
         LDA   $C4
         SEC
         JSL   L01092D
         PLA
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D6
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         PHA
         LDA   #$0004
         PHA
         LDA   $C4
         SEC
         JSL   L01092D
         PLA
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D6
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0004
         LDA   [$F6],Y
         PLX
         STX   $FA
         SEC
         SBC   $FA
         PHA
         LDA   $9A
         PLX
         STX   $FA
         CLC
         ADC   $FA
         PHA
         _SetRect
         BCS   L083AF3
         LDA   #$0000
L083AF3  STAL  L0B0002
         PHX
         PHA
         _GetTick
         BCS   L083B05
         LDA   #$0000
L083B05  STAL  L0B0002
         PLA
         PLX
         STX   $98
         STA   $96
L083B0F  LDA   $BE
         SEC
         SBC   #$0000
         BEQ   L083B2F
         BVS   L083B1C
         EOR   #$8000
L083B1C  BPL   L083B2F
         JSL   L0612DE
         TAY
         BNE   L083B2F
         JSL   L04169A
         TAY
         BNE   L083B2F
         BRL   L08316B
L083B2F  STZ   $C0
         BRA   L083B5E
L083B33  LDA   $C0
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2466
         LDX   #^L0C2466
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDX   #$0000
         LDA   #$0000
         LDY   #$0002
         PHA
         TXA
         STA   [$F6],Y
         PLA
         STA   [$F6]
         INC   $C0
L083B5E  LDA   $C0
         SEC
         SBC   #$0005
         BEQ   L083B33
         BVS   L083B6B
         EOR   #$8000
L083B6B  BPL   L083B33
         LDX   L0B0040
         LDA   L0B003E
         PHX
         PHA
         JSL   L04023C
         PLY
         PLY
         TSC
         CLC
         ADC   #$01BC
         TCS
         PLD
         RTL

L083B83  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F0
         TCS
         STZ   $F4
         JSL   L06063A
         LDAL  L0C1A7A
         CMP   #$0003
         BNE   L083BC5
         LDAL  L0C1A7C
         CMP   #$001B
         BNE   L083BC5
         LDAL  L0C1A7E
         CMP   #$0000
         BNE   L083BC5
         LDA   L0B0078
         CMP   #$0002
         BEQ   L083BBC
         LDA   #$0000
         BRA   L083BBF
L083BBC  LDA   #$0001
L083BBF  JSL   L04169A
         STA   $F4
L083BC5  LDA   $F4
         TAY
         TSC
         CLC
         ADC   #$000A
         TCS
         TYA
         PLD
         RTL

