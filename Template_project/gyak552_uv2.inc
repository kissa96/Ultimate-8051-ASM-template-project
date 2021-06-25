;********************************************************
;*		K K M F  Automatika Intézet		*
;*		  Elektronika Szakcsoport		*
;********************************************************
;*  Változat:		V5.0				*
;*  Dátum:		2007				*
;*  Készítette:		Lamár krisztián			*
;********************************************************

	;xxxxxx Gyakorló port címei xxxxxx

	;*** Memóriába ágyazott perifériák címei ***

DKIC	XDATA	0C007H		; LCD adat irás címe
DBEC	XDATA	0C00FH		; LCD adat olvasás címe
VKIC	XDATA	0C003H		; LCD vezérlés címe
VBEC	XDATA	0C00BH		; LCD vezérlés (statusz) be címe
NGS	XDATA	0C000H		; nyomógomb-sor címe
LEDS	XDATA	0C001H		; LED-sor címe
RELS	XDATA	0C000H		; Relé-sor címe
OPIN	XDATA	0C001H		; Optocsatolt bemenetek címe

	;*** LCD utasítások ***

DCLR	EQU	00000001B	; Display Clear
DHOME	EQU	00000010B	; Display / Cursor home
EMI	EQU	00000110B	; Entry mode = increment, no shift
EMD	EQU	00000100B	; Entry mode = decrement, no shift
EMIS	EQU	00000111B	; Entry mode = increment with shift
EMDS	EQU	00000101B	; Entry mode = decrement with shift
DOFF	EQU	00001000B	; Display OFF
DON	EQU	00001100B	; Display ON, no cursor
DCON	EQU	00001110B	; Display ON, cursor ON, no blinking
DCBON	EQU	00001111B	; Display ON, cursor ON, blinking ON
SHCL	EQU	00010000B	; Shift cursor left
SHCR	EQU	00010100B	; Shift cursor right
SHDCL	EQU	00011000B	; Shift display and cursor to left
SHDCR	EQU	00011100B	; Shift display and cursor to right
FS41	EQU	00100000B	; Function set: 4 bits, 1 line
FS42	EQU	00101000B	; Function set: 4 bits, 2 lines
FS81	EQU	00110000B	; Function set: 8 bits, 1 line
FS82	EQU	00111000B	; Function set: 8 bits, 2 lines
CGADDR	EQU	01000000B	; CGRAM address set (CGADDR _OR_ 6 bits)
DDADDR	EQU	10000000B	; DDRAM address set (DDADDR _OR_ 7 bits)
