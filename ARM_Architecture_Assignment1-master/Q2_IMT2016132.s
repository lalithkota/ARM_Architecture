     THUMB
	 AREA     factorial, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION
		MOV R1, #1
		MOV R2, #3
		MOV R3, #2 ; r1,r2,r3 being inputs
		MOV R4, R1 ; r4 being ouput. initialised to input1
		CMP R4, R2
		IT LT ; if less then output is input2
		MOVLT R4, R2
		
		CMP R4, R3
		IT LT ; if less then output is input3
		MOVLT R4, R3
		
stop    B stop ; stop program
     ENDFUNC
     END