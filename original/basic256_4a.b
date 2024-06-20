; disassembled by DASM6502a v.3.1 by Marat Fayzullin
; modified by Vossi 02/2019
!cpu 6502
*= $8000
	jmp lba89
	jmp lbb39
	!byte $c3
	!byte $c2
	cmp l9438
	!byte $8b
	ror $f08a,x
	txa
	cmp #$8c
	and $8f,x
	bvc l7fa5
	inc $90,x
	!byte $d4
	!byte $8f
	!byte $74
	sta l8c6e
	sbc ($8b),y
	bit $638c
	!byte $8b
	!byte $0f
	sty l8ca2
	adc ($8c,x)
	!byte $92
	!byte $8b
	ora $8d,x
	!byte $3c
	sta ($b2),y
	sta ($05),y
	!byte $92
	ldx $91
	brk
	sta ($30),y
	sta ($64),y
	stx l8e87
	!byte $d3
	!byte $8b
	!byte $73
	!byte $89
	!byte $2b
	txa
	ror
	stx l90d1
	and l8192
	!byte $92
	!byte $ff
	stx l8a0f
	ror $8c
	bmi l7fe9
	!byte $57
l8055:	!byte $93
	!byte $93
	!byte $93
	dey
	sty $11,x
	sty $fd,x
	sty $4a,x
	sta $14,x
	sta $68,x
	!byte $93
	lda lb893
	!byte $93
	!byte $8b
	!byte $92
	!byte $3c
	sta $4e,x
	sty $8b,x
	!byte $92
	!byte $f4
	sty $c8,x
	!byte $93
	sed
	!byte $93
	dec $93,x
	adc #$91
	inc $61ae,x
	sty l8d00
	ldx $0e8d
	stx la72b
	!byte $7c
	lda ($1d,x)
	ldx #$9b
	lda ($02,x)
	brk
	!byte $3b
	!byte $9c
	!byte $9f
	!byte $9c
	!byte $a3
	ldy $c5
	lda $36
	!byte $9f
	!byte $1f
	lda $12
	ldx $19
	ldx $64
	ldx $fd
	ldx $73
	sta laaf0,x
	!byte $47
	!byte $a7
	bpl l8055
	!byte $ff
	tax
	!byte $33
	tax
	eor l84aa
	tax
	ldy $aa
	adc l9db8,y
	adc l9d9b,y
	!byte $7b
	ror $9f,x
	!byte $7b
	!byte $54
	ldy #$7f
	ldy $50a4
	cli
	tya
	lsr $55
	tya
	adc la4e5,x
	!byte $5a
	!byte $e2
	stx $64,y
	!byte $92
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
	bvc l813f
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
	bne l8167
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
	bvc l818c
	eor #$4e
	!byte $d4
	!byte $43
	!byte $4f
l813f:	lsr $4cd4
	eor #$53
	!byte $d4
	!byte $43
	jmp $43d2
	eor $53c4
	eor $4fd3,y
	bvc l8196
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
	bvc l81ab
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
l818c:	!byte $d2
	lsr $52
	cmp $50
	!byte $4f
	!byte $d3
	!byte $53
	eor ($d2),y
l8196:	!byte $52
	lsr $4cc4
	!byte $4f
	!byte $c7
	eor $58
	bne l81e3
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
l81d8:	!byte $4f
	bvc l8220
	dec $4344
	jmp $534f
	cmp $52
l81e3:	eor $43
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
	bvc l81d8
	eor ($50,x)
	bvc l8248
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
l8248:	cmp $45
	jmp $c553
	!byte $54
	!byte $52
	eor ($d0,x)
	!byte $52
	eor $53
	eor $4d,x
	cmp $44
	eor #$53
	bvc l82ab
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
	cpy $de82
	!byte $82
	sbc $f782
	!byte $82
	ora $83
	!byte $14
	!byte $83
	!byte $27
	!byte $83
	rol $83,x
	lsr $83
	cli
	!byte $83
	ror $7e83
	!byte $83
	!byte $c3
	sty $be
	sty $cc
	sty $d3
	sty $e2
	sty $00
	!byte $02
	!byte $f3
	sty $ee
	tsx
	txa
	!byte $83
	!byte $9b
	!byte $83
	tay
	!byte $83
	lda $c983,x
	!byte $83
	!byte $da
	!byte $83
	!byte $e3
	!byte $83
	sbc ($83),y
	ora $84
	!byte $13
	sty $21
	sty $32
	sty $41
	sty $4f
	sty $5f
	sty $69
	sty $7d
	sty $8d
	sty $a0
	sty $ae
	sty $f9
	sty $25
	sta $36
	sta $06
	sta $12
	sta $53
	!byte $54
	!byte $4f
	bvc l82f1
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
	bvc l833a
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
	bvc l8384
	!byte $54
	jsr $4946
	jmp $0045
	lsr $544f
	jsr $554f
	!byte $54
	bvc l8394
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
l8394:	eor $54,x
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
	!byte $4f
	eor $54,x
	jsr $464f
	jsr $5241
	!byte $52
	eor ($59,x)
	jsr $5053
	eor ($43,x)
	eor $00
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
	bvc l8594
	!byte $53
	eor $00
	ldx #$34
	jmp ($0280)
	stx $8f
	cpx #$36
	beq l858a
	jsr l9cc3
	beq l858a
	ldy $0297
	iny
	beq l858a
	dey
	sty $1c
	sty $029d
	ldy $0296
	sty $1b
	ldy #$ff
	sty $0297
	ldx #$01
l8570:	lda $42,x
	sta $0298,x
	lda $46,x
	sta $029a,x
	dex
	bpl l8570
	ldx $029c
	txs
	jsr lb9ee
	jsr l8c8b
	jmp l8778
l858a:	lda $1a
	beq l8595
	jsr $ffcc
	lda #$00
	sta $1a
l8595:	jsr l8eb3
	jsr lb49a
	ldx $8f
	jsr la32f
	jsr l8a60
	jsr lb9ee
	ldy $43
	cpy #$fa
	bcs l85b8
	ldx #$1a
	jsr la32f
	lda $43
	ldx $42
	jsr la320
l85b8:	ldx #$18
	jsr la32f
	lda #$80
	jsr $ff90
; main
l85c2:	jmp ($0282)
	ldx #$ff
	stx $43
	stx $0298
	stx $0299
	stx $8f
	jsr l86db
	sta $85
	sty $86
	stx $87
	jsr lb988
	tax
	beq l85c2
	bcc l85eb
	jsr l88a6
	jsr lb98b
	jmp l874f
l85eb:	jsr l8d39
	jsr l88a6
	sty $0e
	jsr l8717
	bcc l863f
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
	bcs l8629
	inx
	dec $26
l8629:	clc
	adc $22
	bcc l8631
	dec $23
	clc
l8631:	lda ($22),y
	sta ($25),y
	iny
	bne l8631
	inc $23
	inc $26
	dex
	bne l8631
l863f:	jsr l8a2e
	jsr l869c
	ldy #$00
	lda ($85),y
	bne l864e
	jmp l85c2
l864e:	clc
	lda $2f
	ldy $30
	sta $67
	sty $68
	adc $0e
	bcc l865c
	iny
l865c:	clc
	adc #$04
	bcc l8662
	iny
l8662:	sta $64
	sty $65
	jsr l880d
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
	bcc l8687
	inc $6e
l8687:	ldy $0e
	dey
l868a:	lda ($85),y
	sta ($6d),y
	dey
	dec $0e
	bne l868a
	jsr l869c
	jsr l8a27
	jmp l85c2
;
	lda $2d
	ldy $2e
	sta $22
	sty $23
	clc
l86a5:	ldy #$00
	lda ($22),y
	bne l86b0
	iny
	lda ($22),y
	beq l86cc
l86b0:	ldy #$04
l86b2:	iny
	lda ($22),y
	bne l86b2
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
	bcc l86a5
l86cc:	clc
	lda $22
	ldy $23
	adc #$02
	bcc l86d6
	iny
l86d6:	sta $2f
	sty $30
	rts
	lda $88
	ldy $89
	ldx #$01
	sta $22
	sty $23
	stx $24
	ldy #$00
l86e9:	sty $0e
	jsr lbb5b
	cmp #$0d
	beq l86fe
	ldy $0e
	sta ($22),y
	iny
	cpy #$a1
	bcc l86e9
	jmp lb6e7
l86fe:	ldy $0e
	lda #$00
	sta ($22),y
	lda $1a
	bne l870b
	jsr l8eb3
l870b:	ldy $23
	ldx $22
	bne l8712
	dey
l8712:	dex
	txa
	ldx #$01
	rts
	lda $2d
	ldx $2e
l871b:	sta $6d
	stx $6e
	ldy #$00
	lda ($6d),y
	bne l872a
	iny
	lda ($6d),y
	beq l8734
l872a:	ldy #$03
	lda ($6d),y
	cmp $1c
	beq l8736
	bcc l873f
l8734:	clc
l8735:	rts
l8736:	dey
	lda ($6d),y
	cmp $1b
	beq l8735
	bcs l8734
l873f:	ldy #$01
	lda ($6d),y
	tax
	dey
	lda ($6d),y
	bcc l871b
; ngone 
l8749:	jmp ($0288)
	jsr lb988
	jsr l87a0
	jsr $ffe1
	bne l8773
	sec
	jmp l8b9a
	lda ($85),y
	bne l8767
	iny
	lda ($85),y
	bne l8767
l8764:	jmp l85b8
l8767:	ldy #$03
	lda ($85),y
	sta $42
	iny
	lda ($85),y
	sta $43
	rts
;
l8773:	jsr l9cc3
	beq l8784
	lda $85
	ldy $86
	sta $46
	sty $47
	tsx
	stx $029c
l8784:	ldy #$00
	lda ($85),y
	bne l87c9
	jsr l9cc3
	beq l8764
	ldy #$01
	jsr l875b
	tya
	clc
	adc $85
	sta $85
	bcc l8749
	inc $86
	bne l8749
	beq l880c
	cmp #$ff
	beq l87d0
	sec
	sbc #$80
	bcc l87c6
	cmp #$23
	bcc l87b9
	cmp #$4b
	bcc l87d0
	cmp #$67
	bcs l87d0
	sbc #$27
l87b9:	asl
	tay
	lda l800b,y
	pha
	lda l800a,y
	pha
	jmp lb988
l87c6:	jmp l8d75
l87c9:	cmp #$3a
	bne l87d0
	jmp l8749
l87d0:	jmp l973a
;
	tsx
	inx
	inx
	inx
	inx
l87d8:	lda $0101,x
	cmp #$81
	bne l880c
	lda $56
	bpl l87f2
	lda $0102,x
	sta $54
	lda $0103,x
	sta $55
	lda $0104,x
	sta $56
l87f2:	cmp $0104,x
	bne l8805
	lda $55
	cmp $0103,x
	bne l8805
	lda $54
	cmp $0102,x
	beq l880c
l8805:	txa
	clc
	adc #$13
	tax
	bne l87d8
l880c:	rts
	jsr l8886
	sta $2f
	sty $30
	bcc l881e
	jsr l886d
	sta $33
	sty $34
	rts
l881e:	sec
	lda $67
	sbc $6d
	sta $22
	tay
	lda $68
	sbc $6e
	tax
	inx
	tya
	beq l8852
	lda $67
	sec
	sbc $22
	sta $67
	bcs l883b
	dec $68
	sec
l883b:	lda $64
	sbc $22
	sta $64
	bcs l884b
	dec $65
	bcc l884b
l8847:	lda ($67),y
	sta ($64),y
l884b:	dey
	bne l8847
	lda ($67),y
	sta ($64),y
l8852:	dec $68
	dec $65
	dex
	bne l884b
	jmp lb9ee
	asl
	adc #$34
	bcs l8868
	sta $22
	tsx
	cpx $22
	bcs l8885
l8868:	ldx #$50
	jmp l854a
	cpy $02a7
	bcc l8885
	bne l8879
	cmp $02a6
	bcc l8885
l8879:	jmp l8548
	jsr l9917
	sta $54
	sty $55
	stx $56
l8885:	rts
	cpy $89
	bcc l8885
	bne l8890
	cmp $88
	bcc l8885
l8890:	ldx #$56
	jmp l854a
	cpy $02a7
	bcc l8885
	bne l88a1
	cmp $02a6
	bcc l8885
l88a1:	ldx #$58
	jmp l854a
; crunch
	jmp ($0284)
	lda $85
	pha
	lda $86
	pha
l88af:	jsr lb98b
	jmp l88b8
l88b5:	jsr lb988
	bcc l88b5
	cmp #$00
	beq l8917
	cmp #$3a
	beq l88b5
	cmp #$3f
	bne l88ce
	lda #$99
	ldy #$00
	sta ($85),y
	beq l88b5
l88ce:	cmp #$80
	bcc l88dd
	cmp #$ff
	beq l88b5
	ldy #$01
	jsr l8926
	beq l88af
l88dd:	cmp #$22
	bne l88ee
l88e1:	jsr lb988
	cmp #$00
	beq l8917
	cmp #$22
	beq l88b5
	bne l88e1
l88ee:	jsr l893e
	bcc l88b5
	cpy #$00
	beq l88fa
	jsr l8926
l88fa:	lda $0e
	ldy #$00
	sta ($85),y
	cmp #$8f
	beq l8911
	cmp #$83
	bne l88b5
	jsr lb988
	jsr l8cca
	jmp l88af
l8911:	jsr lb988
	jsr l8c62
l8917:	ldx $85
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
l8934:	lda ($22),y
	sta ($85),y
	iny
	cmp #$00
	bne l8934
	rts
; reser
	lda #$80
	ldy #$d2
	sta $23
	sty $22
	ldy #$00
	sty $0e
	dey
l894b:	iny
l894c:	lda ($85),y
	sec
	sbc ($22),y
	beq l894b
	cmp #$80
	beq l896f
l8957:	jsr lb9c6
	bmi l895f
	iny
	bne l8957
l895f:	iny
	inc $0e
	clc
	tya
	jsr laa7b
	clc
	ldy #$00
	jsr lb9c6
	bne l894c
l896f:	ora $0e
	sta $0e
	rts
;
	jsr laf56
	bne l897a
	rts
l897a:	pla
	pla
	ldy #$01
	sty $13
	lda ($6d),y
	bne l8989
	dey
	lda ($6d),y
	beq l89d5
l8989:	ldy #$01
	jsr $ffe1
	bne l8994
	clc
	jmp l8b9a
l8994:	jsr l8eb3
	iny
	lda ($6d),y
	tax
	iny
	lda ($6d),y
	cmp $1c
	bne l89a6
	cpx $1b
	beq l89a8
