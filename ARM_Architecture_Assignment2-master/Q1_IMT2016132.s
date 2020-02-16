     THUMB
	 AREA     factorial, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION
			
			VLDR.F32 S1,=10;
			; when the ouput is represented as a.aaaa*10^bbbb, then
			; it only works for four/five decimal places in mantissa
			
			;VADD.F32 S1,#
							; x, input, in e^x; works only till 87 because
							; e^88 exceeds the maximum floating point number
			VMOV.F32 S3,#1
							; y, output, in y=e^x;
			VMOV.F32 S4,#1
							; i, no of iteration
			VMOV.F32 S2,#1
							; a term which is used like this
							;at each iteration, this term is multiplied by (x/i)
							;and then it is added to the ouput.
			VMOV.F32 S5,#1
							; constant 1. This is used to increment.
			VLDR.F32 S6,=300
							; No of times it will loop
			;VLDR.F32 S9,=0x7f800000
			
myLoop		VMUL.F32 S2,S1
			VDIV.F32 S2,S4
			VADD.F32 S3,S2
			VADD.F32 S4,S5
			
			;AND S8,S3,#0x7F800000; ignore
			;VCMP.F32 S8,S9
			;VMRS.F32 APSR_nzcv,FPSCR
			;BEQ endLoop
			
			VCMP.F32 S4,S6
			VMRS.F32 APSR_nzcv,FPSCR
			BLT myLoop
			
stop    B stop ; stop program
     ENDFUNC
     END