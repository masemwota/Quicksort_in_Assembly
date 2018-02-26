.text
#-------------------------------------------
# Procedure: insertion_sort
# Argument: 
#	$a0: Base address of the array
#       $a1: Number of array element - length
# Return:
#       None
# Notes: Implement insertion sort, base array 
#        at $a0 will be sorted after the routine
#	 is done.
#-------------------------------------------
insertion_sort:
# Caller RTE store 
    addi    $sp, $sp, -40
    sw  $fp, 36($sp)
    sw  $ra, 32($sp)
    sw  $a0, 28($sp)
    sw  $s0, 24($sp)
    sw  $s1, 20($sp)
    sw  $s5, 16($sp)
    sw  $s4, 12($sp)
    sw  $s3, 8($sp)
    addi    $fp, $sp, 40
    
    # Implement insertion sort (TBD)
   
	
	#for i ← 1 to length(A)
	#s1 = i
	li $s1, 1
	#s2 = actual position for i
	li $t1, 0
	#s3 = j
	li $s3, 0
	#s4 = actual position for j
	li $t3, 0
	#reg to store temp number 4
	li $t4, 4
	
	#a1 = length(A) = t3
	#s6 = a[j-1]
	#s7 = a[j]
	li  $s1, 1  
	beq $s1, $a1, end_for

	#for i ← 1 to length(A) -- recursive call
   	# j ← i
    	# while j > 0 and A[j-1] > A[j]
        #   swap A[j] and A[j-1]
        #   j ← j - 1
  	# end while
	#end for
	
while: addi $t5, $a0, 4 #get the base adddress
    beq $s1, $a1, done #if i = num of elements, break because done with this round
    
    addi $s3, $s1, 0 #set j equal to i 
    #set actual j value 
    la $t3, 0($s3)
    
    addi $s3, $s1, 1 #j = i
    
    #while s3 > 0 and s6 > s7
    blt $s3, $zero, end_while
    lw $s6, 0($a0)
    lw $s7, 0($a0)
    add $s3, $s3, -1
end_while:
    sw $s4, 0($a0)
    sw $s5, -4($a0)
    blt $s5, $s4, end_for
   # j insertion_sort
    
end_for:            
   #increment i
     mult $t1, $t4                                           
        add $a0, $a0, $t1        
        addi $s1, $s1, 1
    j insertion_sort
    
    
done:
    # Caller RTE restore (TBD)
   
    sw  $fp, 36($sp)
    sw  $ra, 32($sp)
    sw  $a0, 28($sp)
    sw  $s0, 24($sp)
    sw  $s1, 20($sp)
    sw  $s5, 16($sp)
    sw  $s4, 12($sp)
    sw  $s3, 8($sp)
    addi    $sp, $sp, 40
    # Return to Caller
    jr  $ra