l89a6:	bcs l89d5
l89a8:	sty $54
	jsr la320
	lda #$20
l89af:	ldy $54
; qplop
	and #$7f
l89b3:	jsr lb49c
	cmp #$22
	bne l89c0
	lda $13
	eor #$ff
	sta $13
l89c0:	iny
	beq l89d5
	lda ($6d),y
	bne l89d8
	tay
	lda ($6d),y
	tax
	iny
	lda ($6d),y
	stx $6d
	sta $6e
	jmp l897c
l89d5:	jmp l85b8
l89d8:	jmp ($0286)
	bpl l89b3
	cmp #$ff
	beq l89b3
	bit $13
	bmi l89b3
	tax
	sty $54
	ldy #$80
	sty $23
	ldy #$d2
	sty $22
	ldy #$00
	asl
	beq l8a06
l89f5:	dex
	bpl l8a05
l89f8:	inc $22
	bne l89fe
	inc $23
l89fe:	jsr lb9c6
	bpl l89f8
	bmi l89f5
l8a05:	iny
l8a06:	jsr lb9c6
	bmi l89af
	jsr lb49c
	bne l8a05
;
	bne l8a7a
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
	jsr lb41a
	lda #$00
	bne l8a7a
	jsr lba7a
	lda #$ff
	sta $0297
	ldx #$03
l8a38:	lda l8a7b,x
	sta $0273,x
	dex
	bpl l8a38
	lda #$0f
	sta $0257
	lda #$00
	sta $16
	jsr lbb83
	lda $31
	ldy $32
	sta $33
	sty $34
	lda $35
	ldy $36
	sta $37
	sty $38
	jsr l8b82
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
l8a7a:	rts
	jsr $2e2c
	bit $a9
	!byte $80
	sta $14
	jsr l8d75
	jsr l87d3
	bne l8a90
	txa
	adc #$10
	tax
	txs
l8a90:	pla
	pla
	lda #$09
	jsr l885c
	jsr l8cd8
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
	jsr l971d
	jsr lb466
	jsr lb463
	lda $76
	ora #$7f
	and $72
	sta $72
	lda #$c8
	ldy #$8a
	sta $22
	sty $23
	jmp l9658
	lda #$08
	ldy #$9f
	jsr la0d2
	jsr lb98b
	cmp #$a9
	bne l8adc
	jsr lb988
	jsr lb463
l8adc:	jsr la16e
	jsr l9649
	lda $56
	pha
	lda $55
	pha
	lda $54
	pha
	lda #$81
	pha
	jmp l8752
	bne l8af7
	ldx #$ff
	bmi l8afa
l8af7:	jsr l9917
l8afa:	jsr l887f
	jsr l87d3
	beq l8b07
	ldx #$28
	jmp l854a
l8b07:	txs
	txa
	clc
	adc #$05
	pha
	adc #$06
	sta $25
	pla
	ldy #$01
	jsr la0d2
	tsx
	lda $010a,x
	sta $76
	lda $54
	ldy $55
	ldx $56
	jsr l9fca
	jsr l9db9
	jsr la10b
	ldy #$01
	jsr la1a0
	tsx
	sec
	sbc $010a,x
	beq l8b4f
	lda $0110,x
	sta $42
	lda $0111,x
	sta $43
	lda $0113,x
	sta $85
	lda $0112,x
	sta $86
l8b4c:	jmp l8752
l8b4f:	txa
	adc #$12
	tax
	txs
	jsr lb98b
	cmp #$2c
	bne l8b4c
	jsr lb988
	jsr l8af7
	jmp lb463
	beq l8b82
	jsr lb447
	sty $1b
	sta $1c
	jsr lb9ee
	jsr l8717
	bcc l8b90
	lda $6d
	sbc #$01
	sta $4b
	lda $6e
	sbc #$00
	sta $4c
	rts
l8b82:	sec
	lda $2d
	sbc #$01
	sta $4b
	lda $2e
	sbc #$00
	sta $4c
l8b8f:	rts
l8b90:	jmp l8cb8
	bcs l8b96
	clc
l8b96:	bne l8bf1
	beq l8bae
	php
	ldy $0297
	iny
	beq l8bab
l8ba1:	jsr $ffe1
	beq l8ba1
	ldx #$1c
	jmp l854a
l8bab:	plp
	pha
	pha
l8bae:	php
	jsr l9cc3
	beq l8bc4
	lda $85
	ldy $86
	sta $46
	sty $47
	lda $42
	ldy $43
	sta $44
	sty $45
l8bc4:	plp
	pla
	pla
	bcc l8bd1
	ldx #$1c
	jsr la32f
	jmp l85a3
l8bd1:	jmp l85b8
	bne l8bf1
	ldy $47
	bne l8be3
	lda $46
	bne l8be5
	ldx #$48
	jmp l854a
l8be3:	lda $46
l8be5:	sta $85
	sty $86
	lda $44
	ldy $45
	sta $42
	sty $43
l8bf1:	rts
	jsr l8c02
	jsr lb98b
	bne l8bfd
	jmp l8a27
l8bfd:	jsr l8a2e
	beq l8c24
	jsr l9cc3
	bne l8b8f
	lda #$fe
	sta $43
	lda #$00
	jmp $ff90
	lda #$03
	jsr l885c
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
l8c24:	jsr lb98b
	jsr l8c6f
	jmp l8752
	jsr l95ac
	bit $11
	bpl l8c37
	jsr la855
l8c37:	jsr lb98b
	cmp #$89
	beq l8c43
	lda #$a7
	jsr l971d
l8c43:	lda $71
	bne l8c5a
l8c47:	jsr l8cca
	ldy #$00
	lda ($85),y
	beq l8c62
	jsr lb988
	cmp #$e1
	bne l8c47
	jsr lb988
l8c5a:	jsr lb98b
	bcc l8c6f
	jmp l87a0
l8c62:	jsr l8cdb
	beq l8ccd
	jsr lb98b
	lda #$a4
	jsr l971d
l8c6f:	jsr l8d39
	jsr l8cdb
	sec
	lda $42
	sbc $1b
	lda $43
	sbc $1c
	bcs l8c8b
	tya
	sec
	adc $85
	ldx $86
	bcc l8c8f
	inx
	bcs l8c8f
l8c8b:	lda $2d
	ldx $2e
l8c8f:	jsr l871b
	bcc l8cb8
	lda $6d
	sbc #$01
	sta $85
	lda $6e
	sbc #$00
	sta $86
	jmp l8c02
	bne l8cd7
	lda #$10
	sta $56
	lda #$ff
	sta $55
	jsr l87d3
	txs
	cmp #$8d
	beq l8cbd
	ldx #$2c
	bit $36a2
	jmp l854a
l8cbd:	pla
	pla
	sta $42
	pla
	sta $43
	pla
	sta $85
	pla
	sta $86
	jsr l8cd8
l8ccd:	tya
	clc
	adc $85
	sta $85
	bcc l8cd7
	inc $86
l8cd7:	rts
	ldx #$3a
	bit $00a2
	stx $0c
	ldy #$00
	sty $0d
l8ce3:	lda $0d
	ldx $0c
	sta $0c
	stx $0d
l8ceb:	lda $87
	sta $01
	lda ($85),y
	beq l8cfe
	cmp $0d
	beq l8cfe
	iny
	cmp #$22
	bne l8ceb
	beq l8ce3
l8cfe:	jmp lb9ee
	jsr l9cb6
	jsr lb98b
	beq l8d10
	jsr lb447
	sty $0296
	bit $ffa9
	sta $0297
	rts
	jsr lb438
	pha
	cmp #$8d
	beq l8d25
	cmp #$89
	beq l8d25
l8d22:	jmp l973a
l8d25:	dec $75
	bne l8d2d
	pla
	jmp l87a2
l8d2d:	jsr lb988
	jsr l8d39
	cmp #$2c
	beq l8d25
	pla
l8d38:	rts
	ldx #$00
	stx $1b
	stx $1c
	bcs l8d38
	sbc #$2f
	sta $0c
	lda $1c
	sta $22
	cmp #$19
	bcs l8d22
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
	bcc l8d6d
	inc $1c
l8d6d:	jsr lb988
	jmp l8d3f
l8d73:	bne l8d22
	jsr l887c
	lda #$b2
	jsr l971d
	lda $12
	pha
	lda $11
	pha
	jsr l95ac
	pla
	rol
	jsr lb469
	bne l8dab
	pla
	bpl l8da8
	jsr la15e
	jsr l9a59
	lda $56
	sta $01
	ldy #$00
	lda $74
	sta ($54),y
	iny
	lda $75
	sta ($54),y
	jmp lb9ee
l8da8:	jmp la10b
l8dab:	pla
	jmp la8df
	jsr l9cb6
	ldx $0299
	inx
	beq l8e0a
	jsr lb98b
	beq l8dea
	bcc l8ddc
	cmp #$82
l8dc1:	bne l8d73
	jsr l8dea
	jsr lb9ee
	ldy #$00
	lda ($85),y
	bne l8dd6
	iny
	jsr l875b
	jsr l8ccd
l8dd6:	jsr lb988
	jmp l8cca
l8ddc:	jsr lb447
	sta $1c
	jsr l8df9
	jsr lb9ee
	jmp l8c8b
l8dea:	ldx #$01
l8dec:	lda $0298,x
	sta $42,x
	lda $029a,x
	sta $85,x
	dex
	bpl l8dec
	ldx #$ff
	stx $0f
	stx $0298
	stx $0299
	ldx $029d
	stx $0297
	rts
l8e0a:	ldx #$52
	jmp l854a
	cmp #$81
	beq l8e17
	cmp #$8d
	bne l8dc1
l8e17:	sta $029f
	jsr l9cb6
	tsx
	inx
	inx
	txa
	tay
l8e22:	tya
	tax
	cpy #$ff
	beq l8e60
	lda $0101,x
	cmp #$81
	bne l8e35
	txa
	adc #$12
	jmp l8e39
l8e35:	txa
	clc
	adc #$07
	bcs l8e60
	tay
	lda $0101,x
	cmp $029f
	bne l8e22
	beq l8e49
l8e46:	ldx $029e
l8e49:	lda $0100,x
	sta $0100,y
	dey
	dex
	stx $029e
	tsx
	cpx $029e
	bne l8e46
	tya
	tax
	txs
	jmp lb988
l8e60:	ldx #$54
	jmp l854a
	jsr l8e6b
	jmp l8f44
	jsr lb438
	beq l8e73
	jsr l971b
l8e73:	php
	pha
	stx $0258
	jsr l9571
	sta $1a
	pla
	plp
	jmp l8e88
l8e82:	jsr lb477
l8e85:	jsr lb98b
	beq l8eb3
	cmp #$e6
	bne l8e91
	jmp laf88
l8e91:	beq l8ec4
	cmp #$a3
	beq l8ed5
	cmp #$a6
	clc
	beq l8ed5
	cmp #$2c
	beq l8ec5
	cmp #$3b
	beq l8ef7
	jsr l95ac
	bit $11
	bmi l8e82
	jsr la32a
	jsr lb490
	bne l8e85
l8eb3:	lda #$0d
	jsr lb49c
	lda $0258
	bpl l8ec2
	lda #$0a
	jsr lb49c
l8ec2:	eor #$ff
l8ec4:	rts
l8ec5:	sec
	jsr $fff0
	tya
	sec
l8ecb:	sbc #$0a
	bcs l8ecb
	eor #$ff
	adc #$01
	bne l8eed
l8ed5:	php
	sec
	jsr $fff0
	sty $0255
	jsr lb435
	cmp #$29
	bne l8efd
	plp
	bcc l8eee
	txa
	sbc $0255
	bcc l8ef7
l8eed:	tax
l8eee:	inx
l8eef:	dex
	beq l8ef7
	jsr lb490
	bne l8eef
l8ef7:	jsr lb988
	jmp l8e91
l8efd:	jmp l973a
	jsr l9cb6
	jsr lb98b
	cmp #$23
	bne l8f15
	jsr lb435
	jsr l971b
	jsr l9577
	sta $1a
l8f15:	lda #$01
	ldy $89
	ldx $88
	inx
	bne l8f1f
	iny
l8f1f:	stx $22
	sty $23
	sta $24
	ldy #$00
	tya
	sta ($22),y
	ldy $23
	lda #$40
	jsr l8fde
	ldx $1a
	bne l8f46
	rts
	jsr lb438
	jsr l971b
	jsr l9577
	sta $1a
	jsr lbbbc
	lda $1a
l8f46:	jsr $ffcc
	ldx #$00
	stx $1a
	stx $0258
	rts
	cmp #$22
	bne l8f60
	jsr l96d2
	lda #$3b
	jsr l971d
	jsr lb477
l8f60:	jsr l9cb6
l8f63:	jsr l8f93
	lda $1a
	beq l8f77
	jsr lbb4a
	and #$03
	beq l8f77
	jsr l8f44
	jmp l8cca
l8f77:	ldy #$00
	lda ($22),y
	beq l8f83
l8f7d:	jsr l9da8
	jmp l8fdc
l8f83:	lda $1a
	bne l8f8a
	jmp l8cca
l8f8a:	jsr lbb4a
	and #$40
	beq l8f63
	bne l8f7d
	lda $1a
	bne l8f9d
	jsr lb49a
	jsr lb490
l8f9d:	jmp l86db
l8fa0:	jsr l8cd8
	iny
	tax
	bne l8fc5
	lda $87
	sta $01
	lda ($85),y
	bne l8fb9
	iny
	lda ($85),y
	bne l8fba
	ldx #$2e
	jmp l854a
l8fb9:	iny
l8fba:	iny
	lda ($85),y
	sta $49
	iny
	lda ($85),y
	iny
	sta $4a
l8fc5:	jsr lb9ee
	jsr l8ccd
	jsr lb98b
	tax
	cpx #$83
	bne l8fa0
	beq l9024
	ldx $4b
	ldy $4c
	lda #$98
	bit $00a9
	sta $15
	stx $4d
	sty $4e
	jsr l887c
	lda $85
	ldy $86
	sta $57
	sty $58
	ldx $4d
	ldy $4e
	stx $85
	sty $86
	jsr lb98b
	bne l9024
	bit $15
	bvc l9013
	jsr lbb55
	jsr l9da8
	stx $22
	sty $23
	ldy #$01
	sta ($22),y
	ldy $23
	jmp l9020
l9013:	bmi l8fa0
	lda $1a
	bne l901c
	jsr lb49a
l901c:	jsr l8f93
	tax
	stx $85
	sty $86
l9024:	jsr lb988
	bit $11
	bpl l9062
	bit $15
	bvc l9038
	inx
	stx $85
	lda #$00
	sta $0c
	beq l9044
