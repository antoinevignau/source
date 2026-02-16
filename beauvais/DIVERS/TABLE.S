*
* Table
*
* (c) LoGo, 22/07/92
* v1.00 def

            clc               ;init
            xce
            sep   #$30
            lda   #$41
            sta   $c029
*
            rep   #$30        ;clear screen
            ldx   #$7ffe
            lda   #$0000
]lp         stal  $e12000,x
            dex
            dex
            bpl   ]lp
*
            ldx   #$001e      ;put palette
]lp         lda   palette,x
            stal  $e19e00,x
            dex
            dex
            bpl   ]lp
*
            sep   #$30        ;shgr on
]lp         lda   $c02e
            cmp   #$f8
            bne   ]lp
            lda   #$c1
            sta   $c029
            rep   #$30
            rts
*
palette     hex   0000770741082c070f008000700f000d
            hex   a90ff00fe000df04af0d8f07cc0cff0f
*
ligne       =     *
]ligne      =     $2000
            lup   200
            da    ]ligne
]ligne      =     ]ligne+$a0
            --^

