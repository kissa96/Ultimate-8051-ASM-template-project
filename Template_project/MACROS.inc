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

#ifndef MACROS_H
#define MACROS_H

        M_FILL_RAM_WITH_ACC MACRO
        MOV     R0,#0FFH
        MOV     @R0,A
        DJNZ    R0,$-1
        MOV     00H,A
        ENDM

        M_FILL_RAM_WITH MACRO   VALUE
        MOV     A,#VALUE
        MOV     R0,#0FFH
        MOV     @R0,A
        DJNZ    R0,$-1
        MOV     00H,A
        ENDM

        M_SET_XDATA_LEDS_TO MACRO       VALUE
        PUSH    ACC
        MOV     A,#VALUE
        LCALL   S_WRITE_XDATA_PERIPH_LEDS_FROM_ACC
        POP     ACC
        ENDM

        M_SLEEP   MACRO
        MOV     PCON,#01H
        ENDM

        M_DEC_DPTR MACRO
        PUSH    ACC
        DEC     DPL
        MOV     A,DPL
        CJNE    A,#0xFF,$+5
        DEC     DPH
        POP     ACC
        ENDM
#endif