l9038:	sta $0c
	cmp #$22
	beq l9045
	lda #$3a
	sta $0c
	lda #$2c
l9044:	clc
l9045:	sta $0d
	jsr l9056
	jsr la793
	jsr lab55
	jsr la8df
	jmp l906a
	lda $85
	ldy $86
	adc #$00
	bcc l905f
	iny
l905f:	ldx $87
	rts
l9062:	jsr la244
	lda $12
	jsr l8d8e
	jsr lb98b
	beq l9073
	cmp #$2c
	bne l908e
l9073:	lda $85
	ldy $86
	sta $4d
	sty $4e
	lda $57
	ldy $58
	sta $85
	sty $86
	jsr lb98b
	beq l90b6
	jsr l971b
	jmp l8fe4
l908e:	lda $15
	beq l909f
	bpl l909c
	lda $49
	ldy $4a
	sta $42
	sty $43
l909c:	jmp l973a
l909f:	lda $1a
	beq l90a8
	ldx #$44
	jmp l854a
l90a8:	ldx #$20
	jsr la32f
	lda $46
	ldy $47
	sta $85
	sty $86
	rts
l90b6:	lda $4d
	ldy $4e
	ldx $15
	bpl l90c3
	sta $4b
	sty $4c
l90c2:	rts
l90c3:	ldy #$00
	lda ($4d),y
	beq l90c2
	lda $1a
	bne l90c2
	ldx #$1e
	jmp la32f
	jsr lb447
	lda $01
	pha
	lda $0257
	cmp #$0f
	beq l90ea
	ldx $1b
	ldy $1c
	jsr $ff6c
	pla
	sta $01
	rts
l90ea:	lda #$90
	pha
	lda #$e5
	pha
	jmp ($001b)
	rts
l90f4:	jsr l971b
	tax
	jsr l991c
	jsr lb98b
	bne l90f4
	rts
	jsr l9cc8
	jsr l9cb6
	jsr l9718
	lda #$80
	sta $14
	jsr l9917
	jsr lb466
	jsr l9715
	lda #$b2
	jsr l971d
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
	jsr l8cca
	jmp l9d57
	jsr lb42c
	txa
	jsr l9160
	sta ($1b),y
	stx $01
	rts
	jsr lb42c
	stx $0255
	ldx #$00
	jsr lb98b
	beq l914d
	jsr lb42f
l914d:	stx $0256
	jsr l9160
l9153:	lda ($1b),y
	eor $0256
	and $0255
	beq l9153
	stx $01
	rts
	ldx $01
	ldy $0257
	sty $01
	ldy #$00
	rts
	bne l9170
	ldy #$00
	beq l9196
l9170:	jsr lb438
	txa
	bne l9179
l9176:	jmp l9aed
l9179:	cmp #$15
	bcs l9176
	pha
	jsr l971b
	jsr l91a1
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
l9196:	jsr $ff75
	bcc l91a0
	ldx #$34
	jmp ($0280)
l91a0:	rts
	jsr l95ac
	jmp la852
	lda #$4e
	pha
	lda #$80
	jsr l91eb
	beq l91d1
	pla
	rts
	lda #$00
	jsr l91eb
	beq l91c3
	jsr l869c
	jsr lb41a
	jmp l8a5d
l91c3:	lda $025b
	cmp #$01
	bne l91e4
	stx $2f
	sty $30
	lda #$4c
	pha
l91d1:	jsr lbb4a
	and #$10
	bne l91dc
	pla
	lda #$18
	pha
l91dc:	pla
	tax
l91de:	jsr la32f
	jmp l8693
l91e4:	ldx $56
	bne l91de
	pha
	beq l91ef
	pha
	jsr lb914
l91ef:	jsr $ffe1
	beq l91ef
	pla
	ora #$01
	ldx $2d
	ldy $2e
	jsr lbb73
	bcs l9229
	sta $025b
	jmp l9cc3
	jsr lb914
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
	jsr lbb79
	bcs l9229
	rts
l9229:	asl
	tax
	jmp l854a
	ldx #$00
	stx $8b
	stx $0210
	stx $0221
	inx
	stx $0220
	jsr lb966
	jsr lb438
	stx $021f
	jsr l9272
	stx $0220
	ldy #$00
	cpx #$03
	bcc l9252
	dey
l9252:	sty $0221
	jsr l9272
	stx $0221
	jsr lb98b
	beq l9266
	jsr lb963
	jsr lb8fe
l9266:	jsr lb938
	jsr $ffcc
	jsr lbb4e
	jmp l933b
	jsr lb98b
	bne l927c
	pla
	pla
	jmp l9266
l927c:	jsr lb963
	jmp lb438
	jsr lb966
	jsr lb438
	txa
	jmp lbb7f
	jsr lb4a9
	lda $8b
	and #$e6
	beq l9298
	jmp l973a
l9298:	ldy #$01
	ldx #$01
	lda $8b
	and #$11
	beq l92a8
	lsr
	bcc l92a7
	inx
	inx
l92a7:	inx
l92a8:	txa
	jsr lb774
	lda #$15
	sta $0f
	ldy #$60
	jsr l9346
	ldy #$03
l92b7:	sty $7b
	ldx #$0e
	jsr lbb67
	jsr lbb5b
	sta $7c
	jsr lbb4a
	bne l9333
	jsr lbb5b
	sta $7d
	jsr lbb4a
	bne l9333
	ldy $7b
	dey
	bne l92b7
	jsr l933b
	ldx $7c
	lda $7d
	jsr la320
	lda #$20
	jsr lbb61
l92e6:	jsr $ffcc
	ldx #$0e
	jsr lbb67
	jsr lbb5b
	pha
	jsr lbb4a
	bne l9332
	jsr l933b
	pla
	beq l9302
	jsr lbb61
	bcc l92e6
l9302:	dec $0f
	lda #$0d
	jsr lbb61
	jsr $ffcc
	jsr $ffe1
	beq l9333
	lda $0f
	bne l932e
	lda #$15
	sta $0f
	jsr l9cc3
	bne l932e
	ldx $1a
	cpx #$00
	bne l932e
	ldx #$24
	jsr la32f
l9329:	jsr lbb55
	beq l9329
l932e:	ldy #$02
	bne l92b7
l9332:	pla
l9333:	jsr $ffcc
	lda #$0e
	jsr lbb7f
	jsr $ffcc
	ldx $0258
	beq l938e
	jmp lbb6d
	ldx $0220
	bne l934d
	ldx #$08
l934d:	lda #$0e
	jsr $ffba
	jsr $ffcc
	jmp lbb4e
	lda #$22
	jsr l9379
	ldy #$02
	ldx #$04
	bit $8b
	bvc l9372
	ldx #$08
	bne l9372
	lda #$e2
	jsr l9379
	ldy #$03
	ldx #$05
l9372:	txa
	jsr lb774
	jmp l9269
	jsr lb4ab
	jsr lb87b
	ldy #$61
l9381:	iny
	cpy #$6f
	beq l938f
	jsr $ff8a
	bcc l9381
	sty $0221
l938e:	rts
l938f:	ldx #$02
	jmp l854a
	lda #$f3
	jsr lb4ab
	jsr lb8f6
	lda $8b
	and #$04
	beq l93a8
	lda $021f
	jmp lbb7f
l93a8:	lda $0220
	jmp l957d
	lda #$66
	jsr lb4ab
	jsr lb76d
	jmp l9209
	lda #$e6
	jsr lb4ab
	jsr lb76d
	lda #$00
	jsr l91e8
	jmp l91b8
	jsr lb438
	cpx #$10
	bcs l93d4
	stx $0257
l93d3:	rts
l93d4:	jmp l9aed
	lda #$66
	ldx #$f8
	jsr lb4ad
	jsr lb76d
	ldx $021b
	ldy $021c
	lda $021a
	stx $64
	sty $65
	sta $66
	ldx $021d
	ldy $021e
	jmp l9219
	lda #$e6
	ldx #$fc
	jsr lb4ad
	jsr lb76d
	lda $021a
	clc
	ldx $021b
	ldy $021c
	jsr lbb73
	bcc l93d3
	jsr lb4a9
	jsr lb855
	and #$11
	cmp #$11
	bne l9486
	jsr l93a8
	jsr lb8bd
	bcs l93d3
	ldy #$04
	lda #$04
	ldx $0223
	beq l9431
	lda #$06
l9431:	jsr l9563
	jsr lb884
	jsr l9cc3
	bne l93d3
	jsr lb9df
	ldy #$00
	lda ($17),y
	cmp #$32
	bcs l944a
	jmp lb9ee
l944a:	ldx #$16
	jmp l854a
	jsr lb4a9
	jsr lb855
	jsr lb8bd
	bcs l9485
	ldy #$0a
	lda #$04
	jsr l9563
	jsr lb884
	jsr l9cc3
	bne l9485
	lda #$0d
	jsr lbb61
	jsr lb9df
	ldy #$00
l9473:	lda ($17),y
	beq l947d
	jsr lbb61
	iny
	bne l9473
l947d:	lda #$0d
	jsr lbb61
	jsr lb9ee
l9485:	rts
l9486:	jmp l973a
	lda #$01
	sta $0222
	jsr lb98b
	lda #$23
	jsr l971d
	jsr lb6ef
	cpx #$00
	beq l94b3
	stx $021f
	jsr l971b
	beq l9486
	bcc l94bb
	jsr l9718
	jsr lb447
	jsr l9715
	jmp l94be
l94b3:	jmp lb67d
l94b6:	ldx #$06
	jmp l854a
l94bb:	jsr lb447
	jsr lb98b
	beq l94db
	jsr l971b
	beq l9486
	jsr lb6ef
	cpx #$00
	beq l94b3
	cpx #$ff
	beq l94b3
	stx $0222
	jsr lb98b
l94d9:	bne l9486
l94db:	lda $021f
	jsr $ff8d
	bcs l94b6
	sty $0221
	stx $0220
	jsr $ffba
	jsr lb8f6
	ldy #$0b
	lda #$04
	bne l9563
	jsr lb4a9
	ldy #$00
	lda #$02
	bne l9563
	jsr lb4a9
	jsr lb867
	jsr l93a8
	ldy #$05
	ldx #$01
	lda $8b
	and #$10
	beq l9512
	inx
l9512:	txa
	bne l9563
	jsr lb4a9
	and #$30
	cmp #$30
	bne l9524
	lda $8b
	and #$c7
	beq l952b
l9524:	lda $8b
	jsr lb86c
	lda $8b
l952b:	ldy #$07
	lda #$08
	bne l9563
	jsr lb4a9
	jsr lb86c
	ldy #$08
	lda #$0c
	bne l9563
	lda #$e4
	jsr lb4ab
	jsr lb872
	ldy #$09
	lda #$08
	bne l9563
	lda #$c7
	jsr lb4ab
	and #$30
	cmp #$30
	bne l94d9
	jsr lb8bd
	bcc l955c
	rts
l955c:	jsr l93a8
	ldy #$06
	lda #$04
l9563:	jsr lb774
	jsr $ffcc
	sec
	jsr lbb4f
	jmp l933b
	!byte $f7
	jsr lb8f6
	jmp lbb6d
	jsr lb8f6
	jmp lbb67
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
	bne l95b5
	dec $86
l95b5:	dec $85
	ldx #$00
	bit $48
	txa
	pha
	lda #$01
	jsr l885c
	jsr l9699
	lda #$00
	sta $5a
	jsr lb98b
	sec
	sbc #$b1
	bcc l95e8
	cmp #$03
	bcs l95e8
	cmp #$01
	rol
	eor #$01
	eor $5a
	cmp $5a
	bcc l9641
	sta $5a
	jsr lb988
	jmp l95cc
l95e8:	ldx $5a
	bne l9618
	bcs l966d
	adc #$07
	bcc l966d
	adc $11
	bne l95f9
	jmp la9dc
l95f9:	adc #$ff
	sta $22
	asl
	adc $22
	tay
l9601:	pla
	cmp l80b4,y
	bcs l9672
	jsr lb466
l960a:	pha
	jsr l9631
	pla
	ldy $57
	bpl l962a
	tax
	beq l9670
	bne l967b
l9618:	lsr $11
	txa
	rol
	ldx $85
	bne l9622
	dec $86
l9622:	dec $85
	ldy #$1b
	sta $5a
	bne l9601
l962a:	cmp l80b4,y
	bcs l967b
	bcc l960a
	lda l80b6,y
	pha
	lda l80b5,y
	pha
	jsr l9644
	lda $5a
	jmp l95ba
l9641:	jmp l973a
	lda $76
	ldx l80b4,y
	tay
	pla
	sta $22
	pla
	sta $23
	tya
	pha
	inc $22
	bne l9658
	inc $23
l9658:	jsr la15e
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
l966d:	ldy #$ff
	pla
l9670:	beq l9696
l9672:	cmp #$64
	beq l9679
	jsr lb466
l9679:	sty $57
l967b:	pla
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
l9696:	lda $71
	rts
	jmp ($028a)
	lda #$00
	sta $11
l96a0:	jsr lb988
	bcs l96bb
l96a5:	jmp la244
	cmp #$ff
	bne l96c2
	lda #$b6
	ldy #$96
	jsr la0d2
	jmp lb988
	!byte $82
	eor #$0f
	!byte $da
	lda ($20,x)
	tax
	sta $e890,y
	bcs l973f
l96c2:	cmp #$2e
	beq l96a5
	cmp #$ab
	beq l9708
	cmp #$aa
	beq l96a0
	cmp #$22
	bne l96db
	jsr l9056
	jsr la78b
	jmp lab55
l96db:	cmp #$a8
	bne l96f2
	ldy #$18
	bne l970a
	jsr l9a59
	lda $75
	eor #$ff
	tay
	lda $74
	eor #$ff
	jmp l9ca5
l96f2:	cmp #$a5
	bne l96f9
	jmp l9cdd
l96f9:	cmp #$b4
	bcc l970f
	cmp #$e7
	bcs l9705
	cmp #$cb
	bcs l973a
l9705:	jmp l980c
l9708:	ldy #$15
l970a:	pla
	pla
	jmp l960b
l970f:	jsr l9718
	jsr l95ac
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
	bne l973a
	jmp lb988
l973a:	ldx #$2a
	jmp l854a
l973f:	jsr l9917
	sta $74
	sty $75
	stx $76
	ldx $4f
	ldy $50
	lda $11
	beq l978c
	lda #$00
	sta $80
	jsr lb96e
	bcs l9784
	cpx #$54
	bne l9764
	cpy #$c9
	bne l9778
	jmp labbe
l9764:	cpx #$44
	bne l9778
	cpy #$d3
	bne l9778
	jsr l9785
	lda $17
	ldy $18
	ldx $19
	jmp la78b
