     THUMB
	 AREA     factorial, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION
	MOV R1, #3 ; some random number
	MOV R2, #3 ; another random number
	CMP R1, R2 ; compare them
	ITT LT;		 {start a loop
	MOVLT R3, R1; The manual says that it is restricted to use a IT block inside an IT
	IT EQ;		{start nested loop... build error at this line
	MOVEQ R4, R3;}}It gives build error
	
stop    B stop ; stop program
     ENDFUNC
     END
