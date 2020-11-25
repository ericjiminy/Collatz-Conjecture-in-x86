; Eric Chun - jc2ppp - 10/30/20 - threexplusone.s

; Optimizations:
;	- lea for quick multiplication and addition
;	- shr for quick divison
;	- no pushes or pops
;	- loop unrolling (check for rdi == 1 during loop)
;	- return during loop instead of jumping

	global threexplusone
	section .text

; Parameter 1 is an int, the number to put through the Collatz conjecture
; Return is an int, the number of steps it took to converge to 1

threexplusone:
	xor eax, eax		; eax = 0, step count
threexplusoneStart:	
	cmp edi, 1		; if rdi == 1, jump to threexplusoneEnd
	je threexplusoneEnd

	inc eax		   	; eax++, another step
	test edi, 1		; is rdi even or odd, look at the last bit
	jnz threexplusoneOdd	; lowest bit set = odd, jump to threexplusoneOdd
	jz threexplusoneEven	; lowest bit clear = even, jump to threexplusoneEven
threexplusoneOdd:
	lea edi, [edi*2 + edi + 1] ; rdi = 3*rdi + 1
	cmp edi, 1		; if rdi == 1, jump to threexplusoneEnd
	je threexplusoneEnd
	
	call threexplusoneStart	; call threexplusone(rdi)
	ret			; return step count
threexplusoneEven:
	shr edi, 1		; rdi /= 2
	cmp edi, 1		; if rdi == 1, jump to threexplusoneEnd
	je threexplusoneEnd
	
	call threexplusoneStart	; call threexplusone(rdi)
	ret			; return step count
threexplusoneEnd:
	ret			; return step count
