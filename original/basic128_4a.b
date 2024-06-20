; disassembled by DASM6502a v.3.1 by Marat Fayzullin
; modified by Vossi 02/2019
!cpu 6502
*= $8000
	jmp lbb27
	jmp lbbcc
	!byte $c3
	!byte $c2
	cmp $2038
	tsx
	stx $d0,y
	stx $1b,y
	ldx #$55
	lda #$66
	dey
	ldy $73bb,x
	lda #$c8
	!byte $89
	!byte $5a
	!byte $87
	bit $5799
	!byte $87
	!byte $87
	sty lbb2a
	!byte $ef
	!byte $80
	lda #$8b
	!byte $93
	txa
	ora $8b
	dec $4a8c,x
	!byte $8f
	adc $8f
	!byte $0b
	sta ($e9),y
	!byte $8f
	!byte $89
	sta l8c83
	asl $8c
	eor ($8c,x)
	sei
	!byte $8b
	bit $8c
	!byte $b7
	sty l8c76
l8047:	!byte $a7
	!byte $8b
	rol
	sta l9151
	!byte $c7
	sta ($1a),y
	!byte $92
	!byte $bb
	sta ($15),y
	sta ($45),y
	sta ($79),y
	stx l8e9c
	inx
	!byte $8b
	sty $4489
	txa
	!byte $7f
	stx l90e6
	!byte $42
	!byte $92
	stx $92,y
	!byte $14
	!byte $8f
	plp
	txa
	!byte $7b
	sty l9545
	jmp (la893)
	!byte $93
	sta $2694,x
	sty $12,x
	sta $5f,x
	sta $29,x
	sta $7d,x
	!byte $93
	!byte $c2
	!byte $93
	cmp la093
	!byte $92
	eor ($95),y
	!byte $63
	sty $a0,x
	!byte $92
	ora #$95
	cmp $0d93,x
	sty $eb,x
	!byte $93
	ror l9c91,x
	!byte $af
	ror $8c,x
	ora $8d,x
	!byte $c3
	sta l8e23
	!byte $bf
	!byte $a7
	bpl l8047
	lda ($a2),y
	!byte $2f
	ldx #$02
	brk
	sbc $9c,x
	!byte $33
	sta la537,x
	eor $caa6,y
	!byte $9f
	!byte $b3
	lda $a6
	ldx $ad
	ldx $f8
	ldx $91
	!byte $a7
	!byte $07
	!byte $9e
	stx $dbab
	!byte $a7
	ldx l9dab
	!byte $ab
	cmp ($aa),y
	!byte $eb
	tax
	!byte $22
	!byte $ab
	!byte $42
	!byte $ab
	adc l9e4c,y
	adc l9e2f,y
	!byte $7b
	asl
	ldy #$7b
	inx
	ldy #$7f
	rti
	lda $50
	adc $4698
	ror
	tya
	adc la579,x
	!byte $5a
	!byte $f7
	stx $64,y
	!byte $a7
	tya
	eor $4e
	cpy $46
	!byte $4f
	!byte $d2
	lsr $5845
	!byte $d4
	!byte $44
	eor ($54,x)
	cmp ($49,x)
	lsr $5550
	!byte $54
	!byte $a3
	eor #$4e
	bvc l815c
	!byte $d4
	!byte $44
	eor #$cd
	!byte $52
	eor $41
	cpy $4c
	eor $d4
	!byte $47
	!byte $4f
	!byte $54
	!byte $cf
	!byte $52
	eor $ce,x
	eor #$c6
	!byte $52
	eor $53
	!byte $54
	!byte $4f
	!byte $52
	cmp $47
	!byte $4f
	!byte $53
	eor $c2,x
	!byte $52
	eor $54
	eor $52,x
	dec $4552
	cmp $5453
	!byte $4f
	bne l8184
	dec $4157
	eor #$d4
	jmp $414f
	cpy $53
	eor ($56,x)
	cmp $56
	eor $52
	eor #$46
	cmp $4544,y
	dec $50
	!byte $4f
	!byte $4b
	cmp $50
	!byte $52
	eor #$4e
	!byte $54
	!byte $a3
	bvc l81a9
	eor #$4e
	!byte $d4
	!byte $43
	!byte $4f
l815c:	lsr $4cd4
	eor #$53
	!byte $d4
	!byte $43
	jmp $43d2
	eor $53c4
	eor $4fd3,y
	bvc l81b3
	dec $4c43
	!byte $4f
	!byte $53
	cmp $47
	eor $d4
	lsr $d745
	!byte $54
	eor ($42,x)
	tay
	!byte $54
	!byte $cf
	lsr $ce
	!byte $53
	bvc l81c8
	tay
	!byte $54
	pha
	eor $ce
	lsr $d44f
	!byte $53
	!byte $54
	eor $d0
	!byte $ab
	lda lafaa
	dec $4e41,x
	cpy $4f
	!byte $d2
	ldx lbcbd,y
	!byte $53
	!byte $47
	dec $4e49
	!byte $d4
	eor ($42,x)
	!byte $d3
	eor $53,x
l81a9:	!byte $d2
	lsr $52
	cmp $50
	!byte $4f
	!byte $d3
	!byte $53
	eor ($d2),y
l81b3:	!byte $52
	lsr $4cc4
	!byte $4f
	!byte $c7
	eor $58
	bne l8200
	!byte $4f
	!byte $d3
	!byte $53
	eor #$ce
	!byte $54
	eor ($ce,x)
	eor ($54,x)
	dec $4550
	eor $cb
	jmp $ce45
	!byte $53
	!byte $54
	!byte $52
	ldy $56
	eor ($cc,x)
	eor ($53,x)
	!byte $c3
	!byte $43
	pha
	!byte $52
	ldy $4c
	eor $46
	!byte $54
	ldy $52
	eor #$47
	pha
	!byte $54
	ldy $4d
	eor #$44
	ldy $47
	!byte $cf
	!byte $43
	!byte $4f
	lsr $4143
	!byte $d4
	!byte $44
l81f5:	!byte $4f
	bvc l823d
	dec $4344
	jmp $534f
	cmp $52
l8200:	eor $43
	!byte $4f
	!byte $52
	cpy $48
	eor $41
	!byte $44
	eor $d2
	!byte $43
	!byte $4f
	jmp $454c
	!byte $43
	!byte $d4
	!byte $42
	eor ($43,x)
	!byte $4b
	eor $d0,x
	!byte $43
	!byte $4f
	bvc l81f5
	eor ($50,x)
	bvc l8265
	lsr $44c4
	!byte $53
	eor ($56,x)
	cmp $44
	jmp $414f
	cpy $43
	eor ($54,x)
	eor ($4c,x)
	!byte $4f
	!byte $c7
	!byte $52
	eor $4e
	eor ($4d,x)
	cmp $53
	!byte $43
	!byte $52
	eor ($54,x)
	!byte $43
	iny
	!byte $44
	eor #$52
	eor $43
	!byte $54
	!byte $4f
	!byte $52
	cmp $4344,y
	jmp $4145
	!byte $d2
	!byte $42
	eor ($4e,x)
	!byte $cb
	!byte $42
	jmp $414f
	cpy $42
	!byte $53
	eor ($56,x)
	cmp $4b
	eor $d9
	!byte $44
	eor $4c
	eor $54
l8265:	cmp $45
	jmp $c553
	!byte $54
	!byte $52
	eor ($d0,x)
	!byte $52
	eor $53
	eor $4d,x
	cmp $44
	eor #$53
	bvc l82c8
	!byte $53
	cmp $50
	eor $44,x
	eor $c6
	eor $53,x
	eor #$4e
	!byte $c7
	eor $52
	!byte $52
	ldy $49
	lsr $5453
	!byte $d2
	brk
	!byte $e7
	!byte $82
	sbc $0882,y
	!byte $83
	!byte $12
	!byte $83
	jsr $2f83
	!byte $83
	!byte $42
	!byte $83
	eor ($83),y
	adc ($83,x)
	!byte $73
	!byte $83
	!byte $89
	!byte $83
	sta $de83,y
	sty $d9
	sty $e7
	sty $ee
	sty $fd
	sty $00
	!byte $02
	asl l8185
	!byte $bb
	lda $83
	ldx $83,y
	!byte $c3
	!byte $83
	cld
	!byte $83
	cpx $83
	sbc $83,x
	inc $0c83,x
	sty $20
l82c8:	sty $2e
	sty $3c
	sty $4d
	sty $5c
	sty $6a
	sty $7a
	sty $84
	sty $98
	sty $a8
	sty $bb
	sty $c9
	sty $14
	sta $2d
	sta $3e
	sta $21
	sta $53
	!byte $54
	!byte $4f
	bvc l830c
	!byte $4b
	eor $59
	jsr $4544
	!byte $54
	eor $43
	!byte $54
	eor $44
	brk
	!byte $54
	!byte $4f
	!byte $4f
	jsr $414d
	lsr $2059
	lsr $49
	jmp $5345
	brk
	lsr $49
	jmp $2045
	!byte $4f
	bvc l8355
	lsr $4600
	eor #$4c
	eor $20
	lsr $544f
	jsr $504f
	eor $4e
	brk
	lsr $49
	jmp $2045
	lsr $544f
	jsr $4f46
	eor $4e,x
	!byte $44
	brk
	!byte $44
	eor $56
	eor #$43
	eor $20
	lsr $544f
	jsr $5250
	eor $53
	eor $4e
	!byte $54
	brk
	lsr $544f
	jsr $4e49
	bvc l839f
	!byte $54
	jsr $4946
	jmp $0045
	lsr $544f
	jsr $554f
	!byte $54
	bvc l83af
	!byte $54
	jsr $4946
	jmp $0045
	eor $5349
	!byte $53
	eor #$4e
	!byte $47
	jsr $4946
	jmp $2045
	lsr $4d41
	eor $00
	eor #$4c
	jmp $4745
	eor ($4c,x)
	jsr $4544
	lsr $49,x
	!byte $43
	eor $20
	lsr $4d55
	!byte $42
	eor $52
	brk
	ora $5241
	eor $20
	eor $554f,y
	jsr $5553
	!byte $52
	eor $20
	!byte $3f
	brk
	ora $4142
	!byte $44
	jsr $4944
	!byte $53
	!byte $4b
	jsr $000d
	lsr $5845
	!byte $54
	jsr $4957
	!byte $54
	pha
	!byte $4f
l83af:	eor $54,x
	jsr $4f46
	!byte $52
	brk
	!byte $53
	eor $544e,y
	eor ($58,x)
	jsr $5245
	!byte $52
	!byte $4f
	!byte $52
	brk
	!byte $52
	eor $54
	eor $52,x
	lsr $5720
	eor #$54
	pha
	!byte $4f
	eor $54,x
	jsr $4f47
	!byte $53
	eor $42,x
	brk
	!byte $4f
	eor $54,x
	jsr $464f
	jsr $4144
	!byte $54
	eor ($00,x)
	eor #$4c
	jmp $4745
	eor ($4c,x)
	jsr $5551
	eor ($4e,x)
	!byte $54
	eor #$54
	eor $4f00,y
	lsr $45,x
	!byte $52
	lsr $4c
	!byte $4f
	!byte $57
	brk
	!byte $4f
	eor $54,x
	jsr $464f
	jsr $454d
	eor $524f
	eor $5500,y
	lsr $4544
	lsr $49
	lsr $4445
	jsr $5453
	eor ($54,x)
	eor $4d
	eor $4e
	!byte $54
	brk
	!byte $42
	eor ($44,x)
	jsr $5553
	!byte $42
	!byte $53
	!byte $43
	!byte $52
	eor #$50
	!byte $54
	brk
	!byte $52
	eor $44
	eor #$4d
	!byte $27
	!byte $44
	jsr $5241
	!byte $52
	eor ($59,x)
	brk
	!byte $44
	eor #$56
	eor #$53
	eor #$4f
	lsr $4220
	eor $5a20,y
	eor $52
	!byte $4f
	brk
	eor #$4c
	jmp $4745
	eor ($4c,x)
	jsr $4944
	!byte $52
	eor $43
	!byte $54
	brk
	!byte $54
	eor $4550,y
	jsr $494d
	!byte $53
	eor $5441
	!byte $43
	pha
	brk
	!byte $53
	!byte $54
	!byte $52
	eor #$4e
	!byte $47
	jsr $4f54
	!byte $4f
	jsr $4f4c
	lsr $0047
	lsr $49
	jmp $2045
	!byte $44
	eor ($54,x)
	eor ($00,x)
	lsr $4f
	!byte $52
	eor $4c55
	eor ($20,x)
	!byte $54
	!byte $4f
	!byte $4f
	jsr $4f43
	eor $4c50
	eor $58
	brk
	!byte $43
	eor ($4e,x)
	lsr $544f
	jsr $4f43
	lsr $4954
	lsr $4555
	brk
	eor $4e,x
	!byte $44
	eor $46
	eor #$4e
	eor $44
	jsr $5546
	lsr $5443
	eor #$4f
	lsr $0d00
	!byte $3f
	jmp $414f
	!byte $44
	jsr $5245
	!byte $52
	!byte $4f
	!byte $52
	ora $0d00
	!byte $3f
	lsr $45,x
	!byte $52
	eor #$46
	eor $4520,y
	!byte $52
	!byte $52
	!byte $4f
	!byte $52
	ora $2000
	eor #$4e
	jsr $0d00
	!byte $52
	eor $41
	!byte $44
	eor $0d2e,y
	brk
	ora $5242
	eor $41
	!byte $4b
	brk
	eor $58
	!byte $54
	!byte $52
	eor ($20,x)
	eor #$47
	lsr $524f
	eor $44
	ora $5200
	eor $44
	!byte $4f
	jsr $5246
	!byte $4f
	eor $5320
	!byte $54
	eor ($52,x)
	!byte $54
	ora $4d00
	!byte $4f
	!byte $52
	eor $0d
	brk
	!byte $4f
	eor $54,x
	jsr $464f
	jsr $5453
	eor ($43,x)
	!byte $4b
	brk
	!byte $4f
	eor $54,x
	jsr $464f
	jsr $4554
	cli
	!byte $54
	brk
	eor $4e,x
	eor ($42,x)
	jmp $2045
	!byte $54
	!byte $4f
	jsr $4552
	!byte $53
	eor $4d,x
	eor $00
	eor $4e,x
	eor ($42,x)
	jmp $2045
	!byte $54
	!byte $4f
	jsr $4944
	!byte $53
	bvc l859c
	!byte $53
	eor $00
	ldx #$34
	jmp ($0280)
	stx $8f
	cpx #$36
	beq l8592
	jsr l9d57
	beq l8592
	ldy $0297
	iny
	beq l8592
	dey
	sty $1c
	sty $029d
	ldy $0296
	sty $1b
	ldy #$ff
	sty $0297
	ldx #$01
l8578:	lda $42,x
	sta $0298,x
	lda $46,x
	sta $029a,x
	dex
	bpl l8578
	ldx $029c
	txs
	jsr lba8c
	jsr l8ca0
	jmp l8780
l8592:	lda $1a
	beq l859d
	jsr $ffcc
	lda #$00
	sta $1a
l859d:	jsr l8ec8
	jsr lb538
	ldx $8f
	jsr la3c3
	jsr l8a75
	jsr lba8c
	ldy $43
	cpy #$fa
	bcs l85c0
	ldx #$1a
	jsr la3c3
	lda $43
	ldx $42
	jsr la3b4
l85c0:	ldx #$18
	jsr la3c3
	lda #$80
	jsr $ff90
l85ca:	jmp ($0282)
	ldx #$ff
	stx $43
	stx $0298
	stx $0299
	stx $8f
	jsr l86e3
	sta $85
	sty $86
	stx $87
	jsr lba26
	tax
	beq l85ca
	bcc l85f3
	jsr l88bf
	jsr lba29
	jmp l8757
l85f3:	jsr l8d4e
	jsr l88bf
	sty $0e
	jsr l871f
	bcc l8647
	ldy #$01
	lda ($6d),y
	sta $23
	lda $2f
	sta $22
	lda $6e
	sta $26
	dey
	lda ($6d),y
	clc
	sbc $6d
	eor #$ff
	clc
	adc $2f
	sta $2f
	sta $25
	lda $30
	adc #$ff
	sta $30
	sbc $6e
	tax
	sec
	lda $6d
	sbc $2f
	tay
	bcs l8631
	inx
	dec $26
l8631:	clc
	adc $22
	bcc l8639
	dec $23
	clc
l8639:	lda ($22),y
	sta ($25),y
	iny
	bne l8639
	inc $23
	inc $26
	dex
	bne l8639
l8647:	jsr l8a47
	jsr l86a4
	ldy #$00
	lda ($85),y
	bne l8656
	jmp l85ca
l8656:	clc
	lda $2f
	ldy $30
	sta $67
	sty $68
	adc $0e
	bcc l8664
	iny
l8664:	clc
	adc #$04
	bcc l866a
	iny
l866a:	sta $64
	sty $65
	jsr l8815
	ldy #$00
	lda #$01
	sta ($6d),y
	iny
	sta ($6d),y
	iny
	lda $1b
	sta ($6d),y
	lda $1c
	iny
	sta ($6d),y
	iny
	tya
	clc
	adc $6d
	sta $6d
	bcc l868f
	inc $6e
l868f:	ldy $0e
	dey
l8692:	lda ($85),y
	sta ($6d),y
	dey
	dec $0e
	bne l8692
	jsr l86a4
	jsr l8a40
	jmp l85ca
	lda $2d
	ldy $2e
	sta $22
	sty $23
	clc
l86ad:	ldy #$00
	lda ($22),y
	bne l86b8
	iny
	lda ($22),y
	beq l86d4
l86b8:	ldy #$04
l86ba:	iny
	lda ($22),y
	bne l86ba
	iny
	tya
	adc $22
	tax
	ldy #$00
	sta ($22),y
	tya
	adc $23
	iny
	sta ($22),y
	stx $22
	sta $23
	bcc l86ad
l86d4:	clc
	lda $22
	ldy $23
	adc #$02
	bcc l86de
	iny
l86de:	sta $2f
	sty $30
	rts
	lda $88
	ldy $89
	ldx #$01
	sta $22
	sty $23
	stx $24
	ldy #$00
l86f1:	sty $0e
	jsr lbbee
	cmp #$0d
	beq l8706
	ldy $0e
	sta ($22),y
	iny
	cpy #$a1
	bcc l86f1
	jmp lb785
l8706:	ldy $0e
	lda #$00
	sta ($22),y
	lda $1a
	bne l8713
	jsr l8ec8
l8713:	ldy $23
	ldx $22
	bne l871a
	dey
l871a:	dex
	txa
	ldx #$01
	rts
	lda $2d
	ldx $2e
l8723:	sta $6d
	stx $6e
	ldy #$00
	lda ($6d),y
	bne l8732
	iny
	lda ($6d),y
	beq l873c
l8732:	ldy #$03
	lda ($6d),y
	cmp $1c
	beq l873e
	bcc l8747
l873c:	clc
l873d:	rts
l873e:	dey
	lda ($6d),y
	cmp $1b
	beq l873d
	bcs l873c
l8747:	ldy #$01
	lda ($6d),y
	tax
	dey
	lda ($6d),y
	bcc l8723
l8751:	jmp ($0288)
	jsr lba26
	jsr l87a8
	jsr $ffe1
	bne l877b
	sec
	jmp l8baf
	lda ($85),y
	bne l876f
	iny
	lda ($85),y
	bne l876f
l876c:	jmp l85c0
l876f:	ldy #$03
	lda ($85),y
	sta $42
	iny
	lda ($85),y
	sta $43
	rts
l877b:	jsr l9d57
	beq l878c
	lda $85
	ldy $86
	sta $46
	sty $47
	tsx
	stx $029c
l878c:	ldy #$00
	lda ($85),y
	bne l87d1
	jsr l9d57
	beq l876c
	ldy #$01
	jsr l8763
	tya
	clc
	adc $85
	sta $85
	bcc l8751
	inc $86
	bne l8751
	beq l8814
	cmp #$ff
	beq l87d8
	sec
	sbc #$80
	bcc l87ce
	cmp #$23
	bcc l87c1
	cmp #$4b
	bcc l87d8
	cmp #$67
	bcs l87d8
	sbc #$27
l87c1:	asl
	tay
	lda l8028,y
	pha
	lda l8027,y
	pha
	jmp lba26
l87ce:	jmp l8d8a
l87d1:	cmp #$3a
	bne l87d8
	jmp l8751
l87d8:	jmp l974f
	tsx
	inx
	inx
	inx
	inx
l87e0:	lda $0101,x
	cmp #$81
	bne l8814
	lda $56
	bpl l87fa
	lda $0102,x
	sta $54
	lda $0103,x
	sta $55
	lda $0104,x
	sta $56
l87fa:	cmp $0104,x
	bne l880d
	lda $55
	cmp $0103,x
	bne l880d
	lda $54
	cmp $0102,x
	beq l8814
l880d:	txa
	clc
	adc #$13
	tax
	bne l87e0
l8814:	rts
	jsr l88b0
	sta $2f
	sty $30
	bcc l8828
	jsr l8877
	sta $39
	sty $3a
	jsr lba87
l8828:	sec
	lda $67
	sbc $6d
	sta $22
	tay
	lda $68
	sbc $6e
	tax
	inx
	tya
	beq l885c
	lda $67
	sec
	sbc $22
	sta $67
	bcs l8845
	dec $68
	sec
l8845:	lda $64
	sbc $22
	sta $64
	bcs l8855
	dec $65
	bcc l8855
l8851:	lda ($67),y
	sta ($64),y
l8855:	dey
	bne l8851
	lda ($67),y
	sta ($64),y
l885c:	dec $68
	dec $65
	dex
	bne l8855
	jmp lba8c
	asl
	adc #$34
	bcs l8872
	sta $22
	tsx
	cpx $22
	bcs l88af
l8872:	ldx #$50
	jmp l8552
	cpy $3c
	bcc l88af
	bne l8881
	cmp $3b
	bcc l88af
l8881:	pha
	ldx #$09
	tya
l8885:	pha
	lda $63,x
	dex
	bpl l8885
	jsr ladb5
	ldx #$f7
l8890:	pla
	sta $6d,x
	inx
	bmi l8890
	pla
	tay
	pla
	cpy $3c
	bcc l88af
	bne l88a3
	cmp $3b
	bcc l88af
l88a3:	jmp l8550
	jsr l992c
	sta $54
	sty $55
	stx $56
l88af:	rts
	cpy $89
	bcc l88af
	bne l88ba
	cmp $88
	bcc l88af
l88ba:	ldx #$56
	jmp l8552
	jmp ($0284)
	lda $85
	pha
	lda $86
	pha
l88c8:	jsr lba29
	jmp l88d1
l88ce:	jsr lba26
	bcc l88ce
	cmp #$00
	beq l8930
	cmp #$3a
	beq l88ce
	cmp #$3f
	bne l88e7
	lda #$99
	ldy #$00
	sta ($85),y
	beq l88ce
l88e7:	cmp #$80
	bcc l88f6
	cmp #$ff
	beq l88ce
	ldy #$01
	jsr l893f
	beq l88c8
l88f6:	cmp #$22
	bne l8907
l88fa:	jsr lba26
	cmp #$00
	beq l8930
	cmp #$22
	beq l88ce
	bne l88fa
l8907:	jsr l8957
	bcc l88ce
	cpy #$00
	beq l8913
	jsr l893f
l8913:	lda $0e
	ldy #$00
	sta ($85),y
	cmp #$8f
	beq l892a
	cmp #$83
	bne l88ce
	jsr lba26
	jsr l8cdf
	jmp l88c8
l892a:	jsr lba26
	jsr l8c77
l8930:	ldx $85
	pla
	sta $86
	pla
	sta $85
	sec
	txa
	sbc $85
	tay
	iny
	rts
	clc
	tya
	adc $85
	sta $22
	lda $86
	adc #$00
	sta $23
	ldy #$00
l894d:	lda ($22),y
	sta ($85),y
	iny
	cmp #$00
	bne l894d
	rts
	lda #$80
	ldy #$ef
	sta $23
	sty $22
	ldy #$00
	sty $0e
	dey
l8964:	iny
l8965:	lda ($85),y
	sec
	sbc ($22),y
	beq l8964
	cmp #$80
	beq l8988
l8970:	jsr lba64
	bmi l8978
	iny
	bne l8970
l8978:	iny
	inc $0e
	clc
	tya
	jsr lab19
	clc
	ldy #$00
	jsr lba64
	bne l8965
l8988:	ora $0e
	sta $0e
	rts
	jsr laff4
	bne l8993
	rts
l8993:	pla
	pla
	ldy #$01
	sty $13
	lda ($6d),y
	bne l89a2
	dey
	lda ($6d),y
	beq l89ee
l89a2:	ldy #$01
	jsr $ffe1
	bne l89ad
	clc
	jmp l8baf
l89ad:	jsr l8ec8
	iny
	lda ($6d),y
	tax
	iny
	lda ($6d),y
	cmp $1c
	bne l89bf
	cpx $1b
	beq l89c1
l89bf:	bcs l89ee
l89c1:	sty $54
	jsr la3b4
	lda #$20
l89c8:	ldy $54
	and #$7f
l89cc:	jsr lb53a
	cmp #$22
	bne l89d9
	lda $13
	eor #$ff
	sta $13
l89d9:	iny
	beq l89ee
	lda ($6d),y
	bne l89f1
	tay
	lda ($6d),y
	tax
	iny
	lda ($6d),y
	stx $6d
	sta $6e
	jmp l8995
l89ee:	jmp l85c0
l89f1:	jmp ($0286)
	bpl l89cc
	cmp #$ff
	beq l89cc
	bit $13
	bmi l89cc
	tax
	sty $54
	ldy #$80
	sty $23
	ldy #$ef
	sty $22
	ldy #$00
	asl
	beq l8a1f
l8a0e:	dex
	bpl l8a1e
l8a11:	inc $22
	bne l8a17
	inc $23
l8a17:	jsr lba64
	bpl l8a11
	bmi l8a0e
l8a1e:	iny
l8a1f:	jsr lba64
	bmi l89c8
	jsr lb53a
	bne l8a1e
	bne l8a8f
	lda #$00
	tay
	sta ($2d),y
	iny
	sta ($2d),y
	clc
	lda $2d
	adc #$02
	sta $2f
	lda $2e
	adc #$00
	sta $30
	jsr lb4b8
	lda #$00
	bne l8a8f
	jsr lbb18
	lda #$ff
	sta $0297
	ldx #$03
l8a51:	lda l8a90,x
	sta $0273,x
	dex
	bpl l8a51
	lda #$0f
	sta $0257
	lda #$00
	sta $16
	jsr lbc16
	lda $31
	ldy $32
	sta $39
	sty $3a
	sta $35
	sty $36
	jsr l8b97
	ldx #$00
	stx $1d
	pla
	tay
	pla
	ldx #$fe
	txs
	pha
	tya
	pha
	lda #$00
	sta $46
	sta $47
	sta $1a
	sta $0258
	sta $14
l8a8f:	rts
	jsr $2e2c
	bit $a9
	!byte $80
	sta $14
	jsr l8d8a
	jsr l87db
	bne l8aa5
	txa
	adc #$10
	tax
	txs
l8aa5:	pla
	pla
	lda #$09
	jsr l8866
	jsr l8ced
	clc
	tya
	adc $85
	pha
	lda $86
	adc #$00
	pha
	lda $43
	pha
	lda $42
	pha
	lda #$a4
	jsr l9732
	jsr lb504
	jsr lb501
	lda $76
	ora #$7f
	and $72
	sta $72
	lda #$dd
	ldy #$8a
	sta $22
	sty $23
	jmp l966d
	lda #$9c
	ldy #$9f
	jsr la166
	jsr lba29
	cmp #$a9
	bne l8af1
	jsr lba26
	jsr lb501
l8af1:	jsr la202
	jsr l965e
	lda $56
	pha
	lda $55
	pha
	lda $54
	pha
	lda #$81
	pha
	jmp l875a
	bne l8b0c
	ldx #$ff
	bmi l8b0f
l8b0c:	jsr l992c
l8b0f:	jsr l88a9
	jsr l87db
	beq l8b1c
	ldx #$28
	jmp l8552
l8b1c:	txs
	txa
	clc
	adc #$05
	pha
	adc #$06
	sta $25
	pla
	ldy #$01
	jsr la166
	tsx
	lda $010a,x
	sta $76
	lda $54
	ldy $55
	ldx $56
	jsr la05e
	jsr l9e4d
	jsr la19f
	ldy #$01
	jsr la234
	tsx
	sec
	sbc $010a,x
	beq l8b64
	lda $0110,x
	sta $42
	lda $0111,x
	sta $43
	lda $0113,x
	sta $85
	lda $0112,x
	sta $86
l8b61:	jmp l875a
l8b64:	txa
	adc #$12
	tax
	txs
	jsr lba29
	cmp #$2c
	bne l8b61
	jsr lba26
	jsr l8b0c
	jmp lb501
	beq l8b97
	jsr lb4e5
	sty $1b
	sta $1c
	jsr lba8c
	jsr l871f
	bcc l8ba5
	lda $6d
	sbc #$01
	sta $4b
	lda $6e
	sbc #$00
	sta $4c
	rts
l8b97:	sec
	lda $2d
	sbc #$01
	sta $4b
	lda $2e
	sbc #$00
	sta $4c
l8ba4:	rts
l8ba5:	jmp l8ccd
	bcs l8bab
	clc
l8bab:	bne l8c06
	beq l8bc3
	php
	ldy $0297
	iny
	beq l8bc0
l8bb6:	jsr $ffe1
	beq l8bb6
	ldx #$1c
	jmp l8552
l8bc0:	plp
	pha
	pha
l8bc3:	php
	jsr l9d57
	beq l8bd9
	lda $85
	ldy $86
	sta $46
	sty $47
	lda $42
	ldy $43
	sta $44
	sty $45
l8bd9:	plp
	pla
	pla
	bcc l8be6
	ldx #$1c
	jsr la3c3
	jmp l85ab
l8be6:	jmp l85c0
	bne l8c06
	ldy $47
	bne l8bf8
	lda $46
	bne l8bfa
	ldx #$48
	jmp l8552
l8bf8:	lda $46
l8bfa:	sta $85
	sty $86
	lda $44
	ldy $45
	sta $42
	sty $43
l8c06:	rts
	jsr l8c17
	jsr lba29
	bne l8c12
	jmp l8a40
l8c12:	jsr l8a47
	beq l8c39
	jsr l9d57
	bne l8ba4
	lda #$fe
	sta $43
	lda #$00
	jmp $ff90
	lda #$03
	jsr l8866
	lda $86
	pha
	lda $85
	pha
	lda $43
	pha
	lda $42
	pha
	lda #$8d
	pha
l8c39:	jsr lba29
	jsr l8c84
	jmp l875a
	jsr l95c1
	bit $11
	bpl l8c4c
	jsr la8e9
l8c4c:	jsr lba29
	cmp #$89
	beq l8c58
	lda #$a7
	jsr l9732
l8c58:	lda $71
	bne l8c6f
l8c5c:	jsr l8cdf
	ldy #$00
	lda ($85),y
	beq l8c77
	jsr lba26
	cmp #$e1
	bne l8c5c
	jsr lba26
l8c6f:	jsr lba29
	bcc l8c84
	jmp l87a8
l8c77:	jsr l8cf0
	beq l8ce2
	jsr lba29
	lda #$a4
	jsr l9732
l8c84:	jsr l8d4e
	jsr l8cf0
	sec
	lda $42
	sbc $1b
	lda $43
	sbc $1c
	bcs l8ca0
	tya
	sec
	adc $85
	ldx $86
	bcc l8ca4
	inx
	bcs l8ca4
l8ca0:	lda $2d
	ldx $2e
l8ca4:	jsr l8723
	bcc l8ccd
	lda $6d
	sbc #$01
	sta $85
	lda $6e
	sbc #$00
	sta $86
	jmp l8c17
	bne l8cec
	lda #$10
	sta $56
	lda #$ff
	sta $55
	jsr l87db
	txs
	cmp #$8d
	beq l8cd2
	ldx #$2c
	bit $36a2
	jmp l8552
l8cd2:	pla
	pla
	sta $42
	pla
	sta $43
	pla
	sta $85
	pla
	sta $86
	jsr l8ced
l8ce2:	tya
	clc
	adc $85
	sta $85
	bcc l8cec
	inc $86
l8cec:	rts
	ldx #$3a
	bit $00a2
	stx $0c
	ldy #$00
	sty $0d
l8cf8:	lda $0d
	ldx $0c
	sta $0c
	stx $0d
l8d00:	lda $87
	sta $01
	lda ($85),y
	beq l8d13
	cmp $0d
	beq l8d13
	iny
	cmp #$22
	bne l8d00
	beq l8cf8
l8d13:	jmp lba8c
	jsr l9d4a
	jsr lba29
	beq l8d25
	jsr lb4e5
	sty $0296
	bit $ffa9
	sta $0297
	rts
	jsr lb4d6
	pha
	cmp #$8d
	beq l8d3a
	cmp #$89
	beq l8d3a
l8d37:	jmp l974f
l8d3a:	dec $75
	bne l8d42
	pla
	jmp l87aa
l8d42:	jsr lba26
	jsr l8d4e
	cmp #$2c
	beq l8d3a
	pla
l8d4d:	rts
	ldx #$00
	stx $1b
	stx $1c
	bcs l8d4d
	sbc #$2f
	sta $0c
	lda $1c
	sta $22
	cmp #$19
	bcs l8d37
	lda $1b
	asl
	rol $22
	asl
	rol $22
	adc $1b
	sta $1b
	lda $22
	adc $1c
	sta $1c
	asl $1b
	rol $1c
	lda $1b
	adc $0c
	sta $1b
	bcc l8d82
	inc $1c
l8d82:	jsr lba26
	jmp l8d54
l8d88:	bne l8d37
	jsr l88a6
	lda #$b2
	jsr l9732
	lda $12
	pha
	lda $11
	pha
	jsr l95c1
	pla
	rol
	jsr lb507
	bne l8dc0
	pla
	bpl l8dbd
	jsr la1f2
	jsr l9b13
	lda $56
	sta $01
	ldy #$00
	lda $74
	sta ($54),y
	iny
	lda $75
	sta ($54),y
	jmp lba8c
l8dbd:	jmp la19f
l8dc0:	pla
	jmp la973
	jsr l9d4a
	ldx $0299
	inx
	beq l8e1f
	jsr lba29
	beq l8dff
	bcc l8df1
	cmp #$82
l8dd6:	bne l8d88
	jsr l8dff
	jsr lba8c
	ldy #$00
	lda ($85),y
	bne l8deb
	iny
	jsr l8763
	jsr l8ce2
l8deb:	jsr lba26
	jmp l8cdf
l8df1:	jsr lb4e5
	sta $1c
	jsr l8e0e
	jsr lba8c
	jmp l8ca0
l8dff:	ldx #$01
l8e01:	lda $0298,x
	sta $42,x
	lda $029a,x
	sta $85,x
	dex
	bpl l8e01
	ldx #$ff
	stx $0f
	stx $0298
	stx $0299
	ldx $029d
	stx $0297
	rts
l8e1f:	ldx #$52
	jmp l8552
	cmp #$81
	beq l8e2c
	cmp #$8d
	bne l8dd6
l8e2c:	sta $029f
	jsr l9d4a
	tsx
	inx
	inx
	txa
	tay
