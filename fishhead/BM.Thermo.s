*----------------------------------------
* BatchMan : Thermometer
*----------------------------------------

ctlTHERMO = $1602

showTHERMO pha
 pha
 PushLong #0
 PushLong #wTHERMO
 PushLong #PAINTTHERMO
 PushLong #0
 PushWord #refIsResource
 PushLong #wTHERMO
 PushWord #$800e
 _NewWindow2
 PullLong wiTHERMO
 rts

hideTHERMO PushLong wiTHERMO
 _CloseWindow
 rts

*--------------

initTHERMO PushWord #1
 PushLong wiTHERMO
 PushLong #ctlTHERMO
 _SetCtlValueByID
 rts

moveTHERMO pha
 PushLong wiTHERMO
 PushLong #ctlTHERMO
 _SetCtlValueByID
 rts

*--------------

PAINTTHERMO PushLong wiTHERMO
 _DrawControls
 rtl

*--------------

wiTHERMO ds 4
