#include "gpio.h"
int init();
void display();
void refresh(int run);
unsigned char getBit(unsigned char, int );

static volatile int run;
unsigned int time;

static volatile unsigned char digit[DIGIT];
int numOfDigit4;
static const unsigned char num[10] = {NUM0,NUM1,NUM2,NUM3,NUM4,NUM5,NUM6,NUM7,NUM8,NUM9};

void press (void)
{
    if(time > millis() - DELTA)
        return;
    else
        time = millis();
    run = !run;
    //printf("\nKick...\n");
}
int main (void)
{
    int myCounter = 0 ;
    init();
    printf("Press start button to begin!\n");
    for (;;)
    {
        if(run)
            printf("\rRunning: The number is %d",numOfDigit4 % 8 + 1);
        else
            printf("\rStopped: The number is %d",numOfDigit4 % 8 + 1);
        display();
        delay(1);
        refresh(run);
    }
    return 0 ;
}


int init(){
    if (wiringPiSetup () < 0)
    {
        fprintf (stderr, "Unable to setup wiringPi: %s\n", strerror (errno)) ;
        return 1 ;
    }
    pinMode(D1, OUTPUT);
    pinMode(D2, OUTPUT);
    pinMode(D3, OUTPUT);
    pinMode(D4, OUTPUT);
    pinMode(A, OUTPUT);
    pinMode(B, OUTPUT);
    pinMode(C, OUTPUT);
    pinMode(D, OUTPUT);
    pinMode(E, OUTPUT);
    pinMode(F, OUTPUT);
    pinMode(G, OUTPUT);
    pinMode(DP, OUTPUT); 
    if (wiringPiISR (BUTTON_PIN, INT_EDGE_FALLING, &press) < 0)
    {
        fprintf (stderr, "Unable to setup ISR: %s\n", strerror (errno)) ;
        return 1 ;
    }
    digit[0] = NUM0;
    digit[1] = NUM0;
    digit[2] = NUM0;
    digit[3] = NUM0;
    return 0;
}

void display(){
    int dig[DIGIT] = {D1, D2, D3, D4};
    int seg[SEGMENT] = {A, B, C, D, E, F, G, DP};

    for(int i = 0; i < DIGIT; i++) {
        for(int clear = 0; clear < DIGIT; clear++) {
            if(clear == i)
                digitalWrite(dig[clear], HIGH);
            else
                digitalWrite(dig[clear], LOW);
        }
        //printf(">%x\n",digit[i]);
        for(int j = 0; j < SEGMENT; j++) {
            digitalWrite(seg[j], getBit(digit[i],j));
            
        }

        delayMicroseconds(500);
    }

}
void refresh(int run) {
    static unsigned int refreshTime;
    if(refreshTime > millis() - 100)
        return;
    refreshTime = millis();
    if(run)
    {
        digit[3] = num[++numOfDigit4 % 8 + 1];
        digit[0] = 0;
        digit[1] = 0;
        digit[2] = 0;
    }
}

unsigned char getBit( unsigned char digit, int seg) {
    unsigned char mask = 1 << (SEGMENT - seg - 1);
    return ((digit & mask) == 0) ? HIGH : LOW;
}
