
            LST   OFF         ; MAIN

ECR0100     LDX   SECR2+1     ; MAIN : OPEN
            LDA   #ECR01000
            STA   BUMPER5+1
            JMP   BUMPER
ECR01000    LDA   #$0002      ; IMAGE OPEN
            JMP   PICT

ECR0101     LDX   SECR2+1     ; MAIN : SAVE
            LDA   #ECR01010
            STA   BUMPER5+1
            JMP   BUMPER
ECR01010    LDA   #$0003      ; IMAGE SAVE
            JMP   PICT

ECR0102     LDX   SECR2+1     ; MAIN : SELECT
            LDA   #ECR01020
            STA   BUMPER5+1
            JMP   BUMPER
ECR01020    LDA   #$0004      ; IMAGE SELECT
            JMP   PICT

ECR0103     LDX   SECR2+1     ; MAIN : CONVERT
            LDA   #ECR01030
            STA   BUMPER5+1
            JMP   BUMPER
ECR01030    LDA   #$0005      ; IMAGE CONVERT
            JMP   PICT

ECR0104     LDX   SECR2+1     ; MAIN : STAT
            LDA   #ECR01040
            STA   BUMPER5+1
            JMP   BUMPER
ECR01040    LDA   #$0006      ; IMAGE STAT
            JMP   PICT

ECR0105     LDX   SECR2+1     ; MAIN : OPTIONS
            LDA   #ECR01050
            STA   BUMPER5+1
            JMP   BUMPER
ECR01050    LDA   #$0007      ; IMAGE OPTIONS
            JMP   PICT

ECR0106     LDX   SECR2+1     ; MAIN : DOC
            LDA   #ECR01060
            STA   BUMPER5+1
            JMP   BUMPER
ECR01060    LDA   #$0008      ; IMAGE DOC
            JMP   PICT