l8e37:	tya
	tax
	cpy #$ff
	beq l8e75
	lda $0101,x
	cmp #$81
	bne l8e4a
	txa
	adc #$12
	jmp l8e4e
l8e4a:	txa
	clc
	adc #$07
	bcs l8e75
	tay
	lda $0101,x
	cmp $029f
	bne l8e37
	beq l8e5e
l8e5b:	ldx $029e
l8e5e:	lda $0100,x
	sta $0100,y
	dey
	dex
	stx $029e
	tsx
	cpx $029e
	bne l8e5b
	tya
	tax
	txs
	jmp lba26
l8e75:	ldx #$54
	jmp l8552
	jsr l8e80
	jmp l8f59
	jsr lb4d6
	beq l8e88
	jsr l9730
l8e88:	php
	pha
	stx $0258
	jsr l9586
	sta $1a
	pla
	plp
	jmp l8e9d
l8e97:	jsr lb515
l8e9a:	jsr lba29
; print
	beq l8ec8
	cmp #$e6
	bne l8ea6
	jmp lb026
l8ea6:	beq l8ed9
	cmp #$a3
	beq l8eea
	cmp #$a6
	clc
	beq l8eea
	cmp #$2c
	beq l8eda

	cmp #$3b 	; ";"
	beq l8f0c
	jsr l95c1
	bit $11
	bmi l8e97
	jsr la3be
	jsr lb52e
	bne l8e9a
l8ec8:	lda #$0d
	jsr lb53a
	lda $0258
	bpl l8ed7
	lda #$0a
	jsr lb53a
l8ed7:	eor #$ff
l8ed9:	rts
l8eda:	sec
	jsr $fff0
	tya
	sec
l8ee0:	sbc #$0a
	bcs l8ee0
	eor #$ff
	adc #$01
	bne l8f02
l8eea:	php
	sec
	jsr $fff0
	sty $0255
	jsr lb4d3
	cmp #$29
	bne l8f12
	plp
	bcc l8f03
	txa
	sbc $0255
	bcc l8f0c
l8f02:	tax
l8f03:	inx
l8f04:	dex
	beq l8f0c
	jsr lb52e
	bne l8f04
l8f0c:	jsr lba26
	jmp l8ea6
l8f12:	jmp l974f
	jsr l9d4a
	jsr lba29
	cmp #$23
	bne l8f2a
	jsr lb4d3
	jsr l9730
	jsr l958c
	sta $1a
l8f2a:	lda #$01
	ldy $89
	ldx $88
	inx
	bne l8f34
	iny
l8f34:	stx $22
	sty $23
	sta $24
	ldy #$00
	tya
	sta ($22),y
	ldy $23
	lda #$40
	jsr l8ff3
	ldx $1a
	bne l8f5b
	rts
	jsr lb4d6
	jsr l9730
	jsr l958c
	sta $1a
	jsr lbc4b
	lda $1a
l8f5b:	jsr $ffcc
	ldx #$00
	stx $1a
	stx $0258
	rts
	cmp #$22
	bne l8f75
	jsr l96e7
	lda #$3b
	jsr l9732
	jsr lb515
l8f75:	jsr l9d4a
l8f78:	jsr l8fa8
	lda $1a
	beq l8f8c
	jsr lbbdd
	and #$03
	beq l8f8c
	jsr l8f59
	jmp l8cdf
l8f8c:	ldy #$00
	lda ($22),y
	beq l8f98
l8f92:	jsr l9e3c
	jmp l8ff1
l8f98:	lda $1a
	bne l8f9f
	jmp l8cdf
l8f9f:	jsr lbbdd
	and #$40
	beq l8f78
	bne l8f92
	lda $1a
	bne l8fb2
	jsr lb538
	jsr lb52e
l8fb2:	jmp l86e3
l8fb5:	jsr l8ced
	iny
	tax
	bne l8fda
	lda $87
	sta $01
	lda ($85),y
	bne l8fce
	iny
	lda ($85),y
	bne l8fcf
	ldx #$2e
	jmp l8552
l8fce:	iny
l8fcf:	iny
	lda ($85),y
	sta $49
	iny
	lda ($85),y
	iny
	sta $4a
l8fda:	jsr lba8c
	jsr l8ce2
	jsr lba29
	tax
	cpx #$83
	bne l8fb5
	beq l9039
	ldx $4b
	ldy $4c
	lda #$98
	bit $00a9
	sta $15
	stx $4d
	sty $4e
	jsr l88a6
	lda $85
	ldy $86
	sta $57
	sty $58
	ldx $4d
	ldy $4e
	stx $85
	sty $86
	jsr lba29
	bne l9039
	bit $15
	bvc l9028
	jsr lbbe8
	jsr l9e3c
	stx $22
	sty $23
	ldy #$01
	sta ($22),y
	ldy $23
	jmp l9035
l9028:	bmi l8fb5
	lda $1a
	bne l9031
	jsr lb538
l9031:	jsr l8fa8
	tax
	stx $85
	sty $86
l9039:	jsr lba26
	bit $11
	bpl l9077
	bit $15
	bvc l904d
	inx
	stx $85
	lda #$00
	sta $0c
	beq l9059
l904d:	sta $0c
	cmp #$22
	beq l905a
	lda #$3a
	sta $0c
	lda #$2c
l9059:	clc
l905a:	sta $0d
	jsr l906b
	jsr la827
	jsr labf3
	jsr la973
	jmp l907f
	lda $85
	ldy $86
	adc #$00
	bcc l9074
	iny
l9074:	ldx $87
	rts
l9077:	jsr la2d8
	lda $12
	jsr l8da3
	jsr lba29
	beq l9088
	cmp #$2c
	bne l90a3
l9088:	lda $85
	ldy $86
	sta $4d
	sty $4e
	lda $57
	ldy $58
	sta $85
	sty $86
	jsr lba29
	beq l90cb
	jsr l9730
	jmp l8ff9
l90a3:	lda $15
	beq l90b4
	bpl l90b1
	lda $49
	ldy $4a
	sta $42
	sty $43
l90b1:	jmp l974f
l90b4:	lda $1a
	beq l90bd
	ldx #$44
	jmp l8552
l90bd:	ldx #$20
	jsr la3c3
	lda $46
	ldy $47
	sta $85
	sty $86
	rts
l90cb:	lda $4d
	ldy $4e
	ldx $15
	bpl l90d8
	sta $4b
	sty $4c
l90d7:	rts
l90d8:	ldy #$00
	lda ($4d),y
	beq l90d7
	lda $1a
	bne l90d7
	ldx #$1e
	jmp la3c3
	jsr lb4e5
	lda $01
	pha
	lda $0257
	cmp #$0f
	beq l90ff
	ldx $1b
	ldy $1c
	jsr $ff6c
	pla
	sta $01
	rts
l90ff:	lda #$90
	pha
	lda #$fa
	pha
	jmp ($001b)
	rts
l9109:	jsr l9730
	tax
	jsr l9931
	jsr lba29
	bne l9109
	rts
	jsr l9d5c
	jsr l9d4a
	jsr l972d
	lda #$80
	sta $14
	jsr l992c
	jsr lb504
	jsr l972a
	lda #$b2
	jsr l9732
	lda $53
	pha
	lda $52
	pha
	lda $51
	pha
	lda $86
	pha
	lda $85
	pha
	jsr l8cdf
	jmp l9deb
	jsr lb4ca
	txa
	jsr l9175
	sta ($1b),y
	stx $01
	rts
	jsr lb4ca
	stx $0255
	ldx #$00
	jsr lba29
	beq l9162
	jsr lb4cd
l9162:	stx $0256
	jsr l9175
l9168:	lda ($1b),y
	eor $0256
	and $0255
	beq l9168
	stx $01
	rts
	ldx $01
	ldy $0257
	sty $01
	ldy #$00
	rts
	bne l9185
	ldy #$00
	beq l91ab
l9185:	jsr lb4d6
	txa
	bne l918e
l918b:	jmp l9ba7
l918e:	cmp #$15
	bcs l918b
	pha
	jsr l9730
	jsr l91b6
	sta $64
	lda $22
	ldx $23
	ldy $24
	sta $65
	stx $66
	sty $67
	pla
	tay
	lda #$64
l91ab:	jsr $ff75
	bcc l91b5
	ldx #$34
	jmp ($0280)
l91b5:	rts
	jsr l95c1
	jmp la8e6
	lda #$4e
	pha
	lda #$80
	jsr l9200
	beq l91e6
	pla
	rts
	lda #$00
	jsr l9200
	beq l91d8
	jsr l86a4
	jsr lb4b8
	jmp l8a72
l91d8:	lda $025b
	cmp #$01
	bne l91f9
	stx $2f
	sty $30
	lda #$4c
	pha
l91e6:	jsr lbbdd
	and #$10
	bne l91f1
	pla
	lda #$18
	pha
l91f1:	pla
	tax
l91f3:	jsr la3c3
	jmp l869b
l91f9:	ldx $56
	bne l91f3
	pha
	beq l9204
	pha
	jsr lb9b2
l9204:	jsr $ffe1
	beq l9204
	pla
	ora #$01
	ldx $2d
	ldy $2e
	jsr lbc06
	bcs l923e
	sta $025b
	jmp l9d57
	jsr lb9b2
	ldx $2d
	ldy $2e
	lda #$01
	stx $64
	sty $65
	sta $66
	ldx $2f
	ldy $30
	stx $67
	sty $68
	sta $69
	ldx #$64
	ldy #$67
	jsr lbc0c
	bcs l923e
	rts
l923e:	asl
	tax
	jmp l8552
	ldx #$00
	stx $8b
	stx $0210
	stx $0221
	inx
	stx $0220
	jsr lba04
	jsr lb4d6
	stx $021f
	jsr l9287
	stx $0220
	ldy #$00
	cpx #$03
	bcc l9267
	dey
l9267:	sty $0221
	jsr l9287
	stx $0221
	jsr lba29
	beq l927b
	jsr lba01
	jsr lb99c
l927b:	jsr lb9d6
	jsr $ffcc
	jsr lbbe1
	jmp l9350
	jsr lba29
	bne l9291
	pla
	pla
	jmp l927b
l9291:	jsr lba01
	jmp lb4d6
	jsr lba04
	jsr lb4d6
	txa
	jmp lbc12
	jsr lb547
	lda $8b
	and #$e6
	beq l92ad
	jmp l974f
l92ad:	ldy #$01
	ldx #$01
	lda $8b
	and #$11
	beq l92bd
	lsr
	bcc l92bc
	inx
	inx
l92bc:	inx
l92bd:	txa
	jsr lb812
	lda #$15
	sta $0f
	ldy #$60
	jsr l935b
	ldy #$03
l92cc:	sty $7b
	ldx #$0e
	jsr lbbfa
	jsr lbbee
	sta $7c
	jsr lbbdd
	bne l9348
	jsr lbbee
	sta $7d
	jsr lbbdd
	bne l9348
	ldy $7b
	dey
	bne l92cc
	jsr l9350
	ldx $7c
	lda $7d
	jsr la3b4
	lda #$20
	jsr lbbf4
l92fb:	jsr $ffcc
	ldx #$0e
	jsr lbbfa
	jsr lbbee
	pha
	jsr lbbdd
	bne l9347
	jsr l9350
	pla
	beq l9317
	jsr lbbf4
	bcc l92fb
l9317:	dec $0f
	lda #$0d
	jsr lbbf4
	jsr $ffcc
	jsr $ffe1
	beq l9348
	lda $0f
	bne l9343
	lda #$15
	sta $0f
	jsr l9d57
	bne l9343
	ldx $1a
	cpx #$00
	bne l9343
	ldx #$24
	jsr la3c3
l933e:	jsr lbbe8
	beq l933e
l9343:	ldy #$02
	bne l92cc
l9347:	pla
l9348:	jsr $ffcc
	lda #$0e
	jsr lbc12
	jsr $ffcc
	ldx $0258
	beq l93a3
	jmp lbc00
	ldx $0220
	bne l9362
	ldx #$08
l9362:	lda #$0e
	jsr $ffba
	jsr $ffcc
	jmp lbbe1
	lda #$22
	jsr l938e
	ldy #$02
	ldx #$04
	bit $8b
	bvc l9387
	ldx #$08
	bne l9387
	lda #$e2
	jsr l938e
	ldy #$03
	ldx #$05
l9387:	txa
	jsr lb812
	jmp l927e
	jsr lb549
	jsr lb919
	ldy #$61
l9396:	iny
	cpy #$6f
	beq l93a4
	jsr $ff8a
	bcc l9396
	sty $0221
l93a3:	rts
l93a4:	ldx #$02
	jmp l8552
	lda #$f3
	jsr lb549
	jsr lb994
	lda $8b
	and #$04
	beq l93bd
	lda $021f
	jmp lbc12
l93bd:	lda $0220
	jmp l9592
	lda #$66
	jsr lb549
	jsr lb80b
	jmp l921e
	lda #$e6
	jsr lb549
	jsr lb80b
	lda #$00
	jsr l91fd
	jmp l91cd
	jsr lb4d6
	cpx #$10
	bcs l93e9
	stx $0257
l93e8:	rts
l93e9:	jmp l9ba7
	lda #$66
	ldx #$f8
	jsr lb54b
	jsr lb80b
	ldx $021b
	ldy $021c
	lda $021a
	stx $64
	sty $65
	sta $66
	ldx $021d
	ldy $021e
	jmp l922e
	lda #$e6
	ldx #$fc
	jsr lb54b
	jsr lb80b
	lda $021a
	clc
	ldx $021b
	ldy $021c
	jsr lbc06
	bcc l93e8
	jsr lb547
	jsr lb8f3
	and #$11
	cmp #$11
	bne l949b
	jsr l93bd
	jsr lb95b
	bcs l93e8
	ldy #$04
	lda #$04
	ldx $0223
	beq l9446
	lda #$06
l9446:	jsr l9578
	jsr lb922
	jsr l9d57
	bne l93e8
	jsr lba7d
	ldy #$00
	lda ($17),y
	cmp #$32
	bcs l945f
	jmp lba8c
l945f:	ldx #$16
	jmp l8552
	jsr lb547
	jsr lb8f3
	jsr lb95b
	bcs l949a
	ldy #$0a
	lda #$04
	jsr l9578
	jsr lb922
	jsr l9d57
	bne l949a
	lda #$0d
	jsr lbbf4
	jsr lba7d
	ldy #$00
l9488:	lda ($17),y
	beq l9492
	jsr lbbf4
	iny
	bne l9488
l9492:	lda #$0d
	jsr lbbf4
	jsr lba8c
l949a:	rts
l949b:	jmp l974f
	lda #$01
	sta $0222
	jsr lba29
	lda #$23
	jsr l9732
	jsr lb78d
	cpx #$00
	beq l94c8
	stx $021f
	jsr l9730
	beq l949b
	bcc l94d0
	jsr l972d
	jsr lb4e5
	jsr l972a
	jmp l94d3
l94c8:	jmp lb71b
l94cb:	ldx #$06
	jmp l8552
l94d0:	jsr lb4e5
	jsr lba29
	beq l94f0
	jsr l9730
	beq l949b
	jsr lb78d
	cpx #$00
	beq l94c8
	cpx #$ff
	beq l94c8
	stx $0222
	jsr lba29
l94ee:	bne l949b
l94f0:	lda $021f
	jsr $ff8d
	bcs l94cb
	sty $0221
	stx $0220
	jsr $ffba
	jsr lb994
	ldy #$0b
	lda #$04
	bne l9578
	jsr lb547
	ldy #$00
	lda #$02
	bne l9578
	jsr lb547
	jsr lb905
	jsr l93bd
	ldy #$05
	ldx #$01
	lda $8b
	and #$10
	beq l9527
	inx
l9527:	txa
	bne l9578
	jsr lb547
	and #$30
	cmp #$30
	bne l9539
	lda $8b
	and #$c7
	beq l9540
l9539:	lda $8b
	jsr lb90a
	lda $8b
l9540:	ldy #$07
	lda #$08
	bne l9578
	jsr lb547
	jsr lb90a
	ldy #$08
	lda #$0c
	bne l9578
	lda #$e4
	jsr lb549
	jsr lb910
	ldy #$09
	lda #$08
	bne l9578
	lda #$c7
	jsr lb549
	and #$30
	cmp #$30
	bne l94ee
	jsr lb95b
	bcc l9571
	rts
l9571:	jsr l93bd
	ldy #$06
	lda #$04
l9578:	jsr lb812
	jsr $ffcc
	sec
	jsr lbbe2
	jmp l9350
	!byte $1f
	jsr lb994
	jmp lbc00
	jsr lb994
	jmp lbbfa
	sec
	jmp $ffe7
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	jmp ($028c)
	ldx $85
	bne l95ca
	dec $86
l95ca:	dec $85
	ldx #$00
	bit $48
	txa
	pha
	lda #$01
	jsr l8866
	jsr l96ae
	lda #$00
	sta $5a
	jsr lba29
	sec
	sbc #$b1
	bcc l95fd
	cmp #$03
	bcs l95fd
	cmp #$01
	rol
	eor #$01
	eor $5a
	cmp $5a
	bcc l9656
	sta $5a
	jsr lba26
	jmp l95e1
l95fd:	ldx $5a
	bne l962d
	bcs l9682
	adc #$07
	bcc l9682
	adc $11
	bne l960e
	jmp laa7a
l960e:	adc #$ff
	sta $22
	asl
	adc $22
	tay
l9616:	pla
	cmp l80d1,y
	bcs l9687
	jsr lb504
l961f:	pha
	jsr l9646
	pla
	ldy $57
	bpl l963f
	tax
	beq l9685
	bne l9690
l962d:	lsr $11
	txa
	rol
	ldx $85
	bne l9637
	dec $86
l9637:	dec $85
	ldy #$1b
	sta $5a
	bne l9616
l963f:	cmp l80d1,y
	bcs l9690
	bcc l961f
	lda l80d3,y
	pha
	lda l80d2,y
	pha
	jsr l9659
	lda $5a
	jmp l95cf
