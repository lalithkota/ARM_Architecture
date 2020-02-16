#include "stm32f4xx.h"
#include <stdio.h>

//After this put the debug printf output into a csv file and plot it with four columns
//additionally put the line "x,y,r,theta" in the beginning so it will become the label of csv
void printMsg(int t1,int t2,int t3,int t4){
	float p1=*((float*)&t1);
	float p2=*((float*)&t2);
	float p3=*((float*)&t3);
	float p4=*((float*)&t4);
	char c1[10];
	sprintf(c1,"%f",p1);
	int i;
	for(i=0;c1[i]!='\0';i++){
		ITM_SendChar(c1[i]);
	}
	ITM_SendChar(',');
	
	sprintf(c1,"%f",p2);
	for(i=0;c1[i]!='\0';i++){
		ITM_SendChar(c1[i]);
	}
	ITM_SendChar(',');
	
	sprintf(c1,"%f",p3);
	for(i=0;c1[i]!='\0';i++){
		ITM_SendChar(c1[i]);
	}
	ITM_SendChar(',');
	
	sprintf(c1,"%f",p4);
	for(i=0;c1[i]!='\0';i++){
		ITM_SendChar(c1[i]);
	}
	ITM_SendChar('\n');
}
