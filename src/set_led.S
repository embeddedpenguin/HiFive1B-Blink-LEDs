.section .text
.align 2
.global set_led

.include "memory_map.inc"
.include "_gpio.inc"

.equ NOERROR, 	0x0
.equ ERROR, 	0x01
.equ LEDON, 	0x01

// Which LED to set comes into register a0
// Desired on/off state comes into register a1

set_led:
	addi sp, sp, -16
	sw ra, 12(sp)

	li t0, GPIO_CTRL_ADDR		// Load the GPIO Address
	lw t1, GPIO_OUTPUT_VAL(t0)	// Get the current value of the pins

	beqz a1, ledOff				// branch off to turn off LED if a1 requests it
	li t2, LEDON				// load up on/1 into our temp register
	beq a1, t2, ledOn			// Branch if on requested
	li a0, ERROR				// We got a bad status request, return an error
	j exit

ledOn:
	or t1, t1, a0				// Do an xor to only change the clause of the requested LED
	sw t1, GPIO_OUTPUT_VAL(t0)	// Write the new output value to the GPIO output
	li a0, NOERROR
	j exit

ledOff:
	xor a0, a0, 0xffffffff		// Invert everything so that all bits are 1 except the LED we're turning off
	and t1, t1, a0				// AND a0 and t1 to get the LED we want to turn off
	sw t1, GPIO_OUTPUT_VAL(t0)	// Write the new output value to the right GPIO register
	li a0, NOERROR

exit:
	lw ra, 12(sp)				// Restore out return address
	addi sp, sp, 16				// Deallocating stack frame
	ret