l9656:	jmp l974f
	lda $76
	ldx l80d1,y
	tay
	pla
	sta $22
	pla
	sta $23
	tya
	pha
	inc $22
	bne l966d
	inc $23
l966d:	jsr la1f2
	lda $75
	pha
	lda $74
	pha
	lda $73
	pha
	lda $72
	pha
	lda $71
	pha
	jmp ($0022)
l9682:	ldy #$ff
	pla
l9685:	beq l96ab
l9687:	cmp #$64
	beq l968e
	jsr lb504
l968e:	sty $57
l9690:	pla
	lsr
	sta $0259
	pla
	sta $79
	pla
	sta $7a
	pla
	sta $7b
	pla
	sta $7c
	pla
	sta $7d
	pla
	sta $7e
	eor $76
	sta $7f
l96ab:	lda $71
	rts
	jmp ($028a)
	lda #$00
	sta $11
l96b5:	jsr lba26
	bcs l96d0
l96ba:	jmp la2d8
	cmp #$ff
	bne l96d7
	lda #$cb
	ldy #$96
	jsr la166
	jmp lba26
	!byte $82
	eor #$0f
	!byte $da
	lda ($20,x)
	!byte $bf
	sta $e890,y
	bcs l9754
l96d7:	cmp #$2e
	beq l96ba
	cmp #$ab
	beq l971d
	cmp #$aa
	beq l96b5
	cmp #$22
	bne l96f0
	jsr l906b
	jsr la81f
	jmp labf3
l96f0:	cmp #$a8
	bne l9707
	ldy #$18
	bne l971f
	jsr l9b13
	lda $75
	eor #$ff
	tay
	lda $74
	eor #$ff
	jmp l9d39
l9707:	cmp #$a5
	bne l970e
	jmp l9d71
l970e:	cmp #$b4
	bcc l9724
	cmp #$e7
	bcs l971a
	cmp #$cb
	bcs l974f
l971a:	jmp l9821
l971d:	ldy #$15
l971f:	pla
	pla
	jmp l9620
l9724:	jsr l972d
	jsr l95c1
	lda #$29
	bit $28a9
	bit $2ca9
	sta $025b
	ldy $01
	sty $025c
	ldy $87
	sty $01
	ldy #$00
	lda ($85),y
	ldy $025c
	sty $01
	cmp $025b
	bne l974f
	jmp lba26
l974f:	ldx #$2a
	jmp l8552
l9754:	jsr l992c
	sta $74
	sty $75
	stx $76
	ldx $4f
	ldy $50
	lda $11
	beq l97a1
	lda #$00
	sta $80
	jsr lba0c
	bcs l9799
	cpx #$54
	bne l9779
	cpy #$c9
	bne l978d
	jmp lac5c
l9779:	cpx #$44
	bne l978d
	cpy #$d3
	bne l978d
	jsr l979a
	lda $17
	ldy $18
	ldx $19
	jmp la81f
l978d:	lda $3f
	sta $74
	lda $40
	sta $75
	lda $41
	sta $76
l9799:	rts
	lda $16
	bne l9799
	jmp lb922
l97a1:	bit $12
	bpl l97b9
	lda $76
	sta $01
	ldy #$00
	lda ($74),y
	tax
	iny
	lda ($74),y
	tay
	jsr lba8c
	txa
	jmp l9d39
l97b9:	jsr lba0c
	bcc l97c7
	lda $74
	ldy $75
	ldx $76
	jmp la168
l97c7:	cpx #$53
	bne l97d5
	cpy #$54
	bne l97d5
	jsr lbbdd
	jmp la213
l97d5:	cpx #$45
	bne l97f0
	cpy #$52
	beq l97ea
	cpy #$4c
	bne l97f0
	lda $0299
	ldy $0298
	jmp l9d2c
l97ea:	lda $8f
	lsr
	jmp la213
l97f0:	cpx #$44
	bne l981a
	cpy #$53
	bne l981a
	jsr l979a
	jsr lba7d
	ldy #$00
	lda ($17),y
	and #$0f
	asl
	sta $13
	asl
	asl
	adc $13
	sta $13
	iny
	lda ($17),y
	jsr lba8c
	and #$0f
	adc $13
	jmp la213
l981a:	lda $74
	ldy $75
	jmp la166
	asl
	pha
	tax
	jsr lba26
	cpx #$8f
	bcc l9856
	cpx #$ce
	beq l98a5
	jsr l972d
	jsr l95c1
	jsr l9730
	jsr lb506
	pla
	cmp #$d0
	beq l98a2
	tax
	lda $76
	pha
	lda $75
	pha
	lda $74
	pha
	txa
	pha
	jsr lb4d6
	pla
	tay
	txa
	pha
	jmp l985b
l9856:	jsr l9724
	pla
	tay
	lda l803b,y
	sta $62
	lda l803c,y
	sta $63
	jsr $0061
	jmp lb504
	ldy #$ff
	bit $00a0
	sty $0256
	jsr l9b13
	lda $74
	eor $0256
	sta $0c
	lda $75
	eor $0256
	sta $0d
	jsr la1d3
	jsr l9b13
	lda $75
	eor $0256
	and $0d
	eor $0256
	tay
	lda $74
	eor $0256
	and $0c
	eor $0256
	jmp l9d39
l98a2:	jmp laee9
l98a5:	jmp lac00
	jsr lb507
	bcs l98c0
	lda $7e
	ora #$7f
	and $7a
	sta $7a
	lda #$79
	ldy #$00
	jsr la232
	tax
	jmp l9905
l98c0:	lda #$00
	sta $11
	dec $5a
	jsr la8e9
	sta $70
	ldx #$02
l98cd:	lda $22,x
	sta $71,x
	dex
	bpl l98cd
	lda $7c
	ldy $7d
	ldx $7e
	jsr la8ef
	ldx $22
	ldy $23
	stx $7c
	sty $7d
	ldy $24
	sty $7e
	tax
	sec
	sbc $70
	beq l98f7
	lda #$01
	bcc l98f7
	ldx $70
	lda #$ff
l98f7:	sta $76
	jsr lba69
	ldy #$ff
	inx
l98ff:	iny
	dex
	bne l990a
	ldx $76
	bmi l991c
	clc
	bcc l991c
l990a:	lda ($71),y
	sta $025b
	lda ($7c),y
	cmp $025b
	beq l98ff
	ldx #$ff
	bcs l991c
	ldx #$01
l991c:	jsr lba8c
	inx
	txa
	rol
	and $0259
	beq l9929
	lda #$ff
l9929:	jmp la213
	ldx #$00
	jsr lba29
	stx $10
	sta $4f
	jsr lba29
	jsr l99bf
	bcs l9940
l993d:	jmp l974f
l9940:	ldx #$00
	stx $11
	stx $12
	jsr lba26
	bcc l9950
	jsr l99bf
	bcc l995b
l9950:	tax
l9951:	jsr lba26
	bcc l9951
	jsr l99bf
	bcs l9951
l995b:	cmp #$24
	bne l9965
	lda #$ff
	sta $11
	bne l9975
l9965:	cmp #$25
	bne l997c
	lda $14
	bne l993d
	lda #$80
	sta $12
	ora $4f
	sta $4f
l9975:	txa
	ora #$80
	tax
	jsr lba26
l997c:	stx $50
	sec
	ora $14
	sbc #$28
	bne l9988
	jmp l9b28
l9988:	ldy #$00
	sty $14
	lda $31
	ldx $32
l9990:	stx $6e
l9992:	sta $6d
	cpx $36
	bne l999c
	cmp $35
	beq l99c9
l999c:	jsr lba87
	lda ($6d),y
	cmp $4f
	bne l99b2
	iny
	lda ($6d),y
	cmp $50
	bne l99b1
	jmp l9adf
l99af:	beq l993d
l99b1:	dey
l99b2:	jsr lba8c
	clc
	lda $6d
	adc #$07
	bcc l9992
	inx
	bne l9990
	cmp #$41
	bcc l99c8
	sbc #$5b
	sec
	sbc #$a5
l99c8:	rts
l99c9:	pla
	pha
	cmp #$56
	bne l99de
	tsx
	lda $0102,x
	cmp #$97
	bne l99de
l99d7:	lda #$10
	ldy #$a5
	ldx #$0f
	rts
l99de:	lda $4f
	ldy $50
	cmp #$54
	bne l99ea
	cpy #$c9
	beq l99d7
l99ea:	cmp #$53
	bne l99f2
	cpy #$54
	beq l99af
l99f2:	cmp #$45
	bne l99fe
	cpy #$52
	beq l99af
	cpy #$4c
	beq l99af
l99fe:	cmp #$44
	bne l9a0a
	cpy #$53
	beq l99af
	cpy #$d3
	beq l99af
l9a0a:	lda $35
	ldy $36
	sta $6d
	sty $6e
	lda $39
	ldy $3a
	sta $67
	sty $68
	clc
	adc #$07
	bcc l9a20
	iny
l9a20:	sta $64
	sty $65
	jsr l881e
	lda $64
	ldy $65
	iny
	sta $35
	sty $36
	sta $64
	sty $65
l9a34:	lda $64
	ldx $65
l9a38:	cpx $3a
	bne l9a43
	cmp $39
	bne l9a43
	jmp l9ac0
l9a43:	sta $22
	stx $23
	jsr lba87
	ldy #$00
	lda ($22),y
	tax
	iny
	lda ($22),y
	php
	iny
	lda ($22),y
	adc $64
	sta $64
	iny
	lda ($22),y
	adc $65
	sta $65
	plp
	bpl l9a34
	txa
	bmi l9a34
	iny
	lda ($22),y
	ldy #$00
	asl
	adc #$05
	adc $22
	sta $22
	bcc l9a77
	inc $23
l9a77:	ldx $23
	cpx $65
	bne l9a81
	cmp $64
	beq l9a38
l9a81:	jsr lba87
	ldy #$00
	lda ($22),y
	beq l9ab3
	sta $025b
	iny
	lda ($22),y
	clc
	adc $025b
	sta $67
	tax
	iny
	lda ($22),y
	adc #$00
	sta $68
	iny
	lda ($22),y
	sta $01
	clc
	ldy #$00
	lda ($67),y
	adc #$07
	sta ($67),y
	iny
	lda ($67),y
	adc #$00
	sta ($67),y
l9ab3:	lda #$04
	clc
	adc $22
	sta $22
	bcc l9a77
	inc $23
	bne l9a77
	jsr lba87
	ldy #$00
	lda $4f
	sta ($6d),y
	iny
	lda $50
	sta ($6d),y
	lda #$00
	iny
	sta ($6d),y
	iny
	sta ($6d),y
	iny
	sta ($6d),y
	iny
	sta ($6d),y
	iny
	sta ($6d),y
	jsr lba8c
	lda $6d
	clc
	adc #$02
	ldy $6e
	bcc l9aec
	iny
l9aec:	sta $51
	sty $52
	ldx #$02
	stx $53
	rts
	lda $0e
	asl
	adc #$05
	adc $6d
	ldy $6e
	bcc l9b01
	iny
l9b01:	sta $64
	sty $65
	rts
	jsr lba26
	jsr l95c1
	jsr lb504
	lda $76
	bmi l9b20
	lda $71
	cmp #$90
	bcc l9b22
	lda #$0d
	ldy #$a5
	jsr la232
l9b20:	bne l9b25
l9b22:	jmp la280
l9b25:	jmp l9ba7
	lda $10
	ora $12
	pha
	lda $11
	pha
	lda #$00
	pha
l9b33:	lda $50
	pha
	lda $4f
	pha
	jsr l9b06
	pla
	sta $4f
	pla
	sta $50
	pla
	tay
	tsx
	lda $0102,x
	pha
	lda $0101,x
	pha
	lda $74
	sta $0102,x
	lda $75
	sta $0101,x
	iny
	tya
	pha
	jsr lba29
	cmp #$2c
	beq l9b33
	pla
	sta $0e
	jsr l972a
	pla
	sta $11
	pla
	sta $12
	and #$7f
	sta $10
	ldx $35
	lda $36
l9b75:	stx $6d
	sta $6e
	cmp $3a
	bne l9b81
	cpx $39
	beq l9bd0
l9b81:	jsr lba82
	ldy #$00
	lda ($6d),y
	iny
	cmp $4f
	bne l9b93
	lda ($6d),y
	cmp $50
	beq l9bac
l9b93:	iny
	lda ($6d),y
	clc
	adc $6d
	tax
	iny
	lda ($6d),y
	jsr lba8c
	adc $6e
	bcc l9b75
l9ba4:	ldx #$38
	bit $30a2
l9ba9:	jmp l8552
l9bac:	jsr lba8c
	ldx #$3a
	lda $10
	bne l9ba9
	jsr l9af5
	jsr lba82
	ldy #$04
	lda ($6d),y
	cmp $0e
	bne l9ba4
	jmp l9c5e
	bpl l9bcf
	dex
	lda $4f
	bpl l9bcf
	dex
	dex
l9bcf:	rts
l9bd0:	jsr l9af5
	jsr l8877
	jsr lba82
	ldy #$00
	sty $83
	lda $4f
	sta ($6d),y
	iny
	ldx #$05
	lda $50
	sta ($6d),y
	jsr l9bc6
	stx $82
	lda $0e
	iny
	iny
	iny
	sta ($6d),y
l9bf4:	ldx #$0b
	lda #$00
	bit $10
	bvc l9c04
	pla
	clc
	adc #$01
	tax
	pla
	adc #$00
l9c04:	iny
	sta ($6d),y
	iny
	txa
	sta ($6d),y
	jsr l9cc4
	stx $82
	sta $83
	ldy $22
	dec $0e
	bne l9bf4
	adc $65
	bcs l9c7c
	sta $65
	tay
	txa
	adc $64
	bcc l9c27
	iny
	beq l9c7c
l9c27:	jsr lba8c
	jsr l8877
	sta $39
	sty $3a
	jsr lba82
	lda #$00
	inc $83
	ldy $82
	beq l9c41
l9c3c:	dey
	sta ($64),y
	bne l9c3c
l9c41:	dec $65
	dec $83
	bne l9c3c
	inc $65
	sec
	lda $39
	sbc $6d
	ldy #$02
	sta ($6d),y
	lda $3a
	iny
	sbc $6e
	sta ($6d),y
	lda $10
	bne l9cc1
	iny
	lda ($6d),y
	sta $0e
	lda #$00
	sta $82
l9c66:	sta $83
	iny
	pla
	tax
	sta $74
	pla
	sta $75
	lda ($6d),y
	iny
	cmp $75
	beq l9c7f
	bcs l9c87
l9c79:	jmp l9ba4
l9c7c:	jmp l8550
l9c7f:	lda ($6d),y
	cmp $74
	beq l9c79
	bcc l9c79
l9c87:	lda $83
	ora $82
	clc
	beq l9c98
	jsr l9cc4
	txa
	adc $74
	tax
	tya
	ldy $22
l9c98:	adc $75
	stx $82
	dec $0e
	bne l9c66
	sta $83
	ldx #$05
	lda $50
	jsr l9bc6
	stx $2a
	lda #$00
	jsr l9ccd
	txa
	adc $64
	sta $51
	tya
	adc $65
	sta $52
	tay
	lda $51
	ldx #$02
	stx $53
l9cc1:	jmp lba8c
	sty $22
	lda ($6d),y
	sta $2a
	dey
	lda ($6d),y
	sta $2b
	lda #$10
	sta $6b
	ldx #$00
	ldy #$00
l9cd7:	txa
	asl
	tax
	tya
	rol
	tay
	bcs l9c7c
	asl $82
	rol $83
	bcc l9cf0
	clc
	txa
	adc $2a
	tax
	tya
	adc $2b
	tay
	bcs l9c7c
l9cf0:	dec $6b
	bne l9cd7
	rts
	lda $11
	beq l9d01
	jsr la8e9
	ldx #$02
	jmp l9d19
l9d01:	jsr lb4d9
	cpx #$01
	bne l9d15
	sec
	lda $88
	sbc $2f
	tay
	lda $89
	sbc $30
	jmp l9d2c
l9d15:	cpx #$02
	bne l9d29
	jsr ladb5
	sec
	lda $3b
	sbc $39
	tay
	lda $3c
	sbc $3a
	jmp l9d2c
l9d29:	lda #$00
	tay
	jsr l9d3f
	sec
	jmp la220
	sec
	jsr $fff0
	lda #$00
	jsr l9d3f
	jmp la21b
	ldx #$00
	stx $11
	sta $72
	sty $73
	ldx #$90
l9d49:	rts
	jsr l9d57
	bne l9d49
	ldx #$3e
	bit $4aa2
	jmp l8552
	lda $43
	cmp #$ff
	rts
	lda #$a5
	jsr l9732
	ora #$80
	sta $14
	jsr l9933
	sta $5b
	sty $5c
	stx $5d
	jmp lb504
	jsr l9d5c
	lda $5d
	pha
	lda $5c
	pha
	lda $5b
	pha
	jsr l9724
	jsr lb504
	pla
	sta $5b
	pla
	sta $5c
	pla
	sta $5d
	sta $01
	ldy #$02
	lda ($5b),y
	sta $51
	tax
	iny
	lda ($5b),y
	sta $52
	ora $51
	beq l9d52
	iny
	lda ($5b),y
	sta $53
	sta $01
l9da5:	lda ($51),y
	pha
	dey
	bpl l9da5
	ldy $52
	lda $53
	jsr la1a5
	lda $86
	pha
	lda $85
	pha
	lda $5d
	sta $01
	lda ($5b),y
	sta $85
	iny
	lda ($5b),y
	sta $86
	jsr lba8c
	lda $53
	pha
	lda $52
	pha
	lda $51
	pha
	jsr lb501
	pla
	sta $5b
	pla
	sta $5c
	pla
	sta $5d
	jsr lba29
	beq l9de5
	jmp l974f
