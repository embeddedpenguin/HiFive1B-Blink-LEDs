.section .text
.align 2
.globl delay

.include "memory_map.inc"

# Our delay value in ms is passed as a parameter into a0

delay:
	addi sp, sp, -16			# Setup our stack frame
	sw ra, 12(sp)				# Save return address

	li t0, MTIME				# Load timer register
	lw t1, 0(t0)				# Load the current value of the timer
	li t2, MTIME_FREQ			# Get our clock frequency
	mul t2, t2, a0				# Multiply milliseconds with frequency
	add t2, t1, t2				# The target mtime is now in t2

1:
	lw t1, 0(t0)				# Read mtime value again
	blt t1, t2, 1b				# Keep looping until timeout

	lw ra, 12(sp)				# restore the return address
	addi sp, sp, 16				# deallocate stack frame
	ret
