# Roy Vicerra - CPE 333-01 - Quiz 1

# 2. int x = 0;
#    int a[20] = {1,6,6,7,7,8,8,9,10,...}
#    while (x < 10) {
#    	sum = sum + a[x];
#    	x++;
#    }

.data
arr:	.word	1,6,6,7,7,8,8,9,10,...

.text		# sum = a0
init:		mv	s0, x0		# int x = 0;
		la	s1, arr		# s1 = &a[0]
		li	s2, 10		# set conditional limit

loop:		beq	s0, s2, return	# while (x < 10)
		slli	t0, s0, 2	# Multiply current x by 4
		add	t0, s1, t0	# Get &a[x]
		lw	t0, 0(t0)	# *a[x]
		add	a0, a0, t0	# sum = sum + a[x]
		addi	s0, s0, 1	# x++
		j	loop

return:		done