l9de5:	pla
	sta $85
	pla
	sta $86
	lda $5d
	sta $01
	ldy #$00
	pla
	sta ($5b),y
	pla
	iny
	sta ($5b),y
	pla
	iny
	sta ($5b),y
	pla
	iny
	sta ($5b),y
	pla
	iny
	sta ($5b),y
	jmp lba8c
	lda $1c
	pha
	lda $1b
	pha
	jsr lb4e8
	ldx $01
	lda $0257
	sta $01
	ldy #$00
	lda ($1b),y
	tay
	pla
	sta $1b
	pla
	sta $1c
	stx $01
	jmp l9d37
	lda #$0e
	ldy #$a5
	bne l9e4a
	jsr la05c
	jsr la57e
	eor $7e
	sta $7f
	lda $71
	jmp l9e4d
	ldy $89
	ldx $88
	bne l9e43
	dey
l9e43:	dex
l9e44:	rts
l9e45:	jsr l9f79
	bcc l9e86
l9e4a:	jsr la05c
	bne l9e52
	jmp la1d3
l9e52:	ldx $80
	stx $63
	ldx #$79
	lda $79
	tay
	beq l9e44
	sec
	sbc $71
	beq l9e86
	bcc l9e76
	sty $71
	ldy $7e
	sty $76
	eor #$ff
	adc #$00
	ldy #$00
	sty $63
	ldx #$71
	bne l9e7a
l9e76:	ldy #$00
	sty $80
l9e7a:	cmp #$f9
	bmi l9e45
	tay
	lda $80
	lsr $01,x
	jsr l9f90
l9e86:	bit $7f
	bpl l9ee1
	ldy #$71
	cpx #$79
	beq l9e92
	ldy #$79
l9e92:	sec
	eor #$ff
	adc $63
	sta $80
	lda $0004,y
	sbc $04,x
	sta $75
	lda $0003,y
	sbc $03,x
	sta $74
	lda $0002,y
	sbc $02,x
	sta $73
	lda $0001,y
	sbc $01,x
	sta $72
	bcs l9eba
	jsr l9f2a
l9eba:	ldy #$00
	tya
	clc
l9ebe:	ldx $72
	bne l9f0c
	ldx $73
	stx $72
	ldx $74
	stx $73
	ldx $75
	stx $74
	ldx $80
	stx $75
	sty $80
	adc #$08
	cmp #$20
	bne l9ebe
l9eda:	lda #$00
	sta $71
	sta $76
	rts
l9ee1:	adc $63
	sta $80
	lda $75
	adc $7d
	sta $75
	lda $74
	adc $7c
	sta $74
	lda $73
	adc $7b
	sta $73
	lda $72
	adc $7a
	sta $72
	jmp l9f19
l9f00:	adc #$01
	asl $80
	rol $75
	rol $74
	rol $73
	rol $72
l9f0c:	bpl l9f00
	sec
	sbc $71
	bcs l9eda
	eor #$ff
	adc #$01
	sta $71
	bcc l9f29
	inc $71
	beq l9f5e
	ror $72
	ror $73
	ror $74
	ror $75
	ror $80
l9f29:	rts
	jsr la57e
	lda $72
	eor #$ff
	sta $72
	lda $73
	eor #$ff
	sta $73
	lda $74
	eor #$ff
	sta $74
	lda $75
	eor #$ff
	sta $75
	lda $80
	eor #$ff
	sta $80
	inc $80
	bne l9f5d
	inc $75
	bne l9f5d
	inc $74
	bne l9f5d
	inc $73
	bne l9f5d
	inc $72
l9f5d:	rts
l9f5e:	ldx #$32
	jmp l8552
	ldx #$27
l9f65:	ldy $04,x
	sty $80
	ldy $03,x
	sty $04,x
	ldy $02,x
	sty $03,x
	ldy $01,x
	sty $02,x
	ldy $78
	sty $01,x
	adc #$08
	bmi l9f65
	beq l9f65
	sbc #$08
	tay
	lda $80
	bcs l9f9a
l9f86:	asl $01,x
	bcc l9f8c
	inc $01,x
l9f8c:	ror $01,x
	ror $01,x
	ror $02,x
	ror $03,x
	ror $04,x
	ror
	iny
	bne l9f86
l9f9a:	clc
	rts
	sta ($00,x)
	brk
	brk
	brk
	!byte $03
	!byte $7f
	lsr $cb56,x
	adc $1380,y
	!byte $9b
	!byte $0b
	!byte $64
	!byte $80
	ror $38,x
	!byte $93
	asl $82,x
	sec
	tax
	!byte $3b
	jsr $3580
	!byte $04
	!byte $f3
	!byte $34
	sta ($35,x)
	!byte $04
	!byte $f3
	!byte $34
	!byte $80
	!byte $80
	brk
	brk
	brk
	!byte $80
	and ($72),y
	!byte $17
	sed
	jsr la202
	beq l9fd1
	bpl l9fd4
l9fd1:	jmp l9ba7
l9fd4:	lda $71
	sbc #$7f
	pha
	lda #$80
	sta $71
	lda #$b6
	ldy #$9f
	jsr l9e4a
	lda #$bb
	ldy #$9f
	jsr la0e6
	lda #$9c
	ldy #$9f
	jsr l9e2d
	lda #$a1
	ldy #$9f
	jsr la605
	lda #$c0
	ldy #$9f
	jsr l9e4a
	pla
	jsr la363
	lda #$c5
	ldy #$9f
	jsr la05c
	beq la05b
	jsr la08e
	lda #$00
	sta $28
	sta $29
	sta $2a
	sta $2b
	lda $80
	jsr la036
	lda $75
	jsr la036
	lda $74
	jsr la036
	lda $73
	jsr la036
	lda $72
	jsr la03b
	jmp la15a
	bne la03b
	jmp l9f63
la03b:	lsr
	ora #$80
la03e:	tay
	bcc la04d
	clc
	ldx #$03
la044:	lda $28,x
	adc $7a,x
	sta $28,x
	dex
	bpl la044
la04d:	ror $28
	ror $29
	ror $2a
	ror $2b
	ror $80
	tya
	lsr
	bne la03e
la05b:	rts
	ldx #$0f
	stx $01
	sta $22
	sty $23
	ldy #$04
	lda ($22),y
	sta $7d
	dey
	lda ($22),y
	sta $7c
	dey
	lda ($22),y
	sta $7b
	dey
	lda ($22),y
	sta $7e
	eor $76
	sta $7f
	lda $7e
	ora #$80
	sta $7a
	dey
	lda ($22),y
	jsr lba8c
	sta $79
	lda $71
	rts
	lda $79
	beq la0b1
	clc
	adc $71
	bcc la09b
	bmi la0b6
	clc
	bit $1410
	adc #$80
	sta $71
	bne la0a6
	jmp l9ede
la0a6:	lda $7f
	sta $76
	rts
	lda $76
	eor #$ff
	bmi la0b6
la0b1:	pla
	pla
	jmp l9eda
la0b6:	jmp l9f5e
	jsr la1e3
	tax
	beq la0cf
	clc
	adc #$02
	bcs la0b6
	ldx #$00
	stx $7f
	jsr l9e5a
	inc $71
	beq la0b6
la0cf:	rts
	sty $20
	brk
	brk
	brk
	jsr la1e3
	lda #$d0
	ldy #$a0
	ldx #$00
	stx $7f
	jsr la166
	jmp la0e9
	jsr la05c
	beq la148
	jsr la1f2
	lda #$00
	sec
	sbc $71
	sta $71
	jsr la08e
	inc $71
	beq la0b6
	ldx #$fc
	lda #$01
la100:	ldy $7a
	cpy $72
	bne la116
	ldy $7b
	cpy $73
	bne la116
	ldy $7c
	cpy $74
	bne la116
	ldy $7d
	cpy $75
la116:	php
	rol
	bcc la123
	inx
	sta $2b,x
	beq la14d
	bpl la151
	lda #$01
la123:	plp
	bcs la134
	asl $7d
	rol $7c
	rol $7b
	rol $7a
	bcs la116
	bmi la100
	bpl la116
la134:	tay
	txa
	pha
	ldx #$03
la139:	lda $7a,x
	sbc $72,x
	sta $7a,x
	dex
	bpl la139
	pla
	tax
	tya
	jmp la126
la148:	ldx #$3c
	jmp l8552
la14d:	lda #$40
	bne la123
la151:	asl
	asl
	asl
	asl
	asl
	asl
	sta $80
	plp
	ldx #$03
la15c:	lda $28,x
	sta $72,x
	dex
	bpl la15c
	jmp l9eba
	ldx #$0f
	sta $22
	sty $23
	stx $01
	ldy #$04
	lda ($22),y
	sta $75
	dey
	lda ($22),y
	sta $74
	dey
	lda ($22),y
	sta $73
	dey
	lda ($22),y
	sta $76
	ora #$80
	sta $72
	dey
	lda ($22),y
	sta $71
	sty $80
	jmp lba8c
	ldx #$6a
	bit $64a2
	ldy #$00
	jsr la1f2
	lda #$0f
	bpl la1aa
	ldx $54
	ldy $55
	lda $56
	pha
	jsr la1f2
	pla
la1aa:	sta $01
	sty $23
	stx $22
	ldy #$04
	lda $75
	sta ($22),y
	dey
	lda $74
	sta ($22),y
	dey
	lda $73
	sta ($22),y
	dey
	lda $76
	ora #$7f
	and $72
	sta ($22),y
	dey
	lda $71
	sta ($22),y
	sty $80
	jmp lba8c
	lda $7e
	sta $76
	ldx #$05
la1d9:	lda $78,x
	sta $70,x
	dex
	bne la1d9
	stx $80
	rts
	jsr la1f2
	ldx #$06
la1e8:	lda $70,x
	sta $78,x
	dex
	bne la1e8
	stx $80
la1f1:	rts
	lda $71
	beq la1f1
	asl $80
	bcc la1f1
	jsr l9f4f
	bne la1f1
	jmp l9f1b
la202:	lda $71
	beq la20f
la206:	lda $76
	rol
	lda #$ff
	bcs la20f
	lda #$01
la20f:	rts
	jsr la202
	sta $72
	lda #$00
	sta $73
	ldx #$88
	lda $72
	eor #$ff
	rol
	lda #$00
	sta $75
	sta $74
	stx $71
	sta $80
	sta $76
	jmp l9eb5
	lsr $76
	rts
	sta $25
	sty $26
	ldy #$00
	jsr la278
	iny
	tax
	beq la202
	jsr la278
	eor $76
	bmi la206
	cpx $71
	bne la26f
	jsr la278
	ora #$80
	cmp $72
	bne la26f
	iny
	jsr la278
	cmp $73
	bne la26f
	iny
	jsr la278
	cmp $74
	bne la26f
	iny
	lda #$7f
	cmp $80
	jsr la278
	sbc $75
	beq la29f
la26f:	lda $76
	bcc la275
	eor #$ff
la275:	jmp la208
	jsr lba78
	lda ($25),y
	jmp lba8c
	lda $71
	beq la2ce
	sec
	sbc #$a0
	bit $76
	bpl la294
	tax
	lda #$ff
	sta $78
	jsr l9f2d
	txa
la294:	ldx #$71
	cmp #$f9
	bpl la2a0
	jsr l9f79
	sty $78
la29f:	rts
la2a0:	tay
	lda $76
	and #$80
	lsr $72
	ora $72
	sta $72
	jsr l9f90
	sty $78
	rts
	lda $71
	cmp #$a0
	bcs la2d7
	jsr la280
	sty $80
	lda $76
	sty $76
	eor #$80
	rol
	lda #$a0
	sta $71
	lda $75
	sta $0c
	jmp l9eb5
la2ce:	sta $72
	sta $73
	sta $74
	sta $75
	tay
la2d7:	rts
	ldy #$00
	ldx #$0c
la2dc:	sty $6b,x
	dex
	bpl la2dc
	bcc la2f2
	cmp #$2d
	bne la2eb
	stx $77
	beq la2ef
la2eb:	cmp #$2b
	bne la2f4
la2ef:	jsr lba26
la2f2:	bcc la34f
la2f4:	cmp #$2e
	beq la326
	cmp #$45
	bne la32c
	jsr lba26
	bcc la318
	cmp #$ab
	beq la313
	cmp #$2d
	beq la313
	cmp #$aa
	beq la315
	cmp #$2b
	beq la315
	bne la31a
la313:	ror $6f
la315:	jsr lba26
la318:	bcc la376
la31a:	bit $6f
	bpl la32c
	lda #$00
	sec
	sbc $6c
	jmp la32e
la326:	ror $6e
	bit $6e
	bvc la2ef
la32c:	lda $6c
	sec
	sbc $6b
	sta $6c
	beq la347
	bpl la340
la337:	jsr la0d5
	inc $6c
	bne la337
	beq la347
la340:	jsr la0b9
	dec $6c
	bne la340
la347:	lda $77
	bmi la34c
	rts
la34c:	jmp la57a
la34f:	pha
	bit $6e
	bpl la356
	inc $6b
la356:	jsr la0b9
	pla
	sec
	sbc #$30
	jsr la363
	jmp la2ef
	pha
	jsr la1e3
	pla
	jsr la213
	lda $7e
	eor $76
	sta $7f
	ldx $71
	jmp l9e4d
la376:	lda $6c
	cmp #$0a
	bcc la385
	lda #$64
	bit $6f
	bmi la3a0
	jmp l9f5e
la385:	asl
	asl
	clc
	adc $6c
	asl
	clc
	ldy #$00
	sta $025b
	lda $87
	sta $01
	lda ($85),y
	jsr lba8c
	adc $025b
	sec
	sbc #$30
la3a0:	sta $6c
	jmp la315
	!byte $9b
	rol $1fbc,x
	sbc $6e9e,x
	!byte $6b
	!byte $27
	sbc $6e9e,x
	!byte $6b
	plp
	brk
	sta $72
	stx $73
	ldx #$90
	sec
	jsr la220
; outfac
	jsr la3e2
	ldx #$22
	lda l828f,x
	ldy l8290,x
	sta $025b
	sty $025c
la3cf:	jsr $025a
	beq la3e1
	jsr lb53a
	inc $025b
	bne la3cf
	inc $025c
	bne la3cf
la3e1:	rts
	ldy #$01
	lda #$20
	bit $76
	bpl la3ec
	lda #$2d
la3ec:	sta $01ff,y
	sta $76
	sty $82
	iny
	lda #$30
	ldx $71
	bne la3fd
	jmp la504
la3fd:	lda #$00
	cpx #$80
	beq la405
	bcs la40e
la405:	lda #$af
	ldy #$a3
	jsr la008
	lda #$f7
la40e:	sta $6b
la410:	lda #$aa
	ldy #$a3
	jsr la232
	beq la437
	bpl la42d
la41b:	lda #$a5
	ldy #$a3
	jsr la232
	beq la426
	bpl la434
la426:	jsr la0b9
	dec $6b
	bne la41b
la42d:	jsr la0d5
	inc $6b
	bne la410
la434:	jsr l9e27
la437:	jsr la280
	ldx #$01
	lda $6b
	clc
	adc #$0a
	bmi la44c
	cmp #$0b
	bcs la44d
	adc #$ff
	tax
	lda #$02
la44c:	sec
la44d:	sbc #$02
	sta $6c
	stx $6b
	txa
	beq la458
	bpl la46b
la458:	ldy $82
	lda #$2e
	iny
	sta $01ff,y
	txa
	beq la469
	lda #$30
	iny
	sta $01ff,y
la469:	sty $82
la46b:	ldy #$00
	ldx #$80
la46f:	lda $75
	clc
	adc la516,y
	sta $75
	lda $74
	adc la515,y
	sta $74
	lda $73
	adc la514,y
	sta $73
	lda $72
	adc la513,y
	sta $72
	inx
	bcs la492
la48f:	bpl la46f
	bit $db30
	txa
	bcc la49b
	eor #$ff
	adc #$0a
la49b:	adc #$2f
	iny
	iny
	iny
	iny
	sty $51
	ldy $82
	iny
	tax
	and #$7f
	sta $01ff,y
	dec $6b
	bne la4b6
	lda #$2e
	iny
	sta $01ff,y
la4b6:	sty $82
	ldy $51
	txa
	eor #$ff
	and #$80
	tax
	cpy #$24
	bne la46f
	ldy $82
la4c6:	lda $01ff,y
	dey
	cmp #$30
	beq la4c6
	cmp #$2e
	beq la4d3
	iny
la4d3:	lda #$2b
	ldx $6c
	beq la507
	bpl la4e3
la4db:	lda #$00
	sec
	sbc $6c
	tax
	lda #$2d
la4e3:	sta $0201,y
	lda #$45
	sta $0200,y
	txa
	ldx #$2f
	sec
la4ef:	inx
	sbc #$0a
	bcs la4ef
	adc #$3a
	sta $0203,y
	txa
	sta $0202,y
	lda #$00
	sta $0204,y
	beq la50c
	sta $01ff,y
la507:	lda #$00
	sta $0200,y
la50c:	rts
	bcc la48f
	brk
	brk
	brk
	brk
	!byte $fa
	asl
	!byte $1f
	brk
	brk
	tya
	stx $80,y
	!byte $ff
	beq la4db
	cpy #$00
	ora ($86,x)
	ldy #$ff
	!byte $ff
	cld
	beq la528
la528:	brk
	!byte $03
	inx
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $9c
	brk
la530:	brk
	brk
	asl
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	jsr la1e3
	lda #$0e
	ldy #$a5
	jsr la166
	beq la5b3
	lda $79
	bne la54a
	jmp l9edc
la54a:	ldx #$5b
	ldy #$00
	jsr la198
	lda $7e
	bpl la564
	jsr la2b1
	lda #$5b
	ldy #$00
	jsr la232
	bne la564
	tya
	ldy $0c
