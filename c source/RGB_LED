#include<stdio.h>
#include<softPwm.h>
#include<wiringPi.h>

#define uchar unsigned char

#define R 0
#define G 1
#define B 2

void SetLed(void){
	softPwmCreate(R, 0, 255);
	softPwmCreate(G, 0, 255);
	softPwmCreate(B, 0, 255);
}

void LedColorSet(uchar r, uchar g, uchar b){
	softPwmWrite(R, 0xff - r);
	softPwmWrite(G, 0xff - g);
	softPwmWrite(B, 0xff - b);
}
int main(void){

if(wiringPiSetup() == -1) return -1;

SetLed();

while(1){
	LedColorSet(0xff, 0x00, 0x00);
	delay(1000);
	LedColorSet(0x00, 0xff, 0x00);
	delay(1000);
	LedColorSet(0x00, 0x00, 0xff);
	delay(1000);
	LedColorSet(0xff, 0xff, 0xff);
	delay(1000);
	LedColorSet(0x00, 0xff, 0xff);
	delay(1000);
	LedColorSet(0xff, 0x00, 0xff);
	delay(1000);
	LedColorSet(0xff, 0xff, 0x00);
	delay(1000);
	LedColorSet(0x00, 0x00, 0x00);
	delay(1000);
	LedColorSet(0xff, 0x7d, 0xe5);
	delay(1000);
	}
}
