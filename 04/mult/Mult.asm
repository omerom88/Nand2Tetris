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


		//init vars
	@0
	D=A
	@R2
	M=D	//set R[2]=0
	@R1
	D=M
	@i
	M=D	//i=R1


(LOOP)
	@i
	D=M	//D=i
	@END
	D;JLE	//if i<=0 goto END

	@R0
	D=M
	@R2
	M=D+M	//R[2]=R[2]+R[0]

	@i
	M=M-1	//i—-
	@LOOP
	0;JMP	//goto LOOP

(END)
	@END
	0;JMP	//infinite loop
	 