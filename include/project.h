#ifndef _PROJECT_H_
#define _PROJECT_H_


#define EXAMPLE_DELAY   200 // in ms
#define ON              0x01
#define OFF             0x00
#define NUM_LEDS        0x03

#define RED_LED          0x400000
#define BLUE_LED         0x200000
#define GREEN_LED        0x080000


void setup_gpio(void);
int set_led(int color, int state);
void delay(int ms);


#endif