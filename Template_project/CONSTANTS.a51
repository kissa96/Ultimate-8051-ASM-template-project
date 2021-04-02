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
$IF    (ASSEMBLE_CONSTANTS = 1)

        CR      EQU     15
        LF      EQU     12

;READ ONLY VARIABLES FOR CODE SPACE	
        CCONST SEGMENT CODE
        RSEG	CCONST
        PUBLIC  CCONST_TEMPLATE_TEXT
        PUBLIC  CCONST_LOREM_IPSUM
        
        
;ASCII coded character vectors
CCONST_TEMPLATE_TEXT:	
                DB      "Hello World!",0

CCONST_LOREM_IPSUM: 
                DB      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",CR,LF, \
                        "Phasellus ut feugiat urna. Ut finibus molestie ipsum eu rutrum.",CR,LF, \
                        "Fusce imperdiet volutpat vestibulum. Praesent vel elit vel erat viverra dictum.",CR,LF, \
                        "Mauris faucibus venenatis erat, sed faucibus eros egestas sit amet.",CR,LF, \
                        "Phasellus placerat purus non augue aliquam cursus.",CR,LF, \
                        "Suspendisse sit amet elit et augue gravida scelerisque.",CR,LF, \
                        "Fusce elit nibh, venenatis ut elit in, rhoncus elementum nulla.",0





$ENDIF
$ENDIF 
        END