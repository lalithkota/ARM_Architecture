     THUMB
	 AREA     factorial, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION
			MOV R2, #1; FIRST NUMBER
			MOV R1, #0; Second Number
			MOV R3, #10; input n -'n'th fibonacci number
			LDR R5, =0x20000000
			
loop		MOV r4, r1; loop n time
			ADD r1, r2; add the last two
			MOV r2, r4
			SUBS r3,#1; each time check if reached
			BEQ endloop
			B loop
			
endloop		STR R1, [R5,#0]
		
		
		
stop    B stop ; stop program
     ENDFUNC
     END