	.file	"fifth.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp 					; stack[top-0] <- [rbp]
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp				; rbp <- [rsp]
	.cfi_def_cfa_register 6
	sub	rsp, 64
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR [rbp-8], rax			; [rbp-8]<-rax
	xor	eax, eax				;eax<-[eax]^[eax] ;eax<-0;
	mov	DWORD PTR [rbp-48], 2			; [rbp-48] <- 2
	mov	DWORD PTR [rbp-44], 5			; [rbp-44] <- 5
	mov	DWORD PTR [rbp-40], 4			; [rbp-40] <- 4
	mov	DWORD PTR [rbp-36], 3			; [rbp-36] <- 3
	mov	DWORD PTR [rbp-32], 7			; [rbp-32] <- 7
	mov	DWORD PTR [rbp-28], 9			; [rbp-28] <- 9
	mov	DWORD PTR [rbp-24], 8			; [rbp-24] <- 8
	mov	DWORD PTR [rbp-20], 1			; [rbp-20] <- 1
	mov	DWORD PTR [rbp-16], 6			; [rbp-16] <- 6
	mov	eax, DWORD PTR [rbp-48]			; [eax] <- [rbp-48]
	mov	DWORD PTR [rbp-60], eax			; [rbp-60]<-eax
	mov	eax, DWORD PTR [rbp-48] 	        ; [eax] <- [rbp-48]
	mov	DWORD PTR [rbp-56], eax			; [rbp-56]<-eax
	mov	DWORD PTR [rbp-52], 1			; [rbp-52]<-1
	jmp	.L2					;jump to l2
.L5:
	mov	eax, DWORD PTR [rbp-52]			; [eax] <- [rbp-52]
	cdqe						;convert doubleword to quadword
	mov	eax, DWORD PTR [rbp-48+rax*4] 		; [eax] <- [rbp-48+rax*4]
	cmp	eax, DWORD PTR [rbp-60]			;compare the operand
	jge	.L3					; jump if greater or equal
	mov	eax, DWORD PTR [rbp-52]			; [eax] <- [rbp-52]
	cdqe						;convert doubleword to quadword
	mov	eax, DWORD PTR [rbp-48+rax*4]		; [eax] <- [rbp-48+rax*4]
	mov	DWORD PTR [rbp-60], eax 		; [rbp-60]<-eax
.L3:
	mov	eax, DWORD PTR [rbp-52]			; [eax] <- [rbp-52]
	cdqe						;convert doubleword to quadword
	mov	eax, DWORD PTR [rbp-48+rax*4]		; [eax] <- [rbp-48+rax*4]
	cmp	eax, DWORD PTR [rbp-56]			;compare the operand
	jle	.L4					; jump if less than or equal to
	mov	eax, DWORD PTR [rbp-52]			; [eax] <- [rbp-52]
	cdqe						;convert doubleword to quadword
	mov	eax, DWORD PTR [rbp-48+rax*4]		; [eax] <- [rbp-48+rax*4]
	mov	DWORD PTR [rbp-56], eax         	; [rbp-56]<-eax
.L4:
	add	DWORD PTR [rbp-52], 1			;[rbp-52]<-[rbp-52+1]
.L2:
	cmp	DWORD PTR [rbp-52], 8            	;compare the operand
	jle	.L5					; jump if less than or equal to
	mov	eax, 0					; eax <- 0
	mov	rdx, QWORD PTR [rbp-8]			; [rdx] <- [rbp-8]
	xor	rdx, QWORD PTR fs:40			; rcx<-[rcx]^[fs]
	je	.L7					; jump if equal to
	call	__stack_chk_fail
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret 						;return
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
