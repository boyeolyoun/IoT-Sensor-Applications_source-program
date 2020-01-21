#include <stdio.h>
#include <softPwm.h>

// physic 16 wfi 4
#define FAN_IA 4

static void StopFan(){
    softPwmWrite(FAN_IA, 999);
    printf("정지\n");
    
}

static void Weak(){
    softPwmWrite(FAN_IA, 666);
    printf("미풍\n");
    
}

static void Medium(){
    softPwmWrite(FAN_IA, 333);
    printf("약풍\n");
    
}

static void Strong(){
    softPwmWrite(FAN_IA, 0);
    printf("강풍\n");
    
}
