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
        $INCLUDE(REG552.INC)
        $INCLUDE(CONFIG.INC)
        $INCLUDE(ALIASES.INC)
        $INCLUDE(MACROS.INC)
        $INCLUDE(EXTERNALS.INC) ;contains every external symbol
        
        NAME    BLACK_BELT_TEMPLATE_CODE


        ;Starting address of program can be modified in CONFIG.INC
        PUBLIC ?C_START
IF IN_PIR_LAB <> 1
        CSEG    AT      0100H
ELSE
        CSEG    AT      4100H
ENDIF        
P_USER_PROGRAM_START:
?C_START:
        USING   0       ;Select register bank for use with <ARn> : Absolute Register n
        PUSH    AR0     ;pushes R0 from the selected register bank
        POP     AR0     ;PUSH and POP instructions use direct addressing respectively
        PUSH    R0B0    ;R0B0 is a new alias for R0 of Bank0
        POP     R7B3

        LCALL   S_INIT_SERIAL_PORT      ;Definition of subroutines can be found inside SUBROUTINES.A51
        LCALL   S_INIT_TIMER_0
        LCALL   S_DEC_DPTR      ;Software implemented DPTR decrement
        M_DEC_DPTR              ;Same with macro
        MOV     DPTR,#C_LOREM_IPSUM
        LCALL   S_SERIAL_WRITE_TEXT_AT_DPTR
        LCALL   S_SERIAL_WRITE_NEWLINE
        LCALL   S_GET_NEXT_INSTR_PC_VALUE_IN_DPTR
        
        MOV     DPTR,#X_VAR
        MOVX    A,@DPTR ;ACC now contains whatever was inside X_VAR
        
        MOV     D_T0_OVF_HALF_SEC,#50
        
        MOV     P1,#1
        LCALL   S_INIT_INTERRUPT_SYSTEM
        MOV     TL0,#0FAH ;To speed up the occurrence of the first interrupt
END_OF_PROGRAM:
        M_SLEEP ;Definition of macros can be found inside MACROS.INC
        LJMP    END_OF_PROGRAM
      
        END
