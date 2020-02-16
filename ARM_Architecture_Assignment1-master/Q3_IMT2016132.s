     THUMB
	 AREA     factorial, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION
		MOV R1, #01; input
		MOV R2, #0; output
		AND R2, R1, #1; If R2 is 1, it is odd. if it is zero, it is even
stop    B stop ; stop program
     ENDFUNC
     END