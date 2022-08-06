midi_note_to_freq_table		db 014h, 03ah, 015h, 01ah, 0e2h, 0fbh, 060h, 0dfh, 079h, 0c4h, 013h, 0abh, 01bh, 093h, 07bh, 07ch
							db 020h, 067h, 0f8h, 052h, 0f2h, 03fh, 0fdh, 02dh, 00ah, 01dh, 00ah, 00dh, 0f1h, 0fdh, 0b0h, 0efh
							db 03ch, 0e2h, 089h, 0d5h, 08dh, 0c9h, 03dh, 0beh, 090h, 0b3h, 07ch, 0a9h, 0f9h, 09fh, 0feh, 096h
							db 085h, 08eh, 085h, 086h, 0f8h, 07eh, 0d8h, 077h, 01eh, 071h, 0c4h, 06ah, 0c6h, 064h, 01eh, 05fh
							db 0c8h, 059h, 0beh, 054h, 0fch, 04fh, 07fh, 04bh, 042h, 047h, 042h, 043h, 07ch, 03fh, 0ech, 03bh
							db 08fh, 038h, 062h, 035h, 063h, 032h, 08fh, 02fh, 0e4h, 02ch, 05fh, 02ah, 0feh, 027h, 0bfh, 025h
							db 0a1h, 023h, 0a1h, 021h, 0beh, 01fh, 0f6h, 01dh, 047h, 01ch, 0b1h, 01ah, 031h, 019h, 0c7h, 017h
							db 072h, 016h, 02fh, 015h, 0ffh, 013h, 0dfh, 012h, 0d0h, 011h, 0d0h, 010h, 0dfh, 00fh, 0fbh, 00eh
							db 023h, 00eh, 058h, 00dh, 098h, 00ch, 0e3h, 00bh, 039h, 00bh, 097h, 00ah, 0ffh, 009h, 06fh, 009h
							db 0e8h, 008h, 068h, 008h, 0efh, 007h, 07dh, 007h, 011h, 007h, 0ach, 006h, 04ch, 006h, 0f1h, 005h
							db 09ch, 005h, 04bh, 005h, 0ffh, 004h, 0b7h, 004h, 074h, 004h, 034h, 004h, 0f7h, 003h, 0beh, 003h
							db 088h, 003h, 056h, 003h, 026h, 003h, 0f8h, 002h, 0ceh, 002h, 0a5h, 002h, 07fh, 002h, 05bh, 002h
							db 03ah, 002h, 01ah, 002h, 0fbh, 001h, 0dfh, 001h, 0c4h, 001h, 0abh, 001h, 093h, 001h, 07ch, 001h
							db 067h, 001h, 052h, 001h, 03fh, 001h, 02dh, 001h, 01dh, 001h, 00dh, 001h, 0fdh, 000h, 0efh, 000h
							db 0e2h, 000h, 0d5h, 000h, 0c9h, 000h, 0beh, 000h, 0b3h, 000h, 0a9h, 000h, 09fh, 000h, 096h, 000h
							db 08eh, 000h, 086h, 000h, 07eh, 000h, 077h, 000h, 071h, 000h, 06ah, 000h, 064h, 000h, 05fh, 000h

	
	mario_music_size dw 1781
	spider_music_size dw 895
	music_size dw ?
	
	
	musicIndex dw 0
	
	; 0~127 -> midi note
	; 254   -> note off
	; 255   -> ignore
	
	music_pointer dw 0feh
	
	mario_music	db 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 04ch, 0ffh, 0feh, 04ch, 0ffh, 0feh, 0ffh, 0ffh
				db 0ffh, 04ch, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 04ch, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
				db 04fh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				db 0ffh, 043h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 040h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
				db 0ffh, 0ffh, 0ffh, 045h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 047h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 046h
				db 0ffh, 0feh, 045h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 043h, 0ffh, 0feh, 0ffh, 04ch, 0ffh, 0feh, 0ffh
				db 04fh, 0ffh, 0feh, 0ffh, 051h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 04dh, 0ffh, 0feh, 04fh, 0ffh, 0feh
				db 0ffh, 0ffh, 0ffh, 04ch, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 04ah, 0ffh, 0feh, 047h
				db 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				db 0ffh, 043h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 040h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
				db 0ffh, 0ffh, 0ffh, 045h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 047h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 046h
				db 0ffh, 0feh, 045h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 043h, 0ffh, 0feh, 0ffh, 04ch, 0ffh, 0feh, 0ffh
				db 04fh, 0ffh, 0feh, 0ffh, 051h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 04dh, 0ffh, 0feh, 04fh, 0ffh, 0feh
				db 0ffh, 0ffh, 0ffh, 04ch, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 04ah, 0ffh, 0feh, 047h
				db 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 04fh, 0ffh
				db 0feh, 04eh, 0ffh, 0feh, 04dh, 0ffh, 0feh, 04bh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 04ch, 0ffh, 0feh
				db 0ffh, 0ffh, 0ffh, 044h, 0ffh, 0feh, 045h, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 045h
				db 0ffh, 0feh, 048h, 0ffh, 0feh, 04ah, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 04fh, 0ffh
				db 0feh, 04eh, 0ffh, 0feh, 04dh, 0ffh, 0feh, 04bh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 04ch, 0ffh, 0feh
				db 0ffh, 0ffh, 0ffh, 054h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 054h, 0ffh, 0feh, 054h, 0ffh, 0feh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 04fh, 0ffh
				db 0feh, 04eh, 0ffh, 0feh, 04dh, 0ffh, 0feh, 04bh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 04ch, 0ffh, 0feh
				db 0ffh, 0ffh, 0ffh, 044h, 0ffh, 0feh, 045h, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 045h
				db 0ffh, 0feh, 048h, 0ffh, 0feh, 04ah, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 04bh, 0ffh
				db 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 04ah, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				db 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 04fh, 0ffh
				db 0feh, 04eh, 0ffh, 0feh, 04dh, 0ffh, 0feh, 04bh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 04ch, 0ffh, 0feh
				db 0ffh, 0ffh, 0ffh, 044h, 0ffh, 0feh, 045h, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 045h
				db 0ffh, 0feh, 048h, 0ffh, 0feh, 04ah, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 04fh, 0ffh
				db 0feh, 04eh, 0ffh, 0feh, 04dh, 0ffh, 0feh, 04bh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 04ch, 0ffh, 0feh
				db 0ffh, 0ffh, 0ffh, 054h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 054h, 0ffh, 0feh, 054h, 0ffh, 0feh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 04fh, 0ffh
				db 0feh, 04eh, 0ffh, 0feh, 04dh, 0ffh, 0feh, 04bh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 04ch, 0ffh, 0feh
				db 0ffh, 0ffh, 0ffh, 044h, 0ffh, 0feh, 045h, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 045h
				db 0ffh, 0feh, 048h, 0ffh, 0feh, 04ah, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 04bh, 0ffh
				db 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 04ah, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				db 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh
				db 0ffh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 04ah, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
				db 04ch, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 045h, 0ffh, 0feh, 043h, 0ffh, 0feh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh
				db 0ffh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 04ah, 0ffh, 0feh, 04ch, 0ffh, 0feh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh
				db 0ffh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 04ah, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
				db 04ch, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 045h, 0ffh, 0feh, 043h, 0ffh, 0feh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 04ch, 0ffh, 0feh, 04ch, 0ffh, 0feh, 0ffh, 0ffh
				db 0ffh, 04ch, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 04ch, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
				db 04fh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				db 0ffh, 043h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 040h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
				db 0ffh, 0ffh, 0ffh, 045h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 047h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 046h
				db 0ffh, 0feh, 045h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 043h, 0ffh, 0feh, 0ffh, 04ch, 0ffh, 0feh, 0ffh
				db 04fh, 0ffh, 0feh, 0ffh, 051h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 04dh, 0ffh, 0feh, 04fh, 0ffh, 0feh
				db 0ffh, 0ffh, 0ffh, 04ch, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 04ah, 0ffh, 0feh, 047h
				db 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				db 0ffh, 043h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 040h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
				db 0ffh, 0ffh, 0ffh, 045h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 047h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 046h
				db 0ffh, 0feh, 045h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 043h, 0ffh, 0feh, 0ffh, 04ch, 0ffh, 0feh, 0ffh
				db 04fh, 0ffh, 0feh, 0ffh, 051h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 04dh, 0ffh, 0feh, 04fh, 0ffh, 0feh
				db 0ffh, 0ffh, 0ffh, 04ch, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 04ah, 0ffh, 0feh, 047h
				db 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 04ch, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh
				db 0ffh, 043h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 044h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
				db 045h, 0ffh, 0feh, 04dh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 04dh, 0ffh, 0feh, 045h, 0ffh, 0feh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 047h, 0ffh, 0feh, 0ffh, 051h, 0ffh, 0feh, 0ffh
				db 051h, 0ffh, 0feh, 0ffh, 051h, 0ffh, 0feh, 0ffh, 04fh, 0ffh, 0feh, 0ffh, 04dh, 0ffh, 0feh, 0ffh
				db 04ch, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 045h, 0ffh, 0feh, 043h, 0ffh, 0feh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 04ch, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh
				db 0ffh, 043h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 044h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
				db 045h, 0ffh, 0feh, 04dh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 04dh, 0ffh, 0feh, 045h, 0ffh, 0feh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 047h, 0ffh, 0feh, 04dh, 0ffh, 0feh, 0ffh, 0ffh
				db 0ffh, 04dh, 0ffh, 0feh, 04dh, 0ffh, 0feh, 0ffh, 04ch, 0ffh, 0feh, 0ffh, 04ah, 0ffh, 0feh, 0ffh
				db 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 04ch, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh
				db 0ffh, 043h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 044h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
				db 045h, 0ffh, 0feh, 04dh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 04dh, 0ffh, 0feh, 045h, 0ffh, 0feh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 047h, 0ffh, 0feh, 0ffh, 051h, 0ffh, 0feh, 0ffh
				db 051h, 0ffh, 0feh, 0ffh, 051h, 0ffh, 0feh, 0ffh, 04fh, 0ffh, 0feh, 0ffh, 04dh, 0ffh, 0feh, 0ffh
				db 04ch, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 045h, 0ffh, 0feh, 043h, 0ffh, 0feh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 04ch, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh
				db 0ffh, 043h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 044h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
				db 045h, 0ffh, 0feh, 04dh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 04dh, 0ffh, 0feh, 045h, 0ffh, 0feh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 047h, 0ffh, 0feh, 04dh, 0ffh, 0feh, 0ffh, 0ffh
				db 0ffh, 04dh, 0ffh, 0feh, 04dh, 0ffh, 0feh, 0ffh, 04ch, 0ffh, 0feh, 0ffh, 04ah, 0ffh, 0feh, 0ffh
				db 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh
				db 0ffh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 04ah, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
				db 04ch, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 045h, 0ffh, 0feh, 043h, 0ffh, 0feh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh
				db 0ffh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 04ah, 0ffh, 0feh, 04ch, 0ffh, 0feh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh
				db 0ffh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 04ah, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
				db 04ch, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 045h, 0ffh, 0feh, 043h, 0ffh, 0feh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 04ch, 0ffh, 0feh, 04ch, 0ffh, 0feh, 0ffh, 0ffh
				db 0ffh, 04ch, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 048h, 0ffh, 0feh, 04ch, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
				db 04fh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 04ch, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh
				db 0ffh, 043h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 044h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
				db 045h, 0ffh, 0feh, 04dh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 04dh, 0ffh, 0feh, 045h, 0ffh, 0feh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 047h, 0ffh, 0feh, 0ffh, 051h, 0ffh, 0feh, 0ffh
				db 051h, 0ffh, 0feh, 0ffh, 051h, 0ffh, 0feh, 0ffh, 04fh, 0ffh, 0feh, 0ffh, 04dh, 0ffh, 0feh, 0ffh
				db 04ch, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 045h, 0ffh, 0feh, 043h, 0ffh, 0feh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 04ch, 0ffh, 0feh, 048h, 0ffh, 0feh, 0ffh, 0ffh
				db 0ffh, 043h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 044h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
				db 045h, 0ffh, 0feh, 04dh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 04dh, 0ffh, 0feh, 045h, 0ffh, 0feh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 047h, 0ffh, 0feh, 04dh, 0ffh, 0feh, 0ffh, 0ffh
				db 0ffh, 04dh, 0ffh, 0feh, 04dh, 0ffh, 0feh, 0ffh, 04ch, 0ffh, 0feh, 0ffh, 04ah, 0ffh, 0feh, 0ffh
				db 048h, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				
	spider_music db 0feh, 0fh, 0ffh, 0ffh, 0feh, 03ch, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 03fh, 0ffh, 0ffh, 0feh
				 db 043h, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 042h, 0ffh, 0ffh, 0ffh
				 db 0ffh, 0ffh, 0feh, 03fh, 0ffh, 0ffh, 0feh, 03ch, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				 db 0ffh, 0ffh, 0ffh, 03ch, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 03fh, 0ffh, 0ffh, 0feh, 043h, 0ffh
				 db 0ffh, 0feh, 0ffh, 0ffh, 044h, 0ffh, 0ffh, 0feh, 043h, 0ffh, 0ffh, 0feh, 041h, 0ffh, 0ffh, 0feh
				 db 0ffh, 0ffh, 03fh, 0ffh, 0ffh, 0feh, 03ch, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				 db 0ffh, 0ffh, 041h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 044h, 0ffh, 0ffh, 0feh, 048h, 0ffh, 0ffh
				 db 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 047h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh
				 db 044h, 0ffh, 0ffh, 0feh, 041h, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				 db 03ch, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 03fh, 0ffh, 0ffh, 0feh, 043h, 0ffh, 0ffh, 0feh, 0ffh
				 db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 042h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				 db 0feh, 03fh, 0ffh, 0ffh, 0feh, 03ch, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 044h, 0ffh
				 db 0ffh, 0feh, 043h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				 db 0ffh, 043h, 0ffh, 0ffh, 0feh, 041h, 0ffh, 0ffh, 0feh, 03fh, 0ffh, 0ffh, 0feh, 041h, 0ffh, 0ffh
				 db 0ffh, 0ffh, 0ffh, 0feh, 03fh, 0ffh, 0ffh, 0feh, 03ch, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 0ffh
				 db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				 db 0ffh, 0ffh, 0ffh, 03ch, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 03fh, 0ffh, 0ffh, 0feh, 043h, 0ffh
				 db 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 042h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				 db 0feh, 03fh, 0ffh, 0ffh, 0feh, 03ch, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				 db 0ffh, 03ch, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 03fh, 0ffh, 0ffh, 0feh, 043h, 0ffh, 0ffh, 0feh
				 db 0ffh, 0ffh, 044h, 0ffh, 0ffh, 0feh, 043h, 0ffh, 0ffh, 0feh, 041h, 0ffh, 0ffh, 0feh, 0ffh, 0ffh
				 db 03fh, 0ffh, 0ffh, 0feh, 03ch, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				 db 041h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 044h, 0ffh, 0ffh, 0feh, 048h, 0ffh, 0ffh, 0feh, 0ffh
				 db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 047h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 044h, 0ffh
				 db 0ffh, 0feh, 041h, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 03ch, 0ffh
				 db 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 03fh, 0ffh, 0ffh, 0feh, 043h, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
				 db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 042h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 03fh
				 db 0ffh, 0ffh, 0feh, 03ch, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 044h, 0ffh, 0ffh, 0feh
				 db 043h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 043h
				 db 0ffh, 0ffh, 0feh, 041h, 0ffh, 0ffh, 0feh, 03fh, 0ffh, 0ffh, 0feh, 041h, 0ffh, 0ffh, 0ffh, 0ffh
				 db 0ffh, 0feh, 03fh, 0ffh, 0ffh, 0feh, 03ch, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
				 db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 043h, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 044h, 0ffh, 0ffh, 0ffh, 0ffh
				 db 0ffh, 046h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 044h, 0ffh, 0ffh
				 db 0ffh, 0ffh, 0ffh, 043h, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 041h
				 db 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 03eh, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 041h, 0ffh, 0ffh, 0ffh, 0ffh
				 db 0ffh, 0feh, 0ffh, 0ffh, 03eh, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 041h, 0ffh, 0ffh, 0feh, 043h, 0ffh
				 db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 03ch, 0ffh, 0ffh
				 db 0ffh, 0ffh, 0ffh, 0feh, 03fh, 0ffh, 0ffh, 0feh, 043h, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh
				 db 0ffh, 0ffh, 0ffh, 0ffh, 042h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 03fh, 0ffh, 0ffh, 0feh, 03ch
				 db 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 03ch, 0ffh, 0ffh, 0ffh, 0ffh
				 db 0ffh, 0feh, 03fh, 0ffh, 0ffh, 0feh, 043h, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 044h, 0ffh, 0ffh, 0feh
				 db 043h, 0ffh, 0ffh, 0feh, 041h, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 03fh, 0ffh, 0ffh, 0feh, 03ch, 0ffh
				 db 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 041h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				 db 0feh, 044h, 0ffh, 0ffh, 0feh, 048h, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				 db 0ffh, 047h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 044h, 0ffh, 0ffh, 0feh, 041h, 0ffh, 0ffh, 0feh
				 db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 03ch, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 03fh
				 db 0ffh, 0ffh, 0feh, 043h, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				 db 0ffh, 0ffh, 042h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 03fh, 0ffh, 0ffh, 0feh, 03ch, 0ffh, 0ffh
				 db 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 044h, 0ffh, 0ffh, 0feh, 043h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
				 db 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 043h, 0ffh, 0ffh, 0feh, 041h, 0ffh, 0ffh
				 db 0feh, 03fh, 0ffh, 0ffh, 0feh, 041h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 03fh, 0ffh, 0ffh, 0feh
				 db 03ch, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 043h, 0ffh, 0ffh, 0feh
				 db 041h, 0ffh, 0ffh, 0feh, 03fh, 0ffh, 0ffh, 0feh, 041h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 03fh
				 db 0ffh, 0ffh, 0feh, 03ch, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 043h
				 db 0ffh, 0ffh, 0feh, 041h, 0ffh, 0ffh, 0feh, 03fh, 0ffh, 0ffh, 0feh, 041h, 0ffh, 0ffh, 0feh, 0ffh
				 db 0ffh, 043h, 0ffh, 0ffh, 0feh, 048h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh