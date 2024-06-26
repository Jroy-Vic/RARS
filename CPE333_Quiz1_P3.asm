# Roy Vicerra - CPE 333-01 - Quiz 1

# 3. int a[20] = {1,6,6,7,7,8,8,9,10,...}
#    int func(int n, int &a) {
#    	int x = 0, sum = 0;
#	while (x < n) {
#		sum = sum + a[x];
#		x++;
#	}
# 	return sum;
#    }

.data
arr:	.word	1,6,6,7,7,8,8,9,10,...

.text
main:		li	a1, n		# Stores n into a1
		la	a2, arr		# Saves &a[0] to a2
		jal	func
		
func:		addi	sp, sp, -4	# Allocate memory for s0
		sw	s0, 0(sp)	# Save s0 to stack
		mv	s0, x0		# int x = 0;
		mv	a0, x0		# int sum = 0;

loop:		beq	s0, a1, return	# while (x < n)
		slli	t0, s0, 2	# Multiply x by 4 to advance index
		add	t0, a2, t0	# Get &a[x]
		lw	t0, 0(t0)	# *a[x]
		add	a0, a0, t0	# sum = sum + a[x];
		addi	s0, s0, 1	# x++;
		j	loop
		
return:		lw	s0, 0(sp)	# Restore s0 from stack
		addi	sp, sp, 4	# Deallocate memory in stack
		jr	ra