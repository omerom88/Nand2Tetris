// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.


(LISTEN)
	@SCREEN
	D=A
	@screenPointer
	M=D	//set a screen pointer
	@KBD
	D=M
	@WHITE
	D;JEQ	//if keyboard are not pressed
	@BLACK
	D;JGT	//if keyboard are pressed	
	
	(WHITE)
		@colorVar
		M=0	//set var to zero (white)
		@CHECKSCREEN
		0;JMP

	(BLACK)
		@colorVar
		M=-1	//set var to -1 (black row)
		@CHECKSCREEN
		0;JMP
		
	(CHECKSCREEN)
		@screenPointer
		D=M
		@24576
		D=D-A
		@LISTEN
		D;JGE	//if we got to the end of the screen jump to the start
		@SCREENLOOP
		D;JLT
		
	(SCREENLOOP)	
		@colorVar
		D=M
		@screenPointer
		A=M
		M=D	//color the screen
		@INC
		0;JMP
			
	(INC)
		@screenPointer
		M=M+1 	// screenPointer++
		@CHECKSCREEN
		0;JMP
 

