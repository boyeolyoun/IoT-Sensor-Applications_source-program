#include <stdio.h>
#include <softPwm.h>
#include <wiringPi.h>
#include "InputFanMode.h"

int main(void){
    if(wiringPiSetup()==-1){
        return 1;
    }
    
    softPwmCreate(FAN_IA, 0, 1000);
    
    StopFan();
    
    char fanmode;
    
    for(;;){

        printf("선풍기 모드를 입력하세요 : ");
        scanf("%c", &fanmode);
        getchar();

        switch(fanmode){
        case 'q' :
            StopFan();
            break;
        case 'w' :
            Weak();
            break;
        case 'm' :
            Medium();
            break;
        case 's' :
            Strong();
            break;
        } 
           
    }

    return 0;
}