la564:	jsr la1d5
	tya
	pha
	jsr l9fca
	lda #$5b
	ldy #$00
	jsr la008
	jsr la5b3
	pla
	lsr
	bcc la584
	lda $71
	beq la584
	lda $76
	eor #$ff
	sta $76
la584:	rts
	sta ($38,x)
	tax
	!byte $3b
	and #$07
	adc ($34),y
	cli
	rol $7456,x
	asl $7e,x
	!byte $b3
	!byte $1b
	!byte $77
	!byte $2f
	inc l85e3
	!byte $7a
	ora $1c84,x
	rol
	!byte $7c
	!byte $63
	eor $0a58,y
	ror $fd75,x
	!byte $e7
	dec $80
	and ($72),y
	clc
	bpl la530
	brk
	brk
	brk
	brk
la5b3:	lda #$85
	ldy #$a5
	jsr la008
	lda $80
	adc #$50
	bcc la5c3
	jsr la1fa
la5c3:	sta $63
	jsr la1e6
	lda $71
	cmp #$88
	bcc la5d1
la5ce:	jsr la0ab
la5d1:	jsr la2b1
	lda $0c
	clc
	adc #$81
	beq la5ce
	sec
	sbc #$01
	pha
	ldx #$05
la5e1:	lda $79,x
	ldy $71,x
	sta $71,x
	sty $79,x
	dex
	bpl la5e1
	lda $63
	sta $80
	jsr l9e30
	jsr la57a
	lda #$8a
	ldy #$a5
	jsr la61b
	lda #$00
	sta $7f
	pla
	jmp lbc59
	sta $82
	sty $83
	jsr la194
	lda #$64
	jsr la008
	jsr la61f
	lda #$64
	ldy #$00
	jmp la008
	sta $82
	sty $83
	jsr la191
	lda #$00
	ora ($82),y
	sta $77
	ldy $82
	iny
	tya
	bne la630
	inc $83
la630:	sta $82
	ldy $83
la634:	jsr la008
	lda $82
	ldy $83
	clc
	adc #$05
	bcc la641
	iny
la641:	sta $82
	sty $83
	jsr l9e4a
	lda #$6a
	ldy #$00
	dec $77
	bne la634
	rts
	tya
	and $44,x
	!byte $7a
	pla
	plp
	lda ($46),y
	jsr la202
	bmi la67a
	ldx $8d
	ldy $8e
	inx
	bne la666
	iny
la666:	txa
	ldx #$02
	jsr la168
	lda #$51
	ldy #$a6
	jsr la008
	lda #$55
	ldy #$a6
	jsr l9e4a
la67a:	ldx $75
	lda $72
	sta $75
	stx $72
	ldx $73
	lda $74
	sta $73
	stx $74
	lda #$00
	sta $76
	lda $71
	sta $80
	lda #$80
	sta $71
	jsr l9eba
	ldx $8d
	ldy $8e
	lda #$02
	inx
	bne la6a3
	iny
la6a3:	jmp la1a5
	lda #$26
	ldy #$a7
	jsr l9e4a
	jsr la1e3
	lda #$2b
	ldy #$a7
	ldx $7e
	jsr la0de
	jsr la1e3
	jsr la2b1
	lda #$00
	sta $7f
	jsr l9e30
	lda #$30
	ldy #$a7
	jsr l9e2d
	lda $76
	pha
	bpl la6e1
	jsr l9e27
	lda $76
	bmi la6e4
	lda $0259
	eor #$ff
	sta $0259
la6e1:	jsr la57a
la6e4:	lda #$30
	ldy #$a7
	jsr l9e4a
	pla
	bpl la6f1
	jsr la57a
la6f1:	lda #$35
	ldy #$a7
	jmp la605
	jsr la194
	lda #$00
	sta $0259
	jsr la6ad
	ldx #$5b
	ldy #$00
	jsr la198
	lda #$64
	ldy #$00
	jsr la166
	lda #$00
	sta $76
	lda $0259
	jsr la722
	lda #$5b
	ldy #$00
	jmp la0e6
	pha
	jmp la6e1
	sta ($49,x)
	!byte $0f
	!byte $da
	ldx #$83
	eor #$0f
	!byte $da
	ldx #$7f
	brk
	brk
	brk
	brk
	ora $84
	inc $1a
	and l861b
	plp
	!byte $07
	inc $f8,x
	!byte $87
	sta l8968,y
	ora ($87,x)
	!byte $23
	and $df,x
	sbc ($86,x)
	lda $5d
	!byte $e7
	plp
	!byte $83
	eor #$0f
	!byte $da
	ldx #$0b
	ror $b3,x
	!byte $83
	lda $79d3,x
	asl la6f4,x
	sbc $7b,x
	!byte $83
	!byte $fc
	bcs la774
	!byte $7c
	!byte $0c
	!byte $1f
	!byte $67
	dex
	!byte $7c
	dec $cb53,x
	cmp ($7d,x)
	!byte $14
	!byte $64
	bvs la7bf
	adc $eab7,x
	eor ($7a),y
	adc $3063,x
	dey
	ror l927e,x
	!byte $44
	sta $7e3a,y
	jmp l91cc
	!byte $c7
	!byte $7f
	tax
	tax
	tax
	!byte $13
	sta ($00,x)
	brk
	brk
	brk
	lda $76
	pha
	bpl la799
	jsr la57a
la799:	lda $71
	pha
	cmp #$81
	bcc la7a7
	lda #$9c
	ldy #$9f
	jsr la0e6
la7a7:	lda #$54
	ldy #$a7
	jsr la605
	pla
	cmp #$81
	bcc la7ba
	lda #$26
	ldy #$a7
	jsr l9e2d
la7ba:	pla
	bpl la81e
	jmp la57a
	jsr l91b6
	jsr lba73
	tay
	beq la7d8
	cpy #$04
	bcc la7cf
	ldy #$04
la7cf:	dey
la7d0:	lda ($22),y
	sta $0273,y
	dey
	bpl la7d0
la7d8:	jmp lba8c
	jsr lb504
	jsr la3e2
	pla
	pla
	ldy #$00
la7e5:	lda $0200,y
	beq la7ed
	iny
	bne la7e5
la7ed:	tya
	jsr la811
	sty $01
	ldy #$00
la7f5:	lda $0200,y
	beq la7ff
	sta ($71),y
	iny
	bne la7f5
la7ff:	jsr lba8c
	jmp la86c
	ldx $76
	stx $60
	ldx $74
	ldy $75
	stx $5e
	sty $5f
	jsr lad53
	sta $70
	stx $71
	sty $72
	ldy #$02
	sty $73
la81e:	rts
	pha
	lda #$22
	sta $0c
	sta $0d
	pla
	sta $7f
	sty $80
	stx $81
	stx $01
	sta $71
	sty $72
	stx $73
	stx $84
	ldy #$ff
la839:	iny
	lda ($7f),y
	beq la84a
	cmp $0c
	beq la846
	cmp $0d
	bne la839
la846:	cmp #$22
	beq la84b
la84a:	clc
la84b:	jsr lba8c
	sty $70
	tya
	adc $7f
	sta $82
	ldx $80
	bcc la85a
	inx
la85a:	stx $83
	tya
	jsr la805
	ldx #$02
la862:	ldy $7f,x
	sty $22,x
	dex
	bpl la862
	jsr la8c4
	ldy $1d
	cpy #$0c
	bne la877
	ldx #$46
	jmp l8552
la877:	lda #$02
	sta $01
	sta $76
	ldx #$00
la87f:	lda $70,x
	sta ($20),y
	iny
	inx
	cpx #$04
	bne la87f
	jsr lba8c
	lda $21
	sta $75
	sta $1f
	clc
	lda $20
	adc $1d
	sta $74
	sta $1e
	bcc la8a1
	inc $75
	inc $1f
la8a1:	sty $1d
	ldy #$00
	sty $80
	dey
	sty $11
	rts
	lda $81
	sta $01
	ldy #$00
	lda ($7f),y
	tax
	iny
	lda ($7f),y
	sta $22
	iny
	lda ($7f),y
	sta $23
	iny
	lda ($7f),y
	sta $24
	txa
	tay
	beq la8d9
	pha
	ldx #$02
la8ca:	dey
	lda $24
	sta $01
	lda ($22),y
	stx $01
	sta ($3d),y
	tya
	bne la8ca
	pla
la8d9:	jsr lba8c
	clc
	adc $3d
	sta $3d
	bcc la8e5
	inc $3e
la8e5:	rts
	jsr lb506
	lda $74
	ldy $75
	ldx $76
	jsr la94f
	bne la930
	jsr laa33
	bcc la930
	jsr laa20
	pha
	eor #$ff
	sec
	adc $22
	ldy $23
	bcs la907
	dey
la907:	sta $22
	sty $23
	tax
	pla
	ldy $24
	cpy #$02
	bne la972
	ldy $23
	cpy $3c
	bne la972
	cpx $3b
	bne la972
	pha
	clc
	adc $3b
	bcc la925
	inc $3c
la925:	clc
	adc #$03
	sta $3b
	bcc la92e
	inc $3c
la92e:	pla
	rts
la930:	jsr lba73
	ldy #$00
	lda ($22),y
	pha
	iny
	lda ($22),y
	pha
	iny
	lda ($22),y
	tax
	iny
	lda ($22),y
	sta $24
	stx $23
	jsr lba8c
	pla
	sta $22
	pla
	rts
	sta $22
	sty $23
	stx $24
	cpx #$02
	bne la972
	cpy $1f
	bne la972
	cmp $1e
	bne la972
	sbc #$04
	sta $1e
	bcs la969
	dec $1f
la969:	sec
	lda $1d
	sbc #$04
	sta $1d
	ldy #$00
la972:	rts
	ldy $56
	cpy #$0f
	bne la97c
	jmp lacd6
la97c:	ldy $76
	cpy #$02
	bne la990
	ldy $75
	cpy $3a
	bcc la9bd
	bne la990
	lda $74
	cmp $39
	bcc la9bd
la990:	lda $74
	ldy $75
	ldx $76
	sta $5e
	sty $5f
	stx $60
	jsr la94f
	jsr laa33
	bcc la9a7
	jsr la9fc
la9a7:	jsr laa12
	ldx $56
	ldy #$03
la9ae:	jsr lba6e
	lda ($5e),y
	stx $01
	sta ($54),y
	dey
	bpl la9ae
	jmp lba8c
la9bd:	lda $76
	sta $01
	ldy #$00
	lda ($74),y
	jsr lba8c
	jsr la805
	ldx #$02
la9cd:	ldy $5e,x
	sty $7f,x
	dex
	bpl la9cd
	jsr la8ab
	lda $7f
	ldy $80
	ldx $81
	jsr la955
	jsr laa6c
	bcc la9e8
	jsr la9fc
la9e8:	jsr laa12
	ldy #$03
	lda $56
	sta $01
la9f1:	lda $0070,y
	sta ($54),y
	dey
	bpl la9f1
	jmp lba8c
	jsr lba73
	ldy #$00
	lda $54
	sta ($22),y
	iny
	lda $55
	sta ($22),y
	iny
	lda $56
	sta ($22),y
	jmp lba8c
	ldx #$02
laa14:	ldy $54,x
	sty $22,x
	dex
	bpl laa14
	jsr laa33
	bcc laa65
	jsr lba73
	ldy #$02
	lda #$ff
	sta ($22),y
	dey
	sta ($22),y
	dey
	txa
	sta ($22),y
	jmp lba8c
	jsr lba73
	ldy #$00
	lda ($22),y
	pha
	beq laa66
	iny
	lda ($22),y
	pha
	iny
	lda ($22),y
	tax
	iny
	lda ($22),y
	tay
	jsr lba8c
	pla
	cpy $19
	bne laa59
	cpx $18
	bne laa59
	cmp $17
	beq laa66
laa59:	sta $22
	stx $23
	sty $24
	pla
	tax
	jsr lab18
	sec
laa65:	rts
laa66:	jsr lba8c
	pla
	clc
	rts
	lda $70
	pha
	beq laa66
	lda $71
	ldx $72
	ldy $73
	jmp laa4d
	lda $76
	pha
	lda $75
	pha
	lda $74
	pha
	jsr l96ae
	jsr lb506
	pla
	sta $7f
	pla
	sta $80
	pla
	sta $81
	sta $01
	ldy #$00
	lda ($7f),y
	sta $025b
	lda $76
	sta $01
	lda ($74),y
	jsr lba8c
	clc
	adc $025b
	bcc laaad
	jmp lb785
laaad:	jsr la805
	jsr la8ab
	jsr laac8
	jsr la8c4
	lda $7f
	ldy $80
	ldx $81
	jsr la8ef
	jsr la86c
	jmp l95de
	lda $5e
	ldy $5f
	ldx $60
	jmp la8ef
	jsr lb4d9
	txa
	pha
	lda #$01
	jsr la811
	jsr lba69
	pla
	ldy #$00
	sta ($71),y
	jsr lba8c
	pla
	pla
	jmp la86c
	jsr lab70
	pha
	jsr lba6e
	lda ($5e),y
	sta $025b
	pla
	cmp $025b
	tya
	bcc lab02
	lda ($5e),y
	tax
	tya
lab02:	jsr lba8c
	pha
lab06:	txa
lab07:	pha
	jsr la811
	jsr laac8
	pla
	tay
	pla
	jsr lab18
	tya
	jmp la869
	clc
	adc $22
	sta $22
	bcc lab21
	inc $23
lab21:	rts
	jsr lab70
	pha
	jsr lba6e
	lda ($5e),y
	sta $025b
	pla
	clc
	sbc $025b
	eor #$ff
	jmp laafc
	jsr lba29
	cmp #$29
	beq lab8d
	jmp lb4cd
	lda #$ff
	sta $75
	jsr lab38
	jsr lab70
	beq labab
	dex
	txa
	pha
	pha
	clc
	ldx #$00
	jsr lba6e
	lda ($5e),y
	jsr lba8c
	sta $025b
	pla
	sbc $025b
	bcs lab06
	eor #$ff
	cmp $75
	bcc lab07
	lda $75
	bcs lab07
	jsr l972a
	pla
	tay
	pla
	sta $62
	pla
	pla
	pla
	tax
	pla
	sta $5e
	pla
	sta $5f
	pla
	sta $60
	lda $62
	pha
	tya
	pha
	ldy #$00
	txa
lab8d:	rts
	jsr lab94
	jmp l9d37
	jsr la8e6
	ldx #$00
	stx $11
	tay
	rts
	jsr lab94
	beq labab
	ldy #$00
	jsr lb0df
	tay
	jmp l9d37
labab:	jmp l9ba7
	jsr lab94
	bne labb6
	jmp l9eda
labb6:	ldx #$02
labb8:	ldy $85,x
	sty $82,x
	dex
	bpl labb8
	ldx $24
	stx $87
	stx $01
	ldx $22
	stx $85
	clc
	adc $22
	sta $25
	ldx $23
	stx $86
	bcc labd5
	inx
labd5:	stx $26
	ldy #$00
	lda ($25),y
	pha
	tya
	sta ($25),y
	jsr lba8c
	jsr lba29
	jsr la2d8
	jsr lba7d
	pla
	ldy #$00
	sta ($25),y
	jsr lba8c
	ldx $82
	ldy $83
	lda $84
	stx $85
	sty $86
	sta $87
	rts
	pla
	jsr l9724
	jsr lb504
	jsr lb4d9
	txa
	asl
	cmp #$56
	bcs labab
	tay
	lda l828f,y
	sta $25
	lda l8290,y
	sta $26
	jsr lba78
	ldy #$ff
	ldx #$00
lac22:	iny
	lda ($25),y
	beq lac2e
	cmp #$20
	bcc lac22
	inx
	bne lac22
lac2e:	txa
	jsr la811
	ldy #$ff
	ldx #$00
lac36:	iny
	jsr lba78
	lda ($25),y
	beq lac56
	cmp #$20
	bcc lac36
	sty $025b
	pha
	txa
	tay
	pla
	jsr lba69
	sta ($71),y
	tya
	tax
	ldy $025b
	inx
	bne lac36
lac56:	jsr lba8c
	jmp la86c
	jsr $ffde
	pha
	and #$7f
	sta $07
	tya
	and #$9f
	php
	and #$1f
	cmp #$12
	bne lac70
	lda #$00
lac70:	plp
	bpl lac7a
	sei
	sed
	clc
	adc #$12
	cld
	cli
lac7a:	sta $05
	lda #$00
	sta $08
	tya
	rol
	rol
	rol $08
	rol
	rol $08
	txa
	rol
	rol $08
	lsr
	sta $06
	pla
	rol
	rol $08
	lda #$08
	jsr lad53
	stx $22
	sty $23
	ldy #$02
	sty $24
	sty $01
	tay
	dey
	lda #$00
	sta ($22),y
	dey
	lda $08
	clc
	adc #$30
	sta ($22),y
	dey
	ldx #$02
lacb3:	lda $05,x
	pha
	and #$0f
	clc
	adc #$30
	sta ($22),y
	dey
	pla
	and #$70
	lsr
	lsr
	lsr
	lsr
	adc #$30
	sta ($22),y
	dey
	dex
	bpl lacb3
	lda $22
	ldy $23
	ldx $24
	jmp la81f
	jsr la8e9
	pha
	cmp #$06
	beq lace2
	cmp #$07
	bne lad50
lace2:	ldy #$00
	sty $82
lace6:	jsr lad3d
	asl
	asl
	asl
	asl
	sta $0005,y
	jsr lad3d
	ora $0005,y
	sta $0005,y
	iny
	cpy #$03
	bne lace6
	pla
	cmp #$06
	beq lad08
	jsr lad3d
	bne lad0a
lad08:	lda #$00
lad0a:	sta $08
	lda $05
	cmp #$12
	bcc lad1c
	sei
	sed
	sbc #$12
	cld
	cli
	ora #$80
	sta $05
