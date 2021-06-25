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
        $INCLUDE(MACROS.INC)
        $INCLUDE(EXTERNALS.INC)

$IF    (ASSEMBLE_ISR_ALL = 1)
$IF    (ASSEMBLE_ISR_TIMER0_OVF = 1)

IF IN_PIR_LAB <> 1
        CSEG    AT      000BH
ELSE
        CSEG    AT      MONITOR_PROGRAM_OFFSET+000BH
ENDIF
        LJMP    ISR_VECT_TIMER_0_OVERFLOW
        ISR_TIMER_0 SEGMENT CODE
        RSEG    ISR_TIMER_0
ISR_VECT_TIMER_0_OVERFLOW:
        USING   0
        DJNZ    D_T0_OVF_EXTEND,ISR_VECT_TIMER0_OVERFLOW_END
        MOV     D_T0_OVF_EXTEND,#36
        ;Below this line, everything gets executed exactly every 10ms
        ;If and only if a clock frequency of 11.0592MHz is used
        LCALL   S_WRITE_XDATA_PERIPH_LEDS_FROM_ACC
        LCALL   S_READ_XDATA_PERIPH_BUTTONS_INTO_ACC
        DJNZ    D_T0_OVF_HALF_SEC,ISR_VECT_TIMER0_OVERFLOW_END
        MOV     D_T0_OVF_HALF_SEC,#50
        ;Below this line, everything gets executed exactly every 0.5 sec
        ;If and only if a clock frequency of 11.0592MHz is used
        LCALL   S_CHASER_ON_P1
        CPL     B_T0_OVF_SEC_EXTEND_BIT
        JNB     B_T0_OVF_SEC_EXTEND_BIT,ISR_VECT_TIMER0_OVERFLOW_END
        ;Below this line, everything gets executed exactly every 1 sec
        ;If and only if a clock frequency of 11.0592MHz is used
        LCALL   S_COUNTER_ON_P2
ISR_VECT_TIMER0_OVERFLOW_END:
        RETI
$ENDIF
$ENDIF
        END