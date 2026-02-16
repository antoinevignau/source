*
* Ce qu'il faut pour un fichier sys16
*
* (c) LoGo, 22/07/92
* v1.0 def
*
            rel                            ;assemble avec OA-6
            dsk       nom.l
            lst       off
            use       nom.Macs

*

            phk
            plb
            tdc
            sta       MyZp
            tcs
            sta       MyStack

*

Init        _TLStartUp                     ;tool locator
            pushword  #0
            _MMStartUp                     ;memory manager
            pullword  MyID
            _ADBStartUp                    ;adb tools
            _IMStartUp                     ;integer math tools
            _MTStartUp                     ;miscalleanous tools
            _QDStartUp                     ;quickdraw tools

            PushLong  #0                   ;8 megas pour vider la memoire...
            PushLong  #$008fffff
            PushWord  MyID
            PushWord  #%11000000_00000000
            PushLong  #0
            _NewHandle
            _DisposeHandle                 ;S'il n'y a pas d'erreur, on vide
            _CompactMem

            PushLong  #0                   ;32ko pour les fonts
            PushLong  #$8000
            PushWord  MyID
            PushWord  #%1100000000011000
            PushLong  #0
            _NewHandle
            PullLong  HandleScreen

            PushLong  #0                   ;demande 32ko pour shadowing
            PushLong  #32768               ;du bank 01
            PushWord  MyID
            PushWord  #%1100000000000011
            PushLong  #$012000
            _NewHandle
            phd                            ;on dereference le handle
            tsc
            tcd
            ldy       #0
            lda       [3],y
            sta       Source
            ldy       #2
            lda       [3],y
            sta       Source+2
            pld
            PullLong  HandleShadow

*
            _QDShutDown
            _MTShutDown
            _IMShutDown
            _ADBShutDown
            PushWord  MyID
            _MMShutDown
            _TLShutDown

* et quitte...

MyID        ds        2
MyZp        ds        2
MyStack     ds        2

Chemin      str       '1/PNP.Datas/Ball8.SHR'

