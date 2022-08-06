; ================ PROCEDURES ================

;Input: X in cx, Y in dx
;Output: Pixel drawn at the given coordinates with the color stored in al
proc drawPixel
	xor bh, bh
	mov ah, 0Ch
	int 10h
	ret
endp

;Input: Starting X in cx, Line's Y in dx and final X in EndX
;Output: Horizontal line in the given coordinates
proc drawXLine
		
	cmp cx, [EndX]
	ja endDrawXLine ; Incase the input is faulty and and the starting x is bigger than the ending x
		
	XLine: ; Loop for drawing a pixel on the given y and moving one pixel to the right until reaching the final x wanted
		call drawPixel
		cmp cx, [EndX]
		je endDrawXLine
		inc cx
		jmp XLine	
	endDrawXLine:
	ret
endp

;Input: Starting y in dx, Line's x in cx and final y in EndY
;Output: Vertical line in the given coordinates
proc drawYLine
	
	cmp dx, [EndY]
	ja endDrawYLine ; Incase the input is faulty and and the starting y is bigger than the ending y
	
	YLine: ; Loop for drawing a pixel on the given x and moving one pixel down until reaching the final y wanted
			call drawPixel
			cmp dx, [EndY]
			je endDrawYLine
			inc dx
			jmp YLine	
		endDrawYLine:
		ret
endp

;Input: Starting X in cx, Starting Y in dx, final X in endX and final Y in endY
;Output: Rectangle drawn with the color stored in al stretching between the starting coordinates and end coordinates
proc drawRectangle
	
	cmp dx, [EndY]
	ja endDrawRec ; Incase the input is faulty and and the starting y is bigger than the ending y
	cmp cx, [EndX]
	ja endDrawRec 	; Incase the input is faulty and and the starting x is bigger than the ending x
	
	; Backing up cx for the next lines
	mov si, cx 
	
	; Main draw loop which a rectangle is drawn using a collection of horizontal lines
	Rec:
		mov cx, si
		call drawXLine
		cmp dx, [EndY]
		je endDrawRec
		inc dx
		jmp Rec
	endDrawRec:
	ret
endp

;Input: Starting X in cx, Starting Y in dx, and final in endY
;Output: Isosceles triangle drawn beggning at the given coordinate until it reaches the final Y position
proc drawIscoTriangle
	
	mov si, cx
	mov [endX], cx
	
	cmp dx, [endY]
	ja endDrawIscoTri ; Incase the input is faulty and and the starting y is bigger than the ending y
	
	; Main draw loop which a Triangle is drawn using a collection of horizontal lines than get longer every iteration of the loop
	IscoTri:
		mov cx, si
		call drawXLine
		cmp dx, [EndY]
		je endDrawIscoTri
		inc dx
		mov di, [endX]
		inc di
		mov [endX], di
		dec si
		jmp IscoTri
		
	endDrawIscoTri:
	ret
endp

;Input: Starting X in cx, Starting Y in dx, and length in endY (Note: This draws from bottom to top)
;Output: Isosceles triangle drawn from the bottom to the top beggning at the given coordinate until it reaches the final Y position
proc drawOppIscoTriangle
	
	mov si, cx
	mov [endX], cx
	
	cmp dx, [endY]
	jb endDrawIscoTri ; Incase the input is faulty and and the starting y is smaller than the ending y
	
	OppIscoTri: ; Main draw loop which a Triangle is drawn using a collection of horizontal lines than get longer every iteration of the loop
		mov cx, si
		call drawXLine
		cmp dx, [EndY]
		je endDrawOppIscoTri
		dec dx
		mov di, [endX]
		inc di
		mov [endX], di
		dec si
		jmp OppIscoTri
		
	endDrawOppIscoTri:
	ret
endp
