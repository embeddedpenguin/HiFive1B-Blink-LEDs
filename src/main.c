#include <stdio.h>

#include "project.h"
void setup_gpio(void)
{
    return;
}
int set_led(int color, int state)
{
    return 0;
}
void delay(int ms)
{
    return;
}
int main()
{
    int error = 0;
    int led_num = 0;
    int colors[NUM_LEDS] = {GREEN_LED, RED_LED, BLUE_LED};

    setup_gpio();

    for(;;)
    {
        while(!error)
        {
            set_led(colors[led_num], ON);
            delay(EXAMPLE_DELAY);
            error = set_led(colors[led_num], OFF);
            led_num = (led_num + 1) % NUM_LEDS;
        }
    }
}