l9778:	lda $3f
	sta $74
	lda $40
	sta $75
	lda $41
	sta $76
l9784:	rts
	lda $16
	bne l9784
	jmp lb884
l978c:	bit $12
	bpl l97a4
	lda $76
	sta $01
	ldy #$00
	lda ($74),y
	tax
	iny
	lda ($74),y
	tay
	jsr lb9ee
	txa
	jmp l9ca5
l97a4:	jsr lb96e
	bcc l97b2
	lda $74
	ldy $75
	ldx $76
	jmp la0d4
l97b2:	cpx #$53
	bne l97c0
	cpy #$54
	bne l97c0
	jsr lbb4a
	jmp la17f
l97c0:	cpx #$45
	bne l97db
	cpy #$52
	beq l97d5
	cpy #$4c
	bne l97db
	lda $0299
	ldy $0298
	jmp l9c98
l97d5:	lda $8f
	lsr
	jmp la17f
l97db:	cpx #$44
	bne l9805
	cpy #$53
	bne l9805
	jsr l9785
	jsr lb9df
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
	jsr lb9ee
	and #$0f
	adc $13
	jmp la17f
l9805:	lda $74
	ldy $75
	jmp la0d2
	asl
	pha
	tax
	jsr lb988
	cpx #$8f
	bcc l9841
	cpx #$ce
	beq l9890
	jsr l9718
	jsr l95ac
	jsr l971b
	jsr lb468
	pla
	cmp #$d0
	beq l988d
	tax
	lda $76
	pha
	lda $75
	pha
	lda $74
	pha
	txa
	pha
	jsr lb438
	pla
	tay
	txa
	pha
	jmp l9846
l9841:	jsr l970f
	pla
	tay
	lda l801e,y
	sta $62
	lda l801f,y
	sta $63
	jsr $0061
	jmp lb466
	ldy #$ff
	bit $00a0
	sty $0256
	jsr l9a59
	lda $74
	eor $0256
	sta $0c
	lda $75
	eor $0256
	sta $0d
	jsr la13f
	jsr l9a59
	lda $75
	eor $0256
	and $0d
	eor $0256
	tay
	lda $74
	eor $0256
	and $0c
	eor $0256
	jmp l9ca5
l988d:	jmp lae4b
l9890:	jmp lab62
	jsr lb469
	bcs l98ab
	lda $7e
	ora #$7f
	and $7a
	sta $7a
	lda #$79
	ldy #$00
	jsr la19e
	tax
	jmp l98f0
l98ab:	lda #$00
	sta $11
	dec $5a
	jsr la855
	sta $70
	ldx #$02
l98b8:	lda $22,x
	sta $71,x
	dex
	bpl l98b8
	lda $7c
	ldy $7d
	ldx $7e
	jsr la85b
	ldx $22
	ldy $23
	stx $7c
	sty $7d
	ldy $24
	sty $7e
	tax
	sec
	sbc $70
	beq l98e2
	lda #$01
	bcc l98e2
	ldx $70
	lda #$ff
l98e2:	sta $76
	jsr lb9cb
	ldy #$ff
	inx
l98ea:	iny
	dex
	bne l98f5
	ldx $76
	bmi l9907
	clc
	bcc l9907
l98f5:	lda ($71),y
	sta $025b
	lda ($7c),y
	cmp $025b
	beq l98ea
	ldx #$ff
	bcs l9907
	ldx #$01
l9907:	jsr lb9ee
	inx
	txa
	rol
	and $0259
	beq l9914
	lda #$ff
l9914:	jmp la17f
	ldx #$00
	jsr lb98b
	stx $10
	sta $4f
	jsr lb98b
	jsr l99aa
	bcs l992b
l9928:	jmp l973a
l992b:	ldx #$00
	stx $11
	stx $12
	jsr lb988
	bcc l993b
	jsr l99aa
	bcc l9946
l993b:	tax
l993c:	jsr lb988
	bcc l993c
	jsr l99aa
	bcs l993c
l9946:	cmp #$24
	bne l9950
	lda #$ff
	sta $11
	bne l9960
l9950:	cmp #$25
	bne l9967
	lda $14
	bne l9928
	lda #$80
	sta $12
	ora $4f
	sta $4f
l9960:	txa
	ora #$80
	tax
	jsr lb988
l9967:	stx $50
	sec
	ora $14
	sbc #$28
	bne l9973
	jmp l9a6e
l9973:	ldy #$00
	sty $14
	lda $31
	ldx $32
l997b:	stx $6e
l997d:	sta $6d
	cpx $34
	bne l9987
	cmp $33
	beq l99b4
l9987:	jsr lb9e9
	lda ($6d),y
	cmp $4f
	bne l999d
	iny
	lda ($6d),y
	cmp $50
	bne l999c
	jmp l9a25
l999a:	beq l9928
l999c:	dey
l999d:	jsr lb9ee
	clc
	lda $6d
	adc #$07
	bcc l997d
	inx
	bne l997b
	cmp #$41
	bcc l99b3
	sbc #$5b
	sec
	sbc #$a5
l99b3:	rts
l99b4:	pla
	pha
	cmp #$41
	bne l99c9
	tsx
	lda $0102,x
	cmp #$97
	bne l99c9
l99c2:	lda #$7c
	ldy #$a4
	ldx #$0f
	rts
l99c9:	lda $4f
	ldy $50
	cmp #$54
	bne l99d5
	cpy #$c9
	beq l99c2
l99d5:	cmp #$53
	bne l99dd
	cpy #$54
	beq l999a
l99dd:	cmp #$45
	bne l99e9
	cpy #$52
	beq l999a
	cpy #$4c
	beq l999a
l99e9:	cmp #$44
	bne l99f5
	cpy #$53
	beq l999a
	cpy #$d3
	beq l999a
l99f5:	lda $33
	ldy $34
	sta $6d
	sty $6e
	clc
	adc #$07
	bcc l9a03
	iny
l9a03:	jsr l8816
	jsr lb9e9
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
	jsr lb9ee
	lda $6d
	clc
	adc #$02
	ldy $6e
	bcc l9a32
	iny
l9a32:	sta $51
	sty $52
	ldx #$03
	stx $53
	rts
	lda $0e
	asl
	adc #$05
	adc $6d
	ldy $6e
	bcc l9a47
	iny
l9a47:	sta $64
	sty $65
	rts
	jsr lb988
	jsr l95ac
	jsr lb466
	lda $76
	bmi l9a66
	lda $71
	cmp #$90
	bcc l9a68
	lda #$79
	ldy #$a4
	jsr la19e
l9a66:	bne l9a6b
l9a68:	jmp la1ec
l9a6b:	jmp l9aed
	lda $10
	ora $12
	pha
	lda $11
	pha
	lda #$00
	pha
l9a79:	lda $50
	pha
	lda $4f
	pha
	jsr l9a4c
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
	jsr lb98b
	cmp #$2c
	beq l9a79
	pla
	sta $0e
	jsr l9715
	pla
	sta $11
	pla
	sta $12
	and #$7f
	sta $10
	ldx $35
	lda $36
l9abb:	stx $6d
	sta $6e
	cmp $38
	bne l9ac7
	cpx $37
	beq l9b16
l9ac7:	jsr lb9e4
	ldy #$00
	lda ($6d),y
	iny
	cmp $4f
	bne l9ad9
	lda ($6d),y
	cmp $50
	beq l9af2
l9ad9:	iny
	lda ($6d),y
	clc
	adc $6d
	tax
	iny
	lda ($6d),y
	jsr lb9ee
	adc $6e
	bcc l9abb
l9aea:	ldx #$38
	bit $30a2
l9aef:	jmp l854a
l9af2:	jsr lb9ee
	ldx #$3a
	lda $10
	bne l9aef
	jsr l9a3b
	jsr lb9e4
	ldy #$04
	lda ($6d),y
	cmp $0e
	bne l9aea
	jmp l9ba4
	bpl l9b15
	dex
	lda $4f
	bpl l9b15
	dex
	dex
l9b15:	rts
l9b16:	jsr l9a3b
	jsr l8895
	jsr lb9e4
	ldy #$00
	sty $83
	lda $4f
	sta ($6d),y
	iny
	ldx #$05
	lda $50
	sta ($6d),y
	jsr l9b0c
	stx $82
	lda $0e
	iny
	iny
	iny
	sta ($6d),y
l9b3a:	ldx #$0b
	lda #$00
	bit $10
	bvc l9b4a
	pla
	clc
	adc #$01
	tax
	pla
	adc #$00
l9b4a:	iny
	sta ($6d),y
	iny
	txa
	sta ($6d),y
	jsr l9c0a
	stx $82
	sta $83
	ldy $22
	dec $0e
	bne l9b3a
	adc $65
	bcs l9bc2
	sta $65
	tay
	txa
	adc $64
	bcc l9b6d
	iny
	beq l9bc2
l9b6d:	jsr lb9ee
	jsr l8895
	sta $37
	sty $38
	jsr lb9e4
	lda #$00
	inc $83
	ldy $82
	beq l9b87
l9b82:	dey
	sta ($64),y
	bne l9b82
l9b87:	dec $65
	dec $83
	bne l9b82
	inc $65
	sec
	lda $37
	sbc $6d
	ldy #$02
	sta ($6d),y
	lda $38
	iny
	sbc $6e
	sta ($6d),y
	lda $10
	bne l9c07
	iny
	lda ($6d),y
	sta $0e
	lda #$00
	sta $82
l9bac:	sta $83
	iny
	pla
	tax
	sta $74
	pla
	sta $75
	lda ($6d),y
	iny
	cmp $75
	beq l9bc5
	bcs l9bcd
l9bbf:	jmp l9aea
l9bc2:	jmp l88a1
l9bc5:	lda ($6d),y
	cmp $74
	beq l9bbf
	bcc l9bbf
l9bcd:	lda $83
	ora $82
	clc
	beq l9bde
	jsr l9c0a
	txa
	adc $74
	tax
	tya
	ldy $22
l9bde:	adc $75
	stx $82
	dec $0e
	bne l9bac
	sta $83
	ldx #$05
	lda $50
	jsr l9b0c
	stx $2a
	lda #$00
	jsr l9c13
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
l9c07:	jmp lb9ee
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
l9c1d:	txa
	asl
	tax
	tya
	rol
	tay
	bcs l9bc2
	asl $82
	rol $83
	bcc l9c36
	clc
	txa
	adc $2a
	tax
	tya
	adc $2b
	tay
	bcs l9bc2
l9c36:	dec $6b
	bne l9c1d
	rts
	lda $11
	beq l9c47
	jsr la855
	ldx #$04
	jmp l9c81
l9c47:	jsr lb43b
	cpx #$01
	bne l9c5b
	sec
	lda $88
	sbc $2f
	tay
	lda $89
	sbc $30
	jmp l9c98
l9c5b:	cpx #$03
	bne l9c6e
	sec
	lda $02a6
	sbc $33
	tay
	lda $02a7
	sbc $34
	jmp l9c98
l9c6e:	cpx #$02
	bne l9c81
	sec
	lda $02a6
	sbc $37
	tay
	lda $02a7
	sbc $38
	jmp l9c98
l9c81:	cpx #$04
	bne l9c95
	jsr lad17
	sec
	lda $3b
	sbc $39
	tay
	lda $3c
	sbc $3a
	jmp l9c98
l9c95:	lda #$00
	tay
	jsr l9cab
	sec
	jmp la18c
	sec
	jsr $fff0
	lda #$00
	jsr l9cab
	jmp la187
	ldx #$00
	stx $11
	sta $72
	sty $73
	ldx #$90
l9cb5:	rts
	jsr l9cc3
	bne l9cb5
	ldx #$3e
	bit $4aa2
	jmp l854a
	lda $43
	cmp #$ff
	rts
	lda #$a5
	jsr l971d
	ora #$80
	sta $14
	jsr l991e
	sta $5b
	sty $5c
	stx $5d
	jmp lb466
	jsr l9cc8
	lda $5d
	pha
	lda $5c
	pha
	lda $5b
	pha
	jsr l970f
	jsr lb466
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
	beq l9cbe
	iny
	lda ($5b),y
	sta $53
	sta $01
l9d11:	lda ($51),y
	pha
	dey
	bpl l9d11
	ldy $52
	lda $53
	jsr la111
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
	jsr lb9ee
	lda $53
	pha
	lda $52
	pha
	lda $51
	pha
	jsr lb463
	pla
	sta $5b
	pla
	sta $5c
	pla
	sta $5d
	jsr lb98b
	beq l9d51
	jmp l973a
l9d51:	pla
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
	jmp lb9ee
	lda $1c
	pha
	lda $1b
	pha
	jsr lb44a
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
	jmp l9ca3
	lda #$7a
	ldy #$a4
	bne l9db6
	jsr l9fc8
	jsr la4ea
	eor $7e
	sta $7f
	lda $71
	jmp l9db9
	ldy $89
	ldx $88
	bne l9daf
	dey
l9daf:	dex
l9db0:	rts
l9db1:	jsr l9ee5
	bcc l9df2
l9db6:	jsr l9fc8
	bne l9dbe
	jmp la13f
l9dbe:	ldx $80
	stx $63
	ldx #$79
	lda $79
	tay
	beq l9db0
	sec
	sbc $71
	beq l9df2
	bcc l9de2
	sty $71
	ldy $7e
	sty $76
	eor #$ff
	adc #$00
	ldy #$00
	sty $63
	ldx #$71
	bne l9de6
l9de2:	ldy #$00
	sty $80
l9de6:	cmp #$f9
	bmi l9db1
	tay
	lda $80
	lsr $01,x
	jsr l9efc
l9df2:	bit $7f
	bpl l9e4d
	ldy #$71
	cpx #$79
	beq l9dfe
	ldy #$79
l9dfe:	sec
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
	bcs l9e26
	jsr l9e96
l9e26:	ldy #$00
	tya
	clc
l9e2a:	ldx $72
	bne l9e78
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
	bne l9e2a
l9e46:	lda #$00
	sta $71
	sta $76
	rts
l9e4d:	adc $63
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
	jmp l9e85
l9e6c:	adc #$01
	asl $80
	rol $75
	rol $74
	rol $73
	rol $72
l9e78:	bpl l9e6c
	sec
	sbc $71
	bcs l9e46
	eor #$ff
	adc #$01
	sta $71
	bcc l9e95
	inc $71
	beq l9eca
	ror $72
	ror $73
	ror $74
	ror $75
	ror $80
l9e95:	rts
	jsr la4ea
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
	bne l9ec9
	inc $75
	bne l9ec9
	inc $74
	bne l9ec9
	inc $73
	bne l9ec9
	inc $72
