// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/sort/Sort.asm

// Sort an array that start in the index that store in R14,
// The size of the array is store in R15,
// And the sorted list stores in the same place that
// the unsorted list was.
// (R14, R15 refer to RAM[14], RAM[15])

// pseudo code:
// 		init vars - array= R14
//					i,j,temp= 0
//					len= R15
//		while i<len
//			j=0
//          while j<len-1
//				x= array[j]
//				y= array[j+1]
//				diff= x-y
//				if diff<0:
//					swap x,y
//				j++
//			i++				


    //init vars
@R15
D=M
@len
M=D     //len=R[15]
@R14
D=M
@array
M=D-1     //array=R[14]-1
@len
D=D+M
@last
M=D     //last=R[14]+len-1 

@0
D=A
@i
M=D     //i=0
@j
M=D     //j=0
@temp
M=D     //temp=0


    //start looping
(IWHILE)
    @last
    D=M
    @array
    D=M-D       //if i>len end looping
    @ENDIWHILE
    D;JGE
    
    @array
    D=M
    @x
    M=D+1
    @y
    M=D+1
    @JWHILE
    0;JMP
    
    //@0
    //D=A
    //@j
    //M=D     //set j to zero
    
    
    (JWHILE)
        @j
        D=M
        D=D+1
        @len
        D=D-M       //if j>len end inner loop
        @ENDIWHILE
        D;JGE
        @CHECK
        0;JMP
        
        (COMPARE)   
          //@array
           // D=M
            //@j
            //D=D+M
            //@x
            //M=D     // x = array[j]
            //D=D+1
            //@y
            //M=D     // y = array[j+1]
            //@CHECK
            //0;JMP
            
            (CHECK)
                @x
                A=M
                D=M
                @y
                A=M
                D=D-M
                @NOSWAP // if x>y DO NOT swap
                D;JGE
                @SWAP   // else swap x,y
                0;JMP

            (SWAP)
                @x
                //A=M
                D=M
                //@temp
                //M=D     // temp=x
                @y
                //A=M
                D=M
                //@x
                //A=M
                //M=D     // x=y
                //@temp
                //D=M
                //@y
                //A=M
                //M=D     // y=temp
                @INCJ
                0;JMP
        
            (NOSWAP)   
                @INCJ
                0;JMP
            
        (INCJ)
            @x
            M=M+1   // j++
            D=M
            @last
            D=M-D
            @JWHILE
            0;JGT
            @array
            M=M+1
            @SWAP2
            0;JMP
            
        (SWAP2)
            @array
            A=M
            D=M
            @temp
            M=D     // temp=x
            @y
            A=M
            D=M
            @x
            A=M
            M=D     // x=y
            @temp
            D=M
            @y
            A=M
            M=D     // y=temp
            @IWHILE
            0;JMP 

    (ENDJWHILE)
        @i
        M=M+1   // i++
        @IWHILE
        0;JMP

(ENDIWHILE)
//@ENDIWHILE
//0;JMP   //infinte loop

				