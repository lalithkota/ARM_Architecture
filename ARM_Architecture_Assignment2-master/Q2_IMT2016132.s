     AREA     factorial, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION
			; when the ouput is represented as a.aaaa*10^bbbb, even 
			; then tanx is behaving unpredicatibly
			VLDR.F32 S1,=290
							; x, input, in tan(x), x in DEGREES
			VLDR.F32 S10,=1.74532925199E-2
			VMUL.F32 S1,S10
			VMOV.F32 S2,S1
							; y1, y1=sin(x)
			VMOV.F32 S3,#1
							; y2, y2=cos(x)
			VMOV.F32 S6,#2
							; i, no of iteration
			VMOV.F32 S4,S1
			VMOV.F32 S5,#1
							; two term which are used like this;
							;at each iteration, these terms are multiplied by (-x/i);i+=2
							;and then it is added to the ouput.
			VMOV.F32 S7,#1
							; constant 1. This is used to increment.
			;VMOV.F32 S8,#3
							; constant 3. because i want to iterate the loop...
							;only for step(3*x) no of times
			VLDR.F32 S9,=300
							; No of times it will loop
			
myLoop		VMUL.F32 S5,S4,S1
			VNEG.F32 S5,S5
			VDIV.F32 S5,S6
			VADD.F32 S3,S5
			
			VADD.F32 S6,S7
			
			VMUL.F32 S4,S5,S1
			VDIV.F32 S4,S6
			VADD.F32 S2,S4
			
			VADD.F32 S6,S7
			
			;AND S8,S3,#0x7F800000; ignore
			;VCMP.F32 S8,S9
			;VMRS.F32 APSR_nzcv,FPSCR
			;BEQ endLoop
			
			VCMP.F32 S6,S9
			VMRS.F32 APSR_nzcv,FPSCR
			BLT myLoop

endLoop		VDIV.F32 S2,S3
			
stop    B stop ; stop program
     ENDFUNC
     END
