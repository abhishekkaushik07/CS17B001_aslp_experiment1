	.file	"fourth.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp 						; stack[top-0] <- [rbp]
	.cfi_def_cfa_offset 16				
	.cfi_offset 6, -16
	mov	rbp, rsp					; rbp <- [rsp]					
	.cfi_def_cfa_register 6
	sub	rsp, 80						;Subtract
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR [rbp-8], rax				; [rbp-8] <- [eax]     
	xor	eax, eax   					; eax<-[eax]^[eax] ;eax<-0;
	mov	DWORD PTR [rbp-64], 1				; [rbp-64] <- 1 
	mov	DWORD PTR [rbp-60], 2				; [rbp-60] <- 2
	mov	DWORD PTR [rbp-56], 3				; [rbp-56] <- 3 
	mov	DWORD PTR [rbp-52], 4				; [rbp-52] <- 4
	mov	DWORD PTR [rbp-48], 5				; [rbp-48] <- 5
	mov	DWORD PTR [rbp-68], 0				; [rbp-68] <- 0 
	jmp	.L2						; jump to l2
.L3:
	mov	eax, DWORD PTR [rbp-68]         		; eax<-[rbp-68]
	cdqe							; convert doubleword to quadword
	mov	edx, DWORD PTR [rbp-64+rax*4]			; [eax] <- [rbp-64+rax*4]
	mov	eax, DWORD PTR [rbp-68]				; [eax] <- [rbp-68]
	cdqe							; convert doubleword to quadword
	mov	DWORD PTR [rbp-32+rax*4], edx			; [rbp-32+rax*4] <- [edx] 
	add	DWORD PTR [rbp-68], 1				;[rbp-68]<-[rbp-68]+1
.L2:
	cmp	DWORD PTR [rbp-68], 4          			; compare the operand
	jle	.L3						; jump if less than or equal to
	mov	eax, 0						; eax <- 0
	mov	rcx, QWORD PTR [rbp-8]				; [rcx] <- [rbp-8]
	xor	rcx, QWORD PTR fs:40				; rcx<-[rcx]^[fs]
	je	.L5						; jump if equal
	call	__stack_chk_fail
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret 							;return
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
