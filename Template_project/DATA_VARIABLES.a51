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

        $INCLUDE(CONFIG.INC)

        NAME    DATA_VARIABLES

$IF    (ASSEMBLE_VARIABLES = 1)
$IF    (ASSEMBLE_DATA_VARIABLES = 1)

;VARIABLES FOR DATA MEMORY SPACE
        DATA_SEG SEGMENT DATA
        RSEG    DATA_SEG
        PUBLIC  D_VAR
        PUBLIC  D_T0_OVF_EXTEND
        PUBLIC  D_T0_OVF_HALF_SEC

D_VAR:	          DS	  1
D_T0_OVF_EXTEND:  DS      1
D_T0_OVF_HALF_SEC:DS      1

$ENDIF
$ENDIF
        END