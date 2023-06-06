/**********************************************************************
* © 2007 Microchip Technology Inc.
*
* FileName:        main.c
* Dependencies:    Header (.h) files if applicable, see below
* Processor:       dsPIC33FJ256GP506
* Compiler:        MPLAB® C30 v3.00 or higher
*
*SOFTWARE LICENSE AGREEMENT:
*Except as otherwise expressly provided below, Microchip Technology Inc. 
*(Microchip) licenses this software to you solely for use with Microchip products.
*This software is owned by Microchip and/or its licensors, and is protected under 
*applicable copyright laws.  All rights reserved.
*
*This software and any accompanying information is for suggestion only.  
*It shall not be deemed to modify Microchip?s standard warranty for its products.
*It is your responsibility to ensure that this software meets your requirements.
*
*WARRANTY DISCLAIMER AND LIMIT ON LIABILITY:  SOFTWARE IS PROVIDED AS IS.  
*MICROCHIP AND ITS LICENSORS EXPRESSLY DISCLAIM ANY WARRANTY OF ANY KIND, 
*WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
*OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT. 
*IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE FOR ANY INCIDENTAL, 
*SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, 
*HARM TO YOUR EQUIPMENT, COST OF PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY 
*OR SERVICES, ANY CLAIMS BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY 
*DEFENSE THEREOF), ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR 
*COSTS.  To the fullest extend allowed by law, Microchip and its licensors 
*liability shall not exceed the amount of fees, if any, that you have paid 
*directly to Microchip to use this software.
*
*THIRD PARTY SOFTWARE:  Notwithstanding anything to the contrary, any third 
*party software accompanying this software including but not limited to ITU 
*software is subject to the terms and conditions of the third party?s license
*agreement such as the General Public License.  To the extent required by third
*party licenses covering such third party software, the terms of such license 
*will apply in lieu of the terms provided herein.  To the extent the terms of 
*such third party licenses prohibit any of the restrictions described herein, 
*such restrictions will not apply to such third party software.  THIRD PARTY 
*SOFTWARE  IS SUBJECT TO THE FOREGOING WARRANTY DISCLAIMER AND LIMIT ON LIABILITY 
*PROVIDED IN THE PARAGRAPH ABOVE
*
*MICROCHIP PROVIDES THIS SOFTWARE (INCLUDING ACCOMPANYING THIRD PARTY SOFTWARE)
*CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE TERMS.
************************************************************************/

#include <p33FJ256GP506.h>
#include "..\h\OCPWMDrv.h"
#include "..\h\sask.h"
#include "..\h\SFMDrv.h"
#include "..\h\G711.h"
#include "..\h\ADCChannelDrv.h"
#include <stdio.h>
#include <math.h>

#define SIZE 10
#define SIZE_FILTER 44
_FGS(GWRP_OFF & GCP_OFF);
_FOSCSEL(FNOSC_FRC);
_FOSC(FCKSM_CSECMD & OSCIOFNC_ON & POSCMD_NONE);
_FWDT(FWDTEN_OFF);

/* FRAME_SIZE - Size of each audio frame 	
 * SPEECH_SEGMENT_SIZE - Size of intro speech segment
 * WRITE_START_ADDRESS - Serial Flash Memory write address					
 * */

#define FRAME_SIZE 				128			
#define SPEECH_SEGMENT_SIZE		98049L		
#define WRITE_START_ADDRESS	0x20000	
#define FILTER_SIZE 71
#define SAMPLE_SIZE FRAME_SIZE - FILTER_SIZE + 1


//headers
void convolution(int signal[], int kernel[], float result[], int size_signal, int size_kernel, int size_result);

/* Allocate memory for buffers and drivers	*/

int		adcBuffer		[ADC_CHANNEL_DMA_BUFSIZE] 	__attribute__((space(dma)));
int		ocPWMBuffer		[OCPWM_DMA_BUFSIZE]		__attribute__((space(dma)));
int		samples			[SAMPLE_SIZE];
char 	encodedSamples	[FRAME_SIZE];
int 	decodedSamples	[FRAME_SIZE];
char 	flashMemoryBuffer	[SFMDRV_BUFFER_SIZE];

//int 	output	[FRAME_SIZE + FILTER_SIZE - 1];
int 	output	[FRAME_SIZE];

/* Instantiate the drivers 	*/
ADCChannelHandle adcChannelHandle;
OCPWMHandle 	ocPWMHandle;

/* Create the driver handles	*/
ADCChannelHandle *pADCChannelHandle 	= &adcChannelHandle;
OCPWMHandle 	*pOCPWMHandle 		= &ocPWMHandle;

/* Addresses 
 * currentReadAddress - This one tracks the intro message	
 * currentWriteAddress - This one tracks the writes to flash	
 * userPlaybackAddress - This one tracks user playback		
 * address - Used during flash erase
 * */

 long currentReadAddress;		
 long currentWriteAddress;		
 long userPlaybackAddress;
 long address;	
 
 /* flags
 * record - if set means recording
 * playback - if set mean playback
 * erasedBeforeRecord - means SFM eras complete before record
 * */	