l9ec9:	rts
l9eca:	ldx #$32
	jmp l854a
	ldx #$27
l9ed1:	ldy $04,x
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
	bmi l9ed1
	beq l9ed1
	sbc #$08
	tay
	lda $80
	bcs l9f06
l9ef2:	asl $01,x
	bcc l9ef8
	inc $01,x
l9ef8:	ror $01,x
	ror $01,x
	ror $02,x
	ror $03,x
	ror $04,x
	ror
	iny
	bne l9ef2
l9f06:	clc
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
	jsr la16e
	beq l9f3d
	bpl l9f40
l9f3d:	jmp l9aed
l9f40:	lda $71
	sbc #$7f
	pha
	lda #$80
	sta $71
	lda #$22
	ldy #$9f
	jsr l9db6
	lda #$27
	ldy #$9f
	jsr la052
	lda #$08
	ldy #$9f
	jsr l9d99
	lda #$0d
	ldy #$9f
	jsr la571
	lda #$2c
	ldy #$9f
	jsr l9db6
	pla
	jsr la2cf
	lda #$31
	ldy #$9f
	jsr l9fc8
	beq l9fc7
	jsr l9ffa
	lda #$00
	sta $28
	sta $29
	sta $2a
	sta $2b
	lda $80
	jsr l9fa2
	lda $75
	jsr l9fa2
	lda $74
	jsr l9fa2
	lda $73
	jsr l9fa2
	lda $72
	jsr l9fa7
	jmp la0c6
	bne l9fa7
	jmp l9ecf
l9fa7:	lsr
	ora #$80
l9faa:	tay
	bcc l9fb9
	clc
	ldx #$03
l9fb0:	lda $28,x
	adc $7a,x
	sta $28,x
	dex
	bpl l9fb0
l9fb9:	ror $28
	ror $29
	ror $2a
	ror $2b
	ror $80
	tya
	lsr
	bne l9faa
l9fc7:	rts
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
	jsr lb9ee
	sta $79
	lda $71
	rts
	lda $79
	beq la01d
	clc
	adc $71
	bcc la007
	bmi la022
	clc
	bit $1410
	adc #$80
	sta $71
	bne la012
	jmp l9e4a
la012:	lda $7f
	sta $76
	rts
	lda $76
	eor #$ff
	bmi la022
la01d:	pla
	pla
	jmp l9e46
la022:	jmp l9eca
	jsr la14f
	tax
	beq la03b
	clc
	adc #$02
	bcs la022
	ldx #$00
	stx $7f
	jsr l9dc6
	inc $71
	beq la022
la03b:	rts
	sty $20
	brk
	brk
	brk
	jsr la14f
	lda #$3c
	ldy #$a0
	ldx #$00
	stx $7f
	jsr la0d2
	jmp la055
	jsr l9fc8
	beq la0b4
	jsr la15e
	lda #$00
	sec
	sbc $71
	sta $71
	jsr l9ffa
	inc $71
	beq la022
	ldx #$fc
	lda #$01
la06c:	ldy $7a
	cpy $72
	bne la082
	ldy $7b
	cpy $73
	bne la082
	ldy $7c
	cpy $74
	bne la082
	ldy $7d
	cpy $75
la082:	php
	rol
	bcc la08f
	inx
	sta $2b,x
	beq la0b9
	bpl la0bd
	lda #$01
la08f:	plp
	bcs la0a0
	asl $7d
	rol $7c
	rol $7b
	rol $7a
	bcs la082
	bmi la06c
	bpl la082
la0a0:	tay
	txa
	pha
	ldx #$03
la0a5:	lda $7a,x
	sbc $72,x
	sta $7a,x
	dex
	bpl la0a5
	pla
	tax
	tya
	jmp la092
la0b4:	ldx #$3c
	jmp l854a
la0b9:	lda #$40
	bne la08f
la0bd:	asl
	asl
	asl
	asl
	asl
	asl
	sta $80
	plp
	ldx #$03
la0c8:	lda $28,x
	sta $72,x
	dex
	bpl la0c8
	jmp l9e26
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
	jmp lb9ee
	ldx #$6a
	bit $64a2
	ldy #$00
	jsr la15e
	lda #$0f
	bpl la116
	ldx $54
	ldy $55
	lda $56
	pha
	jsr la15e
	pla
la116:	sta $01
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
	jmp lb9ee
	lda $7e
	sta $76
	ldx #$05
la145:	lda $78,x
	sta $70,x
	dex
	bne la145
	stx $80
	rts
	jsr la15e
	ldx #$06
la154:	lda $70,x
	sta $78,x
	dex
	bne la154
	stx $80
la15d:	rts
	lda $71
	beq la15d
	asl $80
	bcc la15d
	jsr l9ebb
	bne la15d
	jmp l9e87
la16e:	lda $71
	beq la17b
la172:	lda $76
	rol
	lda #$ff
	bcs la17b
	lda #$01
la17b:	rts
	jsr la16e
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
	jmp l9e21
	lsr $76
	rts
	sta $25
	sty $26
	ldy #$00
	jsr la1e4
	iny
	tax
	beq la16e
	jsr la1e4
	eor $76
	bmi la172
	cpx $71
	bne la1db
	jsr la1e4
	ora #$80
	cmp $72
	bne la1db
	iny
	jsr la1e4
	cmp $73
	bne la1db
	iny
	jsr la1e4
	cmp $74
	bne la1db
	iny
	lda #$7f
	cmp $80
	jsr la1e4
	sbc $75
	beq la20b
la1db:	lda $76
	bcc la1e1
	eor #$ff
la1e1:	jmp la174
	jsr lb9da
	lda ($25),y
	jmp lb9ee
	lda $71
	beq la23a
	sec
	sbc #$a0
	bit $76
	bpl la200
	tax
	lda #$ff
	sta $78
	jsr l9e99
	txa
la200:	ldx #$71
	cmp #$f9
	bpl la20c
	jsr l9ee5
	sty $78
la20b:	rts
la20c:	tay
	lda $76
	and #$80
	lsr $72
	ora $72
	sta $72
	jsr l9efc
	sty $78
	rts
	lda $71
	cmp #$a0
	bcs la243
	jsr la1ec
	sty $80
	lda $76
	sty $76
	eor #$80
	rol
	lda #$a0
	sta $71
	lda $75
	sta $0c
	jmp l9e21
la23a:	sta $72
	sta $73
	sta $74
	sta $75
	tay
la243:	rts
	ldy #$00
	ldx #$0c
la248:	sty $6b,x
	dex
	bpl la248
	bcc la25e
	cmp #$2d
	bne la257
	stx $77
	beq la25b
la257:	cmp #$2b
	bne la260
la25b:	jsr lb988
la25e:	bcc la2bb
la260:	cmp #$2e
	beq la292
	cmp #$45
	bne la298
	jsr lb988
	bcc la284
	cmp #$ab
	beq la27f
	cmp #$2d
	beq la27f
	cmp #$aa
	beq la281
	cmp #$2b
	beq la281
	bne la286
la27f:	ror $6f
la281:	jsr lb988
la284:	bcc la2e2
la286:	bit $6f
	bpl la298
	lda #$00
	sec
	sbc $6c
	jmp la29a
la292:	ror $6e
	bit $6e
	bvc la25b
la298:	lda $6c
	sec
	sbc $6b
	sta $6c
	beq la2b3
	bpl la2ac
la2a3:	jsr la041
	inc $6c
	bne la2a3
	beq la2b3
la2ac:	jsr la025
	dec $6c
	bne la2ac
la2b3:	lda $77
	bmi la2b8
	rts
la2b8:	jmp la4e6
la2bb:	pha
	bit $6e
	bpl la2c2
	inc $6b
la2c2:	jsr la025
	pla
	sec
	sbc #$30
	jsr la2cf
	jmp la25b
	pha
	jsr la14f
	pla
	jsr la17f
	lda $7e
	eor $76
	sta $7f
	ldx $71
	jmp l9db9
la2e2:	lda $6c
	cmp #$0a
	bcc la2f1
	lda #$64
	bit $6f
	bmi la30c
	jmp l9eca
la2f1:	asl
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
	jsr lb9ee
	adc $025b
	sec
	sbc #$30
la30c:	sta $6c
	jmp la281
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
	jsr la18c
	jsr la34e
	ldx #$22
	lda l8272,x
	ldy l8273,x
	sta $025b
	sty $025c
la33b:	jsr $025a
	beq la34d
	jsr lb49c
	inc $025b
	bne la33b
	inc $025c
	bne la33b
la34d:	rts
	ldy #$01
	lda #$20
	bit $76
	bpl la358
	lda #$2d
la358:	sta $01ff,y
	sta $76
	sty $82
	iny
	lda #$30
	ldx $71
	bne la369
	jmp la470
la369:	lda #$00
	cpx #$80
	beq la371
	bcs la37a
la371:	lda #$1b
	ldy #$a3
	jsr l9f74
	lda #$f7
la37a:	sta $6b
la37c:	lda #$16
	ldy #$a3
	jsr la19e
	beq la3a3
	bpl la399
la387:	lda #$11
	ldy #$a3
	jsr la19e
	beq la392
	bpl la3a0
la392:	jsr la025
	dec $6b
	bne la387
la399:	jsr la041
	inc $6b
	bne la37c
la3a0:	jsr l9d93
la3a3:	jsr la1ec
	ldx #$01
	lda $6b
	clc
	adc #$0a
	bmi la3b8
	cmp #$0b
	bcs la3b9
	adc #$ff
	tax
	lda #$02
la3b8:	sec
la3b9:	sbc #$02
	sta $6c
	stx $6b
	txa
	beq la3c4
	bpl la3d7
la3c4:	ldy $82
	lda #$2e
	iny
	sta $01ff,y
	txa
	beq la3d5
	lda #$30
	iny
	sta $01ff,y
la3d5:	sty $82
la3d7:	ldy #$00
	ldx #$80
la3db:	lda $75
	clc
	adc la482,y
	sta $75
	lda $74
	adc la481,y
	sta $74
	lda $73
	adc la480,y
	sta $73
	lda $72
	adc la47f,y
	sta $72
	inx
	bcs la3fe
la3fb:	bpl la3db
	bit $db30
	txa
	bcc la407
	eor #$ff
	adc #$0a
la407:	adc #$2f
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
	bne la422
	lda #$2e
	iny
	sta $01ff,y
la422:	sty $82
	ldy $51
	txa
	eor #$ff
	and #$80
	tax
	cpy #$24
	bne la3db
	ldy $82
la432:	lda $01ff,y
	dey
	cmp #$30
	beq la432
	cmp #$2e
	beq la43f
	iny
la43f:	lda #$2b
	ldx $6c
	beq la473
	bpl la44f
la447:	lda #$00
	sec
	sbc $6c
	tax
	lda #$2d
la44f:	sta $0201,y
	lda #$45
	sta $0200,y
	txa
	ldx #$2f
	sec
la45b:	inx
	sbc #$0a
	bcs la45b
	adc #$3a
	sta $0203,y
	txa
	sta $0202,y
	lda #$00
	sta $0204,y
	beq la478
	sta $01ff,y
la473:	lda #$00
	sta $0200,y
la478:	rts
	bcc la3fb
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
	beq la447
	cpy #$00
	ora ($86,x)
	ldy #$ff
	!byte $ff
	cld
	beq la494
la494:	brk
	!byte $03
	inx
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $9c
	brk
la49c:	brk
	brk
	asl
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	jsr la14f
	lda #$7a
	ldy #$a4
	jsr la0d2
	beq la51f
	lda $79
	bne la4b6
	jmp l9e48
la4b6:	ldx #$5b
	ldy #$00
	jsr la104
	lda $7e
	bpl la4d0
	jsr la21d
	lda #$5b
	ldy #$00
	jsr la19e
	bne la4d0
	tya
	ldy $0c
la4d0:	jsr la141
	tya
	pha
	jsr l9f36
	lda #$5b
	ldy #$00
	jsr l9f74
	jsr la51f
	pla
	lsr
	bcc la4f0
	lda $71
	beq la4f0
	lda $76
	eor #$ff
	sta $76
la4f0:	rts
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
	bpl la49c
	brk
	brk
	brk
	brk
la51f:	lda #$f1
	ldy #$a4
	jsr l9f74
	lda $80
	adc #$50
	bcc la52f
	jsr la166
la52f:	sta $63
	jsr la152
	lda $71
	cmp #$88
	bcc la53d
la53a:	jsr la017
la53d:	jsr la21d
	lda $0c
	clc
	adc #$81
	beq la53a
	sec
	sbc #$01
	pha
	ldx #$05
la54d:	lda $79,x
	ldy $71,x
	sta $71,x
	sty $79,x
	dex
	bpl la54d
	lda $63
	sta $80
	jsr l9d9c
	jsr la4e6
	lda #$f6
	ldy #$a4
	jsr la587
	lda #$00
	sta $7f
	pla
	jmp lbbb8
	sta $82
	sty $83
	jsr la100
	lda #$64
	jsr l9f74
	jsr la58b
	lda #$64
	ldy #$00
	jmp l9f74
	sta $82
	sty $83
	jsr la0fd
	lda #$00
	ora ($82),y
	sta $77
	ldy $82
	iny
	tya
	bne la59c
	inc $83
la59c:	sta $82
	ldy $83
la5a0:	jsr l9f74
	lda $82
	ldy $83
	clc
	adc #$05
	bcc la5ad
	iny
la5ad:	sta $82
	sty $83
	jsr l9db6
	lda #$6a
	ldy #$00
	dec $77
	bne la5a0
	rts
	tya
	and $44,x
	!byte $7a
	pla
	plp
	lda ($46),y
	jsr la16e
	bmi la5e6
	ldx $8d
	ldy $8e
	inx
	bne la5d2
	iny
la5d2:	txa
	ldx #$04
	jsr la0d4
	lda #$bd
	ldy #$a5
	jsr l9f74
	lda #$c1
	ldy #$a5
	jsr l9db6
la5e6:	ldx $75
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
	jsr l9e26
	ldx $8d
	ldy $8e
	lda #$04
	inx
	bne la60f
	iny
la60f:	jmp la111
	lda #$92
	ldy #$a6
	jsr l9db6
	jsr la14f
	lda #$97
	ldy #$a6
	ldx $7e
	jsr la04a
	jsr la14f
	jsr la21d
	lda #$00
	sta $7f
	jsr l9d9c
	lda #$9c
	ldy #$a6
	jsr l9d99
	lda $76
	pha
	bpl la64d
	jsr l9d93
	lda $76
	bmi la650
	lda $0259
	eor #$ff
	sta $0259
