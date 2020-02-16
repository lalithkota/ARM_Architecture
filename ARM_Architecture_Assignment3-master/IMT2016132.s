		AREA neural, CODE, READONLY
		EXPORT __main
		ENTRY
__main	FUNCTION
		
		BL myMain
		
myStop	B myStop

perc1	
		
		VMUL.F32 S3,S0
		VMUL.F32 S4,S1
		VMUL.F32 S5,S2
		
		VADD.F32 S3,S4
		VADD.F32 S3,S5
		
		VADD.F32 S3,S6
		
		VMOV.F32 S1,S3
		PUSH {lr}
		BL expx
		POP {lr}
		
		VLDR.F32 S1,=1
		VADD.F32 S2,S3,S1
		VDIV.F32 S3,S2
		
		BX lr
		
expx	VLDR.F32 S2,=1
		VLDR.F32 S3,=1
		VLDR.F32 S4,=1
		
exloop	VMUL.F32 S2,S1
		VDIV.F32 S2,S4
		VADD.F32 S3,S2
		
		VLDR.F32 S5,=1
		VADD.F32 S4,S5
		
		VLDR.F32 S5,=300
		VCMP.F32 S4,S5
		VMRS.F32 APSR_nzcv,FPSCR
		BLT exloop
		BX lr
		
myMain	;S0,S1,S2 ARE INPUTS. S3,S4,S5 ARE WEIGHTS. S6 IS BIAS.
		;FINAL OUPUT IS IN S3
		
		;DECLARE INPUTS HERE.
		;EXAMPLE
		VLDR.F32 S0,=1
		VLDR.F32 S1,=0
		VLDR.F32 S2,=0
		
		VLDR.F32 S3,=-0.1
		VLDR.F32 S4,=0.2
		VLDR.F32 S5,=0.2
		
		VLDR.F32 S6,=-0.2
		
		PUSH {lr}
		BL perc1
		POP {lr}
		
		BX lr

		
		ENDFUNC
		END
		