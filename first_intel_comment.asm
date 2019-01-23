	.file	"first.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp								; stack[top-0] <- [rbp]
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp							; rbp <- [rsp]
	.cfi_def_cfa_register 6
	push	r12								; stack[top-1] <- [r12]
	push	rbx								; stack[top-2] <- [rbx]
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	mov	ebx, 10								; ebx <- 10
	mov	r12d, 5								; r12d <- 5
	lea	eax, [rbx+r12]							; eax <- [rbx + r12] ; eax <- 15
	mov	DWORD PTR [rbp-48], eax						; [rbp-48] <- [eax] ; [rbp-48] <- 15
	mov	eax, ebx							; eax <- [ebx] ; eax <- 10
	sub	eax, r12d							; eax <- [eax] - [r12d] ; eax <- 5
	mov	DWORD PTR [rbp-44], eax						; [rbp-44] <- [eax] ; [rbp-44] <- 5
	mov	eax, ebx							; eax <- [ebx] ; eax <- 10
	cdq									;copy the sign bit value of eax register into edx
	idiv	r12d								; eax <- [eax]/[r12] ; eax <- 2
	mov	DWORD PTR [rbp-40], eax						; [rbp-44] <- [eax] ; [rbp-44] <- 2
	mov	eax, ebx							; eax <- [ebx] ; eax <- 10
	imul	eax, r12d							; eax<-[eax]*[r12]; eax<-50;
	mov	DWORD PTR [rbp-36], eax						; [rbp-36] <- [eax] ; [rbp-36] <- 50
	mov	eax, ebx							; eax <- [ebx] ; eax <- 10
	or	eax, r12d							; eax<-[eax]|[r12]; eax<-15;
	mov	DWORD PTR [rbp-32], eax						; [rbp-32] <- [eax] ; [rbp-32] <- 15
	mov	eax, ebx							; eax <- [ebx] ; eax <- 10
	and	eax, r12d							; eax<-[eax]&[r12]; eax<-0;
	mov	DWORD PTR [rbp-28], eax						; [rbp-28] <- [eax] ; [rbp-28] <- 0
	mov	eax, ebx							; eax <- [ebx] ; eax <- 10
	not	eax								; eax<-~[eax]; eax<-4294967285(2^32-1-10);
	mov	DWORD PTR [rbp-24], eax						; [rbp-24] <- [eax] ; [rbp-24] <- 4294967258(2^32-1-10)
	mov	eax, ebx							; eax <- [ebx] ; eax <- 10
	xor	eax, r12d							; eax<-[eax]^[r12]; eax<-15;
	mov	DWORD PTR [rbp-20], eax						; [rbp-20] <- [eax] ; [rbp-20] <- 15
	mov	eax, 0 								; eax <- [ebx] ; eax <- 0
	pop	rbx								; rbx <- stack[top-2]
	pop	r12								; rbx <- stack[top-1]
	pop	rbp								; rbp <- stack[top -0]
	.cfi_def_cfa 7, 8
	ret									; return
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
