#include <stdio.h>
#include "project.h"

int main()
{
    volatile int error = 0;
    int led_num = 0;
    int colors[NUM_LEDS] = {GREEN_LED, RED_LED, BLUE_LED};
    printf("Got here\n");
    setup_gpio();

    for(;;)
    {
        
        while(!error)
        {
            printf("Hello\n");
            set_led(colors[led_num], ON);
            delay(EXAMPLE_DELAY);
            error = set_led(colors[led_num], OFF);
            led_num = (led_num + 1) % NUM_LEDS;
        }
    }
}