la64d:	jsr la4e6
la650:	lda #$9c
	ldy #$a6
	jsr l9db6
	pla
	bpl la65d
	jsr la4e6
la65d:	lda #$a1
	ldy #$a6
	jmp la571
	jsr la100
	lda #$00
	sta $0259
	jsr la619
	ldx #$5b
	ldy #$00
	jsr la104
	lda #$64
	ldy #$00
	jsr la0d2
	lda #$00
	sta $76
	lda $0259
	jsr la68e
	lda #$5b
	ldy #$00
	jmp la052
	pha
	jmp la64d
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
	bcs la6e0
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
	bvs la72b
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
	bpl la705
	jsr la4e6
la705:	lda $71
	pha
	cmp #$81
	bcc la713
	lda #$08
	ldy #$9f
	jsr la052
la713:	lda #$c0
	ldy #$a6
	jsr la571
	pla
	cmp #$81
	bcc la726
	lda #$92
	ldy #$a6
	jsr l9d99
la726:	pla
	bpl la78a
	jmp la4e6
	jsr l91a1
	jsr lb9d5
	tay
	beq la744
	cpy #$04
	bcc la73b
	ldy #$04
la73b:	dey
la73c:	lda ($22),y
	sta $0273,y
	dey
	bpl la73c
la744:	jmp lb9ee
	jsr lb466
	jsr la34e
	pla
	pla
	ldy #$00
la751:	lda $0200,y
	beq la759
	iny
	bne la751
la759:	tya
	jsr la77d
	sty $01
	ldy #$00
la761:	lda $0200,y
	beq la76b
	sta ($71),y
	iny
	bne la761
la76b:	jsr lb9ee
	jmp la7d8
	ldx $76
	stx $60
	ldx $74
	ldy $75
	stx $5e
	sty $5f
	jsr lacb5
	sta $70
	stx $71
	sty $72
	ldy #$04
	sty $73
la78a:	rts
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
la7a5:	iny
	lda ($7f),y
	beq la7b6
	cmp $0c
	beq la7b2
	cmp $0d
	bne la7a5
la7b2:	cmp #$22
	beq la7b7
la7b6:	clc
la7b7:	jsr lb9ee
	sty $70
	tya
	adc $7f
	sta $82
	ldx $80
	bcc la7c6
	inx
la7c6:	stx $83
	tya
	jsr la771
	ldx #$02
la7ce:	ldy $7f,x
	sty $22,x
	dex
	bpl la7ce
	jsr la830
	ldy $1d
	cpy #$0c
	bne la7e3
	ldx #$46
	jmp l854a
la7e3:	lda #$04
	sta $01
	sta $76
	ldx #$00
la7eb:	lda $70,x
	sta ($20),y
	iny
	inx
	cpx #$04
	bne la7eb
	jsr lb9ee
	lda $21
	sta $75
	sta $1f
	clc
	lda $20
	adc $1d
	sta $74
	sta $1e
	bcc la80d
	inc $75
	inc $1f
la80d:	sty $1d
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
	beq la845
	pha
	ldx #$04
la836:	dey
	lda $24
	sta $01
	lda ($22),y
	stx $01
	sta ($3d),y
	tya
	bne la836
	pla
la845:	jsr lb9ee
	clc
	adc $3d
	sta $3d
	bcc la851
	inc $3e
la851:	rts
	jsr lb468
	lda $74
	ldy $75
	ldx $76
	jsr la8bb
	bne la89c
	jsr la995
	bcc la89c
	jsr la982
	pha
	eor #$ff
	sec
	adc $22
	ldy $23
	bcs la873
	dey
la873:	sta $22
	sty $23
	tax
	pla
	ldy $24
	cpy #$04
	bne la8de
	ldy $23
	cpy $3c
	bne la8de
	cpx $3b
	bne la8de
	pha
	clc
	adc $3b
	bcc la891
	inc $3c
la891:	clc
	adc #$03
	sta $3b
	bcc la89a
	inc $3c
la89a:	pla
	rts
la89c:	jsr lb9d5
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
	jsr lb9ee
	pla
	sta $22
	pla
	rts
	sta $22
	sty $23
	stx $24
	cpx #$04
	bne la8de
	cpy $1f
	bne la8de
	cmp $1e
	bne la8de
	sbc #$04
	sta $1e
	bcs la8d5
	dec $1f
la8d5:	sec
	lda $1d
	sbc #$04
	sta $1d
	ldy #$00
la8de:	rts
	ldy $56
	cpy #$0f
	bne la8e8
	jmp lac38
la8e8:	ldy $76
	cpy #$03
	beq la91f
	cpy #$02
	beq la91f
	lda $74
	ldy $75
	ldx $76
	sta $5e
	sty $5f
	stx $60
	jsr la8bb
	jsr la995
	bcc la909
	jsr la95e
la909:	jsr la974
	ldx $56
	ldy #$03
la910:	jsr lb9d0
	lda ($5e),y
	stx $01
	sta ($54),y
	dey
	bpl la910
	jmp lb9ee
la91f:	lda $76
	sta $01
	ldy #$00
	lda ($74),y
	jsr lb9ee
	jsr la771
	ldx #$02
la92f:	ldy $5e,x
	sty $7f,x
	dex
	bpl la92f
	jsr la817
	lda $7f
	ldy $80
	ldx $81
	jsr la8c1
	jsr la9ce
	bcc la94a
	jsr la95e
la94a:	jsr la974
	ldy #$03
	lda $56
	sta $01
la953:	lda $0070,y
	sta ($54),y
	dey
	bpl la953
	jmp lb9ee
	jsr lb9d5
	ldy #$00
	lda $54
	sta ($22),y
	iny
	lda $55
	sta ($22),y
	iny
	lda $56
	sta ($22),y
	jmp lb9ee
	ldx #$02
la976:	ldy $54,x
	sty $22,x
	dex
	bpl la976
	jsr la995
	bcc la9c7
	jsr lb9d5
	ldy #$02
	lda #$ff
	sta ($22),y
	dey
	sta ($22),y
	dey
	txa
	sta ($22),y
	jmp lb9ee
	jsr lb9d5
	ldy #$00
	lda ($22),y
	pha
	beq la9c8
	iny
	lda ($22),y
	pha
	iny
	lda ($22),y
	tax
	iny
	lda ($22),y
	tay
	jsr lb9ee
	pla
	cpy $19
	bne la9bb
	cpx $18
	bne la9bb
	cmp $17
	beq la9c8
la9bb:	sta $22
	stx $23
	sty $24
	pla
	tax
	jsr laa7a
	sec
la9c7:	rts
la9c8:	jsr lb9ee
	pla
	clc
	rts
	lda $70
	pha
	beq la9c8
	lda $71
	ldx $72
	ldy $73
	jmp la9af
	lda $76
	pha
	lda $75
	pha
	lda $74
	pha
	jsr l9699
	jsr lb468
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
	jsr lb9ee
	clc
	adc $025b
	bcc laa0f
	jmp lb6e7
laa0f:	jsr la771
	jsr la817
	jsr laa2a
	jsr la830
	lda $7f
	ldy $80
	ldx $81
	jsr la85b
	jsr la7d8
	jmp l95c9
	lda $5e
	ldy $5f
	ldx $60
	jmp la85b
	jsr lb43b
	txa
	pha
	lda #$01
	jsr la77d
	jsr lb9cb
	pla
	ldy #$00
	sta ($71),y
	jsr lb9ee
	pla
	pla
	jmp la7d8
	jsr laad2
	pha
	jsr lb9d0
	lda ($5e),y
	sta $025b
	pla
	cmp $025b
	tya
	bcc laa64
	lda ($5e),y
	tax
	tya
laa64:	jsr lb9ee
	pha
laa68:	txa
laa69:	pha
	jsr la77d
	jsr laa2a
	pla
	tay
	pla
	jsr laa7a
	tya
	jmp la7d5
	clc
	adc $22
	sta $22
	bcc laa83
	inc $23
laa83:	rts
	jsr laad2
	pha
	jsr lb9d0
	lda ($5e),y
	sta $025b
	pla
	clc
	sbc $025b
	eor #$ff
	jmp laa5e
	jsr lb98b
	cmp #$29
	beq laaef
	jmp lb42f
	lda #$ff
	sta $75
	jsr laa9a
	jsr laad2
	beq lab0d
	dex
	txa
	pha
	pha
	clc
	ldx #$00
	jsr lb9d0
	lda ($5e),y
	jsr lb9ee
	sta $025b
	pla
	sbc $025b
	bcs laa68
	eor #$ff
	cmp $75
	bcc laa69
	lda $75
	bcs laa69
	jsr l9715
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
laaef:	rts
	jsr laaf6
	jmp l9ca3
	jsr la852
	ldx #$00
	stx $11
	tay
	rts
	jsr laaf6
	beq lab0d
	ldy #$00
	jsr lb041
	tay
	jmp l9ca3
lab0d:	jmp l9aed
	jsr laaf6
	bne lab18
	jmp l9e46
lab18:	ldx #$02
lab1a:	ldy $85,x
	sty $82,x
	dex
	bpl lab1a
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
	bcc lab37
	inx
lab37:	stx $26
	ldy #$00
	lda ($25),y
	pha
	tya
	sta ($25),y
	jsr lb9ee
	jsr lb98b
	jsr la244
	jsr lb9df
	pla
	ldy #$00
	sta ($25),y
	jsr lb9ee
	ldx $82
	ldy $83
	lda $84
	stx $85
	sty $86
	sta $87
	rts
	pla
	jsr l970f
	jsr lb466
	jsr lb43b
	txa
	asl
	cmp #$56
	bcs lab0d
	tay
	lda l8272,y
	sta $25
	lda l8273,y
	sta $26
	jsr lb9da
	ldy #$ff
	ldx #$00
lab84:	iny
	lda ($25),y
	beq lab90
	cmp #$20
	bcc lab84
	inx
	bne lab84
lab90:	txa
	jsr la77d
	ldy #$ff
	ldx #$00
lab98:	iny
	jsr lb9da
	lda ($25),y
	beq labb8
	cmp #$20
	bcc lab98
	sty $025b
	pha
	txa
	tay
	pla
	jsr lb9cb
	sta ($71),y
	tya
	tax
	ldy $025b
	inx
	bne lab98
labb8:	jsr lb9ee
	jmp la7d8
	jsr $ffde
	pha
	and #$7f
	sta $07
	tya
	and #$9f
	php
	and #$1f
	cmp #$12
	bne labd2
	lda #$00
labd2:	plp
	bpl labdc
	sei
	sed
	clc
	adc #$12
	cld
	cli
labdc:	sta $05
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
	jsr lacb5
	stx $22
	sty $23
	ldy #$04
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
lac15:	lda $05,x
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
	bpl lac15
	lda $22
	ldy $23
	ldx $24
	jmp la78b
	jsr la855
	pha
	cmp #$06
	beq lac44
	cmp #$07
	bne lacb2
lac44:	ldy #$00
	sty $82
lac48:	jsr lac9f
	asl
	asl
	asl
	asl
	sta $0005,y
	jsr lac9f
	ora $0005,y
	sta $0005,y
	iny
	cpy #$03
	bne lac48
	pla
	cmp #$06
	beq lac6a
	jsr lac9f
	bne lac6c
lac6a:	lda #$00
lac6c:	sta $08
	lda $05
	cmp #$12
	bcc lac7e
	sei
	sed
	sbc #$12
	cld
	cli
	ora #$80
	sta $05
lac7e:	lda #$00
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
	jsr lb041
	jsr lb9b2
	bcs lacb2
	sbc #$2f
	ldy $83
	rts
lacb2:	jmp l9aed
	lsr $13
lacb7:	tax
	beq lad06
	pha
	lda $3b
	sec
	sbc #$03
	ldy $3c
	bcs lacc7
	beq lad07
	dey
lacc7:	sta $22
	sty $23
	txa
	eor #$ff
	sec
	adc $22
	bcs lacdd
	sta $025b
	tya
	beq lad07
	lda $025b
	dey
lacdd:	cpy $3a
	bcc lad07
	bne lace7
	cmp $39
	bcc lad07
lace7:	sta $3d
	sty $3e
	jsr lb9df
	ldy #$02
	lda #$ff
	sta ($22),y
	dey
	sta ($22),y
	dey
	pla
	sta ($22),y
	jsr lb9ee
	ldx $3d
	ldy $3e
	stx $3b
	sty $3c
lad06:	rts
lad07:	lda $13
	bmi lad14
	jsr lad17
	sec
	ror $13
	pla
	bne lacb7
lad14:	jmp l8548
	lda #$04
	sta $01
	lda $1d
	beq lad3b
lad1f:	pha
	jmp lbb95
	tya
	clc
	adc $20
	ldy #$00
	sta ($6a),y
	lda $21
	iny
	sta ($6a),y
	lda #$04
	iny
	sta ($6a),y
	pla
	sec
	sbc #$04
	bne lad1f
lad3b:	ldy #$00
	sty $64
	lda $3f
	ldy $40
	sta $6d
	sta $5b
	sta $3d
	sty $6e
	sty $5c
	sty $3e
lad4f:	jsr ladb8
	bne lad63
lad54:	ldy #$00
	jsr lb9df
	lda ($5b),y
	jsr lae2a
	sec
	ror $64
	bne lad4f
lad63:	bit $64
	bpl lad9f
	ldx #$00
	stx $64
lad6b:	ldy #$02
	jsr lb9df
lad70:	lda ($5b),y
	sta ($6d),y
	dey
	bpl lad70
	jsr lada5
	txa
	tay
	jsr lb9df
lad7f:	dey
	lda ($5b),y
	sta ($6d),y
	dex
	bne lad7f
	jsr lb9d5
	ldy #$02
lad8c:	lda $006c,y
	sta ($22),y
	dey
	bne lad8c
	lda $5b
	ldy $5c
	jsr ladb8
	beq lad54
	bne lad6b
lad9f:	jsr lada5
	jmp lad4f
	ldy #$00
	jsr lb9d5
	lda ($22),y
	tax
	jsr lae39
	sta $3d
	sty $3e
	txa
	jmp lae2a
	cpy $3c
	bcc lade7
	bne ladc4
	cmp $3b
	beq lade7
	bcc lade7
ladc4:	bit $64
	bmi ladcd
	lda #$03
	jsr lae39
ladcd:	lda #$03
	jsr lae2a
	ldy #$02
	jsr lb9df
	lda ($5b),y
	cmp #$ff
	bne ladde
	rts
ladde:	lda ($5b),y
	sta $0022,y
	dey
	bpl ladde
	rts
lade7:	lda $1d
	beq lae03
ladeb:	pha
	jmp lbba0
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
	bne ladeb
