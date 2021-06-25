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
$IF    (ASSEMBLE_VARIABLES = 1)
$IF    (ASSEMBLE_BITADDRESSABLE_VARIABLES = 1)

;VARIABLES FOR BITADDRESSABLE MEMORY SPACE
        BDATA_SEG SEGMENT DATA BITADDRESSABLE
        RSEG    BDATA_SEG

        PUBLIC  DBA_BADDR_VAR
                PUBLIC  _A
                PUBLIC  _B
                PUBLIC  _C
                PUBLIC  _D
                PUBLIC  _E
                PUBLIC  _F
                PUBLIC  _G
                PUBLIC  _H


DBA_BADDR_VAR:	DS	1
	_A      BIT     DBA_BADDR_VAR.0     ;BADDR_VAR+0
	_B	BIT	DBA_BADDR_VAR.1     ;BADDR_VAR+1
	_C	BIT	DBA_BADDR_VAR.2
	_D	BIT	DBA_BADDR_VAR.3
	_E	BIT	DBA_BADDR_VAR.4
	_F	BIT	DBA_BADDR_VAR.5
	_G	BIT	DBA_BADDR_VAR.6
	_H	BIT	DBA_BADDR_VAR.7


$ENDIF
$ENDIF
        END