lad1c:	lda #$00
	ror $08
	ror
	ora $07
	pha
	lda #$00
	ror $08
	ror
	ora $06
	tax
	lda #$00
	ror $08
	ror
	ror $08
	ror
	lsr
	ora $05
	tay
	pla
	clc
	jmp $ffdb
	sty $83
	ldy $82
	inc $82
	jsr lb0df
	jsr lba50
	bcs lad50
	sbc #$2f
	ldy $83
	rts
lad50:	jmp l9ba7
	lsr $13
lad55:	tax
	beq lada4
	pha
	lda $3b
	sec
	sbc #$03
	ldy $3c
	bcs lad65
	beq lada5
	dey
lad65:	sta $22
	sty $23
	txa
	eor #$ff
	sec
	adc $22
	bcs lad7b
	sta $025b
	tya
	beq lada5
	lda $025b
	dey
lad7b:	cpy $3a
	bcc lada5
	bne lad85
	cmp $39
	bcc lada5
lad85:	sta $3d
	sty $3e
	jsr lba7d
	ldy #$02
	lda #$ff
	sta ($22),y
	dey
	sta ($22),y
	dey
	pla
	sta ($22),y
	jsr lba8c
	ldx $3d
	ldy $3e
	stx $3b
	sty $3c
lada4:	rts
lada5:	lda $13
	bmi ladb2
	jsr ladb5
	sec
	ror $13
	pla
	bne lad55
ladb2:	jmp l8550
	lda #$02
	sta $01
	lda $1d
	beq ladd9
ladbd:	pha
	jmp lbc29
	tya
	clc
	adc $20
	ldy #$00
	sta ($6a),y
	lda $21
	iny
	sta ($6a),y
	lda #$02
	iny
	sta ($6a),y
	pla
	sec
	sbc #$04
	bne ladbd
ladd9:	ldy #$00
	sty $64
	lda $3f
	ldy $40
	sta $6d
	sta $5b
	sta $3d
	sty $6e
	sty $5c
	sty $3e
laded:	jsr lae56
	bne lae01
ladf2:	ldy #$00
	jsr lba7d
	lda ($5b),y
	jsr laec8
	sec
	ror $64
	bne laded
lae01:	bit $64
	bpl lae3d
	ldx #$00
	stx $64
lae09:	ldy #$02
	jsr lba7d
lae0e:	lda ($5b),y
	sta ($6d),y
	dey
	bpl lae0e
	jsr lae43
	txa
	tay
	jsr lba7d
lae1d:	dey
	lda ($5b),y
	sta ($6d),y
	dex
	bne lae1d
	jsr lba73
	ldy #$02
lae2a:	lda $006c,y
	sta ($22),y
	dey
	bne lae2a
	lda $5b
	ldy $5c
	jsr lae56
	beq ladf2
	bne lae09
lae3d:	jsr lae43
	jmp laded
	ldy #$00
	jsr lba73
	lda ($22),y
	tax
	jsr laed7
	sta $3d
	sty $3e
	txa
	jmp laec8
	cpy $3c
	bcc lae85
	bne lae62
	cmp $3b
	beq lae85
	bcc lae85
lae62:	bit $64
	bmi lae6b
	lda #$03
	jsr laed7
lae6b:	lda #$03
	jsr laec8
	ldy #$02
	jsr lba7d
	lda ($5b),y
	cmp #$ff
	bne lae7c
	rts
lae7c:	lda ($5b),y
	sta $0022,y
	dey
	bpl lae7c
	rts
lae85:	lda $1d
	beq laea1
lae89:	pha
	jmp lbc34
	lda ($20),y
	ldy #$00
	sta ($6a),y
	iny
	lda #$ff
	sta ($6a),y
	iny
	sta ($6a),y
	pla
	sec
	sbc #$04
	bne lae89
laea1:	jsr lba8c
	pla
	pla
	lda $3d
	ldy $3e
	sta $3b
	sty $3c
	rts
	tay
	dey
	dey
	lda ($20),y
	sta $6b
	dey
	lda ($20),y
	sta $6a
	dey
	lda ($20),y
	jmp lbc3f
	sta $6a
	bcc laec7
	inc $6b
laec7:	rts
	eor #$ff
	sec
	adc $5b
	ldy $5c
	bcs laed2
	dey
laed2:	sta $5b
	sty $5c
	rts
	eor #$ff
	sec
	adc $6d
	ldy $6e
	bcs laee1
	dey
laee1:	sta $6d
	sty $6e
	rts
laee6:	jmp l9ba7
	ldx #$02
laeeb:	lda $74,x
	sta $02a0,x
	dex
	bpl laeeb
	jsr l95c1
	jsr lb506
	ldx #$02
laefb:	lda $74,x
	sta $02a3,x
	dex
	bpl laefb
	ldx #$01
	stx $75
	jsr lab38
	jsr l972a
	ldx $75
	beq laee6
	dex
	stx $73
	ldx #$05
laf16:	lda $02a0,x
	sta $64,x
	dex
	bpl laf16
	lda $66
	sta $01
	ldy #$03
laf24:	lda ($64),y
	sta $006a,y
	dey
	bpl laf24
	lda $69
	sta $01
	ldy #$03
laf32:	lda ($67),y
	sta $006e,y
	dey
	bpl laf32
	lda $6e
	beq laf77
	lda $6d
	sta $01
laf42:	lda #$00
	sta $74
	clc
	lda $6e
	adc $73
	bcs laf77
	cmp $6a
	bcc laf53
	bne laf77
laf53:	ldy $74
	cpy $6e
	beq laf72
	tya
	clc
	adc $73
	tay
	lda ($6b),y
	sta $72
	ldy $74
	lda ($6f),y
	cmp $72
	beq laf6e
	inc $73
	bne laf42
laf6e:	inc $74
	bne laf53
laf72:	inc $73
	lda $73
	bit $00a9
	pha
	lda $02a3
	ldy $02a4
	ldx $02a5
	jsr la8ef
	lda $02a0
	ldy $02a1
	ldx $02a2
	jsr la8ef
	jsr lba8c
	pla
	tay
	jmp l9d37
laf9a:	jmp l974f
	beq laf9a
	jsr laff4
	beq laf9a
	lda $6d
	ldx $6e
	sta $25
	stx $26
	jsr l871f
	bcc lafc3
	ldy #$01
	lda ($6d),y
	dey
	tax
	bne lafbd
	lda ($6d),y
	beq lafc3
lafbd:	lda ($6d),y
	sta $6d
	stx $6e
lafc3:	lda $25
	sec
	sbc $6d
	tax
	lda $26
	sbc $6e
	tay
	bcs laff1
	txa
	clc
	adc $2f
	sta $2f
	tya
	adc $30
	sta $30
	ldy #$00
lafdd:	jsr lba8c
	lda ($6d),y
	sta ($25),y
	iny
	bne lafdd
	inc $6e
	inc $26
	lda $30
	cmp $26
	bcs lafdd
laff1:	jmp l869b
	bcc lafff
	beq lafff
	cmp #$ab
	beq lafff
laffc:	lda #$00
	rts
lafff:	jsr lba8c
	jsr l8d4e
	jsr l871f
	jsr lba29
	beq lb019
	cmp #$ab
	bne laffc
	jsr lba26
	jsr l8d4e
	bne laffc
lb019:	lda $1b
	ora $1c
	bne lb025
	lda #$ff
	sta $1b
	sta $1c
lb025:	rts
	ldx #$ff
	stx $0272
	jsr lba26
	jsr l95c1
	jsr lb506
	lda $74
	pha
	lda $75
	pha
	lda $76
	pha
	sta $01
	ldy #$03
	lda ($74),y
	tax
	dey
lb045:	sta $0009,y
	lda ($74),y
	dey
	bpl lb045
	sta $0271
	stx $01
	tay
	beq lb05f
lb055:	dey
	lda ($09),y
	cmp #$23
	beq lb062
	tya
	bne lb055
lb05f:	jmp l974f
lb062:	lda #$3b
lb064:	jsr l9732
	sty $8b
	sty $025f
	jsr l95c1
	bit $11
	bpl lb0ae
	jsr lb2a5
	jsr lb3ea
	ldx $0267
	beq lb094
	ldx #$00
	sec
	lda $026d
	sbc $025e
	bcc lb094
	ldx #$3d
	cpx $0267
	bne lb093
	lsr
	adc #$00
lb093:	tax
lb094:	ldy #$00
lb096:	txa
	beq lb09e
	dex
lb09a:	lda #$20
	bne lb0a7
lb09e:	cpy $025e
	bcs lb09a
	jsr lb0df
	iny
lb0a7:	jsr lb3e3
	bne lb096
	beq lb0ba
lb0ae:	jsr la3e2
	jsr la7e3
	jsr lb2a5
	jsr lb0e7
lb0ba:	jsr lba29
	cmp #$2c
	beq lb064
	sec
	ror $8b
	jsr lb3ea
	pla
	tax
	pla
	tay
	pla
	jsr lba8c
	jsr la8ef
	jsr lba29
	cmp #$3b
	beq lb0dc
	jmp l8ec8
lb0dc:	jmp lba26
	jsr lba73
	lda ($22),y
	jmp lba8c
	lda $0273
	sta $026f
	lda #$ff
lb0ef:	sta $026e
	bit l8c86
lb0f5:	cpy $025e
	beq lb12d
	lda $0200,y
	iny
	cmp #$20
	beq lb0f5
	cmp #$2d
	beq lb0ef
	cmp #$2e
	beq lb0f3
	cmp #$45
	beq lb11f
	sta $0200,x
	stx $0260
	inx
	bit $8c
	bpl lb0f5
	inc $0266
	jmp lb0f5
lb11f:	lda $0200,y
	cmp #$2d
	bne lb129
	ror $0264
lb129:	iny
	sty $0265
lb12d:	lda $8c
	bpl lb133
	stx $8c
lb133:	jsr lb3ea
	lda $0268
	cmp #$ff
	beq lb166
	lda $026b
	beq lb181
	lda $0265
	bne lb159
	ldx $0260
	jsr lb271
	dec $0202,x
	inx
	stx $0265
	jsr lb302
	beq lb17e
lb159:	ldy $026a
	bne lb175
	ldy $026e
	bmi lb175
	lda $0268
lb166:	beq lb1d1
	dec $0268
	bne lb172
	lda $0269
	beq lb1d1
lb172:	inc $0263
lb175:	jsr lb1e9
	jsr lb2c0
	jsr lb1e9
lb17e:	jmp lb338
lb181:	ldy $0265
	beq lb19c
	sta $025e
	sec
	ror $026c
	ldy $8c
	lda $0264
	bpl lb199
	jsr lb223
	beq lb1aa
lb199:	jsr lb204
lb19c:	ldy $8c
	beq lb1aa
	jsr lb306
	bne lb1aa
	dec $0266
	bcs lb1ad
lb1aa:	jsr lb2c0
lb1ad:	sec
	lda $0268
	sbc $0266
	bcc lb1d1
	sta $0263
	ldy $026a
	bne lb1d9
	ldy $026e
	bmi lb1d9
	tay
	beq lb1d1
	dey
	bne lb1dc
	lda $0269
	ora $0266
	bne lb17e
lb1d1:	lda #$2a
lb1d3:	jsr lb3e3
	bne lb1d3
	rts
lb1d9:	tay
	beq lb17e
lb1dc:	lda $0266
	bne lb17e
	dec $0263
	inc $8b
	jmp lb17e
	sec
	lda $0268
	sbc $0266
	beq lb22d
	ldy $8c
	bcc lb20e
	sta $025e
lb1f9:	cpy $0260
	beq lb200
	bcs lb201
lb200:	iny
lb201:	inc $0266
	jsr lb23a
	dec $025e
	bne lb1f9
	beq lb22b
lb20e:	eor #$ff
	adc #$01
	sta $025e
lb215:	cpy $025f
	beq lb21f
	dey
	dec $0266
	bit l8be6
	lda #$80
	jsr lb23c
	dec $025e
	bne lb215
lb22b:	sty $8c
lb22d:	rts
	bne lb269
	eor #$09
	sta $0200,x
	dex
	cpx $0265
	rts
	lda #$00
	ldx $0265
	inx
	bit $026c
	bmi lb255
	eor $0264
	beq lb255
lb24a:	jsr lb27f
	jsr lb22e
	bcs lb24a
	jmp l9f5e
lb255:	lda $0200,x
	dec $0200,x
	cmp #$30
	jsr lb22e
	bcs lb255
	bit $026c
	bpl lb26c
	sty $8c
lb269:	pla
	pla
	rts
lb26c:	lda $0264
	eor #$80
	sta $0264
	lda #$30
	sta $0201,x
	lda #$31
	sta $0202,x
	rts
	lda $0200,x
	inc $0200,x
	cmp #$39
	rts
	clc
	iny
	beq lb291
	cpy $0271
	bcc lb295
lb291:	ldy $8b
	bne lb269
lb295:	jsr lb29c
	inc $026d
	rts
	lda $0b
	sta $01
	lda ($09),y
	jmp lba8c
	jsr la8e9
	sta $025e
	ldx #$0a
	lda #$00
lb2af:	sta $0263,x
	dex
	bpl lb2af
	stx $0262
	stx $8c
	stx $0261
	tax
	tay
	rts
	clc
	lda $8c
	adc $0269
	bcs lb301
	sec
	sbc $8b
	bcc lb301
	cmp $0260
	beq lb2d4
	bcs lb301
lb2d4:	cmp $025f
	bcc lb301
	tax
	lda $0200,x
	cmp #$35
	bcc lb301
lb2e1:	cpx $025f
	beq lb2f0
	dex
	jsr lb27f
	stx $0260
	beq lb2e1
	rts
lb2f0:	lda #$31
	sta $0200,x
	inx
	stx $8c
	dec $8b
	bpl lb301
	inc $8b
	inc $0266
lb301:	rts
	ldy $8c
	beq lb31d
	ldy $025f
	lda $0200,y
	cmp #$30
	rts
lb30f:	inc $8c
	jsr lb23a
	inc $025f
	cpy $0260
	beq lb301
	iny
lb31d:	jsr lb309
	beq lb30f
	rts
lb323:	cpx $0260
	beq lb32d
	inx
	lda $0200,x
	bit $30a9
	lsr $0262
	jsr lb3e3
	bne lb346
	rts
	lda $0261
	bmi lb33f
	inc $8b
lb33f:	ldx $025f
	dex
	ldy $0270
lb346:	jsr lb29c
	iny
	cmp #$2c
	bne lb35f
	bit $0262
	bmi lb359
	lda $0274
	jmp lb332
lb359:	lda $026f
	jmp lb332
lb35f:	cmp #$2e
	bne lb37e
	lda $0275
	jmp lb332
lb369:	lda $8b
	beq lb323
	dec $8b
	lda $0261
	bmi lb32d
	sec
	ror $0261
	lda $0276
	jmp lb32f
lb37e:	cmp #$2b
	beq lb3bd
	cmp #$2d
	beq lb3b8
	cmp #$5e
	bne lb3c3
	lda #$45
	jsr lb3e3
	ldy $0265
	jsr lb309
	bne lb39d
	iny
	jsr lb309
	beq lb3a4
lb39d:	lda #$2d
	bit $0264
	bmi lb3a6
lb3a4:	lda #$2b
lb3a6:	jsr lb3e3
	ldx $0265
	lda $0200,x
	jsr lb3e3
	ldy $0272
	jmp lb328
lb3b8:	lda $026e
	bmi lb359
lb3bd:	lda $026e
	jmp lb332
lb3c3:	lda $0263
	beq lb369
	dec $0263
lb3cb:	bne lb359
	lda $026a
	bmi lb3cb
	jsr lb29c
	cmp #$2c
	bne lb3b8
	lda $026f
	jsr lb3e3
	iny
	jmp lb3d2
	jsr lb53a
	dec $026d
lb3e9:	rts
	ldy $0272
lb3ed:	jsr lb288
	jsr lb49e
	bne lb409
	sty $0270
	bcc lb413
	tax
lb3fb:	jsr lb288
	bcs lb405
	jsr lb4a6
	beq lb40e
lb405:	ldy $0270
	txa
lb409:	jsr lb53a
	bcc lb3ed
lb40e:	bcs lb3fb
	ldy $0270
lb413:	ldx $8b
	bne lb3e9
	stx $026d
	dey
lb41b:	dec $026d
lb41e:	jsr lb288
	bcs lb497
	cmp #$2c
	beq lb41e
	jsr lb475
	bcc lb41b
	cmp #$2e
	bne lb438
	inx
	cpx #$02
	bcc lb41e
lb435:	jmp l974f
lb438:	jsr lb4aa
	bne lb448
	bcc lb442
	sta $0267
lb442:	inc $0268,x
	jmp lb41e
lb448:	cmp #$24
	bne lb45b
	bit $0261
	bpl lb442
	clc
	ror $0261
	dec $0268
	jmp lb442
lb45b:	cmp #$5e
	bne lb475
	ldx #$02
lb461:	jsr lb288
	bcs lb435
	cmp #$5e
	bne lb435
	dex
	bpl lb461
	inc $026b
	jsr lb288
	bcs lb497
lb475:	cmp #$2b
	bne lb492
	lda $026e
	bpl lb483
	lda #$2b
	sta $026e
lb483:	lda $026a
	bne lb435
	ror $026a
	sty $0272
	inc $026d
	rts
lb492:	cmp #$2d
	beq lb483
	sec
lb497:	sty $0272
	dec $0272
	rts
	cmp #$2b
	beq lb4b7
	cmp #$2d
	beq lb4b7
	cmp #$2e
	beq lb4b7
	cmp #$3d
	beq lb4b7
	cmp #$3e
	beq lb4b7
	cmp #$23
	bne lb4b7
	clc
