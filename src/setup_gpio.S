.section .text
.align 2
.global setup_gpio

#include "memory_map.inc"
#include "_gpio.inc"

setup_gpio:
    addi sp, sp, -16
    sw ra, 12(sp)                       // Save return address onto the stack

    li t0, GPIO_CTRL_ADDR               // Load base gpio address
    li t1, GPIO_RGB_PINS                // Get the RGB pins offset
    sw t1, GPIO_OUTPUT_EN(t0)           // Enable output on the RGB pins so they are writeable
    sw t1, GPIO_OUTPUT_XOR(t0)          // Set the xor so the rgb pins are active high
    sw x0, GPIO_OUTPUT_VAL(t0)          // Set all writeable pins to 0

    lw ra, 12(sp)
    addi sp, sp, 16
    ret