;------------------------------------------------------------------------------
;  This file is part of the C51 Compiler package
;  Copyright (c) 1988-2005 Keil Elektronik GmbH and Keil Software, Inc.
;  Version 8.01
;------------------------------------------------------------------------------
                $NOMOD51
                $INCLUDE (CONFIG.INC)

                ; Standard SFR Symbols
                ACC     DATA    0E0H
                B       DATA    0F0H
                SP      DATA    81H
                DPL     DATA    82H
                DPH     DATA    83H

                NAME    ?C_STARTUP
                EXTRN   IDATA   (?STACK0)

                EXTRN   CODE    (?C_START)

$IF IN_PIR_LAB <> 1
                CSEG    AT      0H
$ELSE
                CSEG    AT      MONITOR_PROGRAM_OFFSET
$ENDIF
$IF(ASSEMBLE_STARTUP = 1)
                PUBLIC  ?C_STARTUP
?C_STARTUP:     LJMP    STARTUP1
                ?C_C51STARTUP   SEGMENT   CODE
                RSEG    ?C_C51STARTUP

STARTUP1:

IF IDATALEN <> 0
                MOV     R0,#IDATALEN - 1
                CLR     A
IDATALOOP:      MOV     @R0,A
                DJNZ    R0,IDATALOOP
ENDIF

IF XDATALEN <> 0
                MOV     DPTR,#XDATASTART
                MOV     R7,#LOW (XDATALEN)
  IF (LOW (XDATALEN)) <> 0
                MOV     R6,#(HIGH (XDATALEN)) +1
  ELSE
                MOV     R6,#HIGH (XDATALEN)
  ENDIF
                CLR     A
XDATALOOP:      MOVX    @DPTR,A
                INC     DPTR
                DJNZ    R7,XDATALOOP
                DJNZ    R6,XDATALOOP
ENDIF

IF PPAGEENABLE <> 0
                MOV     PPAGE_SFR,#PPAGE
ENDIF

IF PDATALEN <> 0
                MOV     R0,#LOW (PDATASTART)
                MOV     R7,#LOW (PDATALEN)
                CLR     A
PDATALOOP:      MOVX    @R0,A
                INC     R0
                DJNZ    R7,PDATALOOP
ENDIF

IF IBPSTACK <> 0
EXTRN DATA (?C_IBP)

                MOV     ?C_IBP,#LOW IBPSTACKTOP
ENDIF

IF XBPSTACK <> 0
EXTRN DATA (?C_XBP)

                MOV     ?C_XBP,#HIGH XBPSTACKTOP
                MOV     ?C_XBP+1,#LOW XBPSTACKTOP
ENDIF

IF PBPSTACK <> 0
EXTRN DATA (?C_PBP)
                MOV     ?C_PBP,#LOW PBPSTACKTOP
ENDIF


#if 0
EXTRN CODE (?B_SWITCH0)
                CALL    ?B_SWITCH0
#endif
                MOV     SP,#?STACK0-1
$ENDIF
                LJMP    ?C_START

                END