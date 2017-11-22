// Receives two 16 bit numbers located in R13, R14 and calculated R13/R14
// while ignoring the remainder, and sets the answer in R15. All of this is
// done in logarithmic time, meaning log(R13) base 2.


// Pseudocode:
//
// R15->0, a->R13, b->R14
// 
// (LOOP1)
// if a>b then end, else c->b, count->1 and jumpto LOOP2
// (LOOP2)
// c->2*c, count->2*count, if c>a then jumpto LOOP3, else jumpto LOOP2
// (LOOP3)
// count->count/2, R15->R15+count, c->c/2, a->a-c, if b>a jumpto END
// else jumpto LOOP1



	@15
	M=0 //setting R15 as 0
	@14
	D=M
	@b //setting our b variable as R14
	M=D
	@13
	D=M
	@a //setting our a variable as R13
	M=D	
	
(LOOP1)
	

	@b
	D=M	
	@i
	M=D
	@a
	D=M
	@i
	M=M-D //setting i as b-a
	@i
	D=M
	@END //if i=b-a>0 then jumpto END
	D;JGT
	@b
	D=M
	@c
	M=D
	@count //otherwise set temp variable c->b, and count->1
	M=1
	@LOOP2
	0;JEQ //then jumpto LOOP2

(LOOP2)
	
	@c
	M=M<< //multiple c by 2
	@count
	M=M<< //multiply the count by 2
	@a
	D=M
	@i
	M=D
	@c
	D=M
	@i
	M=M-D //set i as a-c
	@i
	D=M
	@LOOP3
	D;JLT //if a-c<0 then jumpto LOOP3, otherwise jumpto LOOP2
	@LOOP2
	0;JEQ

(LOOP3)

	@count
	M=M>> //divide the count by 2
	D=M
	@15
	M=M+D //add the count to R15
	@c
	M=M>> //divide c by 2
	@c
	D=M
	@a
	M=M-D //set as as a-c
	@b	
	D=M
	@i
	M=D
	@a
	D=M
	@i
	M=M-D //set i as b-a
	@i	
	D=M
	@END
	D;JGT //if b-a<0 then jumpto END otherwise jumpto LOOP1
	@LOOP1
	0;JEQ

(END)

