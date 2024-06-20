; Commodore CBM2 Basic 4 plus 901240-04, 901241-04a, 901242-04a, 901243-04a
; modified for ACME assembling by Vossi 06/2024, last update 06/2024
!cpu 6502
!ct pet		; Standard text/char conversion table -> pet = petscii
!to "basic.bin", plain
; * switches
PATCH4A = 1	; Revision -04a
; conditional assembly constants
CC1 =0		; 64k  version
CC2 =1		; 128k version
CC3 =0		; 192k version
CC4 =0		; 256k version
BF=1		; first bank (P500=0, CBMII=1)
; * constants
FILL	= $ff	; Fills free memory areas with $FF
; ########################################### INFO ################################################
; Basic128 Revision -02/-02a/-02b (identical)
; Basic256 Revision -03
;   one bug in original source code basic4plus in patch2 fixed: correct jmp chkin instead chkout !
; ROM-CHECKSUM-BYTE: forfix
; separated SAV12 for 64k version from print using group. 
; 85c0 main loop for basic
; **************************************** DISCLAIMER *********************************************
; *****************************************
; *                                       *
; *       commodore pet basic             *
; *                                       *
; *           version 4.0                 *
; *     copyright 1979,  1980,  by        *
; *    commodore international limited    *
; *                                       *
; *****************************************
;
; version 1 - august 1977
; original microsoft release
;
; version 2 - august 1978
; fixed many bugs some are
; 1) arrays limited to 255
; 2) non-interruptable code
; 3) garbage collect strings
;
; version 3 - may 1979
; faster garbage collect
;
; version 4 - july 1979
; 1) expand reserved words
; 2) add disk commands
; 3) add disk status vars.
;
; version 4x - may, 1980
; 1) separate out kernal
; 2) set-up kernal interface
; 3) remove all kernal direct cell usage
;
; version 4.7 - october, 1981
; 1) bank related commands
; 2) copy literal strings to string space
; 3) indirect input buffer
; 4) copy fbuffr to strings
; 5) chrgot by indirect
; 6) print messages direct
;
;
; version 4.73 - november, 1981
; *** 64k version ***
; 1) floating point move & bank mapping routines
; 2) temp string descriptor pointers moved to
;    top of "user" memory.
; 3) ds$ string area allocated permanently at
;    top of "user" memory.
; 4) three byte pointers (third byte is bank#)
;    for:
;     string descriptor pointers(back links too)
;     string pointers
;     variable pointers
;    string descriptor pointers.
; 5) user memory copy of "zero" occupies 4 null
;    bytes preceding user text area.
;
;
; version 4.74 - december, 1981
; 1) user-defined functions: formal param.
;    ptr uses 3 bytes
; 2) ti$,ti with new kernal interface
;
; version 4.75 - january 7,1982
; 1) extensions for 64k,128k,192k,256k
; ****************************************** EQUATES **********************************************
	codfwa	=$8000			; save code first word address
	false	=0
	true	=255
	romloc	=$8000			; start of rom
	gdebug	=0			; garbage debug
	nkrnl	=1			; using new kernel

; assembly constants and parameters
	pgmkey	=$ff75			; program function keys
	vecorg	=$ff7b			; jump vector

	cr	=$d			; carriage return
	lf	=$a			; line feed
	clrscr	=147			; clear pet screen
	home	=197			; home pet screen
	eom	=$80			; indicate end of message

	forsiz	=19
	numlev	=26			; maximum number of calls to getstk
	bufsiz	=161
	addprc	=1
	addpr2	=addprc+addprc
	addpr4	=addpr2+addpr2
	addpr8	=addpr4+addpr4
	stkend	=$1fb			; first byte used for stack
	clmwid	=10
	pi	=$ff
	strsiz	=4			; # of locs per str descriptor
	ptrsiz	=3			; # of locs per pointer
	numtmp	=3			; # of string temporaries

; bank equates
	sysbnk	=$0f			; system bank#
	mxbank	=sysbnk+1		; 1st bank out of range
!if CC1{			; *** 64k version ***
	txtbnk	=0+BF			; text bank       *one*
	varbnk	=0+BF			; simple variable bank
	arybnk	=0+BF			; array bank
	strbnk	=0+BF			; string bank
}
!if CC2{			; *** 128k version ***
	txtbnk	=0+BF			; text bank       *two*
	varbnk	=1+BF			; simple variable bank
	arybnk	=1+BF			; array bank
	strbnk	=1+BF			; string bank
}
!if CC3{			; *** 192k version ***
	txtbnk	=0+BF			; text bank       *three*
	varbnk	=2+BF+BF		; simple variable bank
	arybnk	=1+BF			; array bank
	strbnk	=2+BF+BF		; string bank
}
!if CC4{			; *** 256k version ***
	txtbnk	=0+BF			; text bank        *four*
	varbnk	=3   			; simple variable bank
	arybnk	=1+BF			; array bank
	strbnk	=2+BF+BF		; string bank
}

; dos interface equates.
	dosfnl	=16+2			; filename length
	dosdsk	=8			; disk device #
	doslfn	=14			; dos internal logical file number
	dosctl	=21			; dos directory lines before prompt
	doslst	=dosfnl+dosfnl+dosfnl+16; (dosfnl+2)*3+10 --transmit buffer length
; ****************************************** BDEFINE **********************************************
; 'page zero storage definitions'
*=0
e6509	*=*+1			; execution bank
i6509	*=*+1			; indirection bank

usrpok	*=*+3			; set up orgin by init
tmhour	*=*+1			; for ti$ calculations
tmmin	*=*+1
tmsec	*=*+1
tmten	*=*+1

form	*=*+ptrsiz		; format pointer

integr				; one-byte integer from qint
charac	*=*+1			; a delimiting char
endchr	*=*+1			; other delimiting char
count	*=*+1			; general counter
xcnt	*=*+1			; dos loop counter

; flags
; dimflg, valtyp and intflg must be
; consecutive locations.
dimflg	*=*+1			; in getting a pointer to a variable
; it is important to remember whether
; it is being done for dim or not.
valtyp	*=*+1			; the type indicator 0=numeric, 1=string
intflg	*=*+1			; tells if integer

garbfl				; whether to do garbage collection
dores	*=*+1			; whether can or can't crunch res'd word.
; turned on when data being scanned by
; crunch so unquoted strs won't be crunched.

subflg	*=*+1			; flag whether sub'd variable allowed.
; for and user-defined function pointer
; fetching turn this on before calling
; ptrget so arrays won't be detected.
; stkini and ptrget clear it.
; also disallows integers there.

inpflg	*=*+1			; flags whether we are doing input or read.

dsdesc	*=*+strsiz		; disk status string
channl	*=*+1			; holds channel number
poker
linnum	*=*+2			; location to store line #

; pointers to temporary string descriptors.
; temp descriptors are located in the string bank
; hence, bank of strbnk is assumed for temppt,lastpt
temppt	*=*+1			; temppst relative offset to 1st free temp descr
lastpt	*=*+2			; pointer to last-used str temporary
tempst	*=*+2			; pointer to storage for 3 temporary descriptors.

index
index1	*=*+ptrsiz		; direct cells for 1st indexing usage
index2	*=*+ptrsiz		; direct cells for 2nd indexing usage

;
resho	*=*+1			; result of multiplier and divider
resmoh	*=*+1
addend				; temp used by umult
resmo	*=*+1
reslo	*=*+1
	*=*+1			; overflow previous cells

; pointers into dynamic data structures
; all are 2-byte offsets into fixed banks
; the following always mark the beginning of an area:
;    txttab, vartab
;    arytab, memtop
; these will have unchangeable values in versions
; where the areas they mark are equal to the "bottom"
; (or "top" for memtop) of a bank.
; additional variables:
;     txtend, varend, aryend
; are used to mark the end of an area, when the start
; of the "next" area is in a different bank (i.e.,
; the end isn't bordered by another area.)

; highst is used to store the offset value from a basic
; startup call to get the top of memory.

; the limit of growth in an area must also be kept.
; in the different versions, the following are used:

; 64k:		memtop (all)
; 128k:		buffpt (text)
;		memtop (data)
; 192k:		buffpt (text)
;		highst (arrays)
;		memtop (vars,strs)
; 256k:		buffpt (text)
;		highst (vars)
;		highst (arrays)
;		memtop (strs)

txttab	*=*+2			; pointer to beginning of text and
; doesn't change after being setup
; by init

txtend	*=*+2			; pointer to end of text (except 64k)

vartab	*=*+2			; pointer to start of simple variable space.

varend	*=*+2			; pointer to end of simple vars (256k only)

arytab	*=*+2			; pointer to start of array table

aryend	*=*+2			; pointer end of arrays (192k, 256k only)

strend	*=*+2			; end of storage in use.

fretop	*=*+2			; top of str free space
frespc	*=*+2			; pointer to new str
memtop	*=*+ptrsiz		; highest location in memory

; line numbers and textual pointers
curlin	*=*+2			; current line number
oldlin	*=*+2			; old line number (setup by stop or
; end in a program)
oldtxt	*=*+ptrsiz		; old text pointer

datlin	*=*+2			; data line number
datptr	*=*+2			; pointer to data. initialized to point
; at the zero infront of (txttab) by
; clr command.
; updated by execution of a read.
inpptr	*=*+2			; remembers where input is coming from.

; stuff used in evaluations

varnam	*=*+2			; variable's name

fdecpt				; pointer into power of tens table.
varpnt	*=*+ptrsiz		; pointer to variable in memory

forpnt				; a variable's pointer for for loops
; and let statements (3 bytes).
lstpnt	*=*+ptrsiz		; pointer to list string (3 bytes).

vartxt				; save current txtptr on read.
opptr	*=*+ptrsiz		; pointer to current op's entry in optab.

opmask	*=*+1			; mask created by current operation.

; temporary floating result registers (5bytes each):
; tempf1,tempf2,tempf3

tempf3				; temp float reg
grbpnt				; pointer used in garbage collection.
defpnt	*=*+ptrsiz		; pointer used in function definition.

dscpnt	*=*+ptrsiz		; pointer to a string descriptor.

jmper	*=*+2			; three bytes long
oldov	*=*+1			; the old overflow.

tempf1				; temp float reg
ptarg1	=tempf1 			; multiply def'd for use by instr$
ptarg2	=tempf1+3
str1	=tempf1+6
str2	=tempf1+10
tmppos	=tempf1+14
positn	=tempf1+15
match	=tempf1+16
arypnt				; pointer used in array building.
highds	*=*+ptrsiz		; destination of highest element in blt.
hightr	*=*+ptrsiz		; source of highest element to move.

tempf2				; temp float reg (5bytes)
lowds	*=*+1			; location of last byte transfered (3 bytes).
deccnt	*=*+1			; number of places before decimal point.
tenexp	*=*+1			; base ten exponent

grbtop				; pointer used in garbage collection.(3 bytes)
lowtr	*=*+1			; last thing to move in blt (3 bytes).
dptflg	*=*+1			; has a dpt been input
expsgn	*=*+1			; sign of exponent

; the floating accumulator
dsctmp	*=*+1			; temporary descriptors are built here.
      				; dsctmp overlaps up to facmoh.
fac
facexp	*=*+1
facho	*=*+1			; most significant byte of mantissa.
facmoh	*=*+1
indice				; used by qint.
facmo	*=*+1
faclo	*=*+1
facsgn	*=*+1
degree				; count used by polynomials.
sgnflg	*=*+1
bits	*=*+1			; cell for shiftr to use.

; the floating argument (unpacked)
t1	=*			; temporaries --uses fp buffer
t2	=t1+1
t3	=t1+2
t4	=t1+3

argexp	*=*+1
argho	*=*+1
argmoh	*=*+1
argmo	*=*+1
arglo	*=*+1
argsgn	*=*+1
strng1
arisgn	*=*+1			; a sign reflecting the result
facov	*=*+1			; overflow byte of the fac
	*=*+1

strng2				; -> to str or desc
polypt				; -> to polynomial coefficients
curtol				; absolute linear index is formed here
fbufpt	*=*+ptrsiz		; -> into fbuffr used by fout
txtptr	*=*+ptrsiz		; pointer to current term
buffpt	*=*+ptrsiz		; ^input buffer

noze				; using's leading zero counter
parsts	*=*+1			; dos std parser word
point				; using's pointer to decimal point
parstx	*=*+1			; dos aux parser word

seedpt	*=*+2
errnum	*=*+1

; string area available for copy.  this area is used
; by fout as a buffer and must have dosspc contiguous
; bytes.
; 
; in addition this area is used to store temporaries
; used by the dos interface routines. note, declaration
; order of locations dosofl-dossa must be preserved.
; ****************************************** ABSOLUTE *********************************************
; Basic's ROM page work area
* =$200
fbuffr
vspbuf				; buffer used to interface with vsp
	*=*+16			; reserve 16 bytes for filename 1
dosf1l	*=*+1			; dos file name 1 length
dosds1	*=*+1			; dos disk drive 1
dosf1a	*=*+2			; dos file name 1 address
dosf1b	*=*+1			; dos file name 1 bank

dosf2l	*=*+1			; dos file name 2 length
dosds2	*=*+1			; dos disk drive 2
dosf2a	*=*+2			; dos file name 2 address
dosf2b	*=*+1			; dos file name 2 bank

dosbnk	*=*+1			; dos bank number
dosofl	*=*+2			; dos low offset  (bsave,bload)
dosofh	*=*+2			; dos high offset (bsave)

dosla	*=*+1			; dos logical address
dosfa	*=*+1			; dos physical address
dossa	*=*+1			; dos secondary address
dosrcl	*=*+1			; dos record length

dosdid	*=*+2			; dos disk identifier (2 chars)
didchk	*=*+1			; dos did flag

dosstr	*=*+1			; dos output string buffer
dosspc=*-fbuffr			; spaced used by dos routines

* =*+46
trmpos				; cursor column on crt
andmsk	*=*+1			; mask used by wait
eormsk	*=*+1			; mask used by wait

dfbank	*=*+1			; default bank number
dolu  	*=*+1			; default output lu (0=> not std output) keeps ds + dir ok

domask
tansgn	*=*+1			; used in determining sign of tan

ldaabs	*=*+1			; lda abs routine (see initat)
tttemp				; temporary store
ldaadr	*=*+2			; modifiable address
	*=*+1			; return opcode

;declarations for print using

hulp	*=*+1			; counter
bnr	*=*+1			; pointer to begin no
enr	*=*+1			; pointer to end no
dolr	*=*+1			; dollar flag
flag	*=*+1			; comma flag
swe	*=*+1			; counter
usgn	*=*+1			; sign exponent
uexp	*=*+1			; pointer to exponent
vn	*=*+1			; # digits before decimal point
chsn	*=*+1			; justify flag
vf	*=*+1			; # pos before dec point (field)
nf	*=*+1			; # pos after dec point (field)
posp	*=*+1			; +/- flag (field)
fesp	*=*+1			; exponent flag (field)
etof	*=*+1			; switch
cform	*=*+1			; char counter (field)
sno	*=*+1			; sign no
blfd	*=*+1			; blank/star flag
begfd	*=*+1			; pointer to begin of field
lfor	*=*+1			; length of for]at
endfd	*=*+1			; pointer to end of field
puchrs
pufill	*=*+1			; print using fill symbol
pucoma	*=*+1			; print using comma symbol
pudot	*=*+1			; print using decimal point symbol
pumony	*=*+1			; print using monetary symbol
; -------------------------------------------------------------------------------------------------
; Basic RAM vectors
*=$280
;    basic indirects

ierror	*=*+2			; error routine, output err in .x
imain	*=*+2			; interpreter main loop
icrnch	*=*+2			; tokenization routine
iqplop	*=*+2			; token output expander routine
igone	*=*+2			; dispatcher
ieval	*=*+2			; eval routine
ifrmev	*=*+2			; frmevl routine
ichrgo	*=*+2			; chrgot routine
ichrge	*=*+2			; chrget routine
adray1	*=*+2			; convert float -> integer
adray2	*=*+2			; convert integer -> float

;    error trapping declarations

trapno	*=*+2			; error trap vector
errlin	*=*+2			; holds line # of last error
errtxt	*=*+2			; text pointer at time of error
oldstk	*=*+1			; stack pointer before execution of last instruction
tmptrp	*=*+1			; used to save hi byte of trap line >trap & <resume
dsptmp	*=*+1			; temporary for dispose
oldtok	*=*+1			;     "      "     "
tmpdes	*=*+6			; temporary for instr$

highst	*=*+2			; max offset for any user bank

