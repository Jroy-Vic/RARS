# Roy Vicerra - CPE 333-01 - Quiz 1

# 1. a[10] = b[10] + 10
# &a[0] = x10, &b[0] = x11

.text
add_arr:	lw	x12, 40(x11)	# Get value at &b[10] from memory and store to x12
		addi	x12, x12, 10	# Add 10 to b[10]
		sw	x12, 40(x10)	# Store value to &a[10]