lae03:	jsr lb9ee
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
	jmp lbbab
	sta $6a
	bcc lae29
	inc $6b
lae29:	rts
	eor #$ff
	sec
	adc $5b
	ldy $5c
	bcs lae34
	dey
lae34:	sta $5b
	sty $5c
	rts
	eor #$ff
	sec
	adc $6d
	ldy $6e
	bcs lae43
	dey
lae43:	sta $6d
	sty $6e
	rts
lae48:	jmp l9aed
	ldx #$02
lae4d:	lda $74,x
	sta $02a0,x
	dex
	bpl lae4d
	jsr l95ac
	jsr lb468
	ldx #$02
lae5d:	lda $74,x
	sta $02a3,x
	dex
	bpl lae5d
	ldx #$01
	stx $75
	jsr laa9a
	jsr l9715
	ldx $75
	beq lae48
	dex
	stx $73
	ldx #$05
lae78:	lda $02a0,x
	sta $64,x
	dex
	bpl lae78
	lda $66
	sta $01
	ldy #$03
lae86:	lda ($64),y
	sta $006a,y
	dey
	bpl lae86
	lda $69
	sta $01
	ldy #$03
lae94:	lda ($67),y
	sta $006e,y
	dey
	bpl lae94
	lda $6e
	beq laed9
	lda $6d
	sta $01
laea4:	lda #$00
	sta $74
	clc
	lda $6e
	adc $73
	bcs laed9
	cmp $6a
	bcc laeb5
	bne laed9
laeb5:	ldy $74
	cpy $6e
	beq laed4
	tya
	clc
	adc $73
	tay
	lda ($6b),y
	sta $72
	ldy $74
	lda ($6f),y
	cmp $72
	beq laed0
	inc $73
	bne laea4
laed0:	inc $74
	bne laeb5
laed4:	inc $73
	lda $73
	bit $00a9
	pha
	lda $02a3
	ldy $02a4
	ldx $02a5
	jsr la85b
	lda $02a0
	ldy $02a1
	ldx $02a2
	jsr la85b
	jsr lb9ee
	pla
	tay
	jmp l9ca3
laefc:	jmp l973a
	beq laefc
	jsr laf56
	beq laefc
	lda $6d
	ldx $6e
	sta $25
	stx $26
	jsr l8717
	bcc laf25
	ldy #$01
	lda ($6d),y
	dey
	tax
	bne laf1f
	lda ($6d),y
	beq laf25
laf1f:	lda ($6d),y
	sta $6d
	stx $6e
laf25:	lda $25
	sec
	sbc $6d
	tax
	lda $26
	sbc $6e
	tay
	bcs laf53
	txa
	clc
	adc $2f
	sta $2f
	tya
	adc $30
	sta $30
	ldy #$00
laf3f:	jsr lb9ee
	lda ($6d),y
	sta ($25),y
	iny
	bne laf3f
	inc $6e
	inc $26
	lda $30
	cmp $26
	bcs laf3f
laf53:	jmp l8693
	bcc laf61
	beq laf61
	cmp #$ab
	beq laf61
laf5e:	lda #$00
	rts
laf61:	jsr lb9ee
	jsr l8d39
	jsr l8717
	jsr lb98b
	beq laf7b
	cmp #$ab
	bne laf5e
	jsr lb988
	jsr l8d39
	bne laf5e
laf7b:	lda $1b
	ora $1c
	bne laf87
	lda #$ff
	sta $1b
	sta $1c
laf87:	rts
	ldx #$ff
	stx $0272
	jsr lb988
	jsr l95ac
	jsr lb468
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
lafa7:	sta $0009,y
	lda ($74),y
	dey
	bpl lafa7
	sta $0271
	stx $01
	tay
	beq lafc1
lafb7:	dey
	lda ($09),y
	cmp #$23
	beq lafc4
	tya
	bne lafb7
lafc1:	jmp l973a
lafc4:	lda #$3b
lafc6:	jsr l971d
	sty $8b
	sty $025f
	jsr l95ac
	bit $11
	bpl lb010
	jsr lb207
	jsr lb34c
	ldx $0267
	beq laff6
	ldx #$00
	sec
	lda $026d
	sbc $025e
	bcc laff6
	ldx #$3d
	cpx $0267
	bne laff5
	lsr
	adc #$00
laff5:	tax
laff6:	ldy #$00
laff8:	txa
	beq lb000
	dex
laffc:	lda #$20
	bne lb009
lb000:	cpy $025e
	bcs laffc
	jsr lb041
	iny
lb009:	jsr lb345
	bne laff8
	beq lb01c
lb010:	jsr la34e
	jsr la74f
	jsr lb207
	jsr lb049
lb01c:	jsr lb98b
	cmp #$2c
	beq lafc6
	sec
	ror $8b
	jsr lb34c
	pla
	tax
	pla
	tay
	pla
	jsr lb9ee
	jsr la85b
	jsr lb98b
	cmp #$3b
	beq lb03e
	jmp l8eb3
lb03e:	jmp lb988
	jsr lb9d5
	lda ($22),y
	jmp lb9ee
	lda $0273
	sta $026f
	lda #$ff
lb051:	sta $026e
	bit l8c86
lb057:	cpy $025e
	beq lb08f
	lda $0200,y
	iny
	cmp #$20
	beq lb057
	cmp #$2d
	beq lb051
	cmp #$2e
	beq lb055
	cmp #$45
	beq lb081
	sta $0200,x
	stx $0260
	inx
	bit $8c
	bpl lb057
	inc $0266
	jmp lb057
lb081:	lda $0200,y
	cmp #$2d
	bne lb08b
	ror $0264
lb08b:	iny
	sty $0265
lb08f:	lda $8c
	bpl lb095
	stx $8c
lb095:	jsr lb34c
	lda $0268
	cmp #$ff
	beq lb0c8
	lda $026b
	beq lb0e3
	lda $0265
	bne lb0bb
	ldx $0260
	jsr lb1d3
	dec $0202,x
	inx
	stx $0265
	jsr lb264
	beq lb0e0
lb0bb:	ldy $026a
	bne lb0d7
	ldy $026e
	bmi lb0d7
	lda $0268
lb0c8:	beq lb133
	dec $0268
	bne lb0d4
	lda $0269
	beq lb133
lb0d4:	inc $0263
lb0d7:	jsr lb14b
	jsr lb222
	jsr lb14b
lb0e0:	jmp lb29a
lb0e3:	ldy $0265
	beq lb0fe
	sta $025e
	sec
	ror $026c
	ldy $8c
	lda $0264
	bpl lb0fb
	jsr lb185
	beq lb10c
lb0fb:	jsr lb166
lb0fe:	ldy $8c
	beq lb10c
	jsr lb268
	bne lb10c
	dec $0266
	bcs lb10f
lb10c:	jsr lb222
lb10f:	sec
	lda $0268
	sbc $0266
	bcc lb133
	sta $0263
	ldy $026a
	bne lb13b
	ldy $026e
	bmi lb13b
	tay
	beq lb133
	dey
	bne lb13e
	lda $0269
	ora $0266
	bne lb0e0
lb133:	lda #$2a
lb135:	jsr lb345
	bne lb135
	rts
lb13b:	tay
	beq lb0e0
lb13e:	lda $0266
	bne lb0e0
	dec $0263
	inc $8b
	jmp lb0e0
	sec
	lda $0268
	sbc $0266
	beq lb18f
	ldy $8c
	bcc lb170
	sta $025e
lb15b:	cpy $0260
	beq lb162
	bcs lb163
lb162:	iny
lb163:	inc $0266
	jsr lb19c
	dec $025e
	bne lb15b
	beq lb18d
lb170:	eor #$ff
	adc #$01
	sta $025e
lb177:	cpy $025f
	beq lb181
	dey
	dec $0266
	bit l8be6
	lda #$80
	jsr lb19e
	dec $025e
	bne lb177
lb18d:	sty $8c
lb18f:	rts
	bne lb1cb
	eor #$09
	sta $0200,x
	dex
	cpx $0265
	rts
	lda #$00
	ldx $0265
	inx
	bit $026c
	bmi lb1b7
	eor $0264
	beq lb1b7
lb1ac:	jsr lb1e1
	jsr lb190
	bcs lb1ac
	jmp l9eca
lb1b7:	lda $0200,x
	dec $0200,x
	cmp #$30
	jsr lb190
	bcs lb1b7
	bit $026c
	bpl lb1ce
	sty $8c
lb1cb:	pla
	pla
	rts
lb1ce:	lda $0264
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
	beq lb1f3
	cpy $0271
	bcc lb1f7
lb1f3:	ldy $8b
	bne lb1cb
lb1f7:	jsr lb1fe
	inc $026d
	rts
	lda $0b
	sta $01
	lda ($09),y
	jmp lb9ee
	jsr la855
	sta $025e
	ldx #$0a
	lda #$00
lb211:	sta $0263,x
	dex
	bpl lb211
	stx $0262
	stx $8c
	stx $0261
	tax
	tay
	rts
	clc
	lda $8c
	adc $0269
	bcs lb263
	sec
	sbc $8b
	bcc lb263
	cmp $0260
	beq lb236
	bcs lb263
lb236:	cmp $025f
	bcc lb263
	tax
	lda $0200,x
	cmp #$35
	bcc lb263
lb243:	cpx $025f
	beq lb252
	dex
	jsr lb1e1
	stx $0260
	beq lb243
	rts
lb252:	lda #$31
	sta $0200,x
	inx
	stx $8c
	dec $8b
	bpl lb263
	inc $8b
	inc $0266
lb263:	rts
	ldy $8c
	beq lb27f
	ldy $025f
	lda $0200,y
	cmp #$30
	rts
lb271:	inc $8c
	jsr lb19c
	inc $025f
	cpy $0260
	beq lb263
	iny
lb27f:	jsr lb26b
	beq lb271
	rts
lb285:	cpx $0260
	beq lb28f
	inx
	lda $0200,x
	bit $30a9
	lsr $0262
	jsr lb345
	bne lb2a8
	rts
	lda $0261
	bmi lb2a1
	inc $8b
lb2a1:	ldx $025f
	dex
	ldy $0270
lb2a8:	jsr lb1fe
	iny
	cmp #$2c
	bne lb2c1
	bit $0262
	bmi lb2bb
	lda $0274
	jmp lb294
lb2bb:	lda $026f
	jmp lb294
lb2c1:	cmp #$2e
	bne lb2e0
	lda $0275
	jmp lb294
lb2cb:	lda $8b
	beq lb285
	dec $8b
	lda $0261
	bmi lb28f
	sec
	ror $0261
	lda $0276
	jmp lb291
lb2e0:	cmp #$2b
	beq lb31f
	cmp #$2d
	beq lb31a
	cmp #$5e
	bne lb325
	lda #$45
	jsr lb345
	ldy $0265
	jsr lb26b
	bne lb2ff
	iny
	jsr lb26b
	beq lb306
lb2ff:	lda #$2d
	bit $0264
	bmi lb308
lb306:	lda #$2b
lb308:	jsr lb345
	ldx $0265
	lda $0200,x
	jsr lb345
	ldy $0272
	jmp lb28a
lb31a:	lda $026e
	bmi lb2bb
lb31f:	lda $026e
	jmp lb294
lb325:	lda $0263
	beq lb2cb
	dec $0263
lb32d:	bne lb2bb
	lda $026a
	bmi lb32d
	jsr lb1fe
	cmp #$2c
	bne lb31a
	lda $026f
	jsr lb345
	iny
	jmp lb334
	jsr lb49c
	dec $026d
lb34b:	rts
	ldy $0272
lb34f:	jsr lb1ea
	jsr lb400
	bne lb36b
	sty $0270
	bcc lb375
	tax
lb35d:	jsr lb1ea
	bcs lb367
	jsr lb408
	beq lb370
lb367:	ldy $0270
	txa
lb36b:	jsr lb49c
	bcc lb34f
lb370:	bcs lb35d
	ldy $0270
lb375:	ldx $8b
	bne lb34b
	stx $026d
	dey
lb37d:	dec $026d
lb380:	jsr lb1ea
	bcs lb3f9
	cmp #$2c
	beq lb380
	jsr lb3d7
	bcc lb37d
	cmp #$2e
	bne lb39a
	inx
	cpx #$02
	bcc lb380
lb397:	jmp l973a
lb39a:	jsr lb40c
	bne lb3aa
	bcc lb3a4
	sta $0267
lb3a4:	inc $0268,x
	jmp lb380
lb3aa:	cmp #$24
	bne lb3bd
	bit $0261
	bpl lb3a4
	clc
	ror $0261
	dec $0268
	jmp lb3a4
lb3bd:	cmp #$5e
	bne lb3d7
	ldx #$02
lb3c3:	jsr lb1ea
	bcs lb397
	cmp #$5e
	bne lb397
	dex
	bpl lb3c3
	inc $026b
	jsr lb1ea
	bcs lb3f9
lb3d7:	cmp #$2b
	bne lb3f4
	lda $026e
	bpl lb3e5
	lda #$2b
	sta $026e
lb3e5:	lda $026a
	bne lb397
	ror $026a
	sty $0272
	inc $026d
	rts
lb3f4:	cmp #$2d
	beq lb3e5
	sec
lb3f9:	sty $0272
	dec $0272
	rts
	cmp #$2b
	beq lb419
	cmp #$2d
	beq lb419
	cmp #$2e
	beq lb419
	cmp #$3d
	beq lb419
	cmp #$3e
	beq lb419
	cmp #$23
	bne lb419
	clc
lb419:	rts
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
	jsr lb447
	jsr l971b
	jmp lb438
	jsr lb988
; getbyt
	jsr lb463
	jsr l9a52
	ldx $74
	bne lb460
	ldx $75
	jmp lb98b
; getpin	
	jsr lb463
; getadr
	lda $76
	bmi lb460
	lda $71
	cmp #$91
	bcs lb460
	jsr la1ec
	lda $74
	ldy $75
	sty $1b
	sta $1c
	rts
lb460:	jmp l9aed
	jsr l95ac
	clc
	bit $38
	bit $11
	bmi lb470
	bcs lb472
lb46f:	rts
lb470:	bcs lb46f
lb472:	ldx #$40
	jmp l854a
	jsr la855
	tax
	ldy #$00
	inx
	jsr lb9d5
	dex
	beq lb48d
	lda ($22),y
	jsr lb49c
	iny
	jmp lb481
lb48d:	jmp lb9ee
	lda $1a
	beq lb497
	lda #$20
	bit $1da9
	bit $3fa9
	jsr lbb61
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
lb4b8:	sta $0200,x
	dex
	bne lb4b8
	ldx #$06
