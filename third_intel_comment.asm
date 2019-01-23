	.file	"third.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp              			; stack[top-0] <- [rbp]
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp				; rbp <- [rsp]
	.cfi_def_cfa_register 6
	sub	rsp, 64					; Subtract
	mov	rax, QWORD PTR fs:40			
	mov	QWORD PTR [rbp-8], rax			; [rbp-8]<-rax
	xor	eax, eax				;eax<-[eax]^[eax] ;eax<-0;
	mov	DWORD PTR [rbp-48], 1			; [rbp-48] <- 1 
	mov	DWORD PTR [rbp-44], 2			; [rbp-44] <- 2
	mov	DWORD PTR [rbp-40], 3			; [rbp-40] <- 3
	mov	DWORD PTR [rbp-36], 4			; [rbp-36] <- 4
	mov	DWORD PTR [rbp-32], 5			; [rbp-32] <- 5
	mov	DWORD PTR [rbp-28], 6			; [rbp-28] <- 6
	mov	DWORD PTR [rbp-24], 7			; [rbp-24] <- 7
	mov	DWORD PTR [rbp-20], 8			; [rbp-20] <- 8
	mov	DWORD PTR [rbp-16], 9			; [rbp-16] <- 9
	mov	DWORD PTR [rbp-12], 10			; [rbp-12] <- 10
	mov	DWORD PTR [rbp-52], 10			; [rbp-52] <- 10
	mov	DWORD PTR [rbp-56], 0			; [rbp-56] <- 0
	jmp	.L2					;jump to l2
.L3:
	mov	eax, DWORD PTR [rbp-56]			; [eax] <- [rbp-56] ;eax <- 0
	cdqe						;convert doubleword to quadword
	mov	eax, DWORD PTR [rbp-48+rax*4]  		; [eax] <- [rbp-48+rax*4]
	lea	edx, [rax+1]				; edx <- [edx + rax+1]	
	mov	eax, DWORD PTR [rbp-56]			; [eax] <- [rbp-56]
	cdqe						;convert doubleword to quadword
	mov	DWORD PTR [rbp-48+rax*4], edx		; [rbp-48+rax*4] <- [edx] 
	add	DWORD PTR [rbp-56], 1			;[rbp-56]<-[rbp-56]+1
.L2:
	mov	eax, DWORD PTR [rbp-56]			; [eax] <- [rbp-56] ;eax <- 0
	cmp	eax, DWORD PTR [rbp-52]			;compare the operand
	jl	.L3					jump if less 
	mov	eax, 0					; eax <- 0
	mov	rcx, QWORD PTR [rbp-8]			; [rcx] <- [rbp-8]
	xor	rcx, QWORD PTR fs:40			rcx<-[rcx]^[fs]
	je	.L5					jump if equal
	call	__stack_chk_fail
.L5:
	leave								
	.cfi_def_cfa 7, 8
	ret 						;return
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
