     THUMB
	 AREA     factorial, CODE, READONLY
	 IMPORT printMsg
     EXPORT __main
     ENTRY 
__main  FUNCTION
			VLDR.F32 S11,=100; r, radius
			VLDR.F32 S13,=0; theta, angle in degrees
			;below program is directly taken from my Assignment2
			
myLoop
			VLDR.F32 S10,=1.74532925199E-2
			VMUL.F32 S1,S13,S10; x, angle in radians;
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
			
mySubLoop	VMUL.F32 S5,S4,S1
			VNEG.F32 S5,S5
			VDIV.F32 S5,S6
			VADD.F32 S3,S5
			
			VADD.F32 S6,S7
			
			VMUL.F32 S4,S5,S1
			VDIV.F32 S4,S6
			VADD.F32 S2,S4
			
			VADD.F32 S6,S7
			
			VCMP.F32 S6,S9
			VMRS.F32 APSR_nzcv,FPSCR
			BLT mySubLoop

endLoop		VMUL.F32 S2,S11; sin(theta)*r
			VMUL.F32 S3,S11; cos(theta)*r;
			
			VLDR.F32 S12,=319
			VADD.F32 S3,S12; Centerx + rcos(theta)
			VLDR.F32 S12,=239
			VADD.F32 S2,S12; Centery + rsin(theta)
			
			VMOV.F32 R0,S3; x coordinate
			VMOV.F32 R1,S2; y coordinate
			VMOV.F32 R2,S11; radius
			VMOV.F32 R3,S13; theta
			BL printMsg
			
			VLDR.F32 S12,=0.1
			VADD.F32 S13,S12; increment teta with 0.1 step
			
			VLDR.F32 S12,=360
			VCMP.F32 S13,S12; check if it is 360
			VMRS.F32 APSR_nzcv,FPSCR
			BLT myLoop
			
stop    B stop ; stop program
     ENDFUNC
     END