lb4c0:	lda lb4a2,x
	sta $021b,x
	dex
	bpl lb4c0
	ldx $0257
	stx $021a
	jsr lb98b
	bne lb4e2
	pla
	and $8c
	bne lb535
	pla
	jsr lb717
	lda $8b
	ldx $8c
	rts
lb4e2:	cmp #$23
	beq lb522
	cmp #$57
	beq lb538
	cmp #$4c
	beq lb538
	cmp #$52
	bne lb508
	jsr lb988
	jmp lb5f4
lb4f8:	jsr lb680
lb4fb:	jmp lb5f0
lb4fe:	jsr lb68d
	bne lb4fb
lb503:	jsr lb69e
	beq lb4fb
lb508:	cmp #$44
	beq lb564
	cmp #$91
	beq lb4f8
	cmp #$42
	beq lb503
	cmp #$55
	beq lb4fe
	cmp #$50
	beq lb584
	cmp #$49
	bne lb55a
	beq lb57d
lb522:	lda #$04
	jsr lb717
	jsr lb6ec
	cpx #$00
	beq lb57a
	stx $021f
	lda #$04
	bne lb4fb
lb535:	jmp l973a
lb538:	tax
	lda #$40
	jsr lb717
	cpx #$57
	bne lb548
	jsr lb988
	jmp lb556
lb548:	jsr lb6ec
	cpx #$00
	beq lb57a
	cpx #$ff
	beq lb57a
	stx $0222
	lda #$40
	bne lb578
lb55a:	cmp #$22
	beq lb5c3
	cmp #$28
	beq lb5c3
	bne lb535
lb564:	lda #$10
	jsr lb717
	jsr lb6ec
	cpx #$02
	bcs lb57a
	stx $0211
	stx $0216
	lda #$10
lb578:	bne lb5f0
lb57a:	jmp lb67d
lb57d:	lda $0225
	beq lb5ac
	bne lb535
lb584:	lda #$02
	jsr lb71c
	jsr lb6ff
	sty $021b
	sta $021c
	lda #$02
lb594:	ora $8c
	sta $8c
	bne lb5f4
lb59a:	lda #$04
	jsr lb71c
	jsr lb6ff
	sty $021d
	sta $021e
	lda #$04
	bne lb594
lb5ac:	jsr lb988
	sta $0223
	jsr lb988
	sta $0224
	lda #$ff
	sta $0225
	jsr lb988
	jmp lb5f4
lb5c3:	lda #$01
	jsr lb6b9
	sta $0210
	sta $0f
	lda #$00
	sta $0212
	lda #$02
	sta $0213
	lda #$0f
	sta $0214
	ldy #$00
	jsr lb9d5
lb5e1:	lda ($22),y
	sta $0200,y
	iny
	cpy $0f
	bcc lb5e1
	jsr lb9ee
	lda #$01
lb5f0:	ora $8b
	sta $8b
lb5f4:	jsr lb98b
	bne lb612
lb5f9:	jmp lb4d4
lb5fc:	cmp #$91
	bne lb603
	jmp lb4f8
lb603:	cmp #$a4
	beq lb609
	bne lb67b
lb609:	jsr lb988
	cmp #$50
	bne lb61f
	beq lb59a
lb612:	cmp #$2c
	bne lb5fc
	jsr lb988
	jmp lb4e2
lb61c:	jsr lb988
lb61f:	cmp #$44
	beq lb633
	cmp #$91
	beq lb646
	cmp #$55
	beq lb64c
	cmp #$22
	beq lb651
	cmp #$28
	beq lb651
lb633:	lda #$20
	jsr lb717
	jsr lb6ec
	cpx #$02
	bcs lb67d
	stx $0216
	lda #$20
	bne lb666
lb646:	jsr lb680
	jmp lb666
lb64c:	jsr lb68d
	bne lb666
lb651:	lda #$02
	jsr lb6b9
	sta $0215
	stx $0217
	sty $0218
	lda $24
	sta $0219
	lda #$02
lb666:	ora $8b
	sta $8b
	jsr lb98b
	beq lb5f9
	cmp #$2c
	beq lb61c
	cmp #$91
	beq lb646
	cmp #$55
	beq lb64c
lb67b:	bne lb6b6
lb67d:	jmp l9aed
	jsr lb988
	cmp #$55
	beq lb68d
	cmp #$42
	beq lb69e
	bne lb6b6
lb68d:	jsr lb6ec
	cpx #$20
	bcs lb67d
	cpx #$03
	bcc lb67d
	stx $0220
	lda #$08
	rts
lb69e:	lda #$01
	jsr lb71c
	jsr lb6ec
	cpx #$10
	bcs lb67d
	stx $021a
	lda #$01
	ora $8c
	sta $8c
	lda #$00
	rts
lb6b6:	jmp l973a
	jsr lb717
	jsr l91a1
	tax
	beq lb67d
	ldy #$00
	jsr lb041
	cmp #$40
	bne lb6dd
	lda #$80
	jsr lb717
	lda $8b
	ora #$80
	sta $8b
	dex
	inc $22
	bne lb6dd
	inc $23
lb6dd:	txa
	cmp #$11
	bcs lb6e7
	ldx $22
	ldy $23
	rts
lb6e7:	ldx #$42
	jmp l854a
	jsr lb988
	beq lb6b6
	bcc lb6fc
	jsr l9718
	jsr lb438
	jmp l9715
lb6fc:	jmp lb438
	jsr lb988
	beq lb6b6
	bcc lb714
	jsr l9718
	jsr lb447
	jsr l9715
	ldy $1b
	lda $1c
	rts
lb714:	jmp lb447
	and $8b
	bne lb6b6
	rts
	and $8c
	bne lb6b6
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
	bne lb7a6
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
	!byte $5c
	clv
	ldy #$02
	lda #$04
	sta $0f
	lda lb721,y
	pha
	jsr lb8f6
	ldx #$00
lb77f:	pla
	dec $0f
	bmi lb7cc
	tay
	iny
	tya
	pha
	lda lb72d,y
	bpl lb7c4
	cmp #$c2
	beq lb7df
	cmp #$d0
	beq lb7ee
	cmp #$e2
	beq lb80c
	cmp #$e1
	beq lb7fa
	cmp #$f0
	beq lb7e4
	cmp #$f1
	beq lb816
	cmp #$f2
	beq lb7ca
	cmp #$e0
	bne lb7b2
	lda $0222
	bne lb7c4
lb7b2:	cmp #$d1
	bne lb7bb
	lda $0211
	bpl lb7c2
lb7bb:	cmp #$d2
	bne lb77f
	lda $0216
lb7c2:	ora #$30
lb7c4:	sta $0226,x
	inx
	bne lb77f
lb7ca:	beq lb82a
lb7cc:	txa
	pha
	ldx #$26
	ldy #$02
	stx $64
	sty $65
	ldy #$0f
	sty $66
	jsr lb94a
	pla
	rts
lb7df:	lda $0221
	bne lb7c4
lb7e4:	bit $8b
	bmi lb7ea
	bpl lb77f
lb7ea:	lda #$40
	bne lb7c4
lb7ee:	lda $0223
	sta $0226,x
	inx
	lda $0224
	bne lb7c4
lb7fa:	lda $0222
	beq lb803
	lda #$4c
	bne lb7c4
lb803:	lda #$53
	sta $0222
	lda #$57
	bne lb7c4
lb80c:	lda $1b
	sta $0226,x
	lda $1c
	inx
	bne lb7c4
lb816:	lda $0212
	sta $22
	lda $0213
	sta $23
	lda $0214
	ldy $0210
	beq lb84e
	bne lb83c
lb82a:	lda $0217
	sta $22
	lda $0218
	sta $23
	lda $0219
	ldy $0215
	beq lb84e
lb83c:	sta $01
	sty $0e
	ldy #$00
lb842:	lda ($22),y
	sta $0226,x
	inx
	iny
	cpy $0e
	bne lb842
	bit $ca
	jsr lb9ee
	jmp lb77f
	and #$e6
	beq lb85c
lb859:	jmp l973a
lb85c:	lda $8b
	and #$01
	cmp #$01
	bne lb859
	lda $8b
	rts
	and #$e7
	bne lb859
	rts
	and #$c4
	bne lb859
	lda $8b
	and #$03
	cmp #$03
	bne lb859
	lda $8b
	rts
	and #$05
	cmp #$05
	bne lb859
	lda $8b
	rts
	lda #$00
	jsr $ffbd
	ldy #$6f
	jsr l9346
	ldx #$0e
	jsr lbb67
	ldy #$ff
	jsr lb9df
lb898:	iny
	jsr lbb5b
	cmp #$0d
	beq lb8a6
	sta ($17),y
	cpy #$27
	bne lb898
lb8a6:	lda #$00
	sta ($17),y
	lda #$28
	sta $16
	jsr lb9ee
	jsr $ffcc
	lda #$0e
	clc
	jsr lbb80
	jmp l933b
	jsr l9cc3
	bne lb8f4
	ldx #$14
	jsr la32f
	jsr $ffcc
	jsr lbb5b
	cmp #$59
	bne lb8ea
	jsr lbb5b
	cmp #$0d
	beq lb8f4
	cmp #$45
	bne lb8ea
	jsr lbb5b
	cmp #$53
	bne lb8ea
	jsr lbb5b
	cmp #$0d
	beq lb8f4
lb8ea:	cmp #$0d
	sec
	beq lb8f5
	jsr lbb5b
	bne lb8ea
lb8f4:	clc
lb8f5:	rts
	lda #$00
	sta $16
	clc
	jmp lbb4b
	jsr l91a1
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
	jsr lb98b
	beq lb938
	jsr lb8fe
	jsr lb95b
	stx $0220
	jsr lb95b
	stx $0221
lb938:	lda $0212
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
	jsr lb98b
	beq lb938
	jmp l927c
	jsr l971b
	jsr lb98b
	bne lb97d
	jmp l973a
	lda $76
	cmp #$0f
	bne lb97e
	clc
	lda #$00
	sbc $74
	lda #$80
	sbc $75
lb97d:	rts
lb97e:	sec
	rts
	jsr l9a59
	lda $74
	ldy $75
	rts
	jmp ($0290)
	jmp ($028e)
	jsr lb9bc
	jmp lb99d
	jsr lb9bc
lb997:	inc $85
	bne lb99d
	inc $86
lb99d:	ldy #$00
	lda ($85),y
	cmp #$20
	beq lb997
	jsr lb9b2
	php
	pha
	lda $025b
	sta $01
	pla
	plp
	rts
	cmp #$3a
	bcs lb9bb
	sbc #$2f
	sec
	sbc #$d0
lb9bb:	rts
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
	bpl lb9f1
	pha
	lda $60
	bpl lb9f1
	pha
	lda $24
	bpl lb9f1
	pha
	lda #$0f
	bpl lb9f1
	pha
	lda #$04
	bpl lb9f1
	pha
	lda #$02
	bpl lb9f1
	pha
	lda #$03
	bpl lb9f1
	pha
	lda #$01
lb9f1:	sta $01
	pla
	rts
	jsr lbb83
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
	bcs lba17
	dey
lba17:	sty $18
	sec
	txa
	sbc #$0c
	sta $20
	tax
	bcs lba23
	dey
lba23:	sty $21
	sec
	txa
	sbc #$07
	sta $8d
	tax
	bcs lba2f
	dey
lba2f:	sty $8e
	sec
	txa
	sbc #$04
	tax
	bcs lba39
	dey
lba39:	stx $3f
	sty $40
	ldy $89
	ldx $88
	bne lba44
	dey
lba44:	dex
	stx $22
	sty $23
	lda #$83
	ldy #$00
	jsr lb9ee
	sta ($22),y
	lda #$04
	sta $01
	sta $41
	sta $19
	ldy #$06
lba5c:	lda lba82,y
	sta ($8d),y
	dey
	bne lba5c
	tya
	ldx #$04
lba67:	sta ($3f),y
	iny
	dex
	bne lba67
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
	bit $2920
	!byte $bb
	ldx #$02
lba8e:	lda lb460,x
	sta $02,x
	dex
	bpl lba8e
	sta $61
	ldx #$04
lba9a:	lda lbb34,x
	sta $0259,x
	dex
	bne lba9a
	stx $78
	stx $1a
	stx $16
	stx $0258
	stx $1d
	dex
	stx $1e
	stx $1f
	inx
	stx $31
	ldx #$80
	stx $32
	sec
	jsr $ff9c
	stx $39
	sty $3a
	stx $35
	sty $36
	stx $2d
	sty $2e
	jsr lb9f5
	jsr lb9ee
	ldy #$00
	tya
	sta ($2d),y
	inc $2d
	bne lbadb
	inc $2e
lbadb:	ldx #$26
	jsr la32f
	jsr l8a12
	ldx #$39
	ldy #$bb
	jsr $ff6f
	cli
	jmp l85b8
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
	jsr $3532
	rol $2c,x
	jsr $3456
	rol $2030
	rol
	rol
	rol
	ora $000d
	eor $c585
	sta $a9
	dey
	!byte $db
	!byte $89
	jmp l9c87
	stx $af,y
	sta $8e,x
	lda lb994,y
	!byte $80
	lda l9ca5,y
	ldx #$15
lbb2b:	lda lbb13,x
	sta $0280,x
	dex
	bpl lbb2b
	rts
	lda $ffff
	rts
	sei
	jsr $ff7b
	jsr lbb83
	jsr $ff7e
	jsr lb9ee
	cli
	jmp l85b8
	sec
	jmp $ffb7
	clc
	jsr $ffc0
	bcs lbb87
	rts
	jsr $ffe4
	bcs lbb87
	rts
	jsr $ffcf
	bcs lbb87
	rts
	jsr $ffd2
	bcs lbb87
	rts
	jsr $ffc6
	bcs lbb87
	rts
	jsr $ffc9
	bcs lbb87
	rts
	jsr $ffd5
	bcs lbb87
	rts
	jsr $ffd8
	bcs lbb87
	rts
	sec
	jmp $ffc3
	clc
	jmp $ffe7
lbb87:	clc
	rol
	pha
	lda #$0e
	clc
	jsr lbb80
	pla
	tax
	jmp l854a
	jsr lae11
	beq lbb9d
	jmp lad23
lbb9d:	jmp lad35
	jsr lae11
	beq lbba8
	jmp ladef
lbba8:	jmp ladfd
	pha
	clc
	adc $6a
	sta $6a
	bcc lbbb5
	inc $6b
lbbb5:	pla
	rts
	!byte $ff
	jsr l9ffc
	rts
	lda $dd
	pha
	lda $ca
	sta $dd
	jsr l8f60
	pla
	sta $dd
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
	php
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
	!byte $ff
