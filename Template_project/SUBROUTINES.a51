/*
MIT License
Copyright (c) 2021 Attila Kiss

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
        $NOMOD51
        $INCLUDE(ALIASES.INC)
        $INCLUDE(CONFIG.INC)
        $INCLUDE(REG552.INC)
        $INCLUDE(GYAK552_UV2.INC)
        $INCLUDE(MACROS.INC)
        $INCLUDE(EXTERNAL_DATA.INC)
        $INCLUDE(EXTERNAL_IDATA.INC)
        $INCLUDE(EXTERNAL_XDATA.INC)
        $INCLUDE(EXTERNAL_BIT_VARIABLES.INC)
        $INCLUDE(EXTERNAL_BITADDRESSABLE_VARIABLES.INC)
        $INCLUDE(EXTERNAL_CONSTANTS.INC)
        $INCLUDE(EXTERNAL_STACK_REFERENCE.INC)
        
        
$IF(ASSEMBLE_SUBROUTINES = 1)        
        
        SUBROUTINES SEGMENT CODE
        RSEG    SUBROUTINES
;SUBROUTINES GO HERE

        PUBLIC  S_NOP
        PUBLIC  S_INIT_SERIAL_PORT
        PUBLIC  S_SERIAL_WRITE_BYTE
        PUBLIC  S_SERIAL_READ_BYTE
        PUBLIC  S_SERIAL_WRITE_TEXT_AT_DPTR
        PUBLIC  S_GET_NEXT_INSTR_PC_VALUE_IN_DPTR
        PUBLIC  S_INIT_INTERRUPT_SYSTEM
        PUBLIC  S_WRITE_XDATA_PERIPH_LEDS_FROM_ACC
        PUBLIC  S_READ_XDATA_PERIPH_BUTTONS_INTO_ACC
        PUBLIC  S_INIT_TIMER_0
        PUBLIC  S_CHASER_ON_P1
        PUBLIC  S_COUNTER_ON_P2
        PUBLIC  S_DEC_DPTR
        PUBLIC  S_SERIAL_WRITE_NEWLINE
        PUBLIC  S_SERIAL_DECIMAL_READ_TO_ACC
        PUBLIC  S_SERIAL_DECIMAL_WRITE_FROM_ACC
        PUBLIC  S_SERIAL_TRY_GET
        PUBLIC  S_SERIAL_TRY_PUT
        
S_NOP:  
        NOP
RET
S_SERIAL_TRY_GET:
        JNB     RI,$+6
        LCALL   S_SERIAL_READ_BYTE
RET
S_SERIAL_TRY_PUT:
        JNB     TI,$+6
        LCALL   S_SERIAL_WRITE_BYTE
RET
S_SERIAL_DECIMAL_READ_TO_ACC:
        USING   0
        PUSH    B
        PUSH    AR2
        PUSH    PSW
        CLR     RS0
        CLR     RS1
	LCALL   S_SERIAL_READ_BYTE
	CLR     C
	SUBB	A,#30H
	MOV	B,#100
	MUL	AB
	MOV	R2,A
	LCALL	S_SERIAL_READ_BYTE
	CLR     C
	SUBB	A,#30H
	MOV	B,#10
	MUL	AB
	ADD	A,R2
	MOV	R2,A
	LCALL	S_SERIAL_READ_BYTE
	CLR     C
	SUBB	A,#30H
	ADD	A,R2
        POP     PSW
        POP     AR2
        POP     B
RET
S_SERIAL_DECIMAL_WRITE_FROM_ACC:
	PUSH    ACC
        PUSH    B
	MOV	B,#100
	DIV	AB
	ADD	A,#30H
	LCALL   S_SERIAL_WRITE_BYTE
	MOV	A,B
	MOV	B,#10
	DIV	AB
	ADD	A,#30H
	LCALL   S_SERIAL_WRITE_BYTE
	MOV	A,B	
	ADD	A,#30H
	LCALL   S_SERIAL_WRITE_BYTE
        POP     B
	POP     ACC
RET

S_CHASER_ON_P1:
        PUSH    ACC
        MOV     A,P1
        RL      A
        MOV     P1,A
        POP     ACC
RET

S_COUNTER_ON_P2:
        PUSH    ACC
        MOV     A,P2
        INC     A
        MOV     P2,A
        POP     ACC
RET

S_READ_XDATA_PERIPH_BUTTONS_INTO_ACC:
        PUSH    DPH
        PUSH    DPL
        MOV     DPTR,#NGS
        MOVX    A,@DPTR
        CPL     A
        POP     DPL
        POP     DPH
RET
        
S_WRITE_XDATA_PERIPH_LEDS_FROM_ACC:
        PUSH    DPL
        PUSH    DPH
        MOV     DPTR,#LEDS
        CPL     A
        MOVX    @DPTR,A
        CPL     A
        POP     DPH
        POP     DPL
RET
        
S_INIT_SERIAL_PORT:
IF IN_PIR_LAB <> 1      ;does not equal to 1
        MOV     SCON,#50H
        ANL     TMOD,#0FH
        ORL     TMOD,#20H
        MOV     TH1,#0FDH
        SETB    TR1      
ELSE
        ;In this case, the monitor program has already configured the serial port
        __WARNING__ "Serial port is being used by MON51, do not change parameters"
ENDIF
$IF(ASSEMBLE_ISR_SERIAL = 0)
        SETB    TI      ;If and only if serial interrupt is not used
$ENDIF
RET
        
S_SERIAL_WRITE_BYTE:
        JNB     TI,$
        CLR     TI
        MOV     SBUF,A
RET
        
S_SERIAL_READ_BYTE:
        JNB     RI,$
        CLR     RI
        MOV     A,SBUF
RET

S_SERIAL_WRITE_NEWLINE:
;Write CR+LF to terminal
        PUSH    ACC
;UNIX based operating systems do not need CR to print out a new line to the terminal
$IF (RUNNING_UNDER_UNIX <> 1)
        MOV     A,#13   ;CR
        LCALL   S_SERIAL_WRITE_BYTE
$ENDIF
        MOV     A,#10   ;LF
        LCALL   S_SERIAL_WRITE_BYTE
        POP     ACC
RET

S_SERIAL_WRITE_TEXT_AT_DPTR:
        PUSH    DPH             
        PUSH    DPL           
        PUSH    ACC            
S_SERIAL_WRITE_TEXT_AT_DPTR_NEXT_CHAR:
        CLR     A               
        MOVC    A,@A+DPTR           
        JZ      S_SERIAL_WRITE_TEXT_AT_DPTR_END_OF_TEXT_AT_DPTR 
        LCALL   S_SERIAL_WRITE_BYTE 
        INC     DPTR               
        LJMP    S_SERIAL_WRITE_TEXT_AT_DPTR_NEXT_CHAR        
S_SERIAL_WRITE_TEXT_AT_DPTR_END_OF_TEXT_AT_DPTR:
        POP     ACC            
        POP     DPL             
        POP     DPH
RET

S_DEC_DPTR:
        PUSH    ACC
        DEC     DPL
        MOV     A,DPL
        CJNE    A,#0xFF,$+5
        DEC     DPH
        POP     ACC
RET
     
S_GET_NEXT_INSTR_PC_VALUE_IN_DPTR:
        POP     DPH     ;DPH <-- PCH (Program Counter [7:0])
        POP     DPL     ;DPL <-- PCL (Program Counter [15:8])
        INC     SP      ;Restore SP in order to return to the correct address
        INC     SP
RET
        
S_INIT_TIMER_0:
        ANL     TMOD,#0F0H
        ORL     TMOD,#02H
        MOV     TH0,#0
        SETB    TR0
RET
        
S_INIT_INTERRUPT_SYSTEM:
        MOV     IP0,#00H        ;Set these manually
        MOV     IP1,#00H
        
        SETB    PT0

;This solution does work indeed, however it is not memory and runtime efficient.
;In case your program is already large enough, replace these lines with a simple byte-based write to IEN0 and IEN1
$IF(ASSEMBLE_ISR_EXTERNAL0 = 1)
        SETB    EX0
$ENDIF
$IF(ASSEMBLE_ISR_TIMER0_OVF = 1)
        SETB    ET0
$ENDIF
$IF(ASSEMBLE_ISR_EXTERNAL1 = 1)
        SETB    EX1
$ENDIF
$IF(ASSEMBLE_ISR_TIMER1_OVF = 1)
        SETB    ET1
$ENDIF
$IF(ASSEMBLE_ISR_SERIAL = 1)
        SETB    ES0
$ENDIF
$IF(ASSEMBLE_ISR_T2_OVF = 1)
        SETB    ET0
$ENDIF
$IF(ASSEMBLE_ISR_T2_COMPARE_2 = 1)
        SETB    ECM2
$ENDIF
$IF(ASSEMBLE_ISR_T2_COMPARE_1 = 1)
        SETB    ECM1
$ENDIF
$IF(ASSEMBLE_ISR_T2_COMPARE_0 = 1)
        SETB    ECM0
$ENDIF
$IF(ASSEMBLE_ISR_T2_CAPTURE_3 = 1)
        SETB    ECT3
$ENDIF
$IF(ASSEMBLE_ISR_T2_CAPTURE_2 = 1)
        SETB    ECT2
$ENDIF
$IF(ASSEMBLE_ISR_T2_CAPTURE_1 = 1)
        SETB    ECT1
$ENDIF
$IF(ASSEMBLE_ISR_T2_CAPTURE_0 = 1)
        SETB    ECT0
$ENDIF
$IF(ASSEMBLE_ISR_ADC = 1)
        SETB    EAD
$ENDIF
$IF (ASSEMBLE_ISR_ALL = 1)        
        SETB    EA
$ENDIF
        RET
$ENDIF      
        END 