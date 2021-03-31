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
        $INCLUDE(EXTERNALS.INC)

$IF    (ASSEMBLE_ISR_ALL = 1)
$IF    (ASSEMBLE_ISR_T2_COMPARE_2 = 1)      

IF IN_PIR_LAB <> 1
        CSEG    AT      006BH
ELSE
        CSEG    AT      406BH
ENDIF
        LJMP    IRQ_VECT_TIMER_2_COMPARE2
        IRQ_TIMER2_COMPARE2 SEGMENT CODE
        RSEG    IRQ_TIMER2_COMPARE2       
IRQ_VECT_TIMER_2_COMPARE2:
        USING   0
        CLR     CMI2
        
        
        RETI
$ENDIF      
$ENDIF 
        END