msiism	*=*+1			; used to save length of string to be added in garb collect
newsys	= $ff6c
; ******************************************* TOKENS **********************************************
!initmem FILL                   ; All unused memory filled with $FF
; 8000 'tables, reserved words, and error texts'
*=codfwa
; entry name and entry point jump
bentry:	jmp init 			; entry point for start
	jmp warm 			; warm start re-entry point
	!byte $c3,$c2,$cd,'8'		; cmb8 ($80 or'd in 1st 3 chars)
; -------------------------------------------------------------------------------------------------
!if CC2{				; *** 128k version ***
	!byte ' '

; 800b vsp rom indirect table (petii basic only)
ieval1	!word eval1
ieval2	!word eval2
iflots	!word floats
ifretm	!word fretms
igtstk	!word getstk
iinitv	!word initv
iinpcm	!word inpcom
iprit4	!word prit4
inewst	!word newstt
iptrgt	!word ptrget
ixeqdr	!word xeqdir
igoto0	!word goto0
iinit0	!word init0
irslst	!word reslst
}
; -------------------------------------------------------------------------------------------------
; 8027 statment dispatch table
stmdsp:	!word end-1
	!word for-1
	!word next-1
	!word data-1
	!word inputn-1
	!word input-1
	!word dim-1
	!word read-1
	!word let-1
	!word goto-1
	!word run-1
	!word if-1
	!word restor-1
	!word gosub-1
	!word return-1
	!word rem-1
	!word stop-1
	!word ongoto-1
	!word fnwait-1
	!word cload-1
	!word csave-1
	!word cverf-1
	!word defn-1
	!word poke-1
	!word printn-1
	!word print-1
	!word cont-1
	!word list-1
	!word clear-1
	!word cmd-1
	!word csys-1
	!word copen-1
	!word cclos-1
	!word get-1
	!word scrath-1
	!word go-1

; disk commands, added 79-june 28
	!word concat-1
	!word dopen-1
	!word dclose-1
	!word record-1
	!word format-1
	!word colect-1
	!word backup-1
	!word dcopy-1
	!word append-1
	!word dsave-1
	!word dload-1
	!word dcat-1
	!word rename-1
	!word scratc-1
	!word dcat-1			; directory == catalog

; disk clear command added for toi
	!word dclear-1

; multi-bank related commands
	!word chbank-1
	!word bload-1
	!word bsave-1

; function key command
	!word fkey-1
	!word delete-1
	!word rem-1			; else stmt
	!word trap-1
	!word resume-1
	!word dispos-1
	!word puctrl-1

fundsp
	!word sgn
	!word int
	!word abs

usrloc
	!word usrpok
	!word fre
	!word pos
	!word sqr
	!word rnd
	!word log
	!word exp
	!word cos
	!word sin
	!word tan
	!word atn
	!word peek
	!word len
	!word strd
	!word val
	!word asc
	!word chrd
	!word leftd
	!word rightd
	!word midd
; -------------------------------------------------------------------------------------------------
; 80d1 floating point functions
optab:	!byte 121
	!word faddt-1

	!byte 121
	!word fsubt-1

	!byte 123
	!word fmultt-1

	!byte 123
	!word fdivt-1

	!byte 127
	!word fpwrt-1

	!byte 80
	!word andop-1

	!byte 70
	!word orop-1

negtab:	!byte 125
	!word negop-1

nottab:	!byte 90
	!word notop-1

ptdorl:	!byte 100
	!word dorel-1
; -------------------------------------------------------------------------------------------------
; 80ef reserved word list
reslst:
tkend=$80
	!scr "EN",$c4     		;  end
tkfor=tkend+1
	!scr "FO",$d2     		;  for
tknext=tkfor+1
	!scr "NEX",$d4    		;  next
tkdata=tknext+1
	!scr "DAT",$c1    		;  data
	!scr "INPUT",$a3  		;  input#
	!scr "INPU",$d4   		;  input
	!scr "DI",$cd     		;  dim
	!scr "REA",$c4    		;  read
	!scr "LE",$d4     		;  let
tkgoto=tkdata+6
	!scr "GOT",$cf    		;  goto
tkrun=tkgoto+1
	!scr "RU",$ce     		;  run
	!scr "I",$c6      		;  if
tkrest=tkrun+2
	!scr "RESTOR",$c5 		;  restore
tkgosu=tkrest+1
	!scr "GOSU",$c2   		;  gosub
	!scr "RETUR",$ce  		;  return
tkrem=tkgosu+2
	!scr "RE",$cd     		;  rem
	!scr "STO",$d0    		;  stop
tkon=tkrem+2
	!scr "O",$ce      		;  on
	!scr "WAI",$d4    		;  wait
	!scr "LOA",$c4    		;  load
	!scr "SAV",$c5    		;  save
	!scr "VERIF",$d9  		;  verify
	!scr "DE",$c6     		;  def
	!scr "POK",$c5    		;  poke
	!scr "PRINT",$a3  		;  print#
tkprin=tkon+8
	!scr "PRIN",$d4   		;  print
	!scr "CON",$d4    		;  cont
	!scr "LIS",$d4    		;  list
	!scr "CL",$d2     		;  clr
	!scr "CM",$c4     		;  cmd
	!scr "SY",$d3     		;  sys
	!scr "OPE",$ce    		;  open
	!scr "CLOS",$c5   		;  close
	!scr "GE",$d4     		;  get
tkscra=tkprin+9
	!scr "NE",$d7     		;  new
tktab=tkscra+1
	!scr "TAB",$a8    		;  tab(
tkto=tktab+1
	!scr "T",$cf      		;  to
tkfn=tkto+1
	!scr "F",$ce      		;  fn
tkspc=tkfn+1
	!scr "SPC",$a8    		;  spc(
tkthen=tkspc+1
	!scr "THE",$ce    		;  then
tknot=tkthen+1
	!scr "NO",$d4     		;  not
tkstep=tknot+1
	!scr "STE",$d0    		;  step
tkplus=tkstep+1
	!byte   $ab          		;  "+"
tkminu=tkplus+1
	!byte $ad          		;  "-"
	!byte $aa          		;  "*"
	!byte $af          		;  "/"
	!byte $de          		;  "^"
	!scr "AN",$c4     		;  and
	!scr "O",$d2      		;  or
tkgrea=tkminu+6
	!byte $be          		;  ">"
tkequl=tkgrea+1
	!byte $bd          		;  "="
tkless=tkequl+1
	!byte $bc          		;  "<"
tkonef=tkless+1
	!scr "SG",$ce     		;  sgn
	!scr "IN",$d4     		;  int
	!scr "AB",$d3     		;  abs
	!scr "US",$d2     		;  usr
	!scr "FR",$c5     		;  fre
	!scr "PO",$d3     		;  pos
	!scr "SQ",$d2     		;  sqr
	!scr "RN",$c4     		;  rnd
	!scr "LO",$c7     		;  log
	!scr "EX",$d0     		;  exp
	!scr "CO",$d3     		;  cos
	!scr "SI",$ce     		;  sin
	!scr "TA",$ce     		;  tan
	!scr "AT",$ce     		;  atn
	!scr "PEE",$cb    		;  peek
	!scr "LE",$ce     		;  len
	!scr "STR",$a4    		;  str$
	!scr "VA",$cc     		;  val
	!scr "AS",$c3     		;  asc
tklasn=tkonef+19
	!scr "CHR",$a4    		;  chr$
	!scr "LEFT",$a4   		;  left$
	!scr "RIGHT",$a4  		;  right$
	!scr "MID",$a4    		;  mid$
tkgo=tklasn+4
	!scr "G",$cf      		;  go
	!scr "CONCA",$d4  		;  concat
	!scr "DOPE",$ce   		;  dopen
	!scr "DCLOS",$c5  		;  dclose
	!scr "RECOR",$c4  		;  record
	!scr "HEADE",$d2  		;  header
	!scr "COLLEC",$d4 		;  collect
	!scr "BACKU",$d0  		;  backup
	!scr "COP",$d9    		;  copy
	!scr "APPEN",$c4  		;  apppend
	!scr "DSAV",$c5   		;  dsave
	!scr "DLOA",$c4   		;  dload
	!scr "CATALO",$c7 		;  catalog
	!scr "RENAM",$c5  		;  rename
	!scr "SCRATC",$c8 		;  scratch
	!scr "DIRECTOR",$d9; directory
	!scr "DCLEA",$d2  		;  dclear
	!scr "BAN",$cb    		;  bank
	!scr "BLOA",$c4   		;  bload
	!scr "BSAV",$c5   		;  bsave
	!scr "KE",$d9     		;  key
	!scr "DELET",$c5  		;  delete
tkelse=tkgo+22
	!scr "ELS",$c5    		;  else
tktrap=tkelse+1
	!scr "TRA",$d0    		;  trap
tkresu=tktrap+1
	!scr "RESUM",$c5  		;  resume
	!scr "DISPOS",$c5 		;  dispose
	!scr "PUDE",$c6   		;  pudef
tkusin=tkresu+3
	!scr "USIN",$c7   		;  using
tkerrd=tkusin+1
	!scr "ERR",$a4    		;  err$
tkinst=tkerrd+1
	!scr "INST",$d2   		;  instr
	!byte 0            		;  end of reserved word list
; -------------------------------------------------------------------------------------------------
; 828f message vectors
ebase                   	;base for error messages
ms0 =*-ebase
	!word ams0
ms1 =*-ebase
	!word ams1
ms2 =*-ebase
	!word ams2
ms3 =*-ebase
	!word ams3
ms4 =*-ebase
	!word ams4
ms5 =*-ebase
	!word ams5
ms6 =*-ebase
	!word ams6
ms7 =*-ebase
	!word ams7
ms8 =*-ebase
	!word ams8
ms9 =*-ebase
	!word ams9
msg30 =*-ebase
	!word ams30
msg31 =*-ebase
	!word ams31

msrdy =*-ebase
	!word reddy
intxt =*-ebase
	!word aintxt
brktxt =*-ebase
	!word abrktx
exignt =*-ebase
	!word aexi
tryagn =*-ebase
	!word atry
fbptr =*-ebase
	!word fbuffr
mremsg =*-ebase
	!word aremsg
asigon =*-ebase
	!word signon

errnf =*-ebase
	!word aernf
errsn =*-ebase
	!word aersn
errrg =*-ebase
	!word aerrg
errod =*-ebase
	!word aerod
errfc =*-ebase
	!word aerfc
errov =*-ebase
	!word aerov
errom =*-ebase
	!word aerom
errus =*-ebase
	!word aerus
errbs =*-ebase
	!word aerbs
errdd =*-ebase
	!word aerdd
errdvo =*-ebase
	!word aerdvo
errid =*-ebase
	!word aerid
errtm =*-ebase
	!word aertm
errls =*-ebase
	!word aerls
errbd =*-ebase
	!word aerbd
errst =*-ebase
	!word aerst
errcn =*-ebase
	!word aercn
erruf =*-ebase
	!word aeruf
errld =*-ebase
	!word aerld
errvr =*-ebase
	!word aervr
erros =*-ebase
	!word aeros
errcr =*-ebase
	!word aercr
errdi =*-ebase
	!word aerdi
errbln=*-ebase
!if CC2+CC3+CC4{
errot =*-ebase
	!word aerot
}
!if CC3+CC4{
erroa =*-ebase
	!word aeroa
}
; -------------------------------------------------------------------------------------------------
; 82e7 kernal error messages.
ams0	!scr "STOP KEY DETECTED",0
ams1	!scr "TOO MANY FILES",0
ams2	!scr "FILE OPEN",0
ams3	!scr "FILE NOT OPEN",0
ams4	!scr "FILE NOT FOUND",0
ams5	!scr "DEVICE NOT PRESENT",0
ams6	!scr "NOT INPUT FILE",0
ams7	!scr "NOT OUTPUT FILE",0
ams8	!scr "MISSING FILE NAME",0
ams9	!scr "ILLEGAL DEVICE "
	!scr "NUMBER",0

; basic error messages.
ams30	!scr cr,"ARE YOU SURE ?",0
ams31	!scr cr,"BAD DISK ",cr,0

aernf	!scr "NEXT WITHOUT FOR",0
aersn	!scr "SYNTAX ERROR",0
aerrg	!scr "RETURN WITHOUT GOSUB",0
aerod	!scr "OUT OF DATA",0
aerfc	!scr "ILLEGAL QUANTITY",0
aerov	!scr "OVERFLOW",0
aerom	!scr "OUT OF MEMORY",0
aerus	!scr "UNDEFINED STATEMENT",0
aerbs	!scr "BAD SUBSCRIPT",0
aerdd	!scr "REDIM",$27,"D ARRAY",0
aerdvo	!scr "DIVISION BY ZERO",0
aerid	!scr "ILLEGAL DIRECT",0
aertm	!scr "TYPE MISMATCH",0
aerls	!scr "STRING TOO LONG",0
aerbd	!scr "FILE DATA",0
aerst	!scr "FORMULA TOO COMPLEX",0
aercn	!scr "CANNOT CONTINUE",0
aeruf	!scr "UNDEFINED FUNCTION",0
aerld	!scr cr,"?LOAD ERROR",cr,0
aervr	!scr cr,"?VERIFY ERROR",cr,0

aintxt	!scr " IN ",0
reddy	!scr cr,"READY.",cr,0
abrktx	!scr cr,"BREAK",0

aexi	!scr "EXTRA IGNORED",cr,0
atry	!scr "REDO FROM START",cr,0
aremsg	!scr "MORE",cr,0
aeros	!scr "OUT OF STACK",0
!if CC2+CC3+CC4{
aerot	!scr "OUT OF TEXT",0
}
!if CC3+CC4{
aeroa	!scr "OUT OF ARRAY SPACE",0
}
aercr	!scr "UNABLE TO RESUME",0
aerdi	!scr "UNABLE TO DISPOSE",0

; ******************************************* CONTRL **********************************************
; 8550 'output error code and start again'
omerr:	ldx #errom		; out of memory

;   entry: x= offset from errtable
error:	jmp (ierror)

nerror:	stx errnum		; save error index
	cpx #errus		; don't trap undefined statement errors
	beq errisd
	jsr tstdir		; don't trap if in direct mode
	beq errisd
	ldy trapno+1		; is trap vector set?
	iny
	beq errisd		; not if $ff
	dey			; restore trapno+1
	sty linnum+1
	sty tmptrp		; save until a resume is executed
	ldy trapno		; finish vector
	sty linnum
	ldy #$ff
	sty trapno+1		; marks no more traps until a 'resume' or 'trap'
	ldx #1

sots:	lda curlin,x
	sta errlin,x
	lda oldtxt,x
	sta errtxt,x
	dex
	bpl sots
	ldx oldstk
	txs
	jsr maptxt		; make sure we're in text
	jsr luk4it		; set up pointers
	jmp nstt9		; and goto that line

errisd:	lda channl
	beq error2		; close non-terminal channel.
	jsr clrch		; close it
	lda #0
	sta channl
error2:	jsr ocrlf		; output new line
	jsr outqst		; output '?'
	ldx errnum		; restore offset

	jsr msg			; output message

	jsr stkini		; reset stk and flags

errfin:	jsr maptxt		; reset i6509
	ldy curlin+1
	cpy #$fa
	bcs ready		; if # = 64000, don't type line #
	ldx #intxt
	jsr msg
	lda curlin+1
	ldx curlin

	jsr linprt		; list line

; 85c0 main loop for basic
ready:	ldx #msrdy
	jsr msg			; ready.
	lda #$80		; turn off messages
	jsr setmsg

main:	jmp (imain)

nmain:	ldx #255
	stx curlin+1
	stx errlin
	stx errlin+1		; flag no errors yet
	stx errnum
	jsr inlin		; get a line from terminal
	sta txtptr		; txtptr:=^to input buffer
	sty txtptr+1
	stx txtptr+2
	jsr chrget
	tax
	beq main		; if end of line
	bcc main1		; if line number
	jsr crunch
	jsr chrgot		; get command
	jmp xeqdir		; execute command

main1:	jsr linget		; read line # into linnum
	jsr crunch
	sty count		; retain char count
	jsr fndlin
	bcc nodel		; no match, so don't delete
	ldy #1
	lda (lowtr),y
	sta index1+1

!if CC1{		; *** 64k version ***
	lda vartab		; text end (64k)
} else{			; *** not 64k version ***
	lda txtend		; text end (except 64k)
}
	sta index1
	lda lowtr+1		; set xfer to
	sta index2+1
	dey
	lda (lowtr),y		;  compute length
	clc
	sbc lowtr
	eor #$ff		;  make it negative
	clc
!if CC1{		; *** 64k version ***
	adc vartab		; compute new text end
	sta vartab
	sta index2		; set low of xfer to
	lda vartab+1
	adc #255
	sta vartab+1		; compute high of text end
} else{			; *** not 64k version ***
	adc txtend		; compute new text end
	sta txtend
	sta index2		; set low of xfer to
	lda txtend+1
	adc #255
	sta txtend+1		; compute high of text end
}
	sbc lowtr+1		; compute # of blocks to move
	tax
	sec
	lda lowtr
!if CC1{		; *** 64k version ***
	sbc vartab		; compute offset
} else{			; *** not 64k version ***
	sbc txtend
}
	tay
	bcs qdect1		; if vartab <= lowtr
	inx			; dec due to carry and
	dec index2+1		; dec store so carry works
qdect1:	clc
	adc index1
	bcc mloop
	dec index1+1
	clc
mloop:	lda (index1),y
	sta (index2),y
	iny
	bne mloop
	inc index1+1
	inc index2+1
	dex
	bne mloop
nodel:	jsr clearc
	jsr lnkprg
	ldy #0
	lda (txtptr),y		; delete line?
	bne nodele		; no...
	jmp main

nodele:	clc			; no...something to insert

!if CC1{		; *** 64k version ***
	lda vartab
	ldy vartab+1
} else{			; *** not 64k version ***
	lda txtend
	ldy txtend+1
}
	sta hightr
	sty hightr+1		; top of block to move

	adc count		; length of characters in line
	bcc nodel1
	iny
nodel1:	clc
	adc #4 			; plus link and line #
	bcc nodelc
	iny
nodelc:	sta highds		; destination of top
	sty highds+1

; low block address is lowtr
; where it was left in the call to fndlin
!if CC1{		; *** 64k version ***
	jsr bltu
} else{			; *** not 64k version ***
	jsr bltut
}

; make links non-null to fool chead
	ldy #0
	lda #1
	sta (lowtr),y
	iny
	sta (lowtr),y

; put line number in text
	iny
	lda linnum
	sta (lowtr),y
	lda linnum+1
	iny
	sta (lowtr),y

; advance lowtr to start of line
	iny
	tya
	clc
	adc lowtr
	sta lowtr
	bcc main2
	inc lowtr+1

main2:
!if CC1{		; *** 64k version ***
	lda strend		; 64k only
	ldy strend+1
	sta vartab
	sty vartab+1
}

; block move line to text
	ldy count
	dey
stolop:	lda (txtptr),y
	sta (lowtr),y
	dey
	dec count
	bne stolop
fini:	jsr lnkprg
	jsr runc
	jmp main

lnkprg:	lda txttab
	ldy txttab+1
	sta index
	sty index+1
	clc 
chead:	ldy #0
	lda (index),y		; check for null link
	bne chea3
	iny
	lda (index),y
	beq lnkrts
chea3:	ldy #4
czloop:	iny
	lda (index),y
	bne czloop
	iny
	tya
	adc index
	tax
	ldy #0
	sta (index),y
	tya
	adc index+1
	iny
	sta (index),y
	stx index
	sta index+1
	bcc chead		; always
lnkrts:	clc
	lda index		; set pointer to end of text
	ldy index+1
	adc #2
	bcc *+3
	iny
!if CC1{		; *** 64k version ***
	sta varend
	sty varend+1
} else{			; *** not 64k version ***
	sta txtend
	sty txtend+1
}
	rts
; -------------------------------------------------------------------------------------------------
; 86e3 line input routine
;   enter: buffpt is used as pointer to start of input buffer.
;   exit:  regs contain pointer to byte preceding buffer
;   index1 also has this pointer value.
;   .a, .y = offset, .x = bank#

inlin:	lda buffpt
	ldy buffpt+1
	ldx #txtbnk
	sta index1
	sty index1+1
	stx index1+2
	ldy #0
inlinc:	sty count
	jsr basin
	cmp #cr
	beq fininl
	ldy count
	sta (index1),y
	iny
	cpy #bufsiz
	bcc inlinc
	jmp errlen		; string too long
fininl:	ldy count
	lda #0
	sta (index1),y		; line terminator
	lda channl
	bne *+5
	jsr ocrlf
	ldy index1+1
	ldx index1
	bne *+3
	dey
	dex
	txa
	ldx #txtbnk
	rts
; -------------------------------------------------------------------------------------------------
; 871f searches program text for the line whose number is passed in 'linnum'.
;   exit:
;   cbit set: lowtr -> to the link field in the line which is the one searched for.
;   cbit clear: line not found. (lowtr) -> line in the program > the one sough after
;   always assume text bank should be used
fndlin:	lda txttab
	ldx txttab+1
fndlnc:	sta lowtr
	stx lowtr+1
	ldy #0
	lda (lowtr),y		; check for null link
	bne fndln3
	iny
	lda (lowtr),y
	beq flnrt
fndln3:	ldy #3
	lda (lowtr),y
	cmp linnum+1
	beq fndl20		; look at low bytes
	bcc affrts		; if not equal,try next
flnrt:	clc			; didn't find it
flnrts:	rts

fndl20:	dey
	lda (lowtr),y
	cmp linnum
	beq flnrts		; if number found
	bcs flnrt		; if above number
affrts:	ldy #1
	lda (lowtr),y
	tax
	dey
	lda (lowtr),y
	bcc fndlnc		; always
; -------------------------------------------------------------------------------------------------
; 8751 here for new statment.
;   character -> by txtptr is ':' or eol. the adr of this loc is left on the stack when a statement
;   is executed so that it can merely do a rts when it is done.
;   get char, exit via xeqcm3, and return to newstt
xeqcm:
gone:	jmp (igone)
ngone:	jsr chrget		; get statement type
xeqdir:	jsr xeqcm3

newstt:	jsr kstop
	bne nstt1		; if stop not requested
	sec			; brk msg desired
	jmp stopc		; if stop requested

sav42:	lda (txtptr),y		; make sure it's not end-of-text
	bne nstt4
	iny
	lda (txtptr),y		; end of text storage?
	bne nstt4		; no...go to next line
nstt3:	jmp ready			; yes...finished

nstt4:	ldy #3			; new line, update pointers
	lda (txtptr),y 		; extract line# lo byte
	sta curlin
	iny
	lda (txtptr),y		; extract line # hi byte
	sta curlin+1
	rts

nstt1:	jsr tstdir		; are we in direct mode?
	beq nstt2		; yes...

; in run mode...
; save txtptr for cont command
nstt9:  lda txtptr		; entry point for error trapping
	ldy txtptr+1
	sta oldtxt
	sty oldtxt+1
	tsx
	stx oldstk		; save in case of error

nstt2:	ldy #0
	lda (txtptr),y		; end of the line?
	bne morsts		; no...end of statement

	jsr tstdir		; in direct mode?
	beq nstt3		; yes...finished execution

; in run mode...
; look for start of next line
	ldy #1
	jsr sav42
	tya 			; y=4
	clc
	adc txtptr 		; point @ character before line start
	sta txtptr
	bcc xeqcm
	inc txtptr+1
	bne xeqcm		; always...execute new line

; set up for command processing and set processor address on stack, exit via jmp to chrget
xeqcm3:	beq ffrts
xeqcm2:	cmp #pi
	beq snerr1
	sec
	sbc #tkend
	bcc glet
	cmp #tkscra-tkend+1
	bcc nstt6
	cmp #tkgo-tkend
	bcc snerr1
	cmp #tkerrd-tkend
	bcs snerr1		; trap err$ & instr$
	sbc #tkgo-tkscra-2
nstt6:	asl
	tay
	lda stmdsp+1,y
	pha
	lda stmdsp,y
	pha			; process address on stack
	jmp chrget		; process command

glet:	jmp let

morsts:	cmp #':'
	bne snerr1
	jmp xeqcm		; if ':', continue statement
snerr1:	jmp snerr		; -> syntax error, ready
; -------------------------------------------------------------------------------------------------
; 87db find a 'for' entry on the stack via varpnt
;   exit:
;   not found - z=0
;   found -  z=1, .x=stack offset to for entry
;   fndfor is also used by the return statement to clear off all loops activated during a gosub call. i.e.,
;   all for entries between tos and last gosub entry. register .a contains token value which ended the search.
;   when fndfor is used by a next statement for which no for-variable was given, forpnt shall contain values
;   impossible for actual variables.
fndfor:	tsx			 ; load x with stk ptr.
	inx
	inx
	inx
	inx		 	; ignore adr (newstt) and rts adr.

ffloop:	lda 257,x		; get stack entry
	cmp #tkfor
	bne ffrts		; if not 'for' token
	lda forpnt+2		; test for real bank#
	bpl cmpfor		; yes...
	lda 258,x		; no, so assume this one
	sta forpnt
	lda 259,x
	sta forpnt+1
	lda 260,x
	sta forpnt+2
cmpfor:	cmp 260,x
	bne addfrs
	lda forpnt+1
	cmp 259,x
	bne addfrs
	lda forpnt
	cmp 258,x
	beq ffrts
addfrs:	txa 
	clc
	adc #forsiz
	tax
	bne ffloop
ffrts:	rts
; -------------------------------------------------------------------------------------------------
; 8815 block transfer routine(s).
;   make space by shoving everything forward.

;   this is done for two purposes:
;   1. to make room for new statements
;   2. to make room for new simple variables.

;   for the 64k version, a single block transfer routine (bltu)
;   serves both purposes. for the 128k, 192k, and 256k versions,
;   separate routines, bltut (for text) and bltuv (for vars),
;   are used as well as a general version of bltu.

;   the allocation of new space requires that checks be made
;   to see if enough memory exists. for the 64k version, the
;   routine, reason, is called. for the 128k, 192k, and 256k
;   versions, reason is called for variables and reasnt is
;   called for text.

;   entry: y,a = (highds)
;   (highds)= destination of high address
;   (lowtr) = lowest adr to be xferred
;   (hightr)= highest adr to be xferred

;
;   exit: (lowtr) = unchanged
;   (hightr)= (lowtr)-80h
;   (highds)= lowest adr xferred into minus 80h
;    high boundary set to new value:
; bltu(64k): strend
; bltut: text end
; bltuv: variable end (strend or varend)
!if CC2+CC3+CC4{	; *** not 64k version ***
bltut:	jsr reasnt
	sta txtend		; set new end of text
	sty txtend+1
	bcc bltu		; move it  ... always
;
bltuv:	jsr reason
}
!if CC2{		; *** 128k version ***
	sta strend		; 128k version
	sty strend+1
	jsr mapvar
}
!if CC3{		; *** 192k version ***
	sta strend		; 192k version
	sty strend+1
	rts		;  nothing to move
}
!if CC4{		; *** 256k version ***
	sta varend		; 256k version
	sty varend+1
	rts			;  nothing to move
}
bltu:
!if CC1{		; *** 64k version ***
	jsr reason		; 64k version
	sta strend
	sty strend+1
	jsr maptxt
}
	sec			; (all versions) prepare to subract
	lda hightr
	sbc lowtr		; compute # of things to move and save
	sta index
	tay
	lda hightr+1
	sbc lowtr+1
	tax			; put it in a counter reg
	inx			; so that cntr algorithm works
	tya			; see if low part of cnt is 0
	beq decblt		; if 0, start moving blocks
	lda hightr		; must justify base adr
	sec
	sbc index
	sta hightr
	bcs blt1
	dec hightr+1
	sec
blt1:	lda highds
	sbc index
	sta highds
	bcs moren1
	dec highds+1
	bcc moren1
bltlp:	lda (hightr),y
	sta (highds),y
moren1:	dey
	bne bltlp
	lda (hightr),y
	sta (highds),y
decblt:	dec hightr+1
	dec highds+1
	dex
	bne moren1
	jmp maptxt
; -------------------------------------------------------------------------------------------------
; 8866 ascertain that a given number of locs remain available for the stack.
;   entry: lda #number of word entries needed
;   jsr getstk must be called by any routine which puts an arbitrary amount of stuff on the stack.
;   note: routines that merely use and free up the guaranteed numlev locations need not call getstk.
;   exit: a and x have been modified.
getstk:	asl			; an entry is two bytes
	adc #numlev+numlev	; overhead required for maximum
	bcs oserr
	sta index		; this much memory must be left
	tsx
	cpx index 		; is it?
	bcs rearts		; yes...

oserr:	ldx #erros		; out of stack space error
	jmp error

reason:
!if CC1+CC2+CC3{	; *** not 64k version ****
	cpy fretop+1
	bcc rearts
	bne trymor
	cmp fretop
	bcc rearts
trymor:	pha
	ldx #8+addprc
	tya
reasav:	pha
	lda highds-1,x
	dex
	bpl reasav
	jsr garba2
	ldx #248-addprc
reasto:	pla
	sta highds+8+addprc,x
	inx
	bmi reasto
	pla
	tay
	pla
	cpy fretop+1
	bcc rearts
	bne omerrc
	cmp fretop
	bcc rearts
}
!if CC4{		; *** 256k version ***
	cpy highst+1
	bcc rearts
	bne omerrc
	cmp highst
	bcc rearts
}
omerrc:	jmp omerr		; out of memory error

sav73:	jsr ptrget
sav74:	sta forpnt
	sty forpnt+1
	stx forpnt+2
rearts:	rts

!if CC2+CC3+CC4{	; *** not 64k version ****
reasnt:	cpy buffpt+1
	bcc rearts
	bne omerrt
	cmp buffpt
	bcc rearts
omerrt:	ldx #errot
	jmp error
}
!if CC3+CC4{		; *** 192k+256k version ***
reasna:	cpy highst+1
	bcc rearts
	bne omerra
	cmp highst
	bcc rearts
omerra ldx #erroa
	jmp error
}
; -------------------------------------------------------------------------------------------------
; 88bf crunch
;   entry:  txtptr points to start of text to crunch
;   exit:   txtptr points to start of crunched text
;   calls:  chrget, chrgot, reser, kloop, rem, data
;   collapses all reserved words to tokens.  does not alter data or rem.  removes all graphic
;   characters not in quoted strings

crunch:	jmp (icrnch)

ncrnch:	lda txtptr		; save old text loc
	pha
	lda txtptr+1
	pha
crun05:	jsr chrgot
	jmp crun20

crun10:	jsr chrget
crun20:	bcc crun10		; don't crunch numbers
	cmp #0			; end of line?
	beq crun90		; yes...
	cmp #':'		; multi-stmt char?
	beq crun10
	cmp #'?'		; print abreviation?
	bne crun30		; no...
	lda #tkprin		; substitute print token
	ldy #0
	sta (txtptr),y
	beq crun10		; branch always
crun30:	cmp #$80		; graphics?
	bcc crun40		; no...
	cmp #pi			; yes...pi?
	beq crun10		; o.k....leave alone
	ldy #1
	jsr kloop		; crunch out graphics
	beq crun05		; branch always
crun40:	cmp #$22 ; "		; quote string?
	bne crun60		; no...
crun50: jsr chrget
	cmp #$0			; end of line?
	beq crun90		; yes...
	cmp #$22 ; "		; close quote?
	beq crun10		; yes...
	bne crun50		; no...
crun60:	jsr reser		; reserved word?
	bcc crun10
	cpy #0			; anything to move?
	beq crun70		; no...
	jsr kloop		; crunch it out
crun70:	lda count		; put token...
	ldy #0
	sta (txtptr),y		; in text
	cmp #tkrem
	beq crun80
	cmp #tkdata
	bne crun10
	jsr chrget
	jsr data
	jmp crun05
crun80:	jsr chrget
	jsr rem

; no other statements can follow a rem
crun90:	ldx txtptr
	pla
	sta txtptr+1
	pla
	sta txtptr
	sec			; compute length of line
	txa
	sbc txtptr
	tay
	iny
	rts
; -------------------------------------------------------------------------------------------------
; 893f kloop
;   crunch loop.  moves offset .y characters from txtptr to end of line

; assume i6509 set to text by crunch.
kloop:	clc			; compute source address
	tya
	adc txtptr
	sta index1
	lda txtptr+1
	adc #0
	sta index1+1
	ldy #0
kloop2:	lda (index1),y		; move source
	sta (txtptr),y		; to destination offset
	iny
	cmp #0			; end of line?
	bne kloop2		; no...
	rts
; -------------------------------------------------------------------------------------------------
; 8957 reser
;   search reserved word list for a match
;   entry:  (txtptr) is first char of word to match
;   exit:   .y=length of word matched
;   .c=success/fail (set/clear) flag
;   count=token value

; assume i6509 set to text by crunch already.
reser:	lda #>reslst		; start search here
	ldy #<reslst
	sta index1+1
	sty index1
	ldy #0
	sty count
	dey
rese10:	iny
rese20:	lda (txtptr),y
	sec
	sbc (index1),y		; does letter match?
	beq rese10		; yes...continue
	cmp #eom		; no...end of word?
	beq rese60		; yes...c set...done

; find next word
rese30:	jsr ldi1y
	bmi rese40		; found end of current
	iny
	bne rese30
rese40:	iny			 ; start of next
	inc count		; value of token
	clc
	tya
	jsr sav14
	clc
	ldy #0
	jsr ldi1y		;  end of list?
	bne rese20		; no...

; yes...carry clear...fail
rese60:	ora count		; .a=$80 if match
	sta count		; token is formed
	rts
; ****************************************** BVERBS1 **********************************************
; 898d LIST - process list verb

list:	jsr range		; set up line range
	bne lstend		; ok...
	rts			; some bad params, do nothing

lstend:	pla
	pla

list4:	ldy #1
	sty dores
	lda (lowtr),y
	bne list44
	dey
	lda (lowtr),y
	beq grody
list44:	ldy #1
	jsr kstop
	bne list5		; if no stop requested
	clc			; no brk msg desired for...
	jmp stopc		; ...process stop

list5:	jsr ocrlf		; new line
	iny
	lda (lowtr),y
	tax
	iny
	lda (lowtr),y
	cmp linnum+1
	bne tstdun
	cpx linnum
	beq typlin

tstdun:	bcs grody
typlin:	sty lstpnt
	jsr linprt
	lda #$20
prit4:	ldy lstpnt
	and #$7f
ploop:	jsr ochr
	cmp #$22;"
	bne ploop1
	lda dores
	eor #$ff
	sta dores
ploop1:	iny
	beq grody
	lda (lowtr),y
	bne qplop
	tay
	lda (lowtr),y
	tax
	iny
	lda (lowtr),y
	stx lowtr
	sta lowtr+1
	jmp list4
grody:	jmp ready

qplop:	jmp (iqplop)

nqplop:	bpl ploop
	cmp #pi
	beq ploop
	bit dores
	bmi ploop
	tax
	sty lstpnt
	ldy #>reslst
	sty index1+1
	ldy #<reslst
	sty index1
	ldy #0
plop20:	asl
	beq prit3b

; point index1 at start of word
resrch:	dex
	bpl prit3
rescr1:	inc index1
	bne rescr2
	inc index1+1
rescr2:	jsr ldi1y
	bpl rescr1
	bmi resrch

; list word indexing by y
prit3:	iny
prit3b:	jsr ldi1y
	bmi prit4
	jsr ochr
	bne prit3
; -------------------------------------------------------------------------------------------------
; 8a29 process new and clr commands.
;   scrtch resets text area.
;   clearc resets data areas.

scrath:	bne stkrts
scrtch:	lda #0
	tay
	sta (txttab),y
	iny
	sta (txttab),y
	clc
	lda txttab
	adc #2
!if CC1{			; *** 64k version ***
	sta vartab
	lda txttab+1
	adc #0
	sta vartab+1
}
!if CC2+CC3+CC4{		; *** not 64k version ***
	sta txtend
	lda txttab+1
	adc #0
	sta txtend+1
}

runc:	jsr stxtpt
	lda #0

; 8a45 clearc:
;   (64k) strend:=arytab:=vartab
;   (128k) strend:=arytab:=vartab
;   (192k) strend:=vartab, aryend:=arytab
;   (256k) varend:=vartab, aryend:=arytab

clear:	bne stkrts
clearc:	jsr settop			; set top of memory
	lda #$ff			; indicate no error trap vector
	sta trapno+1
	ldx #pumony-puchrs		; reset print using chars
clrpu:	lda pudefs,x
	sta puchrs,x
	dex
	bpl clrpu
	lda #sysbnk
	sta dfbank			; set default to system bank#
	lda #0
	sta dsdesc			; clear ds$
	jsr clall
	lda vartab
	ldy vartab+1
!if CC4{			; *** 256k version ***
	sta varend			; only 256k
	sty varend+1
}
!if CC1+CC2+CC3{		; *** not 256k version ***
	sta strend			; except 256k
	sty strend+1
}
!if CC1+CC2{			; *** 64k+128k version ***
	sta arytab			; only 64k,128k
	sty arytab+1
}
!if CC3+CC4{			; *** 192k+256k version ***
	lda arytab			; only 192k,256k
	ldy arytab+1
	sta aryend
	sty aryend+1
}
fload:	jsr resto1

; reset stk, clear oltxt and current channel
stkini:	ldx #0
	stx temppt
	pla 
	tay
	pla			; get callers address
	ldx #$fe		; reset stack (leave $01ff free)
	txs
	pha
	tya
	pha			; restore caller's address
	lda #0
	sta oldtxt
	sta oldtxt+1
	sta channl		; clear out channel
	sta dolu
	sta subflg
stkrts:	rts

pudefs:	!scr " ,.$"		; default fill,comma,dec pt,money symbols
; -------------------------------------------------------------------------------------------------
; a980 FOR
;    a 'for' entry on the stk has the following format using sp relative offsets:
;    (17-18) txtptr value to end of for-stmt
;    (15-16) line number of for-stmt
;    (10-14) limit value, in basic floating form
;    (04-09) step value, in fac floating form
;    (01-03) ptr to for-var's data area
;    (00)    tkfor token

;   this code creates a new for-entry on the stack.
;   note, return to the caller of "for" is cleared and control jumps to newstt. active for-loops between this
;   and an older loop of the same for-variable are cleared off.

for:	lda #128
	sta subflg		; integer for-vars illegal
	jsr let			; for-var <- initial value
	jsr fndfor		; pop off redundant entries
	bne notol
	txa
	adc #forsiz-3
	tax
	txs
notol:	pla
	pla
	lda #8+addprc
	jsr getstk
	jsr datan
	clc
	tya
	adc txtptr		; ptr to end-of-for-stmt
	pha
	lda txtptr+1
	adc #0
	pha
	lda curlin+1		; line number
	pha
	lda curlin
	pha
	lda #tkto
	jsr synchr		; check for 'to' token
	jsr chknum
	jsr frmnum		; compute limit, round
	lda facsgn
	ora #127
	and facho
	sta facho
	lda #<ldfone		; return from forpsh
	ldy #>ldfone
	sta index1
	sty index1+1
	jmp forpsh
ldfone:	lda #<fone		; "one",default step
	ldy #>fone
	jsr movfm
	jsr chrgot
	cmp #tkstep
	bne oneon		; no step given...
	jsr chrget
	jsr frmnum		; compute step value
oneon:	jsr sign
	jsr pushf
	lda forpnt+2		; for-var pointer
	pha
	lda forpnt+1
	pha
	lda forpnt
	pha
	lda #tkfor		; for token
	pha
	jmp newstt		; get new statement
; -------------------------------------------------------------------------------------------------
; 8b06 NEXT

next:	bne getfor
	ldx #$ff		; garbage bank#
	bmi stxfor		; always
getfor:	jsr ptrget
stxfor:	jsr sav74
	jsr fndfor
	beq havfor
	ldx #errnf
	jmp error

havfor:	txs
	txa
	clc
	adc #2+ptrsiz		;  offset to step va lue
	pha
	adc #5+addprc
	sta index2		; offset to limit value
	pla
	ldy #1
	jsr movfm		; fac<-step value
	tsx
	lda addprc+265,x
	sta facsgn
	lda forpnt
	ldy forpnt+1
	ldx forpnt+2
	jsr ucnupk		; acc <- for value
	jsr faddt
	jsr movvf		; for var=for var+step
	ldy #1
	jsr fcompn		; compare to limit
	tsx
	sec			; correct results for sign
	sbc addprc+265,x
	beq loopdn
	lda 270+addprc+addprc,x
	sta curlin		; not done, repeat...
	lda 271+addprc+addprc,x
	sta curlin+1
	lda 273+addprc+addprc,x
	sta txtptr
	lda 272+addprc+addprc,x
	sta txtptr+1
newsgo:	jmp newstt

loopdn:	txa			; cy=1
	adc #16+addprc+addprc
	tax
	txs			; pop for-entry off stack
	jsr chrgot
	cmp #','
	bne newsgo
	jsr chrget
	jsr getfor
	jmp frmnum
; -------------------------------------------------------------------------------------------------
; 8b79 RESTORE

restor:	beq resto1		; no argument..set pointer to start of text
	jsr getpin 		; get line #
	sty linnum 		; store < of arg
	sta linnum+1		; store > of arg
	jsr maptxt
	jsr fndlin 		; point to link of arg. line #
	bcc reserr		; line not found
	lda lowtr		; fndlin's result
	sbc #1
	sta datptr
	lda lowtr+1
	sbc #0
	sta datptr+1
	rts
resto1:	sec
	lda txttab
	sbc #1
	sta datptr
	lda txttab+1
	sbc #0
	sta datptr+1
runm10:	rts
reserr:	jmp userr 		; undef'd statement
; -------------------------------------------------------------------------------------------------
; 8ba8 STOP - process stop verb

stop:	bcs stpz2
end:	clc
stpz2:	bne contx
	beq stopd		; always

; here if stop key depressed while running
; enter: cy=0   =>  no break message desired
stopc:	php        		; entered from list or newstt
	ldy trapno+1   		; test if error trapping on
	iny
	beq sa         		; branch if not

unstop: jsr kstop      		; don't go on till stop key no longer depressed
	beq unstop
	ldx #$1c       		; otherwise load 'break' error number
	jmp error      		; and error routine will goto error trapping
sa:	plp
	pha
	pha		 ; ....push dummy return to be discarded
stopd:	php		 ;  save cy flag
	jsr tstdir		; in direct mode?
	beq nsxx4		; yes...can't continue
	lda txtptr
	ldy txtptr+1
	sta oldtxt
	sty oldtxt+1
	lda curlin
	ldy curlin+1
	sta oldlin
	sty oldlin+1
nsxx4:	plp		 ; restore cy flag
	pla		 ; pop off return to newstt from xeqcm3
	pla
endcon:	bcc nsxx6		; if no break message
	ldx #brktxt
	jsr msg		 ; output message
	jmp errfin

nsxx6:	jmp ready		; output ready message

cont:	bne contx		; make sure there is a terminator
	ldy oldtxt+1
	bne contz3		; if there is code to continue
	lda oldtxt
	bne contz4
	ldx #errcn
	jmp error
contz3 lda oldtxt
contz4 sta txtptr
	sty txtptr+1
	lda oldlin
	ldy oldlin+1
	sta curlin
	sty curlin+1
contx:	rts
; -------------------------------------------------------------------------------------------------
; 8c07 RUN - process run verb

run:	jsr runmod		; set run mode
	jsr chrgot		; is there a line # ?
	bne run2		; yes...
	jmp runc		; no...run from txttab and clear stack
run2 jsr clearc			; run from line #...only clear stack
	beq runc2		; common routine for goto and gosub ... always go

;initialize run mode
;can be started by run,goto, or gosub
runmod:	jsr tstdir
	bne runm10		; already running
	lda #$fe		; curlin>64999 and <> $ff00
; neither valid line or direct mode
	sta curlin+1
	lda #0
	jmp setmsg		; no loading messages, etc. during run
; -------------------------------------------------------------------------------------------------
; 8c25 GOSUB -  process gosub verb
;   on entry has the following format
;   1. the gosutk one byte
;   2. the line # of the gosub statement - two bytes
;   (assumes bank# of txtptr will stay unchanged)
;   3. a -> into the text of the gosub   - two bytes
;   total of 5 bytes

gosub:	lda #3
	jsr getstk		; make sure there is room
	lda txtptr+1
	pha
	lda txtptr
	pha			; push text ptr onto stk
	lda curlin+1
	pha
	lda curlin
	pha			; push current line #
	lda #tkgosu
	pha			; push on a gosub token
runc2:	jsr chrgot		; get chr and set codes for linget
	jsr goto
	jmp newstt
; -------------------------------------------------------------------------------------------------
; 8c42 IF

if:	jsr frmevl
	bit valtyp
	bpl if50
	jsr frefac		; if string expr
if50:	jsr chrgot
	cmp #tkgoto
	beq okgoto
	lda #tkthen
	jsr synchr
okgoto:	lda facexp
	bne docond
lkelse:	jsr data		; skip to next ":" or end-of-line
	ldy #0
	lda (txtptr),y
	beq rem			; eol, no else-clause
	jsr chrget		; is stmt an "else" ?
	cmp #tkelse
	bne lkelse		; no, keep looking...
	jsr chrget		; skip over tkelse
docond:	jsr chrgot
	bcc goto
	jmp xeqcm3
; -------------------------------------------------------------------------------------------------
; 8c77 REM

rem:	jsr remn		; scan to end of line
	beq addon 		; always

go:	jsr chrgot
	lda #tkto
	jsr synchr
; -------------------------------------------------------------------------------------------------
; 8c84 GOTO - process goto verb

goto:	jsr linget
goto0:				; always goto0=goto+3
	jsr remn
goto1:	sec
	lda curlin
	sbc linnum
	lda curlin+1
	sbc linnum+1
	bcs luk4it
	tya
	sec
	adc txtptr
	ldx txtptr+1
	bcc lukall
	inx
	bcs lukall
luk4it:	lda txttab
	ldx txttab+1
lukall:	jsr fndlnc
	bcc userr
	lda lowtr
	sbc #1
	sta txtptr
	lda lowtr+1
	sbc #0
	sta txtptr+1
	jmp runmod         	; put into run mode
; -------------------------------------------------------------------------------------------------
; 8cb8 RETURN - process return verb

return bne addrts
	lda #mxbank		; improbable bank#
	sta forpnt+2
	lda #$ff		; improbable offset(hi)
	sta forpnt+1
	jsr fndfor
	txs
	cmp #tkgosu
	beq retu1
	ldx #errrg
	!byte $2c		; eat the next two bytes
userr:	ldx #errus
	jmp error

retu1:	pla
	pla
	sta curlin
	pla
	sta curlin+1
	pla
	sta txtptr
	pla
	sta txtptr+1
; -------------------------------------------------------------------------------------------------
; 8cdf DATA

data:	jsr datan
addon:	tya
	clc
	adc txtptr
	sta txtptr
	bcc addrts
	inc txtptr+1
addrts:	rts
; -------------------------------------------------------------------------------------------------
; 8ced datan, remn

datan:	ldx #':'
	!byte $2c		; eat the next two bytes
remn:	ldx #0
remn1:	stx charac
	ldy #0
	sty endchr
exchqt:	lda endchr
	ldx charac
	sta charac
	stx endchr
remer:	lda txtptr+2
	sta i6509
	lda (txtptr),y
	beq remtxt
	cmp endchr
	beq remtxt
	iny
	cmp #$22 ; "
	bne remer
	beq exchqt		; always
remtxt:	jmp maptxt
; -------------------------------------------------------------------------------------------------
; 8d16 TRAP

trap:	jsr errdir		; no direct mode allowed
	jsr chrgot		; look for argument
	beq trap1		; null means no arg.
	jsr getpin		; get what should be a line number
	sty trapno		; lo byte of argument
	!byte $2c		; eat 2
trap1:	lda #$ff		; flag no trap
	sta trapno+1
	rts
; -------------------------------------------------------------------------------------------------
; 8d2b ON GOTO

ongoto:	jsr getbyt
	pha
	cmp #tkgosu
	beq onglop
	cmp #tkgoto
	beq onglop		; if goto
snerr3:	jmp snerr		; -> syntax error, ready

onglop:	dec faclo
	bne onglp1
	pla
	jmp xeqcm2

onglp1:	jsr chrget
	jsr linget
	cmp #','
	beq onglop
	pla
ongrts:	rts
; -------------------------------------------------------------------------------------------------
; 8d4e linget
linget:	ldx #0
	stx linnum
	stx linnum+1
morlin:	bcs ongrts
	sbc #$2f
	sta charac
	lda linnum+1
	sta index
	cmp #25
	bcs snerr3
	lda linnum
	asl
	rol index
	asl
	rol index
	adc linnum
	sta linnum
	lda index
	adc linnum+1
	sta linnum+1
	asl linnum
	rol linnum+1
	lda linnum
	adc charac
	sta linnum
	bcc nxtlgc
	inc linnum+1
nxtlgc:	jsr chrget
	jmp morlin

ressnr:	bne snerr3
; -------------------------------------------------------------------------------------------------
; 8d8a LET
let:	jsr sav73
	lda #tkequl
	jsr synchr
	lda intflg
	pha
	lda valtyp
	pha
	jsr frmevl
	pla
	rol
	jsr chkval
	bne copstr
	pla
qintgr:	bpl copflt
	jsr round
	jsr ayint
	lda forpnt+2
	sta i6509
	ldy #0
	lda facmo
	sta (forpnt),y
	iny
	lda faclo
	sta (forpnt),y
	jmp maptxt

copflt:	jmp movvf

copstr:	pla
	jmp inpcom
; -------------------------------------------------------------------------------------------------
; 8dc4 RESUME
resume:	jsr errdir		; no direct mode
	ldx errlin+1		; is there an error to resume fron?
	inx
	beq rescnt		; can't resume!
	jsr chrgot		; look for arguments
	beq resswp		; no arg's...restart err'd line
	bcc resnum		; numeric argument
	cmp #tknext		; only other choice is 'next'
gooos:	bne ressnr		; if not, syntax error

	jsr resswp		; resume execution with next stm't
	jsr maptxt
	ldy #0
	lda (txtptr),y
	bne resum2 		; must be a ':'
	iny			; must be a null,get next line
	jsr sav42
	jsr addon
resum2:	jsr chrget		; skip over this character, into body of statement
	jmp data		; advance until null or ':', then rts

resnum:	jsr getpin		; get address
	sta linnum+1
	jsr resend
	jsr maptxt
	jmp luk4it

resswp:	ldx #1
resum0:	lda errlin,x
	sta curlin,x
	lda errtxt,x
	sta txtptr,x
	dex
	bpl resum0
resend:	ldx #$ff
	stx xcnt
	stx errlin
	stx errlin+1		; flag 'no further resumes until next error'
	ldx tmptrp		; restore trap line to allow traps again
	stx trapno+1
	rts

rescnt:	ldx #errcr
	jmp error
; -------------------------------------------------------------------------------------------------
; 8e24 dispose

dispos:	cmp #tkfor
	beq dispo0
	cmp #tkgosu
	bne gooos 		; not next or gosub is syntax error
dispo0:	sta oldtok
	jsr errdir
	tsx
	inx
	inx  			; look past return to newstt
	txa
	tay
dispo1:	tya			; y==>x
	tax
	cpy #$ff		; stack empty?
	beq diserr		; yes...
	lda 257,x
	cmp #tkfor
	bne dispo2
	txa 			; stack entry is a for loop, 19 bytes.
	adc #18			; + 1 in carry
	jmp dispo3

dispo2:	txa			; stack entry is gosub, 5 bytes.
	clc
	adc #7

dispo3:	bcs diserr		; stack underflow...
	tay
	lda 257,x
	cmp oldtok
	bne dispo1		; keep looking
	beq dispo5
dispo4:	ldx dsptmp
dispo5:	lda 256,x 		; shift stack down
	sta 256,y
	dey
	dex
	stx dsptmp		; done when x=s
	tsx
	cpx dsptmp
	bne dispo4
	tya			; s <== y
	tax
	txs
	jmp chrget		; advance past modifier, do rts
diserr:	ldx #errdi
	jmp error
.end

; ****************************************** BVERBS2 **********************************************
; 8e7a PRINT# - process print# verb

printn:	jsr cmd			; docmd
	jmp iodone		; release channel
; -------------------------------------------------------------------------------------------------
; 8e80 CMD - process cmd verb

cmd:	jsr getbyt
	beq cmnd2		; if no more
	jsr chkcom		; comma after channel#
cmnd2:	php			; save status
	pha
	stx dolu		;  x=la
	jsr patch1		; check and open output chn*****clr dsk status********
	sta channl		; set chn returned from chkout
	pla
	plp			; get status back
	jmp print		; process reset of print stm

strdon:	jsr strprt
newchr:	jsr chrgot		; reget last char
; -------------------------------------------------------------------------------------------------
; 8e9d PRINT - process print verb

print:	beq ocrlf		; terminator so type cr/lf
!if CC2+CC3+CC4{	; *** not 64k version ***
	cmp #tkusin
	bne printc
	jmp using		; if using
}
; here after seeing tab(x) or , or in which ase a terminator does not mean type a cr/lf but just rts.
printc:	beq ocrlfx
	cmp #tktab
	beq taber		; if tab function
	cmp #tkspc
	clc
	beq taber		; if space
	cmp #','
	beq comprt		; if comma
	cmp #';'
	beq notabr		; if semicolon
	jsr frmevl		; evaluate the formula
	bit valtyp
	bmi strdon		; if string
	jsr outfac
	jsr ospc		; output a space
	bne newchr		; always goes

; entry to process carriage return and optional line feed
ocrlf:	lda #cr
	jsr ochr
	lda dolu
	bpl crfin		; cr only
	lda #lf			; line feed
	jsr ochr
crfin:	eor #255
ocrlfx:	rts

comprt:	sec			; set flag to read cursor position
	jsr plot		; get cursor position
	tya
	sec
morco1:	sbc #clmwid
	bcs morco1
	eor #255
	adc #1
	bne aspac		; always

taber:	php			; spc or tab function
	sec
	jsr plot
	sty trmpos
	jsr gtbytc
	cmp #')'
	bne snerr2
	plp
	bcc xspac
	txa
	sbc trmpos
	bcc notabr
aspac:	tax
xspac:	inx
xspac2:	dex
	beq notabr		; if spacing complete
	jsr ospc
	bne xspac2

notabr:	jsr chrget
	jmp printc

snerr2:	jmp snerr		; -> syntax error, ready
; -------------------------------------------------------------------------------------------------
; 8f15 GET command
;   get from keyboard or get# from channel.
;   the value of an ascii 0 for a string value is the null string.  the value of an ascii 0 for
;   a numeric value is also 0.  get is not allowed in direct mode.

get:	jsr errdir		; not allowed in direct mode
	jsr chrgot		; reget first char
	cmp #'#'		; was it a get# ?
	bne get010		; no...get from keyboard
	jsr gtbytc		; value for channel#...returned in .x
	jsr chkcom		; must be comma before variable list
	jsr patch2		; open channel for input****clr dsk status********
	sta channl		; new active channel

; this routine puts a zero as the 2nd character in the buffer and points (x,y) at it.
; this forces a call to getin by inloop the first time and also acts as a terminator.
get010:	lda #txtbnk 		; buffpt points to buffer
	ldy buffpt+1 		; buffpt points to buffer
	ldx buffpt
	inx			; increment to point to 2nd element
	bne get020
	iny
get020:	stx index1		; use this as index
	sty index1+1
	sta index1+2
	ldy #0
	tya			; 0 in .a
	sta (index1),y		; to make buffer terminator
	ldy index1+1		; pass pointer in (.x,.y)
	lda #64			; inpflg will be get
	jsr inpco1		; get and fill variable list...
	ldx channl		; get from keyboard?
	bne iorele		; no...close channel
	rts			; yes...done
; -------------------------------------------------------------------------------------------------
; 8f4b INPUT#

inputn:	jsr getbyt		; must have channel #
	jsr chkcom		; comma after channel #
	jsr patch2		; open chn in ****clr dsk status*********
	sta channl
!if PATCH4A{
	jsr patch4a1		; patch 4a-1
} else{
	jsr notqti
}

; close current working channel
iodone:	lda channl
iorele:	jsr clrch
	ldx #0
	stx channl
	stx dolu
	rts
; -------------------------------------------------------------------------------------------------
; 8f66 INPUT

input:	cmp #$22 ; "		; prompt string?
	bne notqti		; no...
	jsr strtxt		; yes...print it out
	lda #';'
	jsr synchr		; semi-c as delimeter
	jsr strprt
notqti:	jsr errdir

getagn:	jsr qinlin
	lda channl
	beq bufful
	jsr readst		; get i/o status byte
	and #3			; ***stop for timeouts***
	beq bufful		; good input
	jsr iodone		; bad input
	jmp data		; skip rest of this statement

bufful:	ldy #0
	lda (index1),y		; anything in buffer?
	beq buffu2

; input ready to process
; point at comma before buffer
buffu1:	jsr sav75
	jmp inpcon

; buffer was empty
; if from device, try again if not eoi
; otherwise default all variables
buffu2:	lda channl
	bne *+5
	jmp data		; from keyboard, skip rest of stmt
	jsr readst		; from device, check for eoi
	and #$40
	beq getagn		; no eoi, was only a cr
	bne buffu1		; eoi, fill with null vals

qinlin:	lda channl 		; keyboard/crt?
	bne ginlin		; no...
	jsr outqst		; yes..prompt
	jsr ospc
ginlin:	jmp inlin
; -------------------------------------------------------------------------------------------------
; 8fb5 find data
;   search is made by using the execution code for data	to skip over statments.  the start word of
;   each statement is compared with 'datatk'. each new line number is stored in 'datlin' so that if
;   an error occurs while reading data the error msg can give the line # of the ill-formatted data.

datlop:	jsr datan
	iny
	tax
	bne nowlin
	lda txtptr+2
	sta i6509
	lda (txtptr),y		; look for null links
	bne dtlp0
	iny
	lda (txtptr),y
	bne dtlp1		; if no error
	ldx #errod
	jmp error

dtlp0:	iny
dtlp1:	iny			; point stored stmt to line no.
	lda (txtptr),y
	sta datlin
	iny
	lda (txtptr),y
	iny
	sta datlin+1

nowlin:	jsr maptxt
	jsr addon
	jsr chrgot
	tax
	cpx #tkdata
	bne datlop
	beq datbk1
; -------------------------------------------------------------------------------------------------
; 8fea READ
;   in the processing of data and read statements
;   one -> points to the data (ie, the #s being fetched)
;   and another points to the list of variables.

;   the -> into the data always starts pointing to a terminator -- a ,  or eol
;   at this point txtptr points to listo of variables and (y,x) points to data or input line.

;   note, since both data statements and the input buffer are in the text bank, the bank for
;   indirection and the text pointer, txtptr, is always text.

read:	ldx datptr
	ldy datptr+1
	lda #$98
	!byte $2c		; eat the next two bytes
inpcon:	lda #0
inpco1:	sta inpflg
	stx inpptr
	sty inpptr+1
inloop:	jsr sav73
	lda txtptr
	ldy txtptr+1
	sta vartxt
	sty vartxt+1
	ldx inpptr
	ldy inpptr+1
	stx txtptr
	sty txtptr+1
	jsr chrgot
	bne datbk1
	bit inpflg
	bvc qdata
	jsr getin
	jsr sav75
	stx index1
	sty index1+1
	ldy #1
	sta (index1),y
	ldy index1+1
	jmp datbk
qdata:	bmi datlop
	lda channl
	bne getnth
	jsr outqst
getnth:	jsr qinlin
	tax
datbk:	stx txtptr
	sty txtptr+1
datbk1:	jsr chrget
	bit valtyp
	bpl numins
	bit inpflg
	bvc setqut
	inx
	stx txtptr
	lda #0
	sta charac
	beq resetc
setqut:	sta charac
	cmp #$22 ; "
	beq nowget
	lda #':'
	sta charac
	lda #','
resetc:	clc
nowget:	sta endchr
	jsr sav30
	jsr strlt2
	jsr st2txt
	jsr inpcom
	jmp strdn2
sav30:	lda txtptr
	ldy txtptr+1
	adc #0
	bcc nowge1
	iny
nowge1:	ldx txtptr+2
	rts

numins:	jsr fin
	lda intflg
	jsr qintgr
strdn2:	jsr chrgot
	beq trmok
	cmp #','
	bne trmnok

trmok:	lda txtptr
	ldy txtptr+1
	sta inpptr
	sty inpptr+1
	lda vartxt
	ldy vartxt+1
	sta txtptr
	sty txtptr+1
	jsr chrgot
	beq endvar
	jsr chkcom
	jmp inloop

; here when the data that was typed in or in 'data' statements is improperly formatted.
; for 'input' we start again.
; for 'read' we give a syntax errort the data line.
trmnok:	lda inpflg
	beq trmno1		; if input try again
	bpl snerr6		; get stmt, issue syntax err
;	bmi getdtl
;	ldy #255		; make it look direct
;	bne stcurl		; always goes
getdtl:	lda datlin		; get data line number
	ldy datlin+1
stcurl:	sta curlin		; make it current line
	sty curlin+1
snerr6:	jmp snerr		; -> syntax error, ready

trmno1:	lda channl		; if not terminal, give bad data
	beq doagin
	ldx #errbd
	jmp error

doagin:	ldx #tryagn
	jsr msg			; print '?redo from start'
	lda oldtxt		; -> at start of this current line
	ldy oldtxt+1
	sta txtptr
	sty txtptr+1
	rts			; go to newstt

endvar:	lda inpptr
	ldy inpptr+1
	ldx inpflg
	bpl vary0
	sta datptr
	sty datptr+1
inprts:	rts

vary0:	ldy #0
	lda (inpptr),y
	beq inprts
	lda channl
	bne inprts
	ldx #exignt
	jmp msg
; -------------------------------------------------------------------------------------------------
; 90e7 SYS command

csys:	jsr getpin		; get positive integer
	lda i6509
	pha
	lda dfbank    		; current bank
	cmp #$f
	beq fligm
	ldx poker
	ldy poker+1
	jsr newsys
csysrz=*-1
	pla
	sta i6509
	rts

fligm:	lda #>csysrz		; push return address
	pha
	lda #<csysrz
	pha
	jmp (poker)
	rts

dim3:	jsr chkcom
; -------------------------------------------------------------------------------------------------
; 910c DIM

dim:	tax
	jsr ptrgt1
	jsr chrgot
	bne dim3
	rts
; -------------------------------------------------------------------------------------------------
; 9116 DEFFN

defn:	jsr getfnm
	jsr errdir
	jsr chkopn
	lda #128
	sta subflg
	jsr ptrget
	jsr chknum
	jsr chkcls
	lda #tkequl		; must have equal token
	jsr synchr
	lda varpnt+2
	pha
	lda varpnt+1
	pha
	lda varpnt
	pha
	lda txtptr+1
	pha
	lda txtptr
	pha
	jsr data
	jmp deffin
; -------------------------------------------------------------------------------------------------
; 9146 POKE

poke:	jsr getnum
	txa
	jsr sav32
	sta (poker),y
	stx i6509
	rts
; -------------------------------------------------------------------------------------------------
; 9152 WAIT

fnwait:	jsr getnum
	stx andmsk
	ldx #0
	jsr chrgot
	beq stordo
	jsr combyt
stordo:	stx eormsk
	jsr sav32
waiter:	lda (poker),y
	eor eormsk
	and andmsk
	beq waiter
	stx i6509
	rts
sav32:	ldx i6509
	ldy dfbank
	sty i6509
	ldy #0
	rts
; -------------------------------------------------------------------------------------------------
; 917f KEY processor:   key [ key number , string ]

fkey:	bne key20
	ldy #0			; no params => list all keys
	beq keygo		; always

key20:	jsr getbyt		; .x := positive byte integer
	txa
	bne key40		; must be non-zero
fcerr3:	jmp fcerr		; -> illegal quantity error, ready

key40:	cmp #21
	bcs fcerr3		; must be <= 20
	pha			; save key number
	jsr chkcom
	jsr sav13
	sta highds		; set up string descriptor
	lda index1
	ldx index1+1
	ldy index1+2
	sta highds+1
	stx highds+2
	sty highds+3
	pla
	tay			; .y := key number
	lda #<highds		; note hightr must follow highds

keygo:	jsr pgmkey		; do it!
	bcc bakrts		; if no problem
	ldx #52			; out of memory
	jmp (ierror)
bakrts:	rts
sav13:	jsr frmevl
	jmp frestr
; -------------------------------------------------------------------------------------------------
; 91bc VERIFY - process verify verb

cverf:	lda #errvr		; set message table pointer
	pha
	lda #$80		; set verify flag
	jsr ldver		; load/verify routine
	beq cvf1		; if direct mode
	pla
	rts
; -------------------------------------------------------------------------------------------------
; 2966 LOAD - process load verb

cload:	lda #0			; set load flag
	jsr ldver		; load/verify routine

; entry from dload
loadck:	beq clf1		; if direct mode
	jsr lnkprg		; relink
	jsr stxtpt		; point txtptr to null byte
	jmp fload		; set stack pointer

clf1:	lda tttemp		; get bank of end of load
	cmp #txtbnk
	bne cld4		; bad, out of text memory
!if CC1{		; *** 64k version ***
	stx vartab		; save new text end(64k)
	sty vartab+1
} else{			; *** not 64k version ***
	stx txtend		; save new text end(128,192,256k)
	sty txtend+1
}
	lda #errld		; set message table pointer
	pha

cvf1:	jsr readst		; read status of load/verify
	and #$10
	bne cld2		; if error
	pla
	lda #msrdy
	pha

cld2:	pla
	tax

cld3:	jsr msg			; output message
	jmp fini		; relink, set end of text and goto main loop

cld4:
!if CC1{		; *** 64k version ***
	ldx errom		; 64k
} else{			; *** not 64k version ***
	ldx errot		; except 64k
}
	bne cld3		; always

;   entry from dload
loadnp:	pha			; a = 0
	beq lvr1		; always

;   entry a = 0 if no verify, <>0 if verify
ldver:	pha			; save load/verify flag
	jsr plsv		; verify entry

lvr1:	jsr kstop
	beq lvr1		; debounce

	pla			; restore flag
	ora #txtbnk		; pack in bank#
	ldx txttab		; load into text table
	ldy txttab+1
	jsr load		; request load from kernal
	bcs ldsver		; if load/verify error
	sta tttemp		; save bank of end of load
	jmp tdm        		; get direct mode
; -------------------------------------------------------------------------------------------------
; 921b SAVE - process basic save command.

csave:	jsr plsv

savenp:	ldx txttab		; highds is start vector
	ldy txttab+1
	lda #txtbnk
	stx highds
	sty highds+1
	sta highds+2
!if CC1{		; *** 64k version ***
	ldx vartab		;  64k
	ldy vartab+1		; hightr is end vector
} else{			; *** not 64k version ***
	ldx txtend		;  except 64k
	ldy txtend+1		; hightr is end vector
}
savenb:	stx hightr
	sty hightr+1
	sta hightr+2
	ldx #<highds
	ldy #<hightr
	jsr save
	bcs ldsver		; load/save error
	rts

ldsver:	asl			; double error number
	tax			; transfer to x
	jmp error		; process error
; -------------------------------------------------------------------------------------------------
; 9243 OPEN - process open verb

copen:	ldx #00			; set default parameters
	stx parsts		; clear status
	stx dosf1l		; set length to zero
	stx dossa		; set secondary address to zero
	inx
	stx dosfa		; set device number to one
	jsr plsv32
	jsr getbyt
	stx dosla		; set logical file number
	jsr cops		; get next number if one
	stx dosfa		; save device number
	ldy #0
	cpx #3
	bcc cop1		; if not ieee
	dey

cop1:	sty dossa		; set default secondary address
	jsr cops		; get next number if one
	stx dossa		; set secondary address
	jsr chrgot
	beq copx		; if end of statement
	jsr plsv30
	jsr sav77

copx:	jsr plsvx		; set file info

globtt:	jsr clrch		; unlisten
	jsr open
	jmp dcat0		; restore listener,if any

cops:	jsr chrgot
	bne copg
	pla			; if end of statement, scrap return...
	pla			; ...and go off to open it
	jmp copx
copg:	jsr plsv30		; else get next device param and continue
	jmp getbyt
; -------------------------------------------------------------------------------------------------
; 9297 CLOSE - process close verb

cclos:	jsr plsv32
	jsr getbyt
	txa
	jmp close
; ****************************************** BVERBS3 **********************************************
; 'basic/dos interface verbs.'
; this set of routines takes tokens and values after the following basic keywords

; dopen,  dclose, record, format, collect, backup, copy
; concat, dsave,  dload,  catlog, rename,  append, scrtch

; it then parses the following line and finds syntax errors, checks for out of range values, and sets
; variables in the zero-page to be passed to the disk message generator (dmg).

; 92a1 CATALOG-DIRECTORY - catalog a device (==directory)

dcat:	jsr dospar		; parse the line
	lda parsts		; check options
	and #$e6
	beq *+5
	jmp snerr		; -> syntax error, ready
	ldy #tcat		; table offset
	ldx #1			; just $
	lda parsts		; chk for default
	and #$11		; no drive?
	beq dcat2
	lsr
	bcc dcat1		; just drive
	inx			; drive and filename
	inx
dcat1:	inx
dcat2:	txa			; a now has length
	jsr sendp		; build
	lda #dosctl
	sta xcnt		; max lines before prompt
	ldy #$60		; sa, load floppy
	jsr ochanl		; open special channel
	ldy #3			; loop counter
; get length in blocks
dcat3:	sty t3			; save counter
	ldx #doslfn
	jsr chkin		; open for input
	jsr basin		; get char
	sta t4
	jsr readst
	bne dcat10		; if bad status
	jsr basin		; get char
	sta t4+1
	jsr readst
	bne dcat10		; if bad status
	ldy t3
	dey
	bne dcat3		; if not done
; output blocks number
	jsr dcat0		; clear channel  restore output device
	ldx t4
	lda t4+1
	jsr linprt		; output number
	lda #' '
	jsr bsout		; output a space
; loop reading name and output
dcat4:	jsr clrch 		; clear channel  default input is disk
	ldx #doslfn
	jsr chkin
	jsr basin		; get char
	pha			; save char
	jsr readst		; get status
	bne dcat9		; if bad status
	jsr dcat0 		; clear channel  restore output device
	pla			; get back char
	beq dcat5		; if eol
	jsr bsout		; echo char
	bcc dcat4		; continue to process name

; here on end of name
dcat5:	dec xcnt		; decrement max lines counter
	lda #cr
	jsr bsout		; output new line
	jsr clrch		; close
; check for suspend or halt
	jsr kstop		; get status of stop key
	beq dcat10		; if stop request
	lda xcnt		; lines
	bne dcat8		; if not max lines
	lda #dosctl
	sta xcnt		; reset counter
	jsr tstdir    		; don't prompt unless in direct mode
	bne dcat8
	ldx channl    		; or if not writing to screen
	cpx #0
	bne dcat8
	ldx #mremsg
	jsr msg			; prompt user
; wait for go
dcat7:	jsr getin		; suspend waiting for key
	beq dcat7		; if no key - suspend
; process next
dcat8:	ldy #2			; perform 2 times
	bne dcat3		; jmp

dcat9:	pla			; clean up stk
dcat10:	jsr clrch
	lda #doslfn
	jsr close		; close special channel
dcat0:	jsr clrch
	ldx dolu
	beq goorat
	jmp chkout
; -------------------------------------------------------------------------------------------------
; 935b open channel 14 for special purposes
;   enter:  .y=sa
;   doslfn = lu
;   dosfa = fa
;   assumes setnam previously called
ochanl:	ldx dosfa
	bne ochl10
	ldx #8			; use default of 8
ochl10:	lda #doslfn		; lfn
	jsr setlfs		; set file parameters
	jsr clrch		; unlisten default out
	jmp open		; open it...
; -------------------------------------------------------------------------------------------------
; 93d6 DOPEN code dfn(,t(,r))

dopen:	lda #$22		; set error flag
	jsr sav9
	ldy #topn		; fcb format pointer
	ldx #4			; normal length
	bit parsts		; relative record
	bvc dop2		; if not random access
	ldx #8			; random access length
	bne dop2		; alway jump
; -------------------------------------------------------------------------------------------------
; 937e APPEND code

append:	lda #$e2		; set error flags
	jsr sav9		; chk req'd parms
	ldy #tapn		; tabld index
	ldx #5			; length

dop2:	txa			; set length into a
	jsr sendp
	jmp globtt

sav9	jsr dosprs		; parse the line
	jsr chk6		; chk req'd parms
;  find an available secondary address
fndsca:	ldy #$61
fsca10:	iny
	cpy #$6f
	beq fsca20		; if none available
	jsr lkupsa		; get physical unit from secondary
	bcc fsca10		; if secondary address used
	sty dossa		; save secondary address

goorat:	rts			; return .y = sa

fsca20:	ldx #ms1		; too many files open
	jmp error
; -------------------------------------------------------------------------------------------------
; 93a9 DCLOSE - close disk file

dclose:	lda #$f3		; set error flags
	jsr dosprs		; parse the line
	jsr oldclr
	lda parsts		; any la given?
	and #$04
	beq dclall		; no....
	lda dosla
	jmp close		; close file
; -------------------------------------------------------------------------------------------------
; dclall

dclall:	lda dosfa		; get disk #
	jmp patch3		; close all units*****device in .a only******
; -------------------------------------------------------------------------------------------------
; 93c3 DSAVE dfn

dsave:	lda #$66		; set error flags
	jsr dosprs		; parse the line
	jsr sav20
	jmp savenp
; -------------------------------------------------------------------------------------------------
; 93ce DLOAD dfn

dload:	lda #$e6		; set error flags
	jsr dosprs		; parse the line
	jsr sav20
	lda #0			; set load flag
	jsr loadnp		; perform load no parse
	jmp loadck		; go to load checking
; -------------------------------------------------------------------------------------------------
; 93de BANK dfn

chbank:	jsr getbyt
	cpx #mxbank		; too large?
	bcs xbkerr
	stx dfbank
bsvrts:	rts
xbkerr:	jmp    fcerr		; illegal quantity
; -------------------------------------------------------------------------------------------------
; 93ec BSAVE dfn

bsave:	lda #$66		; std error flag
	ldx #$f8		; auxiliary error flag
	jsr dosprx		; parse options
	jsr sav20		; check req params done

!if nkrnl{		; *** new kernal only ***
	ldx dosofl		; start addr
	ldy dosofl+1
	lda dosbnk
	stx highds
	sty highds+1
	sta highds+2
	ldx dosofh		; end addr
	ldy dosofh+1
	jmp savenb
}
; -------------------------------------------------------------------------------------------------
; 940e BLOAD dfn

bload:	lda #$e6		; std error flag
	ldx #$fc		; aux error flag
	jsr dosprx		; parse options
	jsr sav20

!if nkrnl{		; *** new kernal only ***
	lda dosbnk		; bit7 is clear(=>load)
	clc
	ldx dosofl		; start addr
	ldy dosofl+1
	jsr load
	bcc bsvrts		; done
;	jmp ldsver		; error in load
} else{			; *** old kernal ***
	rts
}
; -------------------------------------------------------------------------------------------------
; 9427 HEADER nddn (,id)

format:	jsr dospar		; parse the line
	jsr chk1		; check parameter errors
	and #$11
	cmp #$11
	bne rec5 		; if required parameters not present

frmt2:	jsr dclall		; close all files
	jsr rusure		; r-u-sure prpt
	bcs bsvrts 		; if no and direct mode
	ldy #thed		; tabld index
	lda #4			; length
	ldx dosdid		; check for diskid
	beq frmt6
	lda #6			; length with id
frmt6:	jsr trans			; build and send

	jsr errchl		; get error status
	jsr tdm			; test direct mode
	bne bsvrts 		; if direct mode
	jsr mapstr

	ldy #0
	lda (dsdesc+1),y
	cmp #'2'
	bcs frmt8		; if error occured
	jmp maptxt

frmt8:	ldx #msg31		; ? bad disk
	jmp error
; -------------------------------------------------------------------------------------------------
; 9464 SCRATCH dfn

scratc:	jsr dospar		; parse the line
	jsr chk1
	jsr rusure		; check direct and ask user
	bcs zxit		; if no and direct mode
	ldy #tscr		; offset
	lda #4			; length
	jsr trans
	jsr errchl		; read error channel
	jsr tdm			; test direct mode
	bne zxit		; if direct mode
	lda #cr
	jsr bsout		; output cr
	jsr mapstr
	ldy #0			; clr to read errchl
sctc1:	lda (dsdesc+1),y	; get mesg
	beq sctc2		; if end of error message
	jsr bsout
	iny
	bne sctc1		; always

sctc2:	lda #cr
	jsr bsout		; output cr
	jsr maptxt
zxit:	rts

rec5:	jmp snerr		; -> syntax error, ready
; -------------------------------------------------------------------------------------------------
; 949e RECORD - random record access.

record:	lda #01			; default pos = 1
	sta dosrcl
	jsr chrgot
	lda #'#'
	jsr synchr		; next character = "#"
	jsr gtvl2		; get next value
	cpx #0
	beq rec4		; cannot be zero
	stx dosla		; save logical address
	jsr chkcom		; check for ","
	beq rec5		; if end of statement
	bcc rec1		; if numeric
	jsr chkopn		; check for "("
	jsr getpin		; get positive integer
	jsr chkcls
	jmp rec2

rec4:	jmp qtyerr

rec6:	ldx #ms3		; file not found err
	jmp error

rec1:	jsr getpin		; get positive integer

rec2:	jsr chrgot		; see what is next
	beq rec3		; if end of statement
	jsr chkcom		; check for ","
	beq rec5		; if end of statement
	jsr gtvl2
	cpx #0
	beq rec4		; if out of range
	cpx #$ff
	beq rec4		; if out of range
	stx dosrcl		; save byte position (pos)
	jsr chrgot
gaaa:	bne rec5		; if not end of statement

rec3:	lda dosla		; get logical address
	jsr lkupla		; logical to physical map
	bcs rec6		; if file not found
	sty dossa		; save secondary address
	stx dosfa
	jsr setlfs		; set up la, fa
	jsr oldclr		; clear disk status
	ldy #trec		; set pointer
	lda #4			; process five bytes
	bne trans		; transfer on channel 15
; -------------------------------------------------------------------------------------------------
; 950a DCLEAR

dclear:	jsr dospar		; parse the line
	ldy #tclr		; set code
	lda #2
	bne trans
; -------------------------------------------------------------------------------------------------
; 9513 COLLECT v<drive#}

colect:	jsr dospar		; parse the line
	jsr chk3		; chk opt parms
	jsr dclall		; close all files
	ldy #tcoll		; tabld offset
	ldx #1			; length
	lda parsts
	and #$10
	beq clct2
	inx			; include drive
clct2:	txa			; place in a
	bne trans		; always (x <> 0)
; -------------------------------------------------------------------------------------------------
; COPY - copy routines cdddfn=sdsfn

dcopy:	jsr dospar		; parse the line
	and #$30
	cmp #$30		; chk req'd parms
	bne dcpy2
	lda parsts
	and #$c7
	beq dcpy4
dcpy2:	lda parsts
	jsr chk4
	lda parsts
dcpy4:	ldy #tcopy		; tabld offset
	lda #8			; length
	bne trans		; go do it
; -------------------------------------------------------------------------------------------------
; 9546 CONCAT routines

concat:	jsr dospar		; parse the line
	jsr chk4
	ldy #tconc		; offset
	lda #12			; length
	bne trans		; go do it
; -------------------------------------------------------------------------------------------------
; 9552 RENAME rdddfn=sdsfn

rename:	lda #$e4		; set error flags
	jsr dosprs		; parse the line
	jsr chk5
	ldy #tren		; offset
	lda #8			; length
	bne trans		; go do it
; -------------------------------------------------------------------------------------------------
; 9560 BACKUP d<dd>=<sd}

backup:	lda #$c7		; set error flags
	jsr dosprs		; parse the line
	and #$30		; req'd parms
	cmp #$30
	bne gaaa		; if syntax error
	jsr rusure		; test for direct mode and send message
	bcc bup1  		; if run mode or not 'yes'
	rts

bup1:	jsr dclall		; close disk
	ldy #tbak
	lda #4			; length
; trans subroutine
trans:	jsr sendp		; build string to output
	jsr clrch
	sec
	jsr opn10 		; send it...
	jmp dcat0

; ****************************************** MATH1 ************************************************
; 9585 'math cracking routines.'

forfix:               		; empty space for future fixes
!if CC1{
!if PATCH4A{
	!byte $22		; check sum byte
} else{
	!byte $22		; check sum byte
}
}
!if CC2{
!if PATCH4A{
	!byte $1f		; check sum byte
} else{
	!byte $22		; check sum byte
}
}
!if CC3{
!if PATCH4A{
	!byte $22		; check sum byte
} else{
	!byte $22		; check sum byte
}
}
!if CC4{
!if PATCH4A{
	!byte $f7		; check sum byte
} else{
	!byte $80		; check sum byte
}
}
patch1:	jsr oldclr		; clear disk status for printn & cmd
	jmp chkout

patch2:	jsr oldclr		; clear disk status for inputn & get
;	jmp chkout	; ***** bug in original basic4plus sourcecode !	*****
	jmp chkin

patch3:	sec			; close all files associated with device in .a
	jmp kclall

*=*+$2b
; -------------------------------------------------------------------------------------------------
; 95c1 frmevl
;   the formula evaluator starts with (txtptr) -> to the 1st char of the formula.
;   at the end (txtptr) -> to the terminator. the result is left in the fac.
;   on return (a) does not reflect the terminator.
; 
;   the formula evaluator uses the operator list (optab= to determine precedence and dispatch
;   addresses for each operator. a tem result on the stk has the following format address of the
;   operator routine fp temp result precedence of the operator

frmevl:	jmp (ifrmev)

nfrmev:	ldx txtptr
	bne frmev1
	dec txtptr+1
frmev1:	dec txtptr
	ldx #0
	!byte $24

lpoper:	pha
	txa
	pha
	lda #1
	jsr getstk
	jsr eval
	lda #0
	sta opmask
tstop:	jsr chrgot

loprel:	sec
	sbc #tkgrea
	bcc endrel
	cmp #tkless-tkgrea+1
	bcs endrel
	cmp #1
	rol
	eor #1
	eor opmask
	cmp opmask
	bcc snerr5
	sta opmask
	jsr chrget
	jmp loprel

endrel:	ldx opmask
	bne finrel
	bcs qop
	adc #tkgrea-tkplus
	bcc qop
	adc valtyp
	bne *+5
	jmp cat

	adc #$ff
	sta index1
	asl
	adc index1
	tay 
qprec:	pla
	cmp optab,y
	bcs qchnum
	jsr chknum
doprec:	pha
negprc:	jsr dopre1
	pla
	ldy opptr
	bpl qprec1
	tax
	beq qopgo
	bne pulstk
finrel:	lsr valtyp
	txa
	rol
	ldx txtptr
	bne finre2
	dec txtptr+1
finre2:	dec txtptr
	ldy #ptdorl-optab
	sta opmask
	bne qprec
qprec1:	cmp optab,y
	bcs pulstk
	bcc doprec

dopre1:	lda optab+2,y
	pha
	lda optab+1,y
	pha
	jsr pushf1
	lda opmask
	jmp lpoper

snerr5:	jmp snerr		; -> syntax error, ready
; -------------------------------------------------------------------------------------------------
; 9659 pushf1

pushf1:	lda facsgn
	ldx optab,y
pushf:	tay
	pla
	sta index1
	pla
	sta index1+1
	tya
	pha
	inc index1		; fix 10/19/79
	bne forpsh		; 
	inc index1+1
forpsh:	jsr round
	lda faclo
	pha
	lda facmo
	pha
	lda facmoh
	pha
	lda facho
	pha
	lda facexp
	pha
	jmp (index1)

qop:	ldy #$ff
	pla
qopgo:	beq qoprts
qchnum:	cmp #100
	beq unpstk
	jsr chknum
unpstk:	sty opptr
pulstk:	pla
	lsr
	sta domask
	pla
	sta argexp
	pla
	sta argho
	pla
	sta argmoh
	pla
	sta argmo
	pla
	sta arglo
	pla
	sta argsgn
	eor facsgn
	sta arisgn
qoprts:	lda facexp
	rts
; -------------------------------------------------------------------------------------------------
; 96ae eval

eval:	jmp (ieval)

neval:	lda #0
	sta valtyp

eval0:	jsr chrget
	bcs eval2
eval1:	jmp fin

eval22:	cmp #pi
	bne qdot
	lda #<pival
	ldy #>pival
	jsr movfm
	jmp chrget

pival:	!byte $82,$49,$0f,$da,$a1

; non numeric
eval2:	jsr isletc
	bcc eval22
	bcs isvar

qdot:	cmp #'.'
	beq eval1
	cmp #tkminu
	beq domin
	cmp #tkplus
	beq eval0
	cmp #34
	bne eval3
strtxt:	jsr sav30
	jsr strlit
	jmp st2txt

eval3:	cmp #tknot
	bne eval4
	ldy #nottab-optab
	bne gonprc
; not
notop:	jsr ayint
	lda faclo
	eor #$ff
	tay
	lda facmo
	eor #$ff
	jmp givayf
; fn
eval4 cmp #tkfn
	bne *+5
	jmp fndoer
; math functions
eval5:	cmp #tkonef
	bcc parchk
	cmp #tkerrd		; cover err$ & instr$
	bcs eval6
	cmp #tkgo		; can't be reserved word past str ftns
	bcs snerr
eval6:	jmp isfun		; execute function

domin:	ldy #negtab-optab
gonprc:	pla
	pla
	jmp negprc

parchk:	jsr chkopn		; check '(' ')'
	jsr frmevl

chkcls:	lda #')'		; check for ')'
	!byte $2c		; eat the next two bytes

chkopn:	lda #'('		; check for '('
	!byte $2c		; eat the next two bytes

chkcom:	lda #','		; check ','
; -------------------------------------------------------------------------------------------------
; 9732 synchr
;   looks at the current char to make sure it is the specific thing loaded into acca just before
;   the call to synchk. if not it calls the syntax error routine.
;   otherwise it eats the next char and returns
;   note, i6509 is saved and restored by synchr!

synchr:	sta tttemp
	ldy i6509
	sty tttemp+1
	ldy txtptr+2
	sty i6509
	ldy #0
	lda (txtptr),y
	ldy tttemp+1
	sty i6509
	cmp tttemp
	bne snerr		; if not =, then error
	jmp chrget		; eat char
; -------------------------------------------------------------------------------------------------
; 974f snerr - output syntax error

snerr:	ldx #errsn
	jmp error
; -------------------------------------------------------------------------------------------------
; 9754 isvar
;   isvar sets up the value of the variable expression in the floating accumulator. if it is an
;   integer,the value is floated; if it is a string,fac holds a pointer to the string's descriptor.

;   note, symbol table space for uninitialized variables is never allocated. for these and basic
;   reserved vars, "ptrget" returns a pointer to "zero", stored in basic's rom area. "isvar" checks
;   the var name and type for these special cases. if not a reserved var, "isvar" uses "zero" to
;   create a numeric zero or null string value.

isvar:	jsr ptrget

isvret:	sta facmo
	sty facmo+1
	stx facmo+2
	ldx varnam
	ldy varnam+1
	lda valtyp
	beq goo
	lda #0
	sta facov
	jsr tstrom		; test if in rom
	bcs isvrts		; no...
	cpx #'t'
	bne isvds		; if not 't'
	cpy #$c9 		; 'i'+$80
	bne strrts		; if 't' but not 'ti$'
	jmp gettim		; get time
; check ds$
isvds:	cpx #'d'
	bne strrts		; if not 'd'
	cpy #$d3  		; 's'+$80
	bne strrts		; if not 'ds$'
	jsr chkds
	lda dsdesc+1
	ldy dsdesc+2
	ldx dsdesc+3
	jmp strlit

strrts:	lda memtop		; facmo<-addr of user "zero"
	sta facmo
	lda memtop+1
	sta facmo+1
	lda memtop+2
	sta facmo+2
isvrts:	rts

chkds:	lda dsdesc
	bne isvrts
	jmp errchl		; get status

goo:	bit intflg		; test sign
	bpl gooo
	lda facmo+2		; set indir bank
	sta i6509
	ldy #0
	lda (facmo),y
	tax
	iny
	lda (facmo),y
	tay
	jsr maptxt
	txa
	jmp givayf

gooo:	jsr tstrom		; test if in rom
	bcc qstatv		;  ...yes
	lda facmo
	ldy facmo+1
	ldx facmo+2
	jmp movfum		;  fac <- user mem

; prevent ti as a user-defd var
;	cpx #'t'
;	bne qstatv		; if not 't'
;	cpy #'i'
;	bne gomovf		; if 't' but not 'ti'
;	jmp snerr		; -> syntax error, ready

qstatv:	cpx #'s'
	bne qerlin		; if not 's'
	cpy #'t'
	bne qerlin		; if 's' but not 'st'
	jsr readst		; get i/o status byte
	jmp float

qerlin:	cpx #'e'
	bne qdsav
	cpy #'r'
	beq gnumer
	cpy #'l'
	bne qdsav
	lda errlin+1
	ldy errlin
	jmp nosflt		; print 2 bytes
gnumer:	lda errnum
	lsr			; divide by 2
	jmp float 		; print 1 byte

qdsav:	cpx #'d'
	bne gomovf		; if not 'd'
	cpy #'s'
	bne gomovf		; if 'd' but not 'ds'
	jsr chkds
	jsr mapstr		; assume string bank!
	ldy #0
	lda (dsdesc+1),y
	and #$f
	asl
	sta garbfl
	asl
	asl
	adc garbfl
	sta garbfl
	iny
	lda (dsdesc+1),y
	jsr maptxt
	and #$f
	adc garbfl
	jmp float

gomovf:	lda facmo		;  fac<-rom mem (uninit. flt var)
	ldy facmo+1
	jmp movfm
; -------------------------------------------------------------------------------------------------
; 9821 isfun

isfun:	asl
	pha
	tax
	jsr chrget
	cpx #tklasn+tklasn-$ff
	bcc oknorm

tkerd2=tkerrd+tkerrd
	cpx #<tkerd2
	beq errjmp
	jsr chkopn
	jsr frmevl
	jsr chkcom
	jsr chkstr
	pla

tkint2=tkinst+tkinst
	cmp #<tkint2
	beq insjmp
	tax
	lda facmo+2		;  push descr ptr for opnd1
	pha
	lda facmo+1
	pha
	lda facmo
	pha
	txa
	pha
	jsr getbyt		; opnd2
	pla
	tay
	txa
	pha
	jmp fingo

oknorm:	jsr parchk
	pla
	tay
fingo:	lda fundsp-tkonef-tkonef+256,y
	sta jmper+1

	lda fundsp-tkonef-tkonef+257,y
	sta jmper+2

	jsr jmper
	jmp chknum
; -------------------------------------------------------------------------------------------------
; 986b OR

orop:	ldy #$ff
	!byte $2c		; eat the next two bytes
; AND
andop:	ldy #0
	sty eormsk
	jsr ayint
	lda facmo
	eor eormsk
	sta integr
	lda faclo
	eor eormsk
	sta integr+1
	jsr movfa
	jsr ayint
	lda faclo
	eor eormsk
	and integr+1
	eor eormsk
	tay
	lda facmo
	eor eormsk
	and integr
	eor eormsk
	jmp givayf

insjmp:	jmp instrg

errjmp:	jmp errd
; -------------------------------------------------------------------------------------------------
; 98a8 = - perform relational operator
;   (domask) contains the bits as to which relational operator it was. cbit set = string compare.

dorel:	jsr chkval
	bcs strcmp
	lda argsgn		; conv arg to basic internal form
	ora #127
	and argho
	sta argho
	lda #<argexp
	ldy #>argexp
	jsr fcomp		;  arg is 1st opnd
	tax
	jmp qcomp

; string =
strcmp:	lda #0
	sta valtyp
	dec opmask
	jsr frefac		; free string2
	sta dsctmp		;  dsctmp <- length2,
	ldx #2

grrk:	lda index,x
	sta dsctmp+1,x
	dex
	bpl grrk
	lda argmo
	ldy argmo+1
	ldx argmo+2
	jsr fretmp		; free string1
	ldx index
	ldy index+1
	stx argmo		; argmo<-ptr to string1
	sty argmo+1
	ldy index+2
	sty argmo+2
	tax			; .x <- length1
	sec
	sbc dsctmp
	beq stasgn		;  length1=length2
	lda #1
	bcc stasgn		;  length1<length2
	ldx dsctmp
	lda #$ff
; .a = o(equal), 1(len1<len2), -1(len1>len2)
; .x = length of shorter string
stasgn:	sta facsgn
	jsr mapdst		; bank:=dsctmp+3
	ldy #$ff
	inx
nxtcmp:	iny			; .y=inx to nxt chr, .x=#chrs to go
	dex
	bne getcmp
	ldx facsgn
; come here when strings are equal, but
; .x =  1, len1<len2, cy=1
;  0, len1=len2, cy=0
; -1, len1>len2, cy=0
qcomp:	bmi docmp
	clc
	bcc docmp
getcmp:	lda (dsctmp+1),y	;  chr from string2 (i6509 set)
	sta tttemp
	lda (argmo),y		;  chr from string1
	cmp tttemp
	beq nxtcmp
	ldx #$ff
	bcs docmp
	ldx #1
docmp:	jsr maptxt
	inx
	txa
	rol
	and domask
	beq goflot
	lda #$ff
goflot:	jmp float
; -------------------------------------------------------------------------------------------------
; 992c ptrget

ptrget:	ldx #0
	jsr chrgot
ptrgt1:	stx dimflg
ptrgt2:	sta varnam
	jsr chrgot
	jsr isletc
	bcs ptrgt3
interr:	jmp snerr		; -> syntax error, ready

ptrgt3:	ldx #0
	stx valtyp
	stx intflg
	jsr chrget
	bcc issec
	jsr isletc
	bcc nosec
issec:	tax
eatem:	jsr chrget
	bcc eatem
	jsr isletc
	bcs eatem
nosec:	cmp #'$'
	bne notstr
	lda #$ff
	sta valtyp
	bne turnon
notstr:	cmp #'%'
	bne strnam
	lda subflg
	bne interr
	lda #$80
	sta intflg
	ora varnam
	sta varnam
turnon:	txa
	ora #$80
	tax
	jsr chrget
strnam:	stx varnam+1
	sec
	ora subflg
	sbc #40
	bne strna1
	jmp isary

strna1:	ldy #0
	sty subflg
	lda vartab
	ldx vartab+1
stxfnd:	stx lowtr+1
lopfnd:	sta lowtr		; reached end of simple vars?

!if CC4{		; *** 256k version ***
	cpx varend+1		; 256k
	bne lopfn
	cmp varend		; 256k
}
!if CC3{		; *** 192k version ***
	cpx strend+1		; 192k
	bne lopfn
	cmp strend		; 192k
}
!if CC1+CC2{		; *** 64k+128k version ***
	cpx arytab+1		; 64k or 128k
	bne lopfn
	cmp arytab		; 64k or 128k
}
	beq notfns
lopfn:	jsr mapvar
	lda (lowtr),y
	cmp varnam
	bne notit
	iny
	lda (lowtr),y
	cmp varnam+1
	bne nxtptr
	jmp finptr

gobadv:	beq interr

nxtptr:	dey
notit:	jsr maptxt
	clc
	lda lowtr
	adc #6+addprc
	bcc lopfnd
	inx
	bne stxfnd
isletc:	cmp #'a'
	bcc islrts
	sbc #$5b
	sec
	sbc #$a5
islrts:	rts

notfns:	pla
	pha

isvrm1=isvret-1
	cmp #<isvrm1
	bne notevl
	tsx
	lda $102,x
	cmp #>isvrm1
	bne notevl
ldzr:	lda #<zero
	ldy #>zero
	ldx #sysbnk
	rts

notevl:	lda varnam
	ldy varnam+1
	cmp #'t'
	bne qstavr
	cpy #$c9   		; 'i'+$80
	beq ldzr
;	cpy #'i'
;	bne qstavr
;	gobadv jmp snerr	; -> syntax error, ready

qstavr:	cmp #'s'
	bne qeravr
	cpy #'t'
	beq gobadv
qeravr:	cmp #'e'
	bne qdsvar
	cpy #'r'
	beq gobadv
	cpy #'l'
	beq gobadv

qdsvar:	cmp #'d'		; disk status?
	bne varok
	cpy #'s'
	beq gobadv		; cannot modify ds
	cpy #$d3  		; 's'+$80
	beq gobadv		; cannot modify ds$
varok:
!if CC4{		; *** 256k version ***
	lda varend		; end of simple vars (256k)
	ldy varend+1
}
!if CC3{		; *** 192k version ***
	lda strend		; end of simple vars (192k)
	ldy strend+1
}
!if CC3+CC4{		; *** 192k+256k version ***
	sta lowtr		; ^to start of new variable
	sty lowtr+1
	clc
	adc #6+addprc
	bcc goblt
	iny
goblt:	jsr bltuv		; enough room?
}
!if CC1+CC2{		; *** 64k+128k version ***
	lda arytab		; end of simple vars (64k,128k)
	ldy arytab+1
	sta lowtr
	sty lowtr+1
	lda strend
	ldy strend+1
	sta hightr
	sty hightr+1
	clc
	adc #6+addprc
	bcc noteve
	iny
noteve:	sta highds
	sty highds+1
}
!if CC1{		; *** 64k version ***
	jsr bltu		; 64k
}
!if CC2{		; *** 128k version ***
	jsr bltuv		; 128k
}
!if CC1+CC2{		; *** 64k+128k version ***
	lda highds		; 64k or 128k
	ldy highds+1
	iny
	sta arytab
	sty arytab+1
	sta arypnt		; set pointer to arrays
	sty arypnt+1
aryva2:	lda arypnt
	ldx arypnt+1
aryva3:	cpx strend+1		; end of arrays ?
	bne aryvgo
	cmp strend
	bne aryvgo
	jmp arydon		; finished...
aryvgo:	sta index1		; parse the array
	stx index1+1
	jsr mapvar
	ldy #1-addprc
	lda (index1),y		; array name
	tax
	iny
	lda (index1),y		; name 2nd char
	php			; save status reg
	iny
	lda (index1),y		; point to next array
	adc arypnt
	sta arypnt
	iny
	lda (index1),y
	adc arypnt+1
	sta arypnt+1
	plp			; restore status
	bpl aryva2		; not a string type
	txa
	bmi aryva2		; not a string array
	iny			; ok we have a string array
	lda (index1),y
	ldy #$00
	asl
	adc #5
	adc index1
	sta index1
	bcc aryget
	inc index1+1
aryget:	ldx index1+1		; parse array
	cpx arypnt+1		; done with this array ?
	bne gogo
	cmp arypnt
	beq aryva3		; yes...
gogo:	jsr mapvar
	ldy #$00		; process string pointer
	lda (index1),y
	beq dvarts		; no string...go on...
	sta tttemp
	iny
	lda (index1),y
	clc
	adc tttemp
	sta hightr
	tax			; save is x for check
	iny
	lda (index1),y
	adc #$00		; adjust high byte
	sta hightr+1
	iny
	lda (index1),y
	sta i6509		; bank set for getting strings
; fix backwards pointer by adding
; the move length to it
	clc
	ldy #$00
	lda (hightr),y
	adc #6+addprc
	sta (hightr),y
	iny
	lda (hightr),y
	adc #$00
	sta (hightr),y		; done with this str.
; fix the next string in the array
dvarts:	lda #strsiz
	clc
	adc index1
	sta index1
	bcc aryget
	inc index1+1
	bne aryget		; branch always

arydon:
}
	jsr mapvar
	ldy #0
	lda varnam
	sta (lowtr),y
	iny
	lda varnam+1
	sta (lowtr),y
	lda #0
	iny
	sta (lowtr),y
	iny
	sta (lowtr),y
	iny
	sta (lowtr),y
	iny
	sta (lowtr),y
	iny
	sta (lowtr),y

finptr:	jsr maptxt
	lda lowtr
	clc
	adc #2
	ldy lowtr+1
	bcc finnow
	iny
finnow:	sta varpnt
	sty varpnt+1
	ldx #varbnk
	stx varpnt+2
	rts

; ******************************************* MATH2 ***********************************************
; 9af5 fmaptr

fmaptr:	lda count
	asl
	adc #5			; -> entries, c clr'd by asl
	adc lowtr
	ldy lowtr+1
	bcc jsrgm
	iny
jsrgm:	sta arypnt
	sty arypnt+1
	rts
; -------------------------------------------------------------------------------------------------
; 9b06 intidx
;   read a formula from the current pos and turns it into a positive integer.
;   leaving the result in facmo & lo. negative arguments are not allowed.

intidx:	jsr chrget
	jsr frmevl
posint:	jsr chknum
	lda facsgn
	bmi nonono
ayint:	lda facexp
	cmp #$90
	bcc qintgo
	lda #<n32768
	ldy #>n32768
	jsr fcomp
nonono:	bne fcerr8
qintgo:	jmp qint

fcerr8:	jmp fcerr		; -> illegal quantity error, ready
; -------------------------------------------------------------------------------------------------
; 9b28 isary
;   format of arrays in ram.
;   descriptor:
;   lb = 1st char
;   hb = 2nd char (200 bit = str flag)
;   length of array in ram in bytes
;   number of dims
;   for each dim starting with the 1st list (2 bytes each) of the max indice+1 the values.

isary:	lda dimflg
	ora intflg
	pha
	lda valtyp
	pha
	lda #0
	pha
indlop:	lda varnam+1
	pha
	lda varnam
	pha
	jsr intidx
	pla
	
	sta varnam
	pla
	sta varnam+1
	pla
	tay
	tsx
	lda 258,x
	pha
	lda 257,x
	pha
	lda indice
	sta 258,x
	lda indice+1
	sta 257,x
	
	iny
	tya
	pha
	jsr chrgot
	cmp #44
	beq indlop
	pla
	sta count
	jsr chkcls
	pla
	sta valtyp
	pla
	sta intflg
	and #127
	sta dimflg
	ldx arytab
	lda arytab+1
lopfda:	stx lowtr
	sta lowtr+1
!if CC1+CC2{		; *** 64k+128k version ***
	cmp strend+1		; 64k,128k
}
!if CC3+CC4{		; *** 192k+256k version ***
	cmp aryend+1		; 192k,256k
}
	bne lopfdv
!if CC1+CC2{		; *** 64k+128k version ***
	cpx strend		; 64k,128k
}
!if CC3+CC4{		; *** 192k+256k version ***
	cpx aryend		; 192k,256k
}
	beq notfdd
lopfdv:	jsr mapary 
	ldy #0
	lda (lowtr),y
	iny
	cmp varnam
	bne nmary1
	lda (lowtr),y
	cmp varnam+1
	beq gotary
nmary1:	iny
	lda (lowtr),y
	clc
	adc lowtr
	tax
	iny
	lda (lowtr),y
	jsr maptxt 
	adc lowtr+1
	
	bcc lopfda
; -------------------------------------------------------------------------------------------------
; 9ba4 bserr - bad subscript error

bserr:	ldx #errbs
	!byte $2c
; illegal quantity error
fcerr:	ldx #errfc
errgo3:	jmp error
; -------------------------------------------------------------------------------------------------
; 9bac gotary

gotary:	jsr maptxt 
	ldx #errdd
	lda dimflg
	bne errgo3
	jsr fmaptr
	jsr mapary 
	ldy #4
	lda (lowtr),y
	cmp count
	bne bserr
	jmp getdef		; getdef expects i6509 set to arybnk
sav44:	bpl sav45		; float: size=5
	dex
	lda varnam
	bpl sav45		; string:size=4
	dex
	dex			; int  : size=2
sav45:	rts
; -------------------------------------------------------------------------------------------------
; 9bd0 notfdd - here when var is not found in the array table
;   building an entry
;   put down the descriptor
;   setup # of dims
;   make sure there is room for the new entry
;   remember 'varpnt'
;   tally =4
;   skip 2 locs for later fill in of size
;   loop get an indice
;   put down #+1 and inc varptr
;   tally= tally*#+1
;   decrement #-dims
;   bne loop
;   call 'reason' with y,a reflecting last loc of var
;   update strend
;   zero all
;   make tally include maxdims and descriptor
;   put down tally
;   if called by dim, return
;   otherwise
;   index into the var as if it were found on the
;   initial search

notfdd:	jsr fmaptr
!if CC1+CC2{		; *** 64k+128k version ***
	jsr reason
}
!if CC3+CC4{		; *** 192k+256k version ***
	jsr reasna
}
	jsr mapary 
	ldy #0
	sty curtol+1
	lda varnam		; stor name, calc elt size
	sta (lowtr),y
	iny
	ldx #5
	lda varnam+1
	sta (lowtr),y
	jsr sav44
	stx curtol
	lda count
	iny
	iny
	iny
	sta (lowtr),y		; store #dimensions

loppta:	ldx #11			; default upper bound for subscr
	lda #0
	bit dimflg
	bvc notdim
	pla			; not using default, get size from stack...
	clc
	adc #1			; ...and add 1 to it for limit
	tax
	pla
	adc #0
notdim:	iny
	sta (lowtr),y		; store upper bound (reverse order)
	iny
	txa
	sta (lowtr),y
	jsr umult		; increase current size
	stx curtol
	sta curtol+1
	ldy index		; restore index saved by umult
	dec count
	bne loppta		; any more dims to do?
	adc arypnt+1		; no, add total size of array to ptr
	bcs omerr1
	sta arypnt+1
	tay
	txa
	adc arypnt
	bcc grease
	iny
	beq omerr1

grease:	jsr maptxt 
!if CC1+CC2{		; *** 64k+128k version ***
	jsr reason		; 64k or 128k versions
	sta strend
	sty strend+1
}
!if CC3+CC4{		; *** 192k+256k version ***
	jsr reasna		; 192k or 256k versions
	sta aryend
	sty aryend+1
}
	jsr mapary 
	lda #0
	inc curtol+1
	ldy curtol
	beq deccur
zerita:	dey
	sta (arypnt),y
	bne zerita

deccur:	dec arypnt+1
	dec curtol+1
	bne zerita
	inc arypnt+1
	sec
!if CC1+CC2{		; *** 64k+128k version ***
	lda strend		; 64k or 128k versions
}
!if CC3+CC4{		; *** 192k+256k version ***
	lda aryend		; 192k or 256k versions
}
	sbc lowtr
	ldy #2
	sta (lowtr),y
!if CC1+CC2{		; *** 64k+128k version ***
	lda strend+1		; 64k or 128k versions
}
!if CC3+CC4{		; *** 192k+256k version ***
	lda aryend+1		; 192k or 256k versions
}
	iny
	sbc lowtr+1
	sta (lowtr),y
	lda dimflg
	bne dimrts
	iny

getdef:	lda (lowtr),y		; i6509 set to array bank already
	sta count
	lda #0
	sta curtol
inlpnm:	sta curtol+1
	iny
	pla
	tax
	sta indice
	pla
	sta indice+1
	lda (lowtr),y
	iny
	cmp indice+1
	beq inlpn0
	bcs inlpn1
bserr7:	jmp bserr
!if CC1+CC2{		; *** 64k+128k version ***
omerr1:	jmp omerr
}
!if CC3+CC4{		; *** 192k+256k version ***
omerr1:	jmp omerra
}

inlpn0:	lda (lowtr),y
	cmp indice
	beq bserr7
	bcc bserr7

inlpn1:	lda curtol+1
	ora curtol
	clc
	beq addind
	jsr umult
	txa
	adc indice
	tax
	tya
	ldy index1
addind:	adc indice+1
	stx curtol
	dec count
	bne inlpnm
	sta curtol+1
	ldx #5			; maximum elt size is:
	lda varnam+1
	jsr sav44
	stx addend
	lda #0
	jsr umultd
	txa
	adc arypnt
	sta varpnt
	tya
	adc arypnt+1
	sta varpnt+1
	tay
	lda varpnt
	ldx #arybnk 
	stx varpnt+2
dimrts:	jmp maptxt 
; -------------------------------------------------------------------------------------------------
; 9cc4 umult
;   two byte unsigned integer multiply.
;   for multiply dimensioned arrays.
;   x,y= x,a= curtol*lowtr,y,y+1

umult:	sty index
	lda (lowtr),y		; assumes i6509 set by caller
	sta addend
	dey
	lda (lowtr),y
umultd:	sta addend+1
	lda #16
	sta deccnt
	ldx #0
	ldy #0
umultc:	txa
	asl
	tax
	tya
	rol
	tay
	bcs omerr1
	asl curtol
	rol curtol+1
	bcc umlcnt
	clc
	txa
	adc addend
	tax
	tya
	adc addend+1
	tay
	bcs omerr1
umlcnt:	dec deccnt
	bne umultc
	rts
; -------------------------------------------------------------------------------------------------
; 9cf5 FRE
;   fre(expr) returns the number of available bytes in the specified bank. if 'expr' is string,
;   then the bank is assumed to be the string bank. if 'expr' is numeric, it must be a positive,
;   byte value to be used as the bank#. if the selected bank cannot be used for basic programs,
;   a zero is returned. garbage collection is always done whenever the string bank is selected.
;
;   fre is computed as follows:
;   fretop-strend : 64 (0), 128(1),  192(1),  256(3)
;   buffpt-txtend :         128(0),  192(0),  256(0)
;   highst-aryend :                  192(2),  256(2)
;   highst-varend :                           256(1)

fre:	lda valtyp		; numeric or string param?
	beq fref10		; numeric
	jsr frefac		; string... free temporary
	ldx #strbnk
	jmp frefst

fref10:	jsr conint		; .x := bank#
	cpx #txtbnk
	bne fref80
!if CC1{		; *** 64k version ***
frefst:	jsr garba2		; compress out garbage strings
	sec
	lda fretop
	sbc strend
	tay
	lda fretop+1
	sbc strend+1
}
!if CC2+CC3+CC4{	; *** not 64k version ***
	sec
	lda buffpt
	sbc txtend
	tay
	lda buffpt+1
	sbc txtend+1
}
	jmp nosflt

fref80:
!if CC2+CC3+CC4{	; *** not 64k version ***
	cpx #varbnk
	bne fref70
}
!if CC2+CC3{		; *** 128k+192k version ***

frefst:	jsr garba2		; compress out garbage strings
	sec
	lda fretop
	sbc strend
	tay
	lda fretop+1
	sbc strend+1
	jmp nosflt
}
!if CC4{		; *** 256k version ***
	sec
	lda highst
	sbc varend
	tay
	lda highst+1
	sbc varend+1
	jmp nosflt
}
fref70:
!if CC3+CC4{		; *** 192k+256k version ***
	cpx #arybnk
	bne fref60
	sec
	lda highst
	sbc aryend
	tay
	lda highst+1
	sbc aryend+1
	jmp nosflt
}
fref60:
!if CC4{		; *** 256k version ***
frefst:	cpx #strbnk
	bne fref50
	jsr garba2		; compress out strings
	sec
	lda fretop
	sbc strend
	tay
	lda fretop+1
	sbc strend+1
	jmp nosflt
}
fref50:	lda #0
	tay
; unsigned double byte integer to float
nosflt:	jsr stoint
	sec			; sign is positive
	jmp floatc
; -------------------------------------------------------------------------------------------------
; 9d33 POS
; function pos(x)
pos:	sec
	jsr plot		; get current position

; signed single byte integer to float
sngflt:	lda #0			; msd is 0, lsd in .y

; signed double byte integer to float
givayf:	jsr stoint
	jmp floats
; -------------------------------------------------------------------------------------------------
; 9d3f stoint
;   mov int to fac and compute proper exponents
stoint:	ldx #0
	stx valtyp		; type is integer
	sta facho		; msd
	sty facho+1		; lsd
	ldx #$90		; exponent
storts:	rts
; -------------------------------------------------------------------------------------------------
; note
;   only single arguments are allowed to functions and functions must be of the single line form
;   def fna(x)= x^2+x-2
;   no strings can be involved with these functions
; 
; idea
;   create a simple variable entry whose 1st char has the 200 bit set.
;   the value will be
;   a text ptr to the formula
;   a ptr to the argument variable
; 
;   function names can be like 'fna4'.

; see if we are in direct mode.
; and complain if so.

; 9d4a errdir - test direct? -> illegal direct error
errdir:	jsr tstdir		; in direct mode?
	bne storts		; no...
	ldx #errid		; yes...'illegal direct'
	!byte $2c

; errguf - undefined function error
errguf:	ldx #erruf		; udf never defined
	jmp error
; -------------------------------------------------------------------------------------------------
; 9d57 tstdir
;   test if execution is in direct mode
;   return z=1 if direct, z=0 otherwise

tstdir:	lda curlin+1
	cmp #$ff
	rts
tdm =tstdir
; -------------------------------------------------------------------------------------------------
; 9d5c getfnm - get a ptr to a function name

getfnm:	lda #tkfn		;  must start with fn
	jsr synchr
	ora #$80		;  .a<-1st char of fn name+$80
	sta subflg		;  indicates parsing fn
	jsr ptrgt2
	sta defpnt		;  defpnt<-ptr to ftn
	sty defpnt+1
	stx defpnt+2
	jmp chknum
; -------------------------------------------------------------------------------------------------
; 9d71 fndoer

fndoer:	jsr getfnm
	lda defpnt+2		; stack <- ptr to ftn (defpnt)
	pha
	lda defpnt+1
	pha
	lda defpnt
	pha
	jsr parchk		; compute actual param, check for parens
	jsr chknum
	pla			;  defpnt <- stack
	sta defpnt
	pla
	sta defpnt+1
	pla
	sta defpnt+2
	sta i6509 
	ldy #2			;  varpnt <- ptr for formal param
	lda (defpnt),y
	sta varpnt
	tax
	iny
	lda (defpnt),y
	sta varpnt+1
	ora varpnt		; null ptr => undef'd
	beq errguf
	iny
	lda (defpnt),y
	sta varpnt+2
	sta i6509 
fndo50:	lda (varpnt),y		;  push old value of formal param
	pha
	dey
	bpl fndo50
	ldy varpnt+1		; init formal param with fac
	lda varpnt+2
	jsr movumf
	lda txtptr+1		;  stack <- text ptr
	pha
	lda txtptr
	pha
	lda defpnt+2 
	sta i6509 
	lda (defpnt),y		; text ptr <- ptr to ftn body text
	sta txtptr
	iny
	lda (defpnt),y
	sta txtptr+1
	jsr maptxt 
	lda varpnt+2		;  stack <- ptr to formal param
	pha
	lda varpnt+1
	pha
	lda varpnt
	pha
	jsr frmnum		;  compute the ftn body
	pla			;  defpnt <- ptr to formal
	sta defpnt
	pla
	sta defpnt+1
	pla
	sta defpnt+2
	jsr chrgot
	beq deffi		;  no multi-stmt ftn bodies
	jmp snerr		; -> syntax error, ready

deffi:	pla			;  restore text ptr
	sta txtptr
	pla
	sta txtptr+1

; when entered from defstf, deffin is used to restore the pre-function call value of the formal
; parameter (5 bytes).
; when entered from defn, deffin is used to initialize the ftn's symbol table entry with a ptr to
; the text for the ftn body (2 bytes) and a ptr to the data area of the formal parameter (3 bytes)
deffin:	lda defpnt+2 
	sta i6509 
	ldy #0
	pla
	sta (defpnt),y
	pla
	iny
	sta (defpnt),y
	pla
	iny
	sta (defpnt),y
	pla
	iny
	sta (defpnt),y
	pla
	iny
	sta (defpnt),y
	jmp maptxt 
; -------------------------------------------------------------------------------------------------
; 9e07 PEEK

peek:	lda poker+1
	pha
	lda poker
	pha
	jsr getadr
	ldx i6509
	lda dfbank 
	sta i6509 
	ldy #0
	lda (poker),y
	tay
	pla
	sta poker
	pla
	sta poker+1
	stx i6509
	jmp sngflt
; -------------------------------------------------------------------------------------------------
; 9e27 faddh

faddh:	lda #<fhalf
	ldy #>fhalf
	bne fadd

fsub:	jsr conupk
; -------------------------------------------------------------------------------------------------
; 9e30 MINUS

fsubt:	jsr sav41
	eor argsgn
	sta arisgn
	lda facexp
	jmp faddt

sav75:	ldy buffpt+1
	ldx buffpt
	bne sav76
	dey

sav76:	dex
zerrts:	rts

fadd5:	jsr shiftr
	bcc fadd4		; always
fadd:	jsr conupk
; -------------------------------------------------------------------------------------------------
; 9e4d PLUS

faddt:	bne faddb
	jmp movfa

faddb:	ldx facov
	stx oldov
	ldx #argexp
	lda argexp
faddc:	tay
	beq zerrts
	sec
	sbc facexp
	beq fadd4
	bcc fadda
	sty facexp
	ldy argsgn
	sty facsgn
	eor #$ff
	adc #0
	ldy #0
	sty oldov
	ldx #fac
	bne fadd1
fadda:	ldy #0
	sty facov
fadd1:	cmp #$f9
	bmi fadd5
	tay
	lda facov
	lsr 1,x
	jsr rolshf
fadd4:	bit arisgn
	bpl fadd2
	ldy #facexp
	cpx #argexp
	beq subit
	ldy #argexp
subit:	sec
	eor #$ff
	adc oldov
	sta facov
	lda 3+addprc,y
	sbc 3+addprc,x
	sta faclo
	lda addprc+2,y
	sbc 2+addprc,x
	sta facmo
	lda 2,y
	sbc 2,x
	sta facmoh
	lda 1,y
	sbc 1,x
	sta facho
fadflt:	bcs normal
	jsr negfac
normal:	ldy #0
	tya
	clc
norm3:	ldx facho
	bne norm1
	ldx facho+1
	stx facho
	ldx facmoh+1
	stx facmoh
	ldx facmo+1
	stx facmo
	ldx facov
	stx faclo
	sty facov
	adc #$08
	cmp #$18+addpr8
	bne norm3
zerofc:	lda #0
zerof1:	sta facexp
zeroml:	sta facsgn
	rts
; -------------------------------------------------------------------------------------------------
; 9ee1 fadd2

fadd2:	adc oldov
	sta facov
	lda faclo
	adc arglo
	sta faclo
	lda facmo
	adc argmo
	sta facmo
	lda facmoh
	adc argmoh
	sta facmoh
	lda facho
	adc argho
	sta facho
	jmp squeez

norm2:	adc #1
	asl facov
	rol faclo
	rol facmo
	rol facmoh
	rol facho
norm1:	bpl norm2
	sec
	sbc facexp
	bcs zerofc
	eor #$ff
	adc #1
	sta facexp
squeez:	bcc rndrts
rndshf:	inc facexp
	beq overr
	ror facho
	ror facmoh
	ror facmo
	ror faclo
	ror facov
rndrts:	rts
; -------------------------------------------------------------------------------------------------
; 9f2a negfac

negfac:	jsr sav41

negfch:	lda facho
	eor #$ff
	sta facho
	lda facmoh
	eor #$ff
	sta facmoh
	lda facmo
	eor #$ff
	sta facmo
	lda faclo
	eor #$ff
	sta faclo
	lda facov
	eor #$ff
	sta facov
	inc facov
	bne incfrt
incfac:	inc faclo
	bne incfrt
	inc facmo
	bne incfrt
	inc facmoh
	bne incfrt
	inc facho
incfrt:	rts
; -------------------------------------------------------------------------------------------------
; 9f5e overflow error

overr:	ldx #errov
	jmp error
; -------------------------------------------------------------------------------------------------
; 9f63 mulshf

mulshf:	ldx #resho-1
shftr2:	ldy 3+addprc,x
	sty facov
	ldy 3,x
	sty 4,x
	ldy 2,x
	sty 3,x
	ldy 1,x
	sty 2,x
	ldy bits
	sty 1,x
shiftr:	adc #$08
	bmi shftr2
	beq shftr2
	sbc #$08
	tay
	lda facov
	bcs shftrt
shftr3:	asl 1,x
	bcc shftr4
	inc 1,x
shftr4:	ror 1,x
	ror 1,x
rolshf:	ror 2,x
	ror 3,x
	ror 4,x
	ror
	iny
	bne shftr3
shftrt:	clc
	rts

; constants
fone:	!byte $81,0,0,0,0		; 1
logcn2:	!byte $03			; 4 log constants (polynom 3)
	!byte $7f,$5e,$56,$cb,$79	; 0.434255942
	!byte $80,$13,$9b,$0b,$64	; 0.576584541
	!byte $80,$76,$38,$93,$16	; 0.961800759
	!byte $82,$38,$aa,$3b,$20	; 2.885390007
sqr05:	!byte $80,$35,$04,$f3,$34	; 1/2 sqr 2
sqr20:	!byte $81,$35,$04,$f3,$34	; sqr 2
neghlf:	!byte $80,$80,0,0,0		; -0.5
log2:	!byte $80,$31,$72,$17,$f8	; log 2
; ******************************************* MATH3 ***********************************************
; 9fca LOG

log:	jsr sign
	beq logerr
	bpl log1
logerr:	jmp fcerr		; -> illegal quantity error, ready

log1:	lda facexp
	sbc #$7f
	pha
	lda #$80
	sta facexp
	lda #<sqr05
	ldy #>sqr05
	jsr fadd
	lda #<sqr20
	ldy #>sqr20
	jsr fdiv
	lda #<fone
	ldy #>fone
	jsr fsub
	lda #<logcn2
	ldy #>logcn2
	jsr polyx
	lda #<neghlf
	ldy #>neghlf
	jsr fadd
	pla
	jsr finlog
	lda #<log2
	ldy #>log2

; -------------------------------------------------------------------------------------------------
; a008 MULTIPLY
fmult:	jsr conupk

fmultt:	beq multrt

	jsr muldiv
	lda #0
	sta resho
	sta resmoh
	sta resmo
	sta reslo
	lda facov
	jsr mltply
	lda faclo
	jsr mltply
	lda facmo
	jsr mltply
	lda facmoh
	jsr mltply
	lda facho
	jsr mltpl1
	jmp movfr

mltply:	bne mltpl1
	jmp mulshf

mltpl1:	lsr
	ora #$80
mltpl2:	tay
	bcc mltpl3
	clc
	ldx #3

mltpl4:	lda resho,x
	adc argho,x
	sta resho,x
	dex
	bpl mltpl4
mltpl3:	ror resho
	ror resmoh
	ror resmo
	ror reslo
	ror facov
	tya
	lsr
	bne mltpl2
multrt:	rts
; -------------------------------------------------------------------------------------------------
; a05c conupk
;    move, typically a basic rom constant, into fac
;    enter: .a,.y  pointer to value
;    .x     bank# (ucnupk)

conupk:	ldx #sysbnk
ucnupk:	stx i6509
	sta index1
	sty index1+1
	ldy #4
	lda (index1),y
	sta arglo
	dey
	lda (index1),y
	sta argmo
	dey
	lda (index1),y
	sta argmoh
	dey
	lda (index1),y
	sta argsgn
	eor facsgn
	sta arisgn
	lda argsgn
	ora #$80
	sta argho
	dey
	lda (index1),y
	jsr maptxt 
	sta argexp
	lda facexp
	rts
; -------------------------------------------------------------------------------------------------
; a08e muldiv

muldiv:	lda argexp
mldexp:	beq zeremv
	clc
	adc facexp
	bcc tryoff
	bmi goover
	clc
	!byte $2c
tryoff:	bpl zeremv
	adc #$80
	sta facexp
	bne *+5
	jmp zeroml

	lda arisgn
	sta facsgn
	rts
mldvex:	lda facsgn
	eor #$ff
	bmi goover
zeremv:	pla
	pla
	jmp zerofc

goover:	jmp overr
; -------------------------------------------------------------------------------------------------
; a0b9 multiply by 10

mul10:	jsr movaf
	tax
	beq mul10r
	clc
	adc #2
	bcs goover
finml6:	ldx #0
	stx arisgn
	jsr faddc
	inc facexp
	beq goover
mul10r:	rts
; -------------------------------------------------------------------------------------------------
; constant 10
tenc	!byte $84,$20,0,0,0		
; -------------------------------------------------------------------------------------------------
; a0d5 divide by 10

div10:	jsr movaf
	lda #<tenc
	ldy #>tenc
	ldx #0
fdivf:	stx arisgn
	jsr movfm
	jmp fdivt
; -------------------------------------------------------------------------------------------------
; a0e6 DIVIDE
fdiv:	jsr conupk

fdivt:	beq dv0err
	jsr round
	lda #0
	sec
	sbc facexp
	sta facexp
	jsr muldiv
	inc facexp
	beq goover
	ldx #$fc
	lda #1
divide:	ldy argho
	cpy facho
	bne savquo
	ldy argmoh
	cpy facmoh
	bne savquo
	ldy argmo
	cpy facmo
	bne savquo
	ldy arglo
	cpy faclo
savquo:	php
	rol
	bcc qshft
	inx
	sta reslo,x
	beq ld100
	bpl divnrm
	lda #1
qshft:	plp
	bcs divsub
shfarg:	asl arglo
	rol argmo
	rol argmoh
	rol argho
	bcs savquo
	bmi divide
	bpl savquo
divsub:	tay
	txa
	pha
	ldx #3

divsb1:	lda argho,x
	sbc facho,x
	sta argho,x
	dex
	bpl divsb1
	pla
	tax
	tya
	jmp shfarg

dv0err:	ldx #errdvo		; division by zero error
	jmp error

ld100:	lda #$40
	bne qshft
divnrm:	asl
	asl
	asl
	asl
	asl
	asl
	sta facov
	plp
;	jmp movfr
; -------------------------------------------------------------------------------------------------
; a15a floating pt move routines
;   move data between memory and float "regs". letters following "mov" in each routine name tells
;   what that routine accomplishes: destination, source
;   fac <- res
;   movfr
movfr:	ldx #3

movfrz:	lda resho,x
	sta facho,x
	dex
	bpl movfrz
	jmp normal
; -------------------------------------------------------------------------------------------------
; a166
;   movfm:   fac <- system memory
;   movfum:  fac <- user memory
movfm:	ldx #sysbnk
movfum:	sta index1
	sty index1+1
	stx i6509
	ldy #3+addprc
	lda (index1),y
	sta faclo
	dey
	lda (index1),y
	sta facmo
	dey
	lda (index1),y
	sta facmoh
	dey
	lda (index1),y
	sta facsgn
	ora #$80
	sta facho
	dey
	lda (index1),y
	sta facexp
	sty facov
	jmp maptxt 
; -------------------------------------------------------------------------------------------------
; a191
;   mov2f:  temp2f <- fac
;   mov1f:  temp1f <- fac
;   movmf:  system memory <- fac
;   movvf:  forpnt var  <- fac
;   movumf: user memory <- fac
mov2f:	ldx #tempf2
	!byte $2c
mov1f:	ldx #tempf1
	ldy #0
movmf:	jsr round
	lda #sysbnk
	bpl mov001   		; always

movvf:	ldx forpnt
	ldy forpnt+1
	lda forpnt+2

movumf:	pha
	jsr round
	pla
mov001:	sta i6509
	sty index1+1
	stx index1
	ldy #3+addprc
	lda faclo
	sta (index),y
	dey
	lda facmo
	sta (index),y
	dey
	lda facmoh
	sta (index),y
	dey
	lda facsgn
	ora #$7f
	and facho
	sta (index),y
	dey
	lda facexp
	sta (index),y
	sty facov
	jmp maptxt 
; -------------------------------------------------------------------------------------------------
; a1d3
;   movfa:  fac <- arg register
;   movaf:  arg <- fac register
movfa:	lda argsgn
movfa1:	sta facsgn
	ldx #4+addprc
movfal:	lda argexp-1,x
	sta facexp-1,x
	dex
	bne movfal
	stx facov
	rts

movaf:	jsr round
movef:	ldx #5+addprc
movafl:	lda facexp-1,x
	sta argexp-1,x
	dex
	bne movafl
	stx facov
movrts:	rts
; -------------------------------------------------------------------------------------------------
; a1f2 round

round:	lda facexp
	beq movrts
	asl facov
	bcc movrts

incrnd:	jsr incfac
	bne movrts
	jmp rndshf
sign:	lda facexp
	beq signrt
fcsign:	lda facsgn
fcomps:	rol
	lda #$ff
	bcs signrt
	lda #1
signrt:	rts
; -------------------------------------------------------------------------------------------------
; a210 SGN

sgn:	jsr sign

float:	sta facho
	lda #0
	sta facho+1
	ldx #$88
floats:	lda facho
	eor #$ff
	rol
floatc:	lda #0
	sta faclo
	sta facmo
floatb:	stx facexp
	sta facov
	sta facsgn
	jmp fadflt
; -------------------------------------------------------------------------------------------------
; a22f ABS

abs:	lsr facsgn
	rts
; -------------------------------------------------------------------------------------------------
; a232 fcomp - compare fac with value stored in system memory
;   enter: .a,.y pointer to value

fcomp:	sta index2
fcompn:	sty index2+1		;  enter w/value on stack ("next")
	ldy #0
	jsr fcinx2 
	iny
	tax
	beq sign
	jsr fcinx2 
	eor facsgn
	bmi fcsign
	cpx facexp
	bne fcompc
	jsr fcinx2 
	ora #$80
	cmp facho
	bne fcompc
	iny
	jsr fcinx2 
	cmp facmoh
	bne fcompc
	iny
	jsr fcinx2 
	cmp facmo
	bne fcompc
	iny
	lda #$7f
	cmp facov
	jsr fcinx2 
	sbc faclo
	beq qintrt
fcompc:	lda facsgn
	bcc fcompd
	eor #$ff
fcompd:	jmp fcomps
; -------------------------------------------------------------------------------------------------
; a278 fcinx2
fcinx2:	jsr mapsys 
	lda (index2),y
	jmp maptxt 
; ******************************************* MATH4 ***********************************************
; a280 qint - quick greatest integer function.
;   leaves int(fac) in facho,mo,lo signed.
;   assumes fac < 2**23 = 8388608.

qint:	lda facexp
	beq clrfac
	sec
	sbc #addpr8+$98
	bit facsgn
	bpl qishft
	tax
	lda #$ff
	sta bits
	jsr negfch
	txa
qishft:	ldx #fac
	cmp #$f9
	bpl qint1
	jsr shiftr
	sty bits
qintrt:	rts
qint1:	tay
	lda facsgn
	and #$80
	lsr facho
	ora facho
	sta facho
	jsr rolshf
	sty bits
	rts
; -------------------------------------------------------------------------------------------------
; a2b1 INT

int:	lda facexp
	cmp #addpr8+$98
	bcs intrts
	jsr qint
	sty facov
	lda facsgn
	sty facsgn
	eor #$80
	rol
	lda #$98+8
	sta facexp
	lda faclo
	sta integr
	jmp fadflt
clrfac:	sta facho
	sta facmoh
	sta facmo
	sta faclo
	tay 
intrts:	rts
; -------------------------------------------------------------------------------------------------
; a2d8 fin - number input is left in fac.
;   at entry txtptr -> to the 1st char in a text buf. the 1st char is also in acc.
;   fin packs the digits into the fac as an integer and keeps track of where the decimal point is.
;   dptflg tells whether a dp has been seen.  dccnt is the number of digits after the dp.
;   at the end dccnt and the exp are used to determine how many times to mult or div by 10 to
;   get the correct #.

fin:	ldy #$00
	ldx #sgnflg-deccnt
finzlp:	sty deccnt,x
	dex
	bpl finzlp
	bcc findgq
	cmp #'-'
	bne qplus
	stx sgnflg
	beq finc
qplus:	cmp #'+'
	bne fin1
finc:	jsr chrget
findgq:	bcc findig
fin1:	cmp #'.'
	beq findp
	cmp #'e'
	bne fine
	jsr chrget
	bcc fnedg1
	cmp #tkminu
	beq finec1
	cmp #'-'
	beq finec1
	cmp #tkplus
	beq finec
	cmp #'+'
	beq finec
	bne finec2
finec1:	ror expsgn
finec:	jsr chrget
fnedg1:	bcc finedg
finec2:	bit expsgn
	bpl fine
	lda #0
	sec
	sbc tenexp
	jmp fine1
; findp
findp:	ror dptflg
	bit dptflg
	bvc finc
fine:	lda tenexp
fine1:	sec
	sbc deccnt
	sta tenexp
	beq finqng
	bpl finmul
findiv:	jsr div10
	inc tenexp
	bne findiv
	beq finqng
finmul:	jsr mul10
	dec tenexp
	bne finmul
finqng:	lda sgnflg
	bmi negxqs
	rts

negxqs:	jmp negop
; findig
findig:	pha
	bit dptflg
	bpl findg1
	inc deccnt
findg1:	jsr mul10
	pla
	sec
	sbc #'0'
	jsr finlog
	jmp finc
; finlog
finlog:	pha
	jsr movaf
	pla
	jsr float
	lda argsgn
	eor facsgn
	sta arisgn
	ldx facexp
	jmp faddt
; finedg
finedg:	lda tenexp
	cmp #$0a
	bcc mlex10
	lda #$64
	bit expsgn
	bmi mlexmi
	jmp overr

mlex10:	asl
	asl
	clc
	adc tenexp
	asl
	clc
	ldy #0
	sta tttemp
	lda txtptr+2 
	sta i6509
	lda (txtptr),y
	jsr maptxt 
	adc tttemp
	sec
	sbc #'0'
mlexmi:	sta tenexp
	jmp finec
; -------------------------------------------------------------------------------------------------
; constants
n0999:	!byte $9b,$3e,$bc,$1f,$fd	; 99,999,999.0499
n9999:	!byte $9e,$6e,$6b,$27,$fd	; 999,999,999.499
nmil:	!byte $9e,$6e,$6b,$28,0  	; 10**9
; -------------------------------------------------------------------------------------------------
; a3b4 linprt	
;   entry   a= < of number
;   x= >of number

linprt:	sta facho
	stx facho+1
	ldx #$90		; exponent is 2**16
	sec
	jsr floatc
outfac:	jsr fout
	ldx #fbptr
; -------------------------------------------------------------------------------------------------
; a3c3 msg - print a message
;   can also print the contents of fbuffr
;   entry:  .x =index into ebase, a table of start addresses of messages
;   data =sequential ascii characters
;   terminated by a zero byte
;   calls:  ldaabs, ochr

msg:	lda ebase,x
	ldy ebase+1,x
	sta ldaadr
	sty ldaadr+1

msgprt:	jsr ldaabs
	beq msgrts		; zero byte terminator
	jsr ochr
	inc ldaadr
	bne msgprt
	inc ldaadr+1
	bne msgprt
msgrts:	rts
; -------------------------------------------------------------------------------------------------
; a3e2 fout -  build string for formula result.

fout:	ldy #1
	lda #$20		; print space if positive
	bit facsgn
	bpl fout1
	lda #'-'
fout1:	sta fbuffr-1,y 		; store the char
	sta facsgn 		; make fac positive or qint.
	sty fbufpt 		; save for later
	iny
	lda #'0'		; get zero to type if fac=0
	ldx facexp
	bne fout10
	jmp fout19

fout10:	lda #0
	cpx #$80
	beq fout37 		; if number > 1.0
	bcs fout7
fout37:	lda #<nmil
	ldy #>nmil
	jsr fmult  		; * 10**6
	lda #250-addpr2-addprc
fout7:	sta deccnt 		; save count or zero it
fout4:	lda #<n9999
	ldy #>n9999
	jsr fcomp  		; if num > 999,999.999
	beq bigges
	bpl fout9
fout3:	lda #<n0999
	ldy #>n0999
	jsr fcomp
	beq fout38
	bpl fout5
fout38:	jsr mul10
	dec deccnt
	bne fout3
fout9:	jsr div10
	inc deccnt
	bne fout4
fout5:	jsr faddh
bigges:	jsr qint
	ldx #1
	lda deccnt
	clc
	adc #addpr2+addprc+7
	bmi foutpi
	cmp #addpr2+addprc+$08
	bcs fout6
	adc #$ff
	tax
	lda #2
foutpi:	sec
fout6:	sbc #2
	sta tenexp
	stx deccnt
	txa
	beq fout39
	bpl fout8
fout39:	ldy fbufpt
	lda #'.'
	iny
	sta fbuffr-1,y
	txa
	beq fout16
	lda #'0'
	iny
	sta fbuffr-1,y
fout16:	sty fbufpt

fout8:	ldy #0
	ldx #$80
fout2:	lda faclo
	clc
	adc foutbl+2+addprc,y
	sta faclo
	lda facmo
	adc foutbl+1+addprc,y
	sta facmo
	lda facmoh
	adc foutbl+1,y
	sta facmoh
	lda facho
	adc foutbl,y
	sta facho
	inx
	bcs fout41
	bpl fout2
	!byte $2c    		; hop
fout41:	bmi fout2
fout40:	txa
	bcc foutyp
	eor #$ff
	adc #$0a
foutyp:	adc #$2f
	iny
	iny
	iny
	iny
	sty fdecpt
	ldy fbufpt
	iny
	tax
	and #$7f
	sta fbuffr-1,y
	dec deccnt
	bne stxbuf
	lda #'.'
	iny
	sta fbuffr-1,y
stxbuf:	sty fbufpt
	ldy fdecpt
	txa
	eor #$ff
	and #$80
	tax
	cpy #fdcend-foutbl
	bne fout2
fouldy:	ldy fbufpt
fout11:	lda fbuffr-1,y
	dey
	cmp #'0'
	beq fout11
	cmp #'.'
	beq fout12
	iny
fout12:	lda #'+'
	ldx tenexp
	beq fout17
	bpl fout14
	lda #0
	sec
	sbc tenexp
	tax
	lda #'-'
fout14:	sta fbuffr+1,y
	lda #'e'
	sta fbuffr,y
	txa
	ldx #$2f
	sec
fout15:	inx
	sbc #$0a
	bcs fout15
	adc #$3a
	sta fbuffr+3,y
	txa
	sta fbuffr+2,y
	lda #0
	sta fbuffr+4,y
	beq fout20
fout19:	sta fbuffr-1,y
fout17:	lda #0
	sta fbuffr,y
fout20:	rts
; -------------------------------------------------------------------------------------------------
; a50d constants

n32768:	!byte $90        	; 32768 - must stay with fhalf and zero
fhalf:	!byte $80,0		; 0.5 for sqr
zero:	!byte 0,0,0
; -------------------------------------------------------------------------------------------------
; a513 power of ten table

foutbl:	!byte $fa,$0a,$1f,$00   ; -100,000,000
	!byte $00,$98,$96,$80   ; 10,000,000
	!byte $ff,$f0,$bd,$c0   ; -1,000,000
	!byte $00,$01,$86,$a0   ; 100,000
	!byte $ff,$ff,$d8,$f0   ; -10,000
	!byte $00,$00,$03,$e8   ; 1000
	!byte $ff,$ff,$ff,$9c   ; -100
	!byte $00,$00,$00,$0a   ; 10
	!byte $ff,$ff,$ff,$ff   ; -1
fdcend:
;	!byte $ff,$df,$0a,$80   ; -216,000 for time converter
;	!byte $00,$03,$4b,$c0   ; 216,000
;	!byte $ff,$ff,$73,$60   ; -36000
;	!byte $00,$00,$0e,$10   ; 3600
;	!byte $ff,$ff,$fd,$a8   ; -600
;	!byte $00,$00,$00,$3c   ; 60
;timend
; -------------------------------------------------------------------------------------------------
; a537 SQR - square root function  sqr(a)
;   uses sqr(a) == a**0.5
sqr:	jsr movaf
	lda #<fhalf
	ldy #>fhalf
	jsr movfm
;	jmp fpwrt  		; last thing fetched is facexp into accx
; -------------------------------------------------------------------------------------------------
; a541 EXP - exponentation x**y
;   if y = 0 then results = 1.
;   if x = 0 then results = 0.
;   if x > 0, if not check that y is an integer.
;   if so, negate x, so that log doesn't give fcerr.
;   if x is negative and y is odd, negate the result.
;   returned by exp.
;   to compute the use x**y=exp((y*log(x)).

fpwrt:	beq exp			; if fac=0, just exponentiaaate that
	lda argexp
	bne fpwrt1 		; if x <> 0
	jmp zerof1

fpwrt1:	ldx #<tempf3
	ldy #>tempf3
	jsr movmf

; y=0 already.  good in case no one calls int.
	lda argsgn
	bpl fpwr1  		; no problems if x > 0
	jsr int			; integerize the fac
	lda #<tempf3		; get comperand adr
	ldy #>tempf3
	jsr fcomp
	bne fpwr1
	tya
	ldy integr
fpwr1:	jsr movfa1
	tya
	pha
	jsr log
	lda #<tempf3
	ldy #>tempf3
	jsr fmult
	jsr exp
	pla
	lsr
	bcc negrts
; -------------------------------------------------------------------------------------------------
; a57a NEG

negop:	lda facexp
	beq negrts
; -------------------------------------------------------------------------------------------------
; a57e sav41
sav41:	lda facsgn
	eor #$ff
	sta facsgn
negrts:	rts
; -------------------------------------------------------------------------------------------------
; a585 constants

logeb2:	!byte $81,$38,$aa,$3b,$29	; log(e) base 2

expcon:	!byte 7				; 8 exp constants (polynom 7)
	!byte $71,$34,$58,$3e,$56		
	!byte $74,$16,$7e,$b3,$1b
	!byte $77,$2f,$ee,$e3,$85
	!byte $7a,$1d,$84,$1c,$2a
	!byte $7c,$63,$59,$58,$0a
	!byte $7e,$75,$fd,$e7,$c6
	!byte $80,$31,$72,$18,$10
	!byte $81,0,0,0,0		; 1
; -------------------------------------------------------------------------------------------------
; a5b3 EXP - multiply by log(e) base 2.

exp:	lda #<logeb2
	ldy #>logeb2
	jsr fmult
	lda facov
	adc #$50
	bcc stold
	jsr incrnd

stold:	sta oldov
	jsr movef
	lda facexp
	cmp #$88
	bcc exp1
gomldv:	jsr mldvex
exp1:	jsr int
	lda integr
	clc
	adc #$81
	beq gomldv
	sec
	sbc #1
	pha
	ldx #4+addprc
swaplp:	lda argexp,x
	ldy facexp,x
	sta facexp,x
	sty argexp,x
	dex
	bpl swaplp
	lda oldov
	sta facov
	jsr fsubt
	jsr negop
	lda #<expcon
	ldy #>expcon
	jsr poly
	lda #0
	sta arisgn
	pla
!if PATCH4A{
	jmp patch4a2		; patch 4a-2
} else{
	jmp mldexp
}
; -------------------------------------------------------------------------------------------------
; a605 polyx - evaluate p(x**y)*x
;   pointer to degree is in y,a
;   the constants follow the degree for x=fac, compute
;   c0*x+c1*x**3+c2*x**5+c3*x**7... cn*x**(2*n-1)

polyx:	sta polypt
	sty polypt+1
	jsr mov1f
	lda #tempf1
	jsr fmult
	jsr poly1
	lda #<tempf1
	ldy #>tempf1
	jmp fmult

; polynomial evaluator
; pointer to degree is in y,a
poly:	sta polypt
	sty polypt+1
poly1:	jsr mov2f
	lda #0
	ora (polypt),y		;  read system mem
	sta degree
	ldy polypt
	iny
	tya
	bne poly3
	inc polypt+1
poly3:	sta polypt
	ldy polypt+1
poly2:	jsr fmult
	lda polypt
	ldy polypt+1
	clc
	adc #4+addprc
	bcc poly4
	iny
poly4:	sta polypt
	sty polypt+1
	jsr fadd
	lda #<tempf2
	ldy #>tempf2
	dec degree
	bne poly2
	rts
; -------------------------------------------------------------------------------------------------
; a651 constants for RND
rmulc:	!byte $98,$35,$44,$7a	; 11879546
raddc:	!byte $68,$28,$b1,$46	; 3.92767774 e-4
; -------------------------------------------------------------------------------------------------
; a659 RND - pseudo-random number generator.

rnd:	jsr sign
	bmi rnd1
	ldx seedpt
	ldy seedpt+1
	inx
	bne rnd10
	iny

rnd10:	txa
	ldx #strbnk		; always in str bank
	jsr movfum
	lda #<rmulc
	ldy #>rmulc
	jsr fmult
	lda #<raddc
	ldy #>raddc
	jsr fadd
rnd1:	ldx faclo
	lda facho
	sta faclo
	stx facho
	ldx facmoh
	lda facmo
	sta facmoh
	stx facmo
strnex:	lda #0
	sta facsgn
	lda facexp
	sta facov
	lda #$80
	sta facexp
	jsr normal
	ldx seedpt
	ldy seedpt+1
	lda #strbnk 
	inx
	bne rnd20    		; if no carry
	iny
rnd20:	jmp movumf
; -------------------------------------------------------------------------------------------------
; a6a6 COS - cosinus function

cos:	lda #<pi2
	ldy #>pi2
	jsr fadd
; -------------------------------------------------------------------------------------------------
; a6ad SIN - sinus function

sin:	jsr movaf
	lda #<twopi
	ldy #>twopi
	ldx argsgn
	jsr fdivf
	jsr movaf
	jsr int
	lda #0
	sta arisgn
	jsr fsubt
	lda #<fr4
	ldy #>fr4
	jsr fsub
	lda facsgn
	pha
	bpl sin1
	jsr faddh
	lda facsgn
	bmi sin2
	lda tansgn
	eor #$ff
	sta tansgn
sin1:	jsr negop
sin2:	lda #<fr4
	ldy #>fr4
	jsr fadd
	pla
	bpl sin3
	jsr negop
sin3:	lda #<sincon
	ldy #>sincon
	jmp polyx
; -------------------------------------------------------------------------------------------------
; a6f8 TAN - tangent function

tan:	jsr mov1f
	lda #0
	sta tansgn
	jsr sin
	ldx #<tempf3
	ldy #>tempf3
	jsr movmf
	lda #<tempf1
	ldy #>tempf1
	jsr movfm
	lda #0
	sta facsgn
	lda tansgn
	jsr cosc
	lda #<tempf3
	ldy #>tempf3
	jmp fdiv

cosc:	pha
	jmp sin1
; -------------------------------------------------------------------------------------------------
; a726 constants

pi2:	!byte $81,$49,$0f,$da,$a2	; pi/2
twopi:	!byte $83,$49,$0f,$da,$a2	; 2pi
fr4:	!byte $7f,0,0,0,0		; 0.25

sincon:	!byte 5				; 6 sin+cos constants (polynom 5) 
	!byte $84,$e6,$1a,$2d,$1b
	!byte $86,$28,$07,$f6,$f8
	!byte $87,$99,$68,$89,1
	!byte $87,$23,$35,$df,$e1
	!byte $86,$a5,$5d,$e7,$28
	!byte $83,$49,$0f,$da,$a2

atncon:	!byte $0b			; 12 atn constants (polynom 11)
	!byte $76,$b3,$83,$bd,$d3
	!byte $79,$1e,$f4,$a6,$f5
	!byte $7b,$83,$fc,$b0,$10
	!byte $7c,$0c,$1f,$67,$ca
	!byte $7c,$de,$53,$cb,$c1
	!byte $7d,$14,$64,$70,$4c
	!byte $7d,$b7,$ea,$51,$7a
	!byte $7d,$63,$30,$88,$7e
	!byte $7e,$92,$44,$99,$3a
	!byte $7e,$4c,$cc,$91,$c7
	!byte $7f,$aa,$aa,$aa,$13
	!byte $81,0,0,0,0
; -------------------------------------------------------------------------------------------------
; a791 ATN

atn:	lda facsgn
	pha
	bpl atn1
	jsr negop
atn1:	lda facexp
	pha
	cmp #$81
	bcc atn2
	lda #<fone
	ldy #>fone
	jsr fdiv
atn2:	lda #<atncon
	ldy #>atncon
	jsr polyx
	pla
	cmp #$81
	bcc atn3
	lda #<pi2
	ldy #>pi2
	jsr fsub
atn3:	pla
	bpl atn4
	jmp negop
; ******************************************* STRNG1 **********************************************
; 'string utility routines'
; a7c0 PUDEF
;   puctrl takes assigns values for the print using characters (fill,comma,dot,dollar) from a
;   user string.

puctrl:	jsr sav13
	jsr mapinx		; .a=len, index=^string
	tay
	beq pucbye		; nothing,... done
	cpy #pumony-puchrs+1
	bcc puc50		; len < #pu chars
	ldy #pumony-puchrs+1	; len >= #pu chars
puc50:	dey
puc60:	lda (index),y
	sta puchrs,y
	dey
	bpl puc60
pucbye:	jmp maptxt
; -------------------------------------------------------------------------------------------------
; a7db STR
;   the str$ fnc takes a number and gives a string with the chars the output of the # would have
;   given.

strd:	jsr chknum
	jsr fout
	pla
	pla

; find length of number string
foutst:	ldy #0
str010:	lda fbuffr,y
	beq str020
	iny
	bne str010

str020:	tya			; length to .a
	jsr    strspa
	sty i6509

;	move from fbuffr to (dsctmp)
	ldy #0
str030:	lda fbuffr,y
	beq str040
	sta (dsctmp+1),y
	iny
	bne str030
str040:	jsr maptxt
	jmp putnew
; -------------------------------------------------------------------------------------------------
; a805 strini
;   get string space for the creation of a string and create a descriptor for it in dsctmp
;   enter:  strini -  facmo contains descriptor ptr
;   -  .a = length
;   strspa -  .a = length

strini:	ldx facmo+2
	stx dscpnt+2
	ldx facmo
	ldy facmo+1
	stx dscpnt		; dscpnt <- descriptor ptr
	sty dscpnt+1
strspa:	jsr getspa		; allocate space
	sta dsctmp		; length
	stx dsctmp+1		; ptr to string
	sty dsctmp+2
	ldy #strbnk		; string bank#
	sty dsctmp+3
atn4:	rts
; -------------------------------------------------------------------------------------------------
; a81f strlit
;   get string space for the creation of a string.
;   space is allocated and a copy is made of this substring. a temporary descriptor is made.
;   exit:   strng1 = ptr to start of string
;   strng2 = ptr to 1st char past terminator
;   facmo  = descriptor ptr for copy

;   strlit,strlt2: a string is searched until the end is reached or a matching terminating char is
;   found. this substring is copied to a new temporary string.
;   enter: .a,.y = ptr to string
;          .x = string bank#
;   putnew: temp descriptor dsctmp is put on the descr "stack" and facmo is its desc ptr.

strlit:	pha
	lda #34			; set terminators
	sta charac
	sta endchr
	pla
strlt2:	sta strng1		; strng1<-ptr to string
	sty strng1+1
	stx strng1+2
	stx i6509
	sta dsctmp+1		; ditto..
	sty dsctmp+2
	stx dsctmp+3
	stx strng2+2
	ldy #$ff
strget:	iny			; skim over string
	lda (strng1),y
	beq strfi1
	cmp charac
	beq strfin
	cmp endchr
	bne strget
strfin:	cmp #34
	beq strfi2
strfi1:	clc
strfi2:	jsr maptxt
	sty dsctmp
	tya
	adc strng1		; strng2 <- ptr to end of string
	sta strng2
	ldx strng1+1
	bcc strst2
	inx
strst2:	stx strng2+1
	tya			; .a <- length
	jsr strini		; allocate space
	ldx #2

sotl:	ldy strng1,x
	sty index,x
	dex
	bpl sotl
; entry point from leftd
glgr: 	jsr movdo		; copy it to end of string area

putnew:	ldy temppt
	cpy #strsiz+strsiz+strsiz
	bne putnw1
	ldx #errst
	jmp error

; compute address of this temp descriptor and temppt becomes offset to next descriptor.
; two descr pointers:
; facmo,lastpt <- tempst+temppt
; and:
; temppt <- temppt+strsiz
putnw1:	lda #strbnk		; temp str descrs are in str bank
	sta i6509
	sta facmo+2
	ldx #0			; move len,ptr,bank bytes

putnwl:	lda dsctmp,x
	sta (tempst),y		; length
	iny
	inx
	cpx #strsiz
	bne putnwl
	jsr maptxt
	lda tempst+1
	sta facmo+1
	sta lastpt+1
	clc
	lda tempst
	adc temppt
	sta facmo
	sta lastpt
	bcc putnw2
	inc facmo+1
	inc lastpt+1

putnw2:	sty temppt
	ldy #0
	sty facov
	dey
	sty valtyp		; $ff is string type
	rts
; -------------------------------------------------------------------------------------------------
; a8ab movins - move a string to top of free space
;   enter: movins  - strng1 is src descriptor ptr
;   movdo  - index = ptr to src string
;         .a = length
;   exit: index = ptr to source
;   frespc = ptr to dst link bytes

movins:	lda strng1+2
	sta i6509
	ldy #0
	lda (strng1),y		; get length,ptr via descr ptr
	tax
	iny
	lda (strng1),y		; index<-ptr to string
	sta index
	iny
	lda (strng1),y
	sta index+1
	iny
	lda (strng1),y
	sta index+2
	txa
movdo:	tay
	beq mvdone
	pha
	ldx #strbnk
movlp:	dey			; move the string
	lda index+2
	sta i6509
	lda (index),y
	stx i6509
	sta (frespc),y
	tya
	bne movlp
	pla
mvdone:	jsr maptxt
	clc			; adjust frespc ptr
	adc frespc
	sta frespc
	bcc mvstrt
	inc frespc+1
mvstrt:	rts
; -------------------------------------------------------------------------------------------------
; a8e6 frestr
;   given a string descriptor pointer, determine if it can be freed and do so.
;   exit:  .a = length
;   index = ptr to string

frestr:	jsr chkstr

frefac:	lda facmo		;  descptr ptr
	ldy facmo+1
	ldx facmo+2
fretmp:	jsr sav10
	bne fre02		; one then scratch it
	jsr stradj		; index points to link
	bcc fre02		; literal no fix
	jsr mkgarb		; mark it as garbage
	pha			; save length on stack

	eor #$ff		; put index back
	sec			; to first byte
	adc index
	ldy index+1
	bcs res00
	dey
res00:	sta index
	sty index+1
	tax			; lo into x
	pla			; pull length from stack
	ldy index+2		; equal to fretop?
	cpy #strbnk		; bank
	bne frerts
	ldy index+1
	cpy fretop+1		; ptr(hi)
	bne frerts
	cpx fretop		; ptr(lo)
	bne frerts

; string was last into string space
; save garbage collection some time by freeing up. (length + ptrsiz)
	pha			; save length on stack
	clc
	adc fretop
	bcc fre01
	inc fretop+1
fre01:	clc
	adc #ptrsiz
	sta fretop
	bcc frepla
	inc fretop+1
frepla:	pla			; pull length off stack
	rts

; index is descripto ptr. set up return values as if string had been marked as garbage, as in above
fre02:	jsr mapinx		; set bank to index+2
	ldy #$00		; set up .a and index
	lda (index),y		; length
	pha
	iny
	lda (index),y		; pointer lo
	pha
	iny
	lda (index),y		; pointer hi
	tax
	iny
	lda (index),y		; pointer bank
	sta index+2
	stx index+1
	jsr maptxt
	pla
	sta index
	pla			; get back length
	rts
; -------------------------------------------------------------------------------------------------
; a94f sav10
;   if the descriptor pointer is on the top of string descriptor stack, pop it off.
;   enter:  .a,.y = descriptor ptr
;           .x    = bank#

sav10:	sta index
	sty index+1
	stx index+2

fretms:	cpx #strbnk
	bne frerts
	cpy lastpt+1
	bne frerts
	cmp lastpt
	bne frerts
	sbc #strsiz
	sta lastpt
	bcs fret10
	dec lastpt+1
fret10:	sec
	lda temppt
	sbc #strsiz
	sta temppt
	ldy #0
frerts:	rts
; -------------------------------------------------------------------------------------------------
; string assignment
; a973 inpcom perform the assignment of a string value to a string variable.
;   enter: forpnt = ptr to lhs var's data memory
;          facmo  = descriptor ptr to rhs string val
;   forpnt is checked to see if it ds$. special code handles ds$ assignments. also, if the rhs value
;   is not a temporary result (i.e., descriptor ptr points to the symbol tables), a copy of the
;   value is made.

inpcom:	ldy forpnt+2
	cpy #sysbnk
	bne getspt
	jmp mktime		; see ptrget, => ti$

getspt:	ldy facmo+2		; descr ptr for temp?

!if CC1+CC2{		; *** 64k+128k version ***
	cpy #varbnk		; no, if varbnk & < strend
	bne dntcpy
	ldy facmo+1		; descr ptr for temp?
	cpy strend+1		; make a copy, if not...
	bcc copy
	bne dntcpy
	lda facmo
	cmp strend
	bcc copy
}
!if CC3{		; *** 192k version ***
	cpy #arybnk		; not if in array bank
	beq copy
	cpy #varbnk		; not if varbnk & < strend
	bne dntcpy
	ldy facmo+1		; descr ptr for temp?
	cpy strend+1		; make a copy, if not...
	bcc copy
	bne dntcpy
	lda facmo
	cmp strend
	bcc copy
}
!if CC4{		; *** 256k version ***
	cpy #varbnk		; no, if in varbnk
	beq copy
	cpy #arybnk		; or array bank
	beq copy
}
dntcpy: lda facmo
	ldy facmo+1
	ldx facmo+2
	sta dscpnt
	sty dscpnt+1
	stx dscpnt+2
	jsr sav10
	jsr stradj		; set up index to new string
	bcc dcop02
	jsr bcklnk		; link new
dcop02:	jsr fixold		; fix old...
	ldx forpnt+2
	ldy #strsiz-1
dcop01:	jsr mapdsp
	lda (dscpnt),y		; set the descriptor
	stx i6509
	sta (forpnt),y
	dey
	bpl dcop01
	jmp maptxt
; -------------------------------------------------------------------------------------------------
; a9bd copy - make a copy of the source value. do the assignment of the duplicate.

copy:	lda facmo+2
	sta i6509
	ldy #0
	lda (facmo),y
	jsr maptxt
	jsr strini		; copy src value: make space for it
	ldx #2

soth:	ldy dscpnt,x
	sty strng1,x
	dex
	bpl soth
	jsr movins		; move src to temp
; fix to fre get strings
	lda strng1		; restore .a & .y
	ldy strng1+1
	ldx strng1+2
	jsr fretms		; fre the temp string

	jsr stradd		; set up index
	bcc copy02		; ?fix back links
	jsr bcklnk		; link new
copy02:	jsr fixold		;  fix old...
	ldy #strsiz-1		; fix var's descriptor
	lda forpnt+2
	sta i6509
copy01:	lda dsctmp,y
	sta (forpnt),y
	dey
	bpl copy01
	jmp maptxt
; -------------------------------------------------------------------------------------------------
; a9fc bcklnk
;   fix the new string by setting its back link bytes to point to the destination descriptor.
;   enter: forpnt = descr ptr for dest

bcklnk:	jsr mapinx
	ldy #$00
	lda forpnt		; put in backwards link
	sta (index),y
	iny
	lda forpnt+1
	sta (index),y
	iny			; bank number
	lda forpnt+2
	sta (index),y
	jmp maptxt
; -------------------------------------------------------------------------------------------------
; aa12 fixold - if the destination has an old value, free it and mark it as garbage.
;   enter:  forpnt=dest descriptor ptr

fixold:	ldx #2
sump:	ldy forpnt,x
	sty index,x
	dex
	bpl sump
	jsr stradj		; point to old string
	bcc fnk05		; in text do not fix
;	jmp mkgarb		; mark as garbage
; -------------------------------------------------------------------------------------------------
; aa20 mkgarb - mark the string as garbage
;   enter:  index points to str link bytes
;   .x = length
;   exit:   .x,.a = length
;   .y = 0
;   index unchanged

mkgarb:	jsr mapinx		; bank <= index+2
	ldy #2
	lda #$ff
	sta (index),y		; mark bank#
	dey
	sta (index),y		; mark back link(hi) as junk
	dey
	txa
	sta (index),y		; back link(lo)=len
	jmp maptxt
; -------------------------------------------------------------------------------------------------
; aa33 stradj, stradd	
;   takes the pointer index which points to a descriptor and indexes to the desciptors string data.
;   if no action to take, (ds$ string or zero length string) we return with carry clear;
;   otherwise we return with the pointer set to the link bytes in the string
;   the length in .a and the carry set.
;   stradj - use index as descriptor ptr
;   stradd - use dsctmp as descriptor

stradj:	jsr mapinx
	ldy #$00
	lda (index),y		; push length on stack
	pha
	beq sadj8		; length 0 do nothing
	iny
	lda (index),y		; push lo byte
	pha
	iny
	lda (index),y		; high byte in .x
	tax
	iny
	lda (index),y		; bank in .y
	tay
	jsr maptxt
	pla			; lo

sadj3:
	;cpx fretop+1
	;bcc sadj8
	;cmp fretop
	;bcc sadj8
	cpy dsdesc+3		; is it ds$ string?
	bne sadj4
	cpx dsdesc+2
	bne sadj4		; fix
	cmp dsdesc+1
	beq sadj8
sadj4:	sta index		; ok, set pointer
	stx index+1
	sty index+2
	pla			; get back length
	tax			; into x also
	jsr sav15
sadj6:	sec			; carry set
fnk05:	rts

sadj8:	jsr maptxt
	pla			; clean up stack
	clc
	rts

stradd:	lda dsctmp
	pha			; length on stack
	beq sadj8		; do nothing
	lda dsctmp+1		; string ptr (lo)
	ldx dsctmp+2		; string ptr (hi)
	ldy dsctmp+3		; string ptr (bank)
	jmp sadj3		; etc
; ******************************************* STRNG2 **********************************************
; 'string functions'
; aa7a cat - concatenate two strings

cat:	lda facmo+2		; push descr ptr (bank#)
	pha
	lda facmo+1		; (ptr)
	pha
	lda facmo
	pha
	jsr eval		; do 2nd operand
	jsr chkstr		; must be string value
	pla
	sta strng1		; strng1 <- descr ptr for 1st opnd
	pla
	sta strng1+1
	pla
	sta strng1+2
	sta i6509 
	ldy #0
	lda (strng1),y		; len1+len2<256 ?
	sta tttemp
	lda facmo+2 
	sta i6509 
	lda (facmo),y
	jsr maptxt 
	clc
	adc tttemp
	bcc sizeok
	jmp errlen

sizeok:	jsr strini		; allocate for result
	jsr movins		; copy 1st operand
	jsr sav47
	jsr movdo		; append 2nd string
	lda strng1		; descriptor ptr for result
	ldy strng1+1
	ldx strng1+2
	jsr fretmp
	jsr putnew
	jmp tstop
sav47:	lda dscpnt		; descr ptr 2nd opnd
	ldy dscpnt+1
	ldx dscpnt+2
	jmp fretmp		; sets up index1!
; -------------------------------------------------------------------------------------------------
; aad1 CHR$ function

chrd:	jsr conint
	txa			; .a <- parameter value
	pha
	lda #1
	jsr strspa		; space for 1 char
	jsr mapdst		; bank:=dsctmp+3
	pla
	ldy #0
	sta (dsctmp+1),y	; store the char
chrd2:	jsr maptxt
	pla
	pla
	jmp putnew		; another tmp descr...
; -------------------------------------------------------------------------------------------------
; aaeb LEFT$

leftd:	jsr pream
	pha
	jsr mapdsp		; set bank
	lda (dscpnt),y
	sta tttemp
	pla
	cmp tttemp
	tya
; if 2nd param>length, use length instead
rleft:	bcc rleft1
	lda (dscpnt),y
	tax
	tya
rleft1:	jsr maptxt 
	pha			; starting offset
rleft2:	txa			; length
rleft3:	pha
	jsr strspa		; get space for result
	jsr sav47
	pla
	tay
	pla
; add offset. index will point to 1st desired char.
	jsr sav15
pulmor:	tya
	jmp glgr 		; movdo followed by putnew
sav15:	clc
sav14:	adc index
	sta index
	bcc sav16
	inc index+1
sav16:	rts
; -------------------------------------------------------------------------------------------------
; ab22 RIGHT$

rightd:	jsr pream
	pha
	jsr mapdsp		; set bank
	lda (dscpnt),y
	sta tttemp
	pla
	clc
	sbc tttemp		; places-length
	eor #$ff		; if cy, then length will be used
	jmp rleft

sav17:	jsr chrgot
	cmp #')'
	beq sav18
	jmp combyt     		; check for comma and get a byte
; -------------------------------------------------------------------------------------------------
; ab42 MID$

midd:	lda #$ff
	sta faclo
	jsr sav17

mid2:	jsr pream
	beq gofuc
	dex
	txa			; 1st pos = 1st opnd - 1
	pha
	pha
	clc
	ldx #0
	jsr mapdsp 
	lda (dscpnt),y
	jsr maptxt 
	sta tttemp
	pla
	sbc tttemp
; length of result = 0, if 1st pos > len str opnd
;                  = min(len str opnd - 1st pos, 3rd opnd)
	bcs rleft2
	eor #$ff
	cmp faclo
	bcc rleft3
	lda faclo
	bcs rleft3
; -------------------------------------------------------------------------------------------------
; ab70 pream
;   exit pream: .x=.a=2nd param val
;   .y=0
;   dscpnt set up for 1st opnd

pream:	jsr chkcls		; ')'?
	pla
	tay
	pla
	sta jmper+1		; pop return

; pop off:  return from caller of pream (see isfun should go back to eval instead.)
; .x<-stack (2nd param, byte val)
; dscpnt<-stack (descrp ptr 1st opnd)
; push back return to caller of pream.
	pla
	pla
	pla
	tax
	pla
	sta dscpnt
	pla
	sta dscpnt+1
	pla
	sta dscpnt+2
	lda jmper+1

	pha
	tya
	pha
	ldy #0
	txa
sav18:	rts
; -------------------------------------------------------------------------------------------------
; ab8e LEN

len:	jsr len1
	jmp sngflt

len1:	jsr frestr
	ldx #0
	stx valtyp
	tay
	rts
; -------------------------------------------------------------------------------------------------
; ab9d ASC

asc:	jsr len1
	beq gofuc
	ldy #0
	jsr sav12
	tay
	jmp sngflt

gofuc:	jmp fcerr		; -> illegal quantity error, ready
; -------------------------------------------------------------------------------------------------
; abae VAL

val:	jsr len1
	bne val1
	jmp zerofc

val1:	ldx #2    		; strng2 := txtptr

trug:	ldy txtptr,x
	sty strng2,x
	dex
	bpl trug
	ldx index1+2 
	stx txtptr+2		; txtptr := index1 (start of str)
	stx i6509 
	ldx index1
	stx txtptr
	clc
	adc index1
	sta index2		; index2 := offset to end of str
	ldx index1+1
	stx txtptr+1
	bcc val2
	inx
val2:	stx index2+1
	ldy #0
	lda (index2),y
	pha
	tya
	sta (index2),y
	jsr maptxt 
	jsr chrgot
	jsr fin
	jsr mapstr		; restore byte at end of str (always in str bank)
	pla
	ldy #0
	sta (index2),y
	jsr maptxt 
st2txt:	ldx strng2		; restore text pointer
	ldy strng2+1
	lda strng2+2 
	stx txtptr
	sty txtptr+1
	sta txtptr+2 
	rts
; trash old token from isfun
errd:	pla
	jsr parchk
	jsr chknum		; check for numeric argument
	jsr conint		; get integer arg. in x
	txa
	asl
	cmp #errbln		; check value against length of error pointer list
	bcs gofuc
	tay
	lda ebase,y 		; get address of message
	sta index2		; and create a temp descriptor pointing to it
	lda ebase+1,y
	sta index2+1
	jsr mapsys
	ldy #$ff
	ldx #0
erflp1:	iny	 		; count # of characters in message
	lda (index2),y
	beq errd1  		; quit when the end is found
	cmp #$20   		; don't count non-printers
	bcc erflp1
	inx 			; it's a printer, so count it!
	bne erflp1		; always
errd1:	txa
	jsr strspa		; reserve a string
	ldy #$ff
	ldx #0
erflp2:	iny
	jsr mapsys
	lda (index2),y
	beq errd2    		; done if null
	cmp #$20
	bcc erflp2
	sty tttemp 		; save .y
	pha
	txa        		; move .x to .y
	tay
	pla
	jsr mapdst
	sta (dsctmp+1),y
	tya        		; move .y back to .x
	tax
	ldy tttemp  		; restore .y
	inx
	bne erflp2		; always
errd2:	jsr maptxt
	jmp putnew
; -------------------------------------------------------------------------------------------------
; ac5c gettim
;   time is passed to and from the system in all three registers in the following way:
;   .a  (tenth bit 0) (seconds)
;   .x  (tenth bit 1) (minutes)
;   .y  (am/pm bit) (tenth bits 3,2) (hours)
;   the hours, minutes, and seconds are bcd digits and the tenths digit is stored in the unused
;   bits of them.
;   gettim: get the time in the registers and unpack into tmhour,tmmin,tmsec,tmten
;   puts unpacked time into a string.

gettim:	jsr rdtim
	pha			; save 10th bit 0
	and #$7f		; get seconds
	sta tmsec
	tya			; get hours
	and #$9f
	php			; save plus status
	and #$1f		; get rid of pm bit, if set
	cmp #$12		; treat 12 as 0
	bne *+4
	lda #0
	plp 			; test for pm
	bpl lkt50
	sei			; pm bit set, adjust hours
	sed
	clc
	adc #$12
	cld
	cli
lkt50:	sta tmhour
	lda #0			; do 10ths
	sta tmten
	tya
	rol			; pm bit
	rol			; 10th bit 3
	rol tmten
	rol			; 10th bit 2
	rol tmten
	txa
	rol			; 10th bit 1
	rol tmten
	lsr			; minutes
	sta tmmin
	pla
	rol			; 10th bit 0
	rol tmten

	lda #8			; string space for 7 chars & 1 null
	jsr getspa
	stx index1		; index1<- pointer to str space
	sty index1+1
	ldy #strbnk		; bank for recent allocation
	sty index1+2
	sty i6509 
	tay			;  .y = 8
; put in the null terminator
	dey
	lda #0
	sta (index1),y
	dey
; do tenths, convert to ascii
	lda tmten
	clc
	adc #'0'
	sta (index1),y
	dey
; .y index to place for next digit
; .x index to next byte containing 2 packed
; bcd digits(rel to tmhour)
	ldx #2

gti70:	lda tmhour,x		; do low digit first
	pha
	and #$0f
	clc
	adc #'0'
	sta (index1),y
	dey			; now do high digit
	pla
	and #$70
	lsr
	lsr
	lsr
	lsr
	adc #'0'
	sta (index1),y
	dey
	dex
	bpl gti70
	lda index1
	ldy index1+1
	ldx index1+2
	jmp strlit
; -------------------------------------------------------------------------------------------------
; ti$ routines - ti$ is assigned a value from a string whose descriptor is stored in fac.
; acd6 mktime

mktime:	jsr frefac
	pha
	cmp #6
	beq mktmb
	cmp #7			; must receive 7 digits
	bne fcerr2

mktmb:	ldy #0			; inx reg for packed digits
	sty fbufpt		; inx for unpacked chars

; loop around here three times to get hours, minutes and seconds. two bcd digits are packed into
; each byte indexed by "index2" and .y. expects tmhour, tmmin, tmsec to be stored consecutively.
mkti10:	jsr timnum		; get digit
	asl			; move digit into high nibble
	asl
	asl
	asl
	sta tmhour,y
	jsr timnum		; get and pack 2nd digit
	ora tmhour,y
	sta tmhour,y
	iny
	cpy #3
	bne mkti10
	pla
	cmp #6
	beq mktmc
	jsr timnum		; get tenths
	bne mktmd 		; always

mktmc:	lda #0
mktmd:	sta tmten
; adjust 24 hr clock, setting p.m. if needed
	lda tmhour
	cmp #$12		;  hr >= 12?
	bcc mkti50
	sei
	sed			; decimal math
	sbc #$12
	cld
	cli
	ora #$80		; p.m. bit
	sta tmhour

mkti50:	lda #0			; pack 10th bit 0
	ror tmten
	ror
	ora tmsec
	pha
	lda #0			; pack 10th bit 1
	ror tmten
	ror
	ora tmmin
	tax
	lda #0			; pack 10th bits 2,3
	ror tmten
	ror
	ror tmten
	ror
	lsr
	ora tmhour
	tay
	pla
	clc			; c-clr => set time-of-day
	jmp settim		; set time as specified
; -------------------------------------------------------------------------------------------------
; ad3d timnum gets next digit
;   uses index2 as base ptr, .y<=fbufpt to get ascii digit
;   uses fbufpt+1 as temp for preserving .y
;   exit: .y unchanged
;         .a = unasciied digit value
;   fbufpt=fbufpt+1

timnum:	sty fbufpt+1
	ldy fbufpt
	inc fbufpt
	jsr sav12
	jsr qnum
	bcs fcerr2
	sbc #$2f
	ldy fbufpt+1
	rts

fcerr2:	jmp fcerr		; -> illegal quantity error, ready
; -------------------------------------------------------------------------------------------------
; garbage collection
;   get space for char string.
;   note may force garbage collection
;   entry:   ac = # of chars
;   exit:    ptr in y,x otherwise
;   blows off to 'out of string space' error
;   also preserves ac and sets frespc=
;   y,x= ->at space.
; ad53 getspa

getspa:	lsr garbfl
tryag2:	tax			; save in x also
	beq getrts		; length of 0 no go...
	pha			; save a (length) on stack
	lda fretop		; lo byte
	sec			; for subtract
	sbc #ptrsiz		; minus 3 (link bytes)
	ldy fretop+1
	bcs tryag3
	beq garbag		; make sure no wraparound to $ff page
	dey
tryag3:	sta index1		; save for later
	sty index1+1
	txa
	eor #$ff
	sec
	adc index1
	bcs tryag4
	sta tttemp		; prevent wraparound to $ff page
	tya
	beq garbag
	lda tttemp
	dey
tryag4:	cpy strend+1
	bcc garbag
	bne strfre
	cmp strend
	bcc garbag
strfre:	sta frespc
	sty frespc+1
	jsr mapstr 
	ldy #$02		; flag string as garb.
	lda #$ff		; garbage flag
	sta (index1),y
	dey
	sta (index1),y		; flag
	dey
	pla			; length
	sta (index1),y
	jsr maptxt 
	ldx frespc
	ldy frespc+1
	stx fretop
	sty fretop+1

getrts:	rts

garbag:	lda garbfl
	bmi grbg99		; if out of memory
	jsr garba2
	sec
	ror garbfl
	pla
	bne tryag2  		; always

grbg99:	jmp omerr  		; out of memory
; -------------------------------------------------------------------------------------------------
; adb5 garba2 - routine looks for and squashes out any unused string space it finds.
;   thus returning the space for future use by the string routines.
;   garba2 is called only when basic needs space of a fre instruction is used.

garba2:	lda #strbnk     	; set indirection to string bank
	sta i6509
	lda temppt      	; get # of temporary strings
	beq naa         	; skip if none
; create a back pointer on current temporary strings
la:	pha			; save # of temps
!if PATCH4A{
	jmp patch4a3		; patch 4a-3
} else{
	jsr slr1		; put address of temporary string's back pointer in tempf2
}
patch4a3x1:
	tya			; .y now points to which temporary descriptor
	         		; get location of temp descriptor
	clc
	adc tempst
	ldy #0
	sta (tempf2),y		; and create a back pointer to it
	lda tempst+1
	iny
	sta (tempf2),y
	lda #strbnk
	iny
	sta (tempf2),y

patch4a3x2:
	pla
	sec
	sbc #4
	bne la    		; repeat if this was not last temporary
; main body of garbage collect
naa:	ldy #$00		; set up flag
	sty highds
	lda memtop		; get top of memory
	ldy memtop+1
	sta grbtop		; set both pointers
	sta grbpnt
	sta frespc
	sty grbtop+1
	sty grbpnt+1
	sty frespc+1

; do while (grbpnt <> fretop)
gloop:	jsr chkgrb		; check garbage string
	bne col01		; if not garbage string
col00a:	ldy #0			; get length
	jsr mapstr 
	lda (grbpnt),y
	jsr movpnt		; move grbpnt to next
	sec
	ror highds		; indicate garbage string found
	bne gloop		; always

col01:	bit highds
	bpl col03		; if garbare string not found
	ldx #$00
	stx highds		; clear indicator

; move a string over garbage
col02:	ldy #$02		; move the link bytes
	jsr mapstr

col02a:	lda (grbpnt),y
	sta (grbtop),y
	dey
	bpl col02a

	jsr sav7
	txa			; put length-1 in .y
	tay
	jsr mapstr 

glop1:	dey
	lda (grbpnt),y
	sta (grbtop),y
	dex
	bne glop1

	jsr mapinx 
	ldy #$02		; fix the descriptor
col02b:	lda grbtop-1,y
	sta (index1),y
	dey
	bne col02b
!if gdebug{
	jsr grbpri		; garbage debug
}
	lda grbpnt		; check pointer
	ldy grbpnt+1
	jsr chkgrb		; check garbage string
	beq col00a		; if garbage string found
	bne col02		; always

col03:	jsr sav7
	jmp gloop

sav7:	ldy #0 			; skip over string body
	jsr mapinx
	lda (index1),y
	tax
	jsr movtop
	sta frespc
	sty frespc+1
	txa
	jmp movpnt
!if gdebug{
	jsr  grbpri		; garbage debug
}
; -------------------------------------------------------------------------------------------------
; adb5 subroutines used for garbage collection
;   compare for y,a = fretop.
;   entry:   y,a = address of current string descriptor.
;   exit:    exit to caller if y,a = fretop.
;   else:    z flag set if garbage string.
;            z flag clear if not garbage string.
;   in either case pointers are setup for next loop and string movement.
;   exit to cfre4.
;   carry clear y,a <> fretop.

chkgrb:	cpy fretop+1		; end of strings ?
	bcc cfre4
	bne cfre1		; if not equal
	cmp fretop
	beq cfre4
	bcc cfre4

cfre1:	bit highds		; check flag
	bmi cfre2		; if empty string found
	lda #ptrsiz		; skip pointers past
	jsr movtop		; move top pointer
cfre2:	lda #ptrsiz		; skip pointers past
	jsr movpnt		; move pointers
	ldy #$02
	jsr mapstr 
	lda (grbpnt),y		; garbage ?
	cmp #$ff
	bne cfre3		; if not garbage string
	rts

cfre3:	lda (grbpnt),y		; to link bytes
	sta index1,y
	dey
	bpl cfre3		; if three bytes not moved
	rts
; mark temporary strings as garbage and exit
cfre4:	lda temppt  		; get # of temporary strings
	beq naa2    		; skip if none

; mark current temporary strings as garbage
fa:	pha     		; save # of temps
!if PATCH4A{
	jmp patch4a4		; patch 4a-4
} else{
	jsr slr1   		; put address of temporary string's back pointer in tempf2
}
patch4a4x1:
	lda (tempst),y 		; get string length
	ldy #0     		; set up index
	sta (tempf2),y 		; replace back pointer
	iny
	lda #$ff
	sta (tempf2),y
	iny
	sta (tempf2),y

patch4a4x2:
	pla
	sec
	sbc #4
	bne fa    		; repeat if this was not last temporary

naa2:	jsr maptxt		; restore i6509
	pla			; throw away return address
	pla
	lda frespc		; fix fretop and frespc
	ldy frespc+1
	sta fretop
	sty fretop+1
	rts
	
slr1:	tay
	dey
	dey
	lda (tempst),y  	; get high byte of address
	sta tempf2+1    	; and save it
	dey
	lda (tempst),y  	; get low byte of address
	sta tempf2    		; and save it
	dey
	lda (tempst),y  	; get length of string
!if PATCH4A{
	jmp patch4a5		; patch 4a-5
} else{
	clc
	adc tempf2  		; and adjust tempf2 to point to back pointer
}
	sta tempf2  		; rather than body of the string
	bcc slr2
	inc tempf2+1
slr2:	rts

movpnt:	eor #$ff		; comp and add
	sec
	adc grbpnt
	ldy grbpnt+1
	bcs mov00
	dey
mov00:	sta grbpnt
	sty grbpnt+1
	rts
	
movtop:	eor #$ff		; comp and add
	sec
	adc grbtop
	ldy grbtop+1
	bcs mov01
	dey
mov01:	sta grbtop
	sty grbtop+1
	rts
!if gdebug{

putspc:	lda #' '
	jmp bsout

; print a byte out in hex
;   enter:  .a = byte value
;   exit :  .a unchanged
hxout:	pha
	pha			; do high order nibble
	lsr
	lsr
	lsr
	lsr
	jsr hxnb
	pla			; do low order nibble
	and #$0f
	jsr hxnb
	pla
	rts
hxnb:	cmp #$0a
	bcc hxn10
	clc
	adc #55
	jmp hxn20
hxn10:	adc #$30
hxn20:	jmp bsout

; print string pointed to by grbtop. this is a non-garbage string, whose descriptor is pointed
; to by index. string bytes are printed in hex, in case non-printable chars appear.
; dumps: (str address) (string) (link)

grbpri:	lda grbtop+1		; print addr of str
	jsr hxout
	lda grbtop
	jsr hxout
	jsr putspc

; print string body
	ldy #0
	lda (index1),y		; length
	tax
	cmp #0
	beq gpr10

gpr20:	lda (grbtop),y
	sty reslo		; reslo, resmo used as temps
	stx resmo
	jsr hxout
	jsr putspc
	ldy reslo
	ldx resmo
	iny
	dex
	bne gpr20

; print out link bytes, descr address
gpr10:	jsr putspc
	lda (grbtop),y
	pha
	iny
	lda (grbtop),y
	jsr hxout
	pla
	jsr hxout
	jsr putspc
	iny
	lda (grbtop),y
	jsr hxout
	jsr putspc
	lda index1+1
	jsr hxout
	lda index1
	jsr hxout
	jsr putspc
	lda index1+1
	jsr hxout
	jsr ocrlf
	!byte 0,0
	rts
}
; -------------------------------------------------------------------------------------------------
; aee6 instrg - instring

infcer:	jmp fcerr		; -> illegal quantity error, ready

instrg:	ldx #2
incop1:	lda facmo,x		; save pointer to temporary descriptor
	sta tmpdes,x
	dex
	bpl incop1
	jsr frmevl		; get next arg.
	jsr chkstr		; must be string
	ldx #2
incop2:	lda facmo,x		; and save it, too
	sta tmpdes+3,x
	dex
	bpl incop2

	ldx #1
	stx faclo		; if no starting position is given, 1 is assumed
	jsr sav17
inst1:	jsr chkcls
	ldx faclo
	beq infcer		; s.a. of 0 is an error
	dex
	stx positn

	ldx #5			; move pointers to temp descriptors to zero page
inst2:	lda tmpdes,x
	sta ptarg1,x
	dex
	bpl inst2

	lda ptarg1+2		; now move in the descriptors
	sta i6509
	ldy #3
inst3:	lda (ptarg1),y
	sta str1,y
	dey
	bpl inst3

	lda ptarg2+2
	sta i6509
	ldy #3
inst4:	lda (ptarg2),y
	sta str2,y
	dey
	bpl inst4

	lda str2		; check if string 2 is null
	beq instnf		; if so, return zero

	lda str1+3
	sta i6509
inst5:	lda #0
	sta match
	clc
	lda str2		; length of string 2
	adc positn
	bcs instnf		; too long, not found
	cmp str1		; see if > length of string 1
	bcc inst6		; < len. string 1
	bne instnf		; must be >, not found
inst6:	ldy match
	cpy str2		; if match len. = str. len, then found
	beq instfd
	tya
	clc
	adc positn		; compare string1(s+p+m) with string2(m)
	tay
	lda (str1+1),y
	sta tmppos
	ldy match
	lda (str2+1),y
	cmp tmppos
	beq inst7
	inc positn		; not the same, start over from next position
	bne inst5		; always
inst7:	inc match		; count characters that match
	bne inst6		; always

instfd:	inc positn
	lda positn
	!byte $2c
instnf:	lda #0
	pha
	lda tmpdes+3		; free temp descriptors
	ldy tmpdes+4
	ldx tmpdes+5
	jsr fretmp
	lda tmpdes
	ldy tmpdes+1
	ldx tmpdes+2
	jsr fretmp
	jsr maptxt
	pla 			; send result back as an integer
	tay
	jmp sngflt
; ******************************************* DELETE **********************************************
; af9a DELETE -  delete a range of source
;   syntax: delete from#,to#

nrange:	jmp snerr		; -> syntax error, ready

delete:	beq nrange		; bad..no range parms.
	jsr range		; get line # range
	beq nrange		; some range errors
	lda lowtr		; save it
	ldx lowtr+1
	sta index2
	stx index2+1
	jsr fndlin		; find it
	bcc del300		; skip if not found
	ldy #1
	lda (lowtr),y   	; at end of source ?
	dey
	tax			; save it in case of swap
	bne noteos
	lda (lowtr),y
	beq del300 		; both zero means end-of-source
noteos:	lda (lowtr),y
	sta lowtr		; include to line #
	stx lowtr+1
del300:	lda index2		; check from#<to#
	sec
	sbc lowtr		; gen neg delta
	tax
	lda index2+1
	sbc lowtr+1
	tay
	bcs notdel		; no good
	txa
	clc
	adc txtend		; gen new end of source
	sta txtend
	tya
	adc txtend+1
	sta txtend+1
	ldy #0
del500:	jsr maptxt
	lda (lowtr),y   	; move source down
	sta (index2),y
	iny
	bne del500
	inc lowtr+1
	inc index2+1
	lda txtend+1		; done one extra page
	cmp index2+1
	bcs del500		; no
notdel:	jmp fini		; relink and say ready
; -------------------------------------------------------------------------------------------------
; aff4 range - input range parms
;   exit: z=1, if range errors

range:	bcc rng100		; from chrgot a # ?
	beq rng100		; a terminator
	cmp #tkminu		; a dash
	beq rng100
rngerr:	lda #0			; z=1, syntax error
	rts

rng100:	jsr maptxt
	jsr linget		; get #
	jsr fndlin		; find or set ptrs
	jsr chrgot		; get last char
	beq rng200		; skip done
	cmp #tkminu		; a dash
	bne rngerr		; syntax error
	jsr chrget		; yes - skip dash
	jsr linget		; get to #
	bne rngerr		; not a number err
rng200:	lda linnum
	ora linnum+1		; was a # to input ?
	bne rngrts		; yes
	lda #$ff		; no - make max
	sta linnum
	sta linnum+1
rngrts:	rts			; z=0, no errors

!if CC2+CC3+CC4{	; *** not 64k version) ***
; -------------------------------------------------------------------------------------------------
; b026 USING - print using (only >64k version)
;   entered by cmd, print, or print#
;   sample syntax:   print using"****";a;b;c

using:	ldx #$ff
	stx endfd
	jsr chrget
	jsr frmevl		; evaluate format string
	jsr chkstr		; must be string type...
;save temp descriptor
	lda facmo
	pha
	lda facmo+1
	pha
	lda facmo+2
	pha
	sta i6509
	ldy #3			; get 4 bytes from (facmo)
	lda (facmo),y  		; start with the bank number
	tax			; keep it handy-we will need it soon
	dey			; set up for remaining 3 bytes
ldform:	sta form,y		; copy (facmo),n to form,n-1
	lda (facmo),y
	dey
	bpl ldform
	sta lfor		; (facmo),0 is length - not stored with form
	stx i6509		; now use (facmo),3 as new indirect
	tay
	beq ser			; error if length 0
cncj:	dey
	lda (form),y
	cmp #'#'		; at least one # in format?
	beq cscol		; yes...
	tya			; no...end of format?
	bne cncj		; no...
ser:	jmp snerr		; yes...syntax error

cscol:	lda #';'
eex2:	jsr synchr		; check character
	sty noze		; clear flag for anaf
	sty bnr			; set pointer to begin of no
	jsr frmevl		; evaluate expression
	bit valtyp		; numeric or string?
	bpl conv		; branch if numeric
	jsr ini			; init counters and flags
	jsr anaf		; analyze format
	ldx chsn		; > or = in format field
	beq prcha		; branch if not
	ldx #$00
	sec
	lda cform
	sbc hulp		; .a=room left in field
	bcc prcha		; branch if no room left
	ldx #'='
	cpx chsn		; = in field
	bne schs1		; branch if not
	lsr			; .a=.a/2
	adc #$00		; add 1 if odd
schs1:	tax			; store no of blanks in x
prcha:	ldy #$00
chx:	txa
	beq cpef		; branch if no blanks
	dex
oblk:	lda #$20		; output a blank
	bne outc		; always

cpef:	cpy hulp		; end of string reached?
	bcs oblk		; output blank if yes
	jsr sav12
	iny
outc:	jsr cdout		; output character
	bne chx			; branch if not ready
	beq reay

conv:	jsr fout		; convert mfp to decimal
	jsr foutst		; build descriptor for fout string
	jsr ini			; init counters and flags
	jsr fform		; output one formatted number
reay:	jsr chrgot		; get old character
	cmp #','		; comma?
	beq eex2		; continue print use if yes
	sec
	ror noze		; set flag for anaf
	jsr anaf		; print rest of format
	pla			; restore descriptor
	tax
	pla
	tay
	pla
	jsr maptxt
	jsr fretmp
	jsr chrgot
	cmp #';'		; semi-colon?
	beq nocr		; branch if yes
	jmp ocrlf		; end of print using

nocr:	jmp chrget		; rts to basic

sav12:	jsr mapinx
	lda (index),y
	jmp maptxt
; -------------------------------------------------------------------------------------------------
; b0e7 fform
;   output a number to format
;   number is in fbuffr...format checked by anaf

fform:	lda pufill
	sta blfd		; set working fill char
	lda #$ff
ana:	 sta sno		; save blank or - in sno
	!byte $2c
stp:	stx point		; set point pointer
insy:	cpy hulp		; end of no reached?
	beq eoa			; branch if yes
	lda fbuffr,y		; get character of no
	iny
	cmp #' '		; blank?
	beq insy		; yes...span
	cmp #'-'		; sign no negative
	beq ana			; yes...
	cmp #'.'		; decimal point?
	beq stp			; yes...
	cmp #'e'		; is char 'e'?
	beq lsg			; yes...
	sta fbuffr,x		; move number
	stx enr			; update end-no pointer
	inx
	bit point		; point pointer set?
	bpl insy		; yes...
	inc vn			; count digits before point
	jmp insy

lsg:	lda fbuffr,y
	cmp #'-'		; sign of exponent negative
	bne nomn		; no...
	ror usgn		; make sign negative
nomn:	iny
	sty uexp		; set exponent pointer
eoa:	lda point		; decimal found?
	bpl rtts		; yes...
	stx point		; no...add point
rtts:	jsr anaf		; analyze format
	lda vf
	cmp #$ff
	beq erst		; field overflow
	lda fesp		; exponent in field
	beq cff			; convert to f format if not
	lda uexp		; exponent in number?
	bne ete			; yes...
	ldx enr
	jsr et2			; add exponent to number
	dec fbuffr+2,x
	inx
	stx uexp
	jsr alg			; delete leading zeros
	beq hup			; all zero
ete:	ldy posp		; + or - in format?
	bne sswe		; yes...
	ldy sno			; +?
	bmi sswe		; yes...
	lda vf
erst:	beq errf		; no room for sign
	dec vf			; reserve room
	bne rspa
	lda nf			; one #?
	beq errf		; yes...error
rspa:	inc swe
sswe:	jsr shpn		; shift decimal point
	jsr uround		; round number
	jsr shpn		; shift again if necessary
hup:	jmp chout		; output number

cff:	ldy uexp		; exponent in no?
	beq ftf			; no...
	sta hulp		; delete exponent
	sec			; adjust decimal point
	ror etof		; set e-to-f flag
	ldy point
	lda usgn		; exec nos3 or nos4
	bpl no4			; depends on sign of exp
	jsr nos3
	beq rndd 		; always
no4:	jsr nos4
ftf:	ldy point		; at start of no?
	beq rndd		; yes...
	jsr cho			; no = 0 ?
	bne rndd		; no...round
	dec vn
	bcs devn2		; always ....no round
rndd:	jsr uround
devn2:	sec
	lda vf
	sbc vn
	bcc errf		; no fit...error
	sta swe			; save difference
	ldy posp		; + or -?
	bne ahp			; yes...
	ldy sno			; get sign
	bmi ahp			; positive...
	tay
	beq errf		; no room for sign
	dey
	bne ldvn		; swe<>1
	lda nf
	ora vn			; both zero?
	bne hup			; no...
errf:	lda #'*'		; format error
stout:	jsr cdout		; fill field with stars
	bne stout
	rts

ahp:	tay			; output no if swe=0
	beq hup
ldvn:	lda vn
	bne hup			; vn<>0
	dec swe			; add extra 0
	inc noze		; before decimal point
	jmp hup
; -------------------------------------------------------------------------------------------------
; b1e9 shpn
;   shift decimal point

shpn:	sec
	lda vf
	sbc vn
	beq rdy			; format o.k
	ldy point
	bcc pntl		; vf<vn
	sta hulp
incy:	cpy enr			; end of no reached?
	beq ity
	bcs nos1		; yes...
ity:	iny
nos1:	inc vn
nos4:	jsr eado		; adjust exponent
	dec hulp		; ready?
	bne incy		; no...
	beq poit

pntl:	eor #$ff
	adc #$01
	sta hulp		; =vn-vf
decy:	cpy bnr			; begin of no?
	beq inz			; yes...
	dey
	dec vn
	!byte $2c       	; hop
inz:	inc noze		; add leading zeros
inz2:	lda #$80
nos3:	jsr eadj		; adjust exponent
	dec hulp		; ready?
	bne decy		; no...
poit:	sty point		; decimal point pointer
rdy:	rts
; -------------------------------------------------------------------------------------------------
; b33e eaxp
;   adjust exponent

sexp:	bne retrn		; no over/underflow
	eor #$09		; .a is 0 or 9
	sta fbuffr,x		; digit back in exp
	dex			; = 0 or 9
	cpx uexp
	rts

eado:	lda #$00
eadj:	ldx uexp
	inx
	bit etof		; e-to-f flag on?
	bmi tag2		; yes...
	eor usgn
	beq tag2		; ++ or --
tag1:	jsr tag3		; inc exp, overflow?
	jsr sexp		; digit 0 if yes
	bcs tag1		; try second digit
	jmp overr		; exp>99

tag2:	lda fbuffr,x
	dec fbuffr,x		; decrement exp
	cmp #'0'		; underflow on digit?
	jsr sexp		; set digit=9 if yes...
	bcs tag2		; try 2nd digit
	bit etof		; flag off?
	bpl et3			; yes...
	sty point		; decimal point pointer
retrn:	pla
	pla
	rts			; return to fform/main

et3:	lda usgn
	eor #$80		; reverse sign exp
et2:	sta usgn
	lda #'0'
	sta fbuffr+1,x		; exp<0 here
	lda #'1'
	sta fbuffr+2,x
rets:	rts

tag3:	lda fbuffr,x		; get digit of exp
	inc fbuffr,x		; increment digit
	cmp #'9'		; overflow
	rts			; return .z set
; -------------------------------------------------------------------------------------------------
; b288 ansub - load format field char in .a

ansub:	clc
	iny			; begin format?
	beq ans010		; yes...
	cpy lfor		; end?
	bcc ans020		; no...
ans010:	ldy noze		; <>0?
	bne retrn		; yes...
ans020:	jsr sav1		; set up to update bank #
	inc cform		; pointer to field
	rts

sav1:	lda form+2
	sta i6509
	lda (form),y
	jmp maptxt
; -------------------------------------------------------------------------------------------------
; b2a5 ini - init counters and flags

ini:	jsr frefac		; free temp descriptor
	sta hulp		; length string
	ldx #$0a		; printed in hulp
	lda #$00
stz:	sta swe,x		; init working registers
	dex
	bpl stz
	stx flag		; comma flag =ff
	stx point		; point pointer=ff
	stx dolr		; dollar flag=ff
	tax			; x=y=0
	tay
	rts
; -------------------------------------------------------------------------------------------------
; b2c0 round number

uround:	clc
	lda point
	adc nf			; overflow?
	bcs rrts		; yes...
	sec
	sbc noze		; underflow?
	bcc rrts		; yes...
	cmp enr			; anything to round?
	beq cbn			; yes...
	bcs rrts		; no...
cbn:	cmp bnr			; again...
	bcc rrts		; no...
	tax
	lda fbuffr,x		; get digit
	cmp #'5'		; <5 ?
roun:	bcc rrts		; yes...no round
con1:	cpx bnr			; begin of no reached?
	beq add1		; yes..add 1
	dex
	jsr tag3		; increment digit
	stx enr			; new end of no pointer
	beq con1		; branch on overflow
	rts

add1:	lda #'1'
	sta fbuffr,x
	inx
	stx point
	dec noze		; # of 0's before .
	bpl rrts		; no underflow
	inc noze		; underflow...back to 0
	inc vn
rrts:	rts
; -------------------------------------------------------------------------------------------------
; b302 alg - delete leading zeros of no

alg:	ldy point		; start with a .?
	beq szer		; yes...
cho:	ldy bnr
cmo:	lda fbuffr,y		; start with a 0?
	cmp #'0'
	rts

nbr:	inc point		; adjust point
	jsr eado		; and exponent
	inc bnr			; and pointer to begin of no
	cpy enr			; end of number?
	beq rrts		; yes...
	iny
szer:	jsr cmo			; zero in no?
	beq nbr			; yes...
	rts			; no...
; -------------------------------------------------------------------------------------------------
; b338 chout - print number

lzer:	cpx enr			; end of # reached?
	beq zout		; yes...output zero
telx:	inx
	lda fbuffr,x		; get digit
	!byte $2c		; branch awlays
zout:	lda #'0'		; output zero
outs:	lsr flag		; clear comma flag
out:	jsr cdout		; output character
	bne afrm		; not ready...
	rts

chout:	lda dolr		; dollar flag set?
	bmi chou		; no...
	inc noze		; make room for $
chou:	ldx bnr			; start of #
	dex
	ldy begfd		; begin of field
afrm:	jsr sav1
	iny
	cmp #','		; comma?
	bne punt		; no...
	bit flag		; comma flag on?
	bmi bout		; yes, do a fill char
	lda pucoma
	jmp out			; no,...output a comma char

bout:	lda blfd
	jmp out
 
punt:	cmp #'.'		; decimal point?
	bne afplus
	lda pudot		; yes...
	jmp out

zerot:	lda noze		; # of zeros
	beq lzer
	dec noze		; count leading zeros
	lda dolr		; $ flag set?
	bmi zout		; no...output zero
	sec
	ror dolr		; clear dollar flag
	lda pumony
	jmp outs		; output money symbol
 
afplus:	cmp #'+'		; plus?
	beq ispl		; yes...
	cmp #'-'		; minus?
	beq ispl1		; yes...
	cmp #'^'		; up arrow?
	bne pndd		; no...
	lda #'e'
	jsr cdout
	ldy uexp
	jsr cmo			; first dig of exp zero?
	bne mint		; no...
	iny
	jsr cmo			; second digit?
	beq post		; yes
mint:	lda #'-'
	bit usgn
	bmi mout
post:	lda #'+'
mout:	jsr cdout		; output sign exp
	ldx uexp
	lda fbuffr,x
	jsr cdout		; output first dig exp
	ldy endfd
	jmp telx
 
ispl1:	lda sno			; positive?
	bmi bout		; yes...out blank or *
ispl:	lda sno			; output sgn
	jmp out

pndd:	lda swe			; # of blanks
	beq zerot
	dec swe			; count !
pndx:	bne bout		; out blank or *
	lda posp		; + or - in field?
	bmi pndx		; yes...out blank or *
tat:	jsr sav1
	cmp #','		; comma?
	bne ispl1		; no...out sign
	lda blfd		; yes...
	jsr cdout		; out blank or *
	iny
	jmp tat

cdout:	jsr ochr		; char out
	dec cform		; count it
gooop:	rts
; -------------------------------------------------------------------------------------------------
; b3ea anaf - analyze format

anaf:	ldy endfd		; format pointer
gfor:	jsr ansub
	jsr comp		; check special chars
	bne pchar		; no match...
	sty begfd		; save beginning of field
	bcc ffoun		; # was found
	tax			; save char
sfur:	jsr ansub		; get next format char
	bcs nono		; stop on wrap-around
	jsr com1		; compare specials
	beq foun1		; found some...
nono:	ldy begfd
	txa
pchar:	jsr ochr		; out character
	bcc gfor      		; always
foun1:	bcs sfur		; no #...keep looking
	ldy begfd
ffoun:	ldx noze
	bne gooop
	stx cform
	dey
hyo2:	dec cform		; correct counter
hyo:	jsr ansub		; get next format char
	bcs efo			; end of format
	cmp #','		; comma?
	beq hyo			; yes...ignore it
	jsr isp			; + or - in format?
	bcc hyo2		; yes...
	cmp #'.'		; decimal point?
	bne avf1		; no...
	inx
	cpx #2			; more than 1 decimal?
	bcc hyo			; no...
ero:	jmp snerr		; yes...syntax error
avf1:	jsr com2		; =, >, or # in field
	bne llar		; no...
	bcc hyo1		; was #
	sta chsn		; was > or =
hyo1:	inc vf,x
	jmp hyo
llar:	cmp #'$'		; dollar?
	bne expo		; no...
	bit dolr		; test flag
	bpl hyo1		; no...
	clc
	ror dolr		; set flag
	dec vf
	jmp hyo1
expo:	cmp #'^'		; up arrow?
	bne isp			; no...
	ldx #$02
chkk:	jsr ansub		; must be 4 up arrows
	bcs ero
	cmp #'^'		; up arrow?
	bne ero
	dex
	bpl chkk
	inc fesp		; set exp flag
	jsr ansub		; next format char
	bcs efo			; end of format
isp:	cmp #'+'		; plus?
	bne chom		; no...
	lda sno			; sign neg?
	bpl spos		; yes...
	lda #'+'
	sta sno
spos:	lda posp		; + or - already?
	bne ero
	ror posp		; make posp neg/clc
	sty endfd		; end field pointer
	inc cform		; corect counter
trts:	rts
chom:	cmp #'-'		; minus?
	beq spos		; yes...
	sec
efo:	sty endfd		; end field pointer
	dec endfd
	rts
; -------------------------------------------------------------------------------------------------
; b49e comp - compare .a with symbols

comp:	cmp #'+'
	beq rt
	cmp #'-'
	beq rt
com1:	cmp #'.'
	beq rt
com2:	cmp #'='
	beq rt
	cmp #'>'
	beq rt
	cmp #'#'
	bne rt
	clc
rt:	rts
} else{			; *** 64k version *** PATCHED by VOSSI !
sav12:	jsr mapinx
	lda (index),y
	jmp maptxt
}
; ******************************************* BUTES1 **********************************************
; 'basic utility routines'
; b4b8 stxtpt

stxtpt:	lda #txtbnk
	sta txtptr+2
	clc
	lda txttab
	adc #255
	sta txtptr
	lda txttab+1
	adc #255
	sta txtptr+1
	rts
; -------------------------------------------------------------------------------------------------
; b4ca getnum - get positive integer

getnum:	jsr getpin
; check comma
combyt:	jsr chkcom
	jmp getbyt

gtbytc:	jsr chrget

getbyt:	jsr frmnum
conint:	jsr posint
	ldx facmo
	bne fcer1
	ldx faclo
	jmp chrgot
; -------------------------------------------------------------------------------------------------
; b4e5 getpin - evaluate the formula

getpin:	jsr frmnum

getadr:	lda facsgn
	bmi fcer1
	lda facexp
	cmp #145
	bcs fcer1
	jsr qint
	lda facmo
	ldy facmo+1
	sty poker
	sta poker+1
	rts

bjmps:		  		; referenced in initialization routine
fcer1:	jmp fcerr		; -> illegal quantity error, ready
; -------------------------------------------------------------------------------------------------
; these routines check for certain 'valtyp'
;   (c) is not preserved.
; b501 frmnum

frmnum:	jsr frmevl

chknum:	clc
	!byte $24
chkstr:	sec

chkval:	bit valtyp
	bmi docstr
	bcs chkerr
chkok:	rts

docstr:	bcs chkok
chkerr:	ldx #errtm
	jmp error
; -------------------------------------------------------------------------------------------------
; b515 strprt - print the str whose descriptor is -> by facmo

strprt:	jsr frefac		; return temp -}
	tax			; put count into counter
	ldy #0
	inx
	jsr mapinx

; output x characters to device
strp2:	dex
	beq strp3
	lda (index),y
	jsr ochr		; output one char
	iny
	jmp strp2		; next
strp3:	jmp maptxt
; -------------------------------------------------------------------------------------------------
; b52e output space
ospc:	lda channl
	beq crtskp
	lda #' '
	!byte $2c		; eat next two bytes
crtskp:	lda #29
	!byte $2c		; eat next two bytes
outqst:	lda #'?'
; output one character to device
ochr:	jsr bsout		; output character
	and #$ff
	rts
; -------------------------------------------------------------------------------------------------
; 'dos utility routines.' -mgm 7/23/79-
;   this is the dos parser routine which looks at lines passed to it and varifies that the syntax
;   is proper.
;   entry (dosprs): a = parsts bit which must be zero.
;   exit:    a = parsts as follows
;
; i-i-i-i-i-i-i-i-i
; i7+6+5+4+3+2+1+0i
; i-i-i-i-i-i-i-i-i
;  ^ ^ ^ ^ ^ ^ ^ ^ ====>  fn1 this bit is set when the
;  | | | | | | | |             first filename is parsed
;  | | | | | | | ======>  fn2 set for second filename
;  | | | | | |=========>  la set when #lfn parsed
;  | | | | |===========>  fa set for device number
;  | | | | ============>  d1 set for first disk unit
;  | | | ==============>  d2 set for second disk unit
;  | | ================>  dosrcl set for record size
;  | ==================>  @ set when @ encountered.
;
; the following are the vaild bit patterns for parsts after parsing for the various keywords
;
;      7 6 5 4   3 2 1 0
; (format)
;  header   0 0 0 1   * 0 0 1
;  colect   0 0 0 *   * 0 0 0
;  backup   0 0 1 1   * 0 0 0
;  copy     0 0 1 1   * 0 0 0
;    or..   0 0 * *   * 0 1 1
;  concat   0 0 * *   * 0 1 1
;  bsave    * 0 0 *   * 0 0 1
;  dsave    * 0 0 *   * 0 0 1
;  bload    0 0 0 *   * 0 0 1
;  dload    0 0 0 *   * 0 0 1
;  catlog   0 0 0 *   * 0 0 *
;  rename   0 0 0 *   * 0 1 1
;  append   0 0 0 *   * 1 0 1
;  scrtch   0 0 0 *   * 0 0 1
;  dopen    * * 0 *   * 1 0 1
;  dclose   0 0 0 0   * * 0 0
;      ^ ^ ^ ^   ^ ^ ^ ^
;      @ l d d   f l f f
;      r r 2 1   a a n n
;      p e           2 1
;      l l
;
;    "0" bits are required to be clear.
;    "1" bits are required to be set.
;    "*" bits are optional parameters.
;
; entry (dosprs):  parstx shall be set to prevent any auxiliary options to be specified.
; entry (dosprx):  x = parstx bits whic must be zero.
; exit: x = parstx as follows
;
; i-i-i-i-i-i-i-i-i
; i7+6+5+4+3+2+1+0i
; i-i-i-i-i-i-i-i-i
;  ^ ^ ^ ^ ^ ^ ^ ^ ====>  bnk is set for bank option
;  < < < < < < < ======>  offl set for 1st address
;  < < < < < <=========>  offh set for 2nd address
;  < < < < <===========>  unused
;  < < < < ============>  unused
;  < < < = ============>  unused
;  < < = = ============>  unused
;  < = = = ============>  unused

; the following are the vaild bit patterns for parstx after parsing for the various keywords
; only two stmts are allowed bits set in parstx.

;      7 6 5 4   3 2 1 0
; (format)
;  bsave    0 0 0 0   0 * * *
;  bload    0 0 0 0   0 0 * *
;      ^ ^ ^ ^   ^ ^ ^ ^
;      ? ? ? ?   ? o o b
;                  f f n
;                  h l k
;    "0" bits are required to be clear.
;    "1" bits are required to be set.
;    "*" bits are optional parameters.

dostbl:	!byte $ff,$ff,$ff,$ff,doslfn,dosdsk,$6f

; b547 dospar

dospar:	lda #0
; special error flag entry
dosprs:	ldx    #$ff		; no aux options!
; spec aux error flag entry
dosprx:	pha			; save error flags
	txa
	pha
	lda #0
	sta parsts
	sta parstx

	ldx #dosspc-1		; clear dos scratch area
dos01:	sta fbuffr,x
	dex
	bne dos01
	ldx #dossa-dosofl	; set some defaults from table
dos02:	lda dostbl,x
	sta dosofl,x
	dex
	bpl dos02
	ldx dfbank
	stx dosbnk

	jsr chrgot		; get current chr
	bne parse1		; if not end of statement

done:	pla			; get aux error flag
	and parstx		;  repeated,illegal params?
	bne dn20
	pla			; get error flags
	jsr prmrpt
	lda parsts
	ldx parstx
	rts

parse1:	cmp #'#'
	beq logadr		; if logical file number
	cmp #'w'
	beq reclen		; if record length
	cmp #'l'
	beq reclen		; if record length
	cmp #'r'
	bne dos5		; if not ????
	jsr chrget		; move on
	jmp delim1

on1:	jsr on
sav60:	jmp del1

unit1:	jsr unit		; do unit# parsing
	bne sav60    		; always

bank1:	jsr bank
	beq sav60    		; always

dos5:	cmp #'d'
	beq drv1
	cmp #tkon		; "on" token
	beq on1
	cmp #'b'
	beq bank1
	cmp #'u'
	beq unit1
	cmp #'p'
	beq doffl
	cmp #'i'
	bne dos10		; if not identifier
	beq ident
	
logadr:	lda #4
	jsr prmrpt		; check for repeated parameter
	jsr getval
	cpx #0
	beq qtyer2		; if illegal value
	stx dosla
	lda #4			; set logical address flag
	bne sav60		; get next parameter
dn20:	jmp snerr
	
reclen:	tax			; save char
	lda #$40
	jsr prmrpt		; check for repeated parameter
	cpx #'w'
	bne recoo
	jsr chrget
	jmp recon		; set parsts
recoo:	jsr getval
	cpx #0
	beq qtyer2		; zero illegal dosrcl
	cpx #255
	beq qtyer2		; illegal dosrcl
	stx dosrcl		; store parcel

recon:	lda #$40		; set dosrcl flag &
	bne tacky1

dos10:	cmp #$22;"
	beq name1
	cmp #'('
	beq name1
	bne dn20

drv1:	lda #$10
	jsr prmrpt		; check for repeated parameter
	jsr getval
	cpx #2
	bcs qtyer2		; illegal drv# if >1
	stx dosds1
	stx dosds2
	lda #$10
tacky1:	bne del1

qtyer2:	jmp qtyerr
	
ident:	lda didchk
	beq idcon		; only 1 dosdid allowed
	bne dn20

doffl:	lda #$02		; chk aux status
	jsr prxrpt
	jsr getoff		; get offset value
	sty dosofl
	sta dosofl+1
	lda #$02
dlimx1:	ora parstx		; set aux status bits
	sta parstx
	bne delim1		; try for nxt param

doffh:	lda #$04
	jsr prxrpt
	jsr getoff
	sty dosofh
	sta dosofh+1
	lda #$04
	bne dlimx1		; set aux status

idcon:	jsr chrget		; get next character
	sta dosdid		; m(txtptr => dosdid
	jsr chrget
	sta dosdid+1
	lda #$ff
	sta didchk		; set dosdid flag &
	jsr chrget		; continue
	jmp delim1
	
name1:	lda #1			; name1 allwd only once
	jsr newnam		; do name parsing
	sta dosf1l
	sta xcnt		; save temp value
	lda #<fbuffr
	sta dosf1a
	lda #>fbuffr
	sta dosf1a+1
	lda #sysbnk		;  set to system bank
	sta dosf1b

	ldy #0
	jsr mapinx
loop6:	lda (index),y
	sta fbuffr,y		;  set char in buffer
	iny
	cpy xcnt
	bcc loop6		; if not full name
	jsr maptxt
	lda #1			; set name1 flag

del1:	ora parsts
	sta parsts

delim1:	jsr chrgot
	bne nxxx
done1:	jmp done		; <cr>/<>  => done

next6:	cmp #tkon
	bne next6a
	jmp on1
next6a:	cmp #tkto		; "to" token
	beq next6b
	bne sav61		; sntax error

; if "to" is not followed by an offset param, then do file2 params. otherwise, do high
; offset and continue with file0 options.
next6b:	jsr chrget
	cmp #'p'
	bne pars22
	beq doffh

nxxx:	cmp #','
	bne next6
	jsr chrget
	jmp parse1

parse2:	jsr chrget
pars22:	cmp #'d'
	beq drv2
	cmp #tkon		; "on" token
	beq on2
	cmp #'u'
	beq unit2
	cmp #$22;"
	beq name2
	cmp #'('
	beq name2

drv2:	lda #$20
	jsr prmrpt		; check for repeated parameter
	jsr getval
	cpx #2
	bcs qtyerr		; illegal drive #
	stx dosds2
	lda #$20
	bne del2

on2:	jsr on
	jmp del2

unit2:	jsr unit		; do unit# parsing
	bne del2  		; always

name2:	lda #2			; name2 allowed only once
	jsr newnam
	sta dosf2l
	stx dosf2a
	sty dosf2a+1
	lda index1+2		;  get strng bank#
	sta dosf2b
	lda #2			; set filename2 flag &

del2:	ora parsts		; set flag in status
	sta parsts
	jsr chrgot
	beq done1		; done on <cr>/<}
	cmp #','
	beq parse2
	cmp #tkon		; "on" token
	beq on2
	cmp #'u'
	beq unit2

sav61:	bne sner
	
qtyerr:	jmp fcerr		; "illegal quantity"

on:	jsr chrget
	cmp #'u'
	beq unit		; if character is a "u"
	cmp #'b'
	beq bank
	bne sner

unit:	jsr getval
	cpx #32
	bcs qtyerr		; error if >31
	cpx #3
	bcc qtyerr		; error if <3
	stx dosfa
	lda #8
	rts

bank:	lda #$01		; repeated param?
	jsr prxrpt
	jsr getval
	cpx #mxbank		; bank too large?
	bcs qtyerr
	stx dosbnk
	lda #$01
	ora parstx		; set bnk bit in aux status
	sta parstx
	lda #0			;  .a=std status wrd, no bits to set
	rts

sner:	jmp snerr		; jump syntax error

newnam:	jsr prmrpt		; check for repeated parameter
	jsr sav13
	tax		; save length of string
	beq qtyerr		; if length = 0
	ldy #0
	jsr sav12
	cmp #'@'
	bne lenchk
	lda #$80
	jsr prmrpt
	lda parsts
	ora #$80		; set "@" flag
	sta parsts
	dex			; decrement length
	inc index1		; increment past "@"
	bne lenchk		; if no carry
	inc index1+1

lenchk:	txa
	cmp #17
	bcs errlen		; if length < 17
	ldx index1
	ldy index1+1
	rts

errlen:	ldx #errls
	jmp error		; filename too long
; get nextvalue routine
getval:	jsr chrget		; get nxt chr
gtvl2:	beq sner		; if end of statement
	bcc gtvl5		; can be numeric
	jsr chkopn		; or a "("
	jsr getbyt		; anything else is an error
	jmp chkcls		; need closing ")"

gtvl5:	jmp getbyt		; evaluate it

; get next 2byte expr routine
;   exit:  .a,.y (high,low) value
getoff:	jsr chrget		; get nxt chr
	beq sner		; if end of statement
	bcc gtff5		; can be num. const
	jsr chkopn		; or a "("
	jsr getpin		; expr
	jsr chkcls		; need closing ")"
	ldy poker
	lda poker+1
	rts

gtff5:	jmp getpin		; evaluate it
	
; prmrpt  checks for a repeated parameter.
;   entry   a contains parsts flag to check.
prmrpt:	and parsts		; and with parsts
	bne sner		; if bit previously set
	rts

; prxrpt  checks for a repeated parameter.
;   entry   a contains parstx flag to check.
prxrpt:	and parstx		; and with parstx
	bne sner		; if bit previously set
	rts
; ******************************************* BUTES2 **********************************************
; cbm 2001 disk verb processors - author rsr 7-24-79
; b7bf tabfcb - table of fcb processing strings.

tabfcb:
tclr=*-tabfcb
	!byte <fclrm1		; clear
tcat=*-tabfcb
	!byte fcat-1		; catalog
topn=*-tabfcb
	!byte fopn-1		; dopen dsave dload
tapn=*-tabfcb
	!byte fapn-1		; append
thed=*-tabfcb
	!byte fhed-1		; header
tcoll=*-tabfcb
	!byte fcoll-1		; collect
tbak=*-tabfcb
	!byte fbak-1		; backup
tcopy=*-tabfcb
	!byte fcopy-1		; copy
tconc=*-tabfcb
	!byte fconc-1		; concat
tren=*-tabfcb
	!byte fren-1		; rename
tscr=*-tabfcb
	!byte fscr-1		; scratch
trec=*-tabfcb
	!byte frec-1		; record

xsca =$c2		; send dossca
xid =$d0		; sends disk id
xd1 =$d1		; sends dosds1
xd2 =$d2		; sends dosds2
xrec =$e0		; sends s for seq or dosrcl
xwrt =$e1		; sends w or l
xrcl =$e2		; send low ((poker))
xfat =$f0		; sends "@" if specified
xfn1 =$f1		; sends filename1
xfn2 =$f2		; sends filename2

; b7cb tabld - token table definitions

tabld				; used to build disk command strings
fclr =*-tabld
fclrm1 =fclr-1
	!byte 'i',xd1
fcat =*-tabld
	!byte '$',xd1,':',xfn1

fopn =*-tabld
	!byte xfat,xd1,':',xfn1,',',xwrt,',',xrec

fconc =*-tabld
	!byte 'c',xd2,':',xfn2,'=',xd2,':',xfn2,','
fapn =*-tabld
	!byte xd1,':',xfn1,',','a'

fhed =*-tabld
	!byte 'n',xd1,':',xfn1,',',xid

fcoll =*-tabld
	!byte 'v',xd1

fbak =*-tabld
	!byte 'd',xd2,'=',xd1

fcopy =*-tabld
	!byte 'c',xd2,':',xfn2,'=',xd1,':',xfn1

fren =*-tabld
	!byte 'r',xd1,':',xfn2,'=',xd1,':',xfn1

fscr =*-tabld
	!byte 's',xd1,':',xfn1

frec =*-tabld
	!byte 'p',xsca,xrcl,xrec
; -------------------------------------------------------------------------------------------------
; b80b send parameters to device
;   entry  a number of bytes in format.
;   y --> tabld entry.

sav20:	jsr chk2
	ldy #topn		; table offset
sav21:	lda #4			; length

sendp:	sta xcnt		; save number of string bytes
	lda tabfcb,y		; get pointer into tabld
	pha
	jsr oldclr		; clear old status

	ldx #0

sdp1:	pla
	dec xcnt
	bmi tranr
	tay
	iny			; move down table
	tya
	pha
	lda tabld,y		; get next entry
	bpl sdp5		; if not escape code
	cmp #xsca		; if not secondary address
	beq rsca
	cmp #xid
	beq rid			; if disk id
	cmp #xrcl
	beq rdcn		; if record number
	cmp #xwrt
	beq rwrt		; if w or l
	cmp #xfat
	beq rfat		; if "@" symbol request
	cmp #xfn1
	beq rsfn		; if filename 1
	cmp #xfn2
	beq gordfn		; if filename 2
	cmp #xrec
	bne sdp2		; if not record type
	lda dosrcl		; get rec #
	bne sdp5		; always branch
sdp2:	cmp #xd1
	bne sdp3		; if not drive 1
	lda dosds1
	bpl sdp4		; always branch
sdp3:	cmp #xd2
	bne sdp1		; if not drive 2, continue
	lda dosds2
sdp4:	ora #'0' 		; change # to ascii

sdp5:	sta dosstr,x		; else into buffer
	inx
	bne sdp1		; always

gordfn:	beq rdfn

tranr:	txa			; length to a
	pha
	ldx #<dosstr		; set filename
	ldy #>dosstr
	stx highds		;  set up vector for filename
	sty highds+1
	ldy #sysbnk		; filename is in system bank
	sty highds+2
	jsr sav3
	pla
	rts

rsca:	lda dossa		; secondary address (record)
	bne sdp5		; always

rfat:	bit parsts
	bmi rfata
	bpl sdp1		; if @ not encountered
rfata:	lda #'@'
	bne sdp5		; always

; id subroutine
rid:	lda dosdid		; include id
	sta dosstr,x
	inx
	lda dosdid+1
	bne sdp5		; always

rwrt:	lda dosrcl		; chk for l or w
	beq rwrt1		; zero then write
	lda #'l'
	bne sdp5		; always

rwrt1:	lda #'s'		; send w,s
	sta dosrcl
	lda #'w'
	bne sdp5		; always

; move record number
rdcn:	lda poker
	sta dosstr,x
	lda poker+1
	inx
	bne sdp5		; always

; move file names.
rsfn:	lda dosf1a
	sta index1
	lda dosf1a+1
	sta index1+1
	lda dosf1b
	ldy dosf1l
	beq rdrt0		; if null string
	bne xrfn		; always

rdfn:	lda dosf2a
	sta index1
	lda dosf2a+1
	sta index1+1
	lda dosf2b
	ldy dosf2l
	beq rdrt0		; if null string

xrfn:	sta i6509		; set indirection bank
	sty count
	ldy #0			; move name to dosstr
rdmov:	lda (index1),y
	sta dosstr,x
	inx
	iny
	cpy count
	bne rdmov		; if move not complete
	!byte $24		; hop
rdrt0:	dex			; case cdd=sd

rdrt1:	jsr maptxt		; restore indir bank
	jmp sdp1		; get next symbol
; -------------------------------------------------------------------------------------------------
; b8f3 syntax checker
;   routines for dos.write

chk1:	and #$e6		; for header,dload,scrtch
	beq chk2		; chk opt parms
chker1:	jmp snerr		; -> syntax error, ready

chk2:	lda parsts		; for dsave
	and #1
	cmp #1			; chk req'd parms
	bne chker1		; error if 1 missing
	lda parsts		; reload for return
	rts

chk3:	and #$e7		; for colect
	bne chker1		; chk opt parms
	rts

chk4:	and #$c4		; for copy,concat
	bne chker1		; chk opt parms
	lda parsts
chk5:	and #3			; for rename
	cmp #3			; chk req'd parms
	bne chker1
	lda parsts		; reload for return
	rts

chk6:	and #5			; for append,dopen
	cmp #5			; chk req'd parms
	bne chker1
	lda parsts		; reload for rts
	rts
; -------------------------------------------------------------------------------------------------
; b922 error on channel read

errchl:	lda #0			; no filename
	jsr setnam
	ldy #$6f		; .y=sa
	jsr ochanl		; open special channel
	ldx #doslfn		; make it the input channel
	jsr chkin
	ldy #$ff		; for offset
	jsr mapstr

loop1:	iny
	jsr basin
	cmp #cr			; check for end
	beq errend
	sta (dsdesc+1),y
	cpy #39
	bne loop1
errend lda #00
	sta (dsdesc+1),y
	lda #40			; get 40 char str
	sta dsdesc		; we have 40 chrs
	jsr maptxt
	jsr clrch
	lda #doslfn		; close channel and restore default chnls
	clc
	jsr tclose
	jmp dcat0		; restore default channel ...

; r-u-sure subroutine
rusure:	jsr tstdir		; chk for direct
	bne ansyes		; z clr=not direct
	ldx #msg30
	jsr msg			; prompt user
	jsr clrch		; clear channel for basin
	jsr basin		; next char
	cmp #'y'
	bne ansno		; if 1st <> 'y'
	jsr basin		; next chr
	cmp #cr
	beq ansyes		; if short form of yes (y,cr)
	cmp #'e'
	bne ansno		; if not 'e'
	jsr basin
	cmp #'s'
	bne ansno		; if not 's'
	jsr basin
	cmp #cr
	beq ansyes		; if 'yes',cr

; if not yes, input until cr received
ansno:	cmp #cr
	sec			; carry set =no&direct
	beq ansbye		; if cr received, exit
	jsr basin
	bne ansno		; continue to ignore

; here if answer 'yes'
ansyes:	clc			; carry clr =not direct
ansbye:	rts

; oldclr subroutine
;   clears ds$: set string length to zero.
;   clears st
oldclr:	lda #0
	sta dsdesc		; kill ds$
	clc
	jmp storst		; kill st

sav77:	jsr sav13
	sta dosf1l
	lda index1		; save address of string
	ldy index1+1
	sta dosf1a
	sty dosf1a+1
	ldy index1+2		;  ...and its bank#
	sty dosf1b
	rts
; -------------------------------------------------------------------------------------------------
; b9b2 parser for load,save and verify verbs
;   (file name option)
;   (opt device #) dflt=1
;   (eot cmd) dflt=0=no

plsv:	ldx #0
	stx dosf1l		; set file name length to zero
	stx dossa		; set secondary address to zero
	stx dosla		; clear logical address
	ldx #1			; default device
	stx dosfa		; set physical address to 8 (disk)

	jsr chrgot
	beq plsvx		; if no paramters
	jsr sav77

	jsr plsv27
	stx dosfa		; save device channel

	jsr plsv27
	stx dossa		; set secondary address

plsvx:	lda dosf1a
	ldx dosf1a+1
	ldy dosf1b
	sta highds		; set up vector to filename
	stx highds+1
	sty highds+2
	lda dosf1l		; .a=filename length
sav3:	ldx #<highds		; page 0 addr of vector
	jsr setnam
	lda dosla		; set logical file info
	ldx dosfa
	ldy dossa
	jmp setlfs

plsv27:	jsr chrgot
	beq plsvx
	jmp copg

plsv30:	jsr chkcom
plsv32:	jsr chrgot
	bne plsrts		; if not end of statement
	jmp snerr		; -> syntax error, ready

; routine to test if variable is in basic.
;   entry:  (facmo) = address of variable.
;   exit:  carry clear if variable is in basic.
;   carry set if variable not in basic.
tstrom:	lda facmo+2		; check bank#s
	cmp #sysbnk
	bne xit			; not in basic...
	clc
	lda #<bentry		; bentry-ptr-1<=0?
	sbc facmo
	lda #>bentry
	sbc facmo+1
plsrts:	rts

xit:	sec
	rts

flpint:	jsr ayint
	lda facmo
	ldy faclo
	rts
; -------------------------------------------------------------------------------------------------
; 'chrget routine'
;   chrget is called to get the next character from the text buffer pointed to by txtptr which is
;   incremented before the access is made.
;
;   chrgot is called to get the current character from the buffer pointed to by txtptr.

;   qnum is called to test for a ascii numeric character.
;   entry:  txtptr points to the buffer.
;   exit:  .a = character from buffer.
;          .y = 0
;   txtptr is updated (chrget).
;   c bit = 0, character in .a is numeric.
;         = 1, character in .a is non-numeric.
;   z bit = 0, the not end of statement.
;         = 1, end of statement "" or end of line.

; ba26 chrget
chrget jmp (ichrge)

; ba29 chrgot
chrgot jmp (ichrgo)

!if CC1{		; *** 64k version ***
nchrge:	inc txtptr		; increment text pointer
	bne nchrgo		; if no carry into msb
	inc txtptr+1

nchrgo:	ldy #0
	lda (txtptr),y
	cmp #$20		; span blanks
	beq chrget		; if blank character

; if the character in .a is numeric then the following code clears the carry bit.
qnum:	cmp #':'
	bcs qnrts
	sbc #$2f		; '0'-1
	sec
	sbc #$d0		; $100-'0'
qnrts:	rts

} else{			; *** not 64k version ***
nchrgo:	jsr chrmap
	jmp chrg20

nchrge:	jsr chrmap

chrg10:	inc txtptr		; increment text pointer
	bne chrg20		; if no carry into msb
	inc txtptr+1

chrg20:	ldy #0
	lda (txtptr),y
	cmp #$20		; span blanks
	beq chrg10		; if blank character
	jsr qnum
	php
	pha
	lda tttemp
	sta i6509
	pla
	plp
	rts
;  if the character in .a is numeric then the following code clears the carry bit.
qnum:	cmp #':'
	bcs qnrts
	sbc #$2f		; '0'-1
	sec
	sbc #$d0		; $100-'0'
qnrts:	rts

chrmap:	lda i6509
	sta tttemp
	lda txtptr+2		; can't always assume txt bank
	sta i6509
	rts
}
; -------------------------------------------------------------------------------------------------
; ba64 'indirect register routines'
;   load indirect through .y, using index1 or index2 as pointer.
;   used to read from system memory bank
;   exit:    .a

ldi1y:	lda #0
	ora (index1),y
	rts

; bank mapping routines
mapdst:	pha			; i6509:=dsctmp+3
	lda dsctmp+3
	bpl map001		;  always

mapdsp:	pha			; i6509:=dscpnt+2
	lda dscpnt+2
	bpl map001

mapinx:	pha			; i6509:=index+2
	lda index+2
	bpl map001

mapsys:	pha			; i6509:=system bank
	lda #sysbnk
	bpl map001

mapstr:	pha			; i6509:=string bank
	lda #strbnk
	bpl map001

mapary:	pha			; i6509:=array bank
	lda #arybnk
	bpl map001

mapvar:	pha			; i6509:=simp var bank
	lda #varbnk
	bpl map001

mapusr:
maptxt:	pha			; i6509:=text bank
	lda #txtbnk
map001:	sta i6509
	pla
	rts
; ******************************************** INIT ***********************************************
; 'init'
; ba63 initop - set variabales based upon top of memory.
;
;   for the 64k conversion, several variables have been allocated at the top of user memory and the
;   top of the string area is set below them. these areas are:
;   input buffer
;   ds$ string space
;   temporary descriptor stack
;   random seed
;   "zero" value
;   for all other versions, the input buffer is allocated at the top of the text bank and the other
;   items are put at the top of the string bank.
;   note, the highest usable location is assumed to be identical in the two segments; after
;   allocation here, the highest usable location in text is pointed to by buffpt and memtop in the
;   string bank.

initop:	jsr clall		; restore default i/o channels
	sec
	jsr topmem		; get top of ram
	stx highst		; save highest offset
	sty highst+1

	sec
	txa
	sbc #<bufsiz
	sta buffpt
!if CC1{		; *** 64k version ***
	tax
}
	tya
	sbc #>bufsiz
	sta buffpt+1
!if CC1{		; *** 64k version ***
	tay
}
	sec
	txa
	sbc #40+ptrsiz		; 40 char ds$ string
	sta dsdesc+1
	tax
	bcs itp04
	dey
itp04:	sty dsdesc+2

	sec			; 3 temp descriptors
	txa
	sbc #strsiz+strsiz+strsiz
	sta tempst
	tax
	bcs itp03
	dey
itp03:	sty tempst+1

	sec
	txa
	sbc #7			;  5 seed, 1 comma, 1 unused byte
	sta seedpt
	tax
	bcs itp02
	dey
itp02:	sty seedpt+1

	sec
	txa
	sbc #strsiz		; "zero" descriptor
	tax
	bcs itp06
	dey

itp06:	stx memtop		; top of str bank
	sty memtop+1

!if CC2+CC3+CC4{	; *** not 64k version ***
; store a non-zero byte preceding input buffer for input cmd
	ldy buffpt+1
	ldx buffpt
	bne itp07
	dey
itp07:	dex
	stx index1
	sty index1+1
	lda #tkdata
	ldy #0
	jsr maptxt
	sta (index1),y
}

; set some banks
	lda #strbnk
	sta i6509
	sta memtop+2
	sta dsdesc+3

	ldy #6
itp01:	lda rseed-1,y		; move seed to ram
	sta (seedpt),y
	dey
	bne itp01		; if move not complete

	tya			; zero out "zero", .a<-0
	ldx #strsiz
itp05:	sta (memtop),y
	iny
	dex
	bne itp05

	lda #40 		; do ds$ link bytes
	tay
	sta (dsdesc+1),y	; length
	iny
	lda #$ff		; garbage bytes
	sta (dsdesc+1),y
	iny
	sta (dsdesc+1),y

settop:	lda memtop		; reset top of strings
	ldy memtop+1
	sta fretop
	sty fretop+1
	rts

rseed:	!byte $80,$4f,$c7,$52,$58,','
; -------------------------------------------------------------------------------------------------
; bb27 init - this initializes the basic interpreter and should
;   be located where it will be wiped out in ram if code is all in ram.

init:	jsr initv		; init vectors
; always init0 after vector initialization
init0:	ldx #2			; init usr
init05:	lda bjmps,x
	sta usrpok,x
	dex
	bpl init05
	sta jmper		; always a jmp op

; move small routines to page 0
	ldx #initl		; length of routine
init10:	lda initat-1,x
	sta ldaabs-1,x		; move to ram
	dex
	bne init10		; if move not complete

	stx bits		; clear cells
	stx channl
	stx dsdesc
	stx dolu
	stx temppt
	dex
	stx lastpt
	stx lastpt+1

; set pointers to bottom of dynamic areas. (only for areas which start in a new bank.
; bottom and top limits will be the same in each bank.)
!if CC4{		; *** 256k version ***
	inx
	stx vartab
	ldx #$80		; fixed lower limit of $8000
	stx vartab+1
}
	sec			; get bottom of memory
	jsr membot

!if CC4{		; *** 256k version ***
	stx strend
	sty strend+1
}
!if CC3+CC4{		; *** 192k+256k version ***
	stx arytab		; 192k, 256k versions
	sty arytab+1
}
!if CC2+CC3{		; *** 128k+192k version ***
	stx vartab		; 128k, 192k versions
	sty vartab+1
}
	stx txttab		; save for text entry
	sty txttab+1
	jsr initop

; set text pointer and output signon message
	jsr maptxt
	ldy #0
	tya
	sta (txttab),y
	inc txttab
	bne init20
	inc txttab+1

init20:	ldx #asigon
	jsr msg			; output cbm sign-on

	jsr scrtch		; set variables
	ldx #<warm 		; fix for bob russell
	ldy #>warm
	jsr $ff6f
	cli
	jmp ready		; indicate ready, and start
; -------------------------------------------------------------------------------------------------
; bb81 signon

signon:
	!scr clrscr,"*** COMMODORE BASIC "
!if CC1{				; *** 64k version ***
	!scr "64"
}
!if CC2{				; *** 128k version ***
	!scr "128"
}
!if CC3{				; *** 192k version ***
	!scr "192"
}
!if CC4{				; *** 256k version ***
	!scr "256"
}
!scr ", V4.0 ***",cr,cr,0

bvtrs:	!word nerror,nmain,ncrnch,nqplop,ngone
	!word neval,nfrmev,nchrgo,nchrge,flpint,givayf

initv:	ldx #initv-bvtrs-1		; init vectors

initv5:	lda bvtrs,x
	sta ierror,x
	dex
	bpl initv5
	rts
; -------------------------------------------------------------------------------------------------
; bbc8 initat
;   this code is moved to page 0 ram during initialization.
;   this code gets altered (ldaadr, staadr) throughout execution. it is very fast this way.

initat:
	lda $ffff
	rts
initl =*-initat		; length of move
; -------------------------------------------------------------------------------------------------
; bbcc warm entry point
;   do some i/o initialization

warm:	sei			; disable interrupts
	jsr ioinit
	jsr clall
	jsr cint		; screen init
	jsr maptxt
	cli			; enable ints
	jmp ready
; ******************************************* SYSCAL **********************************************
; bbdd 'interface system calls.'

readst:	sec

storst:	jmp krdst		; return i/o status byte

open:	clc
opn10:	jsr kopen		; open logical file
	bcs ioerr
	rts

getin:	jsr kgetin		; get a byte
	bcs ioerr
	rts

basin:	jsr kbasin		; get a byte
	bcs ioerr
	rts

bsout:	jsr kbsout		; send a byte
	bcs ioerr
	rts

chkin:	jsr kchkin		; open channel in
	bcs ioerr
	rts

chkout:	jsr kchout		; open   -     out
	bcs ioerr
	rts

load:	jsr kload		; load from file
	bcs ioerr
	rts

save:	jsr ksave		; save to    -
	bcs ioerr
	rts

close:	sec
tclose:	jmp kclose

clall:	clc			; c-clr => close 'em all
	jmp kclall		; close all files

; ioerr - .a = error number
;   cy = 1
;   print error message and go to ready.
ioerr:	clc
	rol
	pha
	lda #doslfn		; close cmd channel in case
	clc
	jsr tclose
	pla
	tax
	jmp error
endprg:
; -------------------------------------------------------------------------------------------------
; additional revision 04a patches
!if PATCH4A{
!if CC2{
	!byte $00
}
patch4a3:			; entry from garba2
	jsr slr1
	beq +
	jmp patch4a3x1
+	jmp patch4a3x2

patch4a4:			; entry from fa
	jsr slr1
	beq +
	jmp patch4a4x1
+	jmp patch4a4x2

patch4a5:			; entry from slr1
	pha
	clc
	adc lowds
	sta lowds
	bcc +
	inc lowds+1
+	pla
	rts
!if CC4{
	!byte $ff
patch4a2:			; entry from swaplp
	jsr mldexp
	rts
}
patch4a1:			; entry from inputn
tblx	= $ca
scbot	= $dd
	lda scbot
	pha
	lda tblx
	sta scbot
	jsr notqti
	pla
	sta scbot
	rts
!if CC4=0{
patch4a2:			; entry from swaplp
	jsr mldexp
	rts
}
!if CC4{
*=$bbe0
	!byte $08		; extra checksum byte Basic 256 revision 04a
}
} else {
!if CC2{
	!byte $b5		; checksum byte Basic128 revision 02b
}
!if CC4{
	!byte $ce		; checksum byte Basic256 revision 03
}
}
; -------------------------------------------------------------------------------------------------
; interface jump vectors.
*=vecorg

ioinit	*=*+3		; i/o initialization
cint	*=*+3		; screen initialization
alloc	*=*+3		; allocate routine
vector	*=*+3		; read/set i/o vectors
krestr	*=*+3		; restore i/o vectors
lkupsa	*=*+3		; secondary to physical map
lkupla	*=*+3		; logical to physical map
setmsg	*=*+3		; control os messages
second	*=*+3		; send sa after listen
tksa	*=*+3		; send sa after talk
topmem	*=*+3		; read/set top of memory
membot	*=*+3		; read/set bottom of memory
kscnky	*=*+3		; scan keyboard
ksetmo	*=*+3		; set timeout in ieee
acptr	*=*+3		; hand shake ieee byte in
ciout	*=*+3		; hand shake ieee byte out
untlk	*=*+3		; send untalk out
unlsn	*=*+3		; send unlisten out
listn	*=*+3		; send listen out
talk	*=*+3		; send talk out

krdst	*=*+3		; return i/o status byte
setlfs	*=*+3		; set la, fa and sa
setnam	*=*+3		; set length and filename adr
kopen	*=*+3		; open logical file
kclose	*=*+3		; close  -      -
kchkin	*=*+3		; open channel in
kchout	*=*+3		; open   -     out

clrch	*=*+3		; close i/o channel
kbasin	*=*+3		; input from  -
kbsout	*=*+3		; output -    -
kload	*=*+3		; load from file
ksave	*=*+3		; save to    -
settim	*=*+3		; set internal clock
rdtim	*=*+3		; read   -      -
kstop	*=*+3		; scan stop key (break)
kgetin	*=*+3		; get char from queue
kclall	*=*+3		; close all files
udtim	*=*+3		; increment clock
scrorg	*=*+3		; return screen origin
plot	*=*+3		; read/set .x,.y coords
iobase	*=*+3		; return base address of i/o
; -------------------------------------------------------------------------------------------------
*=$bfff
	!byte $ff