int record;						
int playback;						
int erasedBeforeRecord;			

int main(void)
{
	/* Addresses 
	 * currentReadAddress - This one tracks the intro message	
	 * currentWriteAddress - This one tracks the writes to flash	
	 * userPlaybackAddress - This one tracks user playback		
	 * address - Used during flash erase
	 * */

	long currentReadAddress = 0;		
	long currentWriteAddress = WRITE_START_ADDRESS;		
	long userPlaybackAddress = WRITE_START_ADDRESS;		
	long address = 0;	
    
    
	/* flags
	 * record - if set means recording
	 * playback - if set mean playback
	 * erasedBeforeRecord - means SFM eras complete before record
	 * */

//	int record = 0;						
//	int playback = 0;					
//	int erasedBeforeRecord = 0;			

	/* Configure Oscillator to operate the device at 40MHz.
	 * Fosc= Fin*M/(N1*N2), Fcy=Fosc/2
	 * Fosc= 7.37M*40/(2*2)=80Mhz for 7.37M input clock */
	 
	PLLFBD=41;				/* M=39	*/
	CLKDIVbits.PLLPOST=0;		/* N1=2	*/
	CLKDIVbits.PLLPRE=0;		/* N2=2	*/
	OSCTUN=0;			
	
	__builtin_write_OSCCONH(0x01);		/*	Initiate Clock Switch to FRC with PLL*/
	__builtin_write_OSCCONL(0x01);
	while (OSCCONbits.COSC != 0b01);	/*	Wait for Clock switch to occur	*/
	while(!OSCCONbits.LOCK);

	
	/* Intialize the board and the drivers	*/
//	SASKInit();
	ADCChannelInit	(pADCChannelHandle,adcBuffer);			/* For the ADC	*/
	OCPWMInit		(pOCPWMHandle,ocPWMBuffer);			/* For the OCPWM	*/

	/* Open the flash and unprotect it so that
	 * it can be written to.
	 * */

	SFMInit(flashMemoryBuffer);
	
		
	/* Start Audio input and output function	*/
	ADCChannelStart	(pADCChannelHandle);
	OCPWMStart		(pOCPWMHandle);	
		
	
	/* Main processing loop. Executed for every input and 
	 * output frame	*/
    //int kernel[] = {1};
    float kernel[SIZE_FILTER] = {0.0260089671855094, -0.00283661216918882, -0.0115087163411002, -0.0235406970052995, -0.0356584358926075, -0.0442641700479179, -0.0469018131634581, -0.0432643300136655, -0.0354772146876289, -0.0276944554524758, -0.0245006714156357, -0.0289610721637429, -0.0410682341139295, -0.0570087340865727, -0.0698139320700921, -0.0713553141769536, -0.0550740941298067, -0.0185506411723116, 0.0349252502126112, 0.0965926966503804, 0.154163116606530, 0.195035526088132, 0.209811555619217, 0.195035526088132, 0.154163116606530, 0.0965926966503804, 0.0349252502126112, -0.0185506411723116, -0.0550740941298067, -0.0713553141769536, -0.0698139320700921, -0.0570087340865727, -0.0410682341139295, -0.0289610721637429, -0.0245006714156357, -0.0276944554524758, -0.0354772146876289, -0.0432643300136655, -0.0469018131634581, -0.0442641700479179, -0.0356584358926075, -0.0235406970052995, -0.0115087163411002, -0.00283661216918882, 0.0260089671855094};    
    float result[FRAME_SIZE + SIZE_FILTER - 1];
    int kernelRounded[SIZE_FILTER];
    for (int i = 0; i < SIZE_FILTER; i++) {
        kernelRounded[i] = 0;
        kernelRounded[i] =  round(kernel[i]*65536); // Multiplica por 2^16 (65536)
    }

	while(1)
	{
			/* Obtaing the ADC samples	*/
			while(ADCChannelIsBusy(pADCChannelHandle));
                ADCChannelRead(pADCChannelHandle,samples,FRAME_SIZE);           
                        
            while(OCPWMIsBusy(pOCPWMHandle));
                convolution(samples, kernelRounded, result, FRAME_SIZE, SIZE_FILTER, FRAME_SIZE + SIZE_FILTER - 1);

		
			/* Write the frame to the output	*/
            OCPWMWrite(pOCPWMHandle, result, FRAME_SIZE);
			/* Playback the intro message if record or play functions 
			 * are not active. Read SFM from address 0 where the intro
			 * message is stored. Rewind the currentReadAddress if the
			 * message has reached the end.
			 * */
	}
}

void convolution(int signal[], int kernel[], float result[], int size_signal, int size_kernel, int size_result) {
    int i, j;
      
    for (i = 0; i < size_result; i++) {
        result[i] = 0;
        for (j = 0; j < size_signal ; j++) {
            if (i - j >= 0 && i - j < size_kernel) {
                result[i] += signal[j] * kernel[i - j];
            }
        }
    }
    
    for (i = 0; i < size_result; i++){
        result[i] = result[i] / 65536;
    }
}