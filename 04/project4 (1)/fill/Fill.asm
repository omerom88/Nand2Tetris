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
	M=D    //set a screen pointer	
	@CHECKSCREEN
	0;JMP
		
	(CHECKSCREEN)
		@screenPointer
		D=M
		@24576
		D=D-A
		@LISTEN
		D;JGE	//if we've got to the end of the screen jump to the start
		@COLORIT
		D;JLT
		
	(COLORIT)	
		@KBD
		D=M
		@WHITE
		D;JEQ	//if keyboard are not pressed
		@BLACK
		D;JGT	//if keyboard are pressed
		
		(WHITE)
			@screenPointer
			A=M
			M=0    //color the screen in white
			@INC
			0;JMP
		(BLACK)
			@screenPointer
			A=M	
			M=-1	//color the screen in black
			@INC
			0;JMP
			
	(INC)
		@screenPointer
		M=M+1   // incrament screenPointer
		@CHECKSCREEN
		0;JMP
 

