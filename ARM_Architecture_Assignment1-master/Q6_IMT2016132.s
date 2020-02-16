     THUMB
	 AREA     factorial, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION
		MOV R1, #27 ; Input1
		MOV R2, #36 ; Input2
loop	CMP R1, R2
		IT GT;	if greater, then do this
		SUBGT R1, R1, R2
		
		CMP R1, R2
		IT LT; if lesser, then do this
		SUBLT R2, R2, R1
		
		CMP R1, R2
		BNE loop
		
		;; Either of them is outputs at this stage
stop    B stop ; stop program
     ENDFUNC
     END