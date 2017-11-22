// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// pseudo code:
//	sum = 0
//	i=R1
//	while i>0
//		sum = sum + R[2]
//		i—-


	@2
	M=0 // setting R2 as 0
	@1
	D=M
	@i
	M=D //setting the counter as R1

(LOOP)
	
	@i
	D=M
	@END
	D;JEQ // if i=0 end
	@0
	D=M
	@2
	M=M+D // setting R2 as R2 + R0
	@i
	M=M-1 // decreasing i by 1
	@LOOP
	0;JMP

(END)
	
	@END // entering infinite loop
	0;JMP