lb4b7:	rts
	lda #$01
	sta $87
	clc
	lda $2d
	adc #$ff
	sta $85
	lda $2e
	adc #$ff
	sta $86
	rts
	jsr lb4e5
	jsr l9730
	jmp lb4d6
	jsr lba26
	jsr lb501
	jsr l9b0c
	ldx $74
	bne lb4fe
	ldx $75
	jmp lba29
	jsr lb501
	lda $76
	bmi lb4fe
	lda $71
	cmp #$91
	bcs lb4fe
	jsr la280
	lda $74
	ldy $75
	sty $1b
	sta $1c
	rts
lb4fe:	jmp l9ba7
	jsr l95c1
	clc
	bit $38
	bit $11
	bmi lb50e
	bcs lb510
lb50d:	rts
lb50e:	bcs lb50d
lb510:	ldx #$40
	jmp l8552
; strprt
	jsr la8e9
	tax
	ldy #$00
	inx
	jsr lba73
	dex
	beq lb52b
	lda ($22),y
	jsr lb53a
	iny
	jmp lb51f
lb52b:	jmp lba8c
	lda $1a
	beq lb535
	lda #$20
	bit $1da9
	bit $3fa9
	jsr lbbf4
	and #$ff
	rts
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	asl $6f08
	lda #$00
	ldx #$ff
	pha
	txa
	pha
	lda #$00
	sta $8b
	sta $8c
	ldx #$26
lb556:	sta $0200,x
	dex
	bne lb556
	ldx #$06
lb55e:	lda lb540,x
	sta $021b,x
	dex
	bpl lb55e
	ldx $0257
	stx $021a
	jsr lba29
	bne lb580
	pla
	and $8c
	bne lb5d3
	pla
	jsr lb7b5
	lda $8b
	ldx $8c
	rts
lb580:	cmp #$23
	beq lb5c0
	cmp #$57
	beq lb5d6
	cmp #$4c
	beq lb5d6
	cmp #$52
	bne lb5a6
	jsr lba26
	jmp lb692
lb596:	jsr lb71e
lb599:	jmp lb68e
lb59c:	jsr lb72b
	bne lb599
lb5a1:	jsr lb73c
	beq lb599
lb5a6:	cmp #$44
	beq lb602
	cmp #$91
	beq lb596
	cmp #$42
	beq lb5a1
	cmp #$55
	beq lb59c
	cmp #$50
	beq lb622
	cmp #$49
	bne lb5f8
	beq lb61b
lb5c0:	lda #$04
	jsr lb7b5
	jsr lb78a
	cpx #$00
	beq lb618
	stx $021f
	lda #$04
	bne lb599
lb5d3:	jmp l974f
lb5d6:	tax
	lda #$40
	jsr lb7b5
	cpx #$57
	bne lb5e6
	jsr lba26
	jmp lb5f4
lb5e6:	jsr lb78a
	cpx #$00
	beq lb618
	cpx #$ff
	beq lb618
	stx $0222
	lda #$40
	bne lb616
lb5f8:	cmp #$22
	beq lb661
	cmp #$28
	beq lb661
	bne lb5d3
lb602:	lda #$10
	jsr lb7b5
	jsr lb78a
	cpx #$02
	bcs lb618
	stx $0211
	stx $0216
	lda #$10
lb616:	bne lb68e
lb618:	jmp lb71b
lb61b:	lda $0225
	beq lb64a
	bne lb5d3
lb622:	lda #$02
	jsr lb7ba
	jsr lb79d
	sty $021b
	sta $021c
	lda #$02
lb632:	ora $8c
	sta $8c
	bne lb692
lb638:	lda #$04
	jsr lb7ba
	jsr lb79d
	sty $021d
	sta $021e
	lda #$04
	bne lb632
lb64a:	jsr lba26
	sta $0223
	jsr lba26
	sta $0224
	lda #$ff
	sta $0225
	jsr lba26
	jmp lb692
lb661:	lda #$01
	jsr lb757
	sta $0210
	sta $0f
	lda #$00
	sta $0212
	lda #$02
	sta $0213
	lda #$0f
	sta $0214
	ldy #$00
	jsr lba73
lb67f:	lda ($22),y
	sta $0200,y
	iny
	cpy $0f
	bcc lb67f
	jsr lba8c
	lda #$01
lb68e:	ora $8b
	sta $8b
lb692:	jsr lba29
	bne lb6b0
lb697:	jmp lb572
lb69a:	cmp #$91
	bne lb6a1
	jmp lb596
lb6a1:	cmp #$a4
	beq lb6a7
	bne lb719
lb6a7:	jsr lba26
	cmp #$50
	bne lb6bd
	beq lb638
lb6b0:	cmp #$2c
	bne lb69a
	jsr lba26
	jmp lb580
lb6ba:	jsr lba26
lb6bd:	cmp #$44
	beq lb6d1
	cmp #$91
	beq lb6e4
	cmp #$55
	beq lb6ea
	cmp #$22
	beq lb6ef
	cmp #$28
	beq lb6ef
lb6d1:	lda #$20
	jsr lb7b5
	jsr lb78a
	cpx #$02
	bcs lb71b
	stx $0216
	lda #$20
	bne lb704
lb6e4:	jsr lb71e
	jmp lb704
lb6ea:	jsr lb72b
	bne lb704
lb6ef:	lda #$02
	jsr lb757
	sta $0215
	stx $0217
	sty $0218
	lda $24
	sta $0219
	lda #$02
lb704:	ora $8b
	sta $8b
	jsr lba29
	beq lb697
	cmp #$2c
	beq lb6ba
	cmp #$91
	beq lb6e4
	cmp #$55
	beq lb6ea
lb719:	bne lb754
lb71b:	jmp l9ba7
	jsr lba26
	cmp #$55
	beq lb72b
	cmp #$42
	beq lb73c
	bne lb754
lb72b:	jsr lb78a
	cpx #$20
	bcs lb71b
	cpx #$03
	bcc lb71b
	stx $0220
	lda #$08
	rts
lb73c:	lda #$01
	jsr lb7ba
	jsr lb78a
	cpx #$10
	bcs lb71b
	stx $021a
	lda #$01
	ora $8c
	sta $8c
	lda #$00
	rts
lb754:	jmp l974f
	jsr lb7b5
	jsr l91b6
	tax
	beq lb71b
	ldy #$00
	jsr lb0df
	cmp #$40
	bne lb77b
	lda #$80
	jsr lb7b5
	lda $8b
	ora #$80
	sta $8b
	dex
	inc $22
	bne lb77b
	inc $23
lb77b:	txa
	cmp #$11
	bcs lb785
	ldx $22
	ldy $23
	rts
lb785:	ldx #$42
	jmp l8552
	jsr lba26
	beq lb754
	bcc lb79a
	jsr l972d
	jsr lb4d6
	jmp l972a
lb79a:	jmp lb4d6
	jsr lba26
	beq lb754
	bcc lb7b2
	jsr l972d
	jsr lb4e5
	jsr l972a
	ldy $1b
	lda $1c
	rts
lb7b2:	jmp lb4e5
	and $8b
	bne lb754
	rts
	and $8c
	bne lb754
	rts
	!byte $ff
	ora ($05,x)
	asl $1b,x
	and ($23,x)
	!byte $27
	ora $372f
	!byte $3b
	eor #$d1
	bit $d1
	!byte $3a
	sbc ($f0),y
	cmp ($3a),y
	sbc ($2c),y
	sbc ($2c,x)
	cpx #$43
	!byte $d2
	!byte $3a
	!byte $f2
	and $3ad2,x
	!byte $f2
	bit $3ad1
	sbc ($2c),y
	eor ($4e,x)
	cmp ($3a),y
	sbc ($2c),y
	bne lb844
	cmp ($44),y
	!byte $d2
	and $43d1,x
	!byte $d2
	!byte $3a
	!byte $f2
	and $3ad1,x
	sbc ($52),y
	cmp ($3a),y
	!byte $f2
	and $3ad1,x
	sbc ($53),y
	cmp ($3a),y
	sbc ($50),y
	!byte $c2
	!byte $e2
	cpx #$20
	!byte $fa
	clv
	ldy #$02
	lda #$04
	sta $0f
	lda lb7bf,y
	pha
	jsr lb994
	ldx #$00
lb81d:	pla
	dec $0f
	bmi lb86a
	tay
	iny
	tya
	pha
	lda lb7cb,y
	bpl lb862
	cmp #$c2
	beq lb87d
	cmp #$d0
	beq lb88c
	cmp #$e2
	beq lb8aa
	cmp #$e1
	beq lb898
	cmp #$f0
	beq lb882
	cmp #$f1
	beq lb8b4
	cmp #$f2
	beq lb868
	cmp #$e0
	bne lb850
	lda $0222
	bne lb862
lb850:	cmp #$d1
	bne lb859
	lda $0211
	bpl lb860
lb859:	cmp #$d2
	bne lb81d
	lda $0216
lb860:	ora #$30
lb862:	sta $0226,x
	inx
	bne lb81d
lb868:	beq lb8c8
lb86a:	txa
	pha
	ldx #$26
	ldy #$02
	stx $64
	sty $65
	ldy #$0f
	sty $66
	jsr lb9e8
	pla
	rts
lb87d:	lda $0221
	bne lb862
lb882:	bit $8b
	bmi lb888
	bpl lb81d
lb888:	lda #$40
	bne lb862
lb88c:	lda $0223
	sta $0226,x
	inx
	lda $0224
	bne lb862
lb898:	lda $0222
	beq lb8a1
	lda #$4c
	bne lb862
lb8a1:	lda #$53
	sta $0222
	lda #$57
	bne lb862
lb8aa:	lda $1b
	sta $0226,x
	lda $1c
	inx
	bne lb862
lb8b4:	lda $0212
	sta $22
	lda $0213
	sta $23
	lda $0214
	ldy $0210
	beq lb8ec
	bne lb8da
lb8c8:	lda $0217
	sta $22
	lda $0218
	sta $23
	lda $0219
	ldy $0215
	beq lb8ec
lb8da:	sta $01
	sty $0e
	ldy #$00
lb8e0:	lda ($22),y
	sta $0226,x
	inx
	iny
	cpy $0e
	bne lb8e0
	bit $ca
	jsr lba8c
	jmp lb81d
	and #$e6
	beq lb8fa
lb8f7:	jmp l974f
lb8fa:	lda $8b
	and #$01
	cmp #$01
	bne lb8f7
	lda $8b
	rts
	and #$e7
	bne lb8f7
	rts
	and #$c4
	bne lb8f7
	lda $8b
	and #$03
	cmp #$03
	bne lb8f7
	lda $8b
	rts
	and #$05
	cmp #$05
	bne lb8f7
	lda $8b
	rts
	lda #$00
	jsr $ffbd
	ldy #$6f
	jsr l935b
	ldx #$0e
	jsr lbbfa
	ldy #$ff
	jsr lba7d
lb936:	iny
	jsr lbbee
	cmp #$0d
	beq lb944
	sta ($17),y
	cpy #$27
	bne lb936
lb944:	lda #$00
	sta ($17),y
	lda #$28
	sta $16
	jsr lba8c
	jsr $ffcc
	lda #$0e
	clc
	jsr lbc13
	jmp l9350
	jsr l9d57
	bne lb992
	ldx #$14
	jsr la3c3
	jsr $ffcc
	jsr lbbee
	cmp #$59
	bne lb988
	jsr lbbee
	cmp #$0d
	beq lb992
	cmp #$45
	bne lb988
	jsr lbbee
	cmp #$53
	bne lb988
	jsr lbbee
	cmp #$0d
	beq lb992
lb988:	cmp #$0d
	sec
	beq lb993
	jsr lbbee
	bne lb988
lb992:	clc
lb993:	rts
	lda #$00
	sta $16
	clc
	jmp lbbde
	jsr l91b6
	sta $0210
	lda $22
	ldy $23
	sta $0212
	sty $0213
	ldy $24
	sty $0214
	rts
	ldx #$00
	stx $0210
	stx $0221
	stx $021f
	ldx #$01
	stx $0220
	jsr lba29
	beq lb9d6
	jsr lb99c
	jsr lb9f9
	stx $0220
	jsr lb9f9
	stx $0221
lb9d6:	lda $0212
	ldx $0213
	ldy $0214
	sta $64
	stx $65
	sty $66
	lda $0210
	ldx #$64
	jsr $ffbd
	lda $021f
	ldx $0220
	ldy $0221
	jmp $ffba
	jsr lba29
	beq lb9d6
	jmp l9291
	jsr l9730
	jsr lba29
	bne lba1b
	jmp l974f
	lda $76
	cmp #$0f
	bne lba1c
	clc
	lda #$00
	sbc $74
	lda #$80
	sbc $75
lba1b:	rts
lba1c:	sec
	rts
	jsr l9b13
	lda $74
	ldy $75
	rts
	jmp ($0290)
	jmp ($028e)
	jsr lba5a
	jmp lba3b
	jsr lba5a
lba35:	inc $85
	bne lba3b
	inc $86
lba3b:	ldy #$00
	lda ($85),y
	cmp #$20
	beq lba35
	jsr lba50
	php
	pha
	lda $025b
	sta $01
	pla
	plp
	rts
	cmp #$3a
	bcs lba59
	sbc #$2f
	sec
	sbc #$d0
lba59:	rts
	lda $01
	sta $025b
	lda $87
	sta $01
	rts
	lda #$00
	ora ($22),y
	rts
	pha
	lda $73
	bpl lba8f
	pha
	lda $60
	bpl lba8f
	pha
	lda $24
	bpl lba8f
	pha
	lda #$0f
	bpl lba8f
	pha
	lda #$02
	bpl lba8f
	pha
	lda #$02
	bpl lba8f
	pha
	lda #$02
	bpl lba8f
	pha
	lda #$01
lba8f:	sta $01
	pla
	rts
	jsr lbc16
	sec
	jsr $ff99
	stx $02a6
	sty $02a7
	sec
	txa
	sbc #$a1
	sta $88
	tya
	sbc #$00
	sta $89
	sec
	txa
	sbc #$2b
	sta $17
	tax
	bcs lbab5
	dey
lbab5:	sty $18
	sec
	txa
	sbc #$0c
	sta $20
	tax
	bcs lbac1
	dey
lbac1:	sty $21
	sec
	txa
	sbc #$07
	sta $8d
	tax
	bcs lbacd
	dey
lbacd:	sty $8e
	sec
	txa
	sbc #$04
	tax
	bcs lbad7
	dey
lbad7:	stx $3f
	sty $40
	ldy $89
	ldx $88
	bne lbae2
	dey
lbae2:	dex
	stx $22
	sty $23
	lda #$83
	ldy #$00
	jsr lba8c
	sta ($22),y
	lda #$02
	sta $01
	sta $41
	sta $19
	ldy #$06
lbafa:	lda lbb20,y
	sta ($8d),y
	dey
	bne lbafa
	tya
	ldx #$04
lbb05:	sta ($3f),y
	iny
	dex
	bne lbb05
	lda #$28
	tay
	sta ($17),y
	iny
	lda #$ff
	sta ($17),y
	iny
	sta ($17),y
	lda $3f
	ldy $40
	sta $3b
	sty $3c
	rts
	!byte $80
	!byte $4f
	!byte $c7
	!byte $52
	cli
	bit lbc20
	!byte $bb
	ldx #$02
lbb2c:	lda lb4fe,x
	sta $02,x
	dex
	bpl lbb2c
	sta $61
	ldx #$04
lbb38:	lda lbbc7,x
	sta $0259,x
	dex
	bne lbb38
	stx $78
	stx $1a
	stx $16
	stx $0258
	stx $1d
	dex
	stx $1e
	stx $1f
	sec
	jsr $ff9c
	stx $31
	sty $32
	stx $2d
	sty $2e
	jsr lba93
	jsr lba8c
	ldy #$00
	tya
	sta ($2d),y
	inc $2d
	bne lbb6e
	inc $2e
lbb6e:	ldx #$26
	jsr la3c3
	jsr l8a2b
	ldx #$cc
	ldy #$bb
	jsr $ff6f
	cli
	jmp l85c0
	!byte $93
	rol
	rol
	rol
	jsr $4f43
	eor $4f4d
	!byte $44
	!byte $4f
	!byte $52
	eor $20
	!byte $42
	eor ($53,x)
	eor #$43
	jsr $3231
	sec
	bit $5620
	!byte $34
	rol $2030
	rol
	rol
	rol
	ora $000d
	eor $85,x
	cmp $c285
	dey
	!byte $f4
	!byte $89
	!byte $54
	!byte $87
	lda ($96),y
	cpy $95
	bit $32ba
	tsx
	asl $39ba,x
	sta $15a2,x
lbbbe:	lda lbba6,x
	sta $0280,x
	dex
	bpl lbbbe
	rts
	lda $ffff
	rts
	sei
	jsr $ff7b
	jsr lbc16
	jsr $ff7e
	jsr lba8c
	cli
	jmp l85c0
	sec
	jmp $ffb7
	clc
	jsr $ffc0
	bcs lbc1a
	rts
	jsr $ffe4
	bcs lbc1a
	rts
	jsr $ffcf
	bcs lbc1a
	rts
	jsr $ffd2
	bcs lbc1a
	rts
	jsr $ffc6
	bcs lbc1a
	rts
	jsr $ffc9
	bcs lbc1a
	rts
	jsr $ffd5
	bcs lbc1a
	rts
	jsr $ffd8
	bcs lbc1a
	rts
	sec
	jmp $ffc3
	clc
	jmp $ffe7
lbc1a:	clc
	rol
	pha
	lda #$0e
	clc
	jsr lbc13
	pla
	tax
	jmp l8552
	brk
	jsr laeaf
	beq lbc31
	jmp ladc1
lbc31:	jmp ladd3
	jsr laeaf
	beq lbc3c
	jmp lae8d
lbc3c:	jmp lae9b
	pha
	clc
	adc $6a
	sta $6a
	bcc lbc49
	inc $6b
lbc49:	pla
	rts
	lda $dd
	pha
	lda $ca
	sta $dd
	jsr l8f75
	pla
	sta $dd
	rts
	jsr la090
	rts
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
