# Image Trasnformation

## Original Image
![lenna.png](https://github.com/ayuyamo/Projects/blob/068a73847087c556dbca571a0b74bfda5fd3f3ea/MIPS/images/lenna.png)
## 1. Monochrome to Binary Pixel Mapping
Here is the MIPS assembly code responsible for image thresholding. This code transforms the input image into a binary image based on a specified threshold value. The assembly code accepts the following parameters:

- `a0`: Input buffer address
- `a1`: Output buffer address
- `a2`: Image dimension (assuming a square-sized image, i.e., the number of pixels is `a2*a2`)
- `a3`: Threshold value
The algorithm proceeds as follows:

1. Initialize two counters, `x` and `y`, to zero (`$t0` and `$t1`).
```
addu $t0, $0, $0 # x
addu $t1, $0, $0 # y
```
2. Set `$t2` to the value `0xFF`, representing the color black (pixel value 255) for pixels exceeding the threshold.
```
addiu $t2, $0, 0xFF # color black (val = 255) for pixels val > threshold
```
3. Start an outer loop (`for_loop`) that iterates for each row of pixels &
   Begin an inner loop (`test_inner_loop_condition`) for each pixel within the row.
```
for_loop:
beq $t0, $a2, exit # if x > a2 - 1, exit
addu $t1, $0, $0 # initialize counter (for inner loop) to 1
test_inner_loop_condition:
beq $t1, $a2, Iterate_outer_loop # if y > a2 - 1, increment x
lbu $t3, 0($a0) # load byte from a0 to t3
bge $t3, $a3, Assign_1 # if t3 > threshold --> j Assign 1
sb $0, 0($a1) #assign 0 to buffer address
j Increment_y # increment y

Assign_1: sb $t2, 0($a1) # store val 255 into output buffer
```
This section of the code loads a byte from the input buffer at `a0` into `$t3`. It then evaluates whether the value in `$t3` exceeds the threshold (`$a3`). If it does, the corresponding location in the output buffer (`$a1`) is set to pixel value 255 (black); otherwise, it is set to pixel value 0 (white). This process determines the pixel's color in the resulting binary image.

4. Increment the counters and buffer addresses accordingly and continue the inner loop.
```
Increment_y:
addiu $t1, $t1, 1 #increment y-counter
addiu $a0, $a0, 1 #increment input buffer address
addiu $a1, $a1, 1 #increment output buffer address
j test_inner_loop_condition # iterates inner loop
```
5. After completing each row, increment the `x` counter and return to the outer loop.
   Continue this process until all pixels in the image have been processed.
```
Iterate_outer_loop:
addiu $t0 $t0, 1 # increment x
j for_loop #jump back to loop
```
<div align="center">
  <img src="https://github.com/ayuyamo/Projects/blob/068a73847087c556dbca571a0b74bfda5fd3f3ea/MIPS/images/lenna.png" width="48%">
  <img src="https://github.com/ayuyamo/Projects/blob/61a3e80eb8b9da2db11573c8ef3ccbe7689bdc71/MIPS/images/lenna-thresh.png" width="48%">
</div>

## 2. Image Pixel Transformation: Rotation, Shearing, and Scaling
<div align="center">
  <img src="https://github.com/ayuyamo/Projects/blob/5321f52cc9af2f61f05c65e0ee9c2e897a55c61e/MIPS/images/lenna-rotation.png" width="30%">
  <img src="https://github.com/ayuyamo/Projects/blob/5321f52cc9af2f61f05c65e0ee9c2e897a55c61e/MIPS/images/lenna-shear.png" width="30%">
  <img src="https://github.com/ayuyamo/Projects/blob/5321f52cc9af2f61f05c65e0ee9c2e897a55c61e/MIPS/images/lenna-scale.png" width="30%">
</div>
This section contains MIPS assembly code responsible for transforming the original image pixels through rotation, shearing, and scaling. The code accepts the following parameters:

- `a0`: Input buffer address
- `a1`: Output buffer address
- `a2`: Transformation matrix address
- `a3`: Image dimension (assuming a square-sized image, i.e., the number of pixels is `a3*a3`)

The transformation of a pixel's coordinates (x, y) using a 2D transformation matrix can be expressed as follows:
```
x' = M00 * x + M01 * y + M02
y' = M10 * x + M11 * y + M12
```
In this equation:
    (x', y') are the transformed coordinates.
    (x, y) are the original coordinates.
    M00, M01, M02, M10, M11, M12 are elements of the transformation matrix.
    M00 and M01 are responsible for scaling and shearing in the x-direction.
    M10 and M11 are responsible for scaling and shearing in the y-direction.
    M02 and M12 are responsible for translation in the x and y directions, respectively.
    
Here is how the algorithm works:
1. Initialize two counters, `x` and `y`, to zero (`$t0` and `$t1`).
```
addu $t0, $0, $0 # t0 = x = 0 = row
addu $t1, $0, $0 # t1 = y = 0 = column
```
2. Start an outer loop (`Outer_loop`) that iterates for each row of pixels in the image &
   Begin an inner loop (`Inner_loop`) for each pixel within the row &
```
Outer_loop: beq $t0, $a3, Done # if x > a3 - 1, exit program
addu $t1, $0, $0 # initialize y = 0
Inner_loop: beq $t1, $a3, Increment_x
# Load elements (`M00`, `M01`, `M02`, `M10`, `M11`, `M12`) from the transformation matrix.
lw $t2, 0($a2) # load M00
lw $t3, 4($a2) # load M01
lw $t4, 8($a2) # load M02

# Calculate the new pixel coordinates, `x0` and `y0`, based on the transformation.
mul $t2, $t1, $t2 # t2 = y*M00
mul $t3, $t0, $t3 # t3 = x*M01
addu $t3, $t3, $t2 # t3 =  y*M00 + x*M01
addu $t5, $t3, $t4 # t5 = x0 = y*M00 + x*M01 + M02

lw $t2, 12($a2) # load M10
lw $t3, 16($a2) # load M11
lw $t4, 20($a2) # load M12

mul $t2, $t1, $t2 # t2 = y*M10
mul $t3, $t0, $t3 # t3 = x*M11
addu $t3, $t3, $t2 # t3 =  y*M10 + x*M11
addu $t6, $t3, $t4 # t6 = y0 = y*M10 + x*M11 + M12

# Check if the calculated coordinates exceed the image dimension (`a3`). If they do, set the pixel value to 0 (white); otherwise, retrieve the pixel value.
check_x0: bge $t5, $a3, zero_value # if x0 >= a3, jump to zero_value
check_y0: bge $t6, $a3, zero_value # if y0 >= a3, jump to zero_value
mul $t6, $t6, $a3 # $t6 = y0*a3
addu $t6, $t5, $t6 #$t6 = offset = y0*a3 + x0
addu $t6, $a0, $t6 # t6 = element address = a0 + offset
lbu $t2, 0($t6) # load affine transformation pixel value from element address
sb $t2, 0($a1) # store element in output buffer
j Increment_counter_y
zero_value: sb $0, 0($a1) # store 0 into output buffer
```
3. Increment the counters and buffer addresses accordingly and continue the inner loop.
```
Increment_counter_y:
    addiu $t1, $t1, 1 # increment inner loop counter (y++)
    addiu $a1, $a1, 1 # increment output buffer address
    j Inner_loop # iterate inner loop
```
4. After completing each row, increment the `x` counter and return to the outer loop.
```
Increment_x:
addiu $t0, $t0, 1 # increment outer loop counter (x++)
j Outer_loop # iterate outer loop
Done:
```

## 3. Image Pixel Encryption with Caesar Cipher
This section contains MIPS assembly code responsible for encrypting image pixels using the Caesar Cipher cryptography technique. The code accepts the following parameters:

- `a0`: Input buffer address
- `a1`: Output buffer address
- `a2`: Image dimension (assuming a square-sized image, i.e., the number of pixels is `a2*a2`)

Here's how the algorithm works:
1. Initialize two counters, `x` (row) and `y` (column), to zero (`$t0` and `$t1`).
```
addu $t0, $0, $0 # initialize x (row) to 0
addu $t1, $0, $0 # initialize y (col) to 0
```
2. Start an outer loop (`outer_for_loop`) that iterates for each row of pixels in the image.
```
outer_for_loop: beq $t0, $a2, exit # if x > a2 - 1, exit loop
		addu $t1, $0, $0 # initialize counter (for inner loop) to 0
```
3. Begin an inner loop (`inner_for_loop`) for each pixel within the row.
```
# Load five consecutive pixels from the input buffer (`$a0`) into registers `$t2` to `$t6`.
inner_for_loop: beq $t1, $a2, Increment_row # if y > a2 - 1, increment row
   # Shuffle the positions of these pixels, effectively performing a permutation.
	lbu $t2, 0($a0) # load 1st pixel
	addiu $a0, $a0, 1 # increment input buffer address
	lbu $t3, 0($a0) # load 2nd pixel
	addiu $a0, $a0, 1 # increment input buffer address
	lbu $t4, 0($a0) # load 3rd pixel
	addiu $a0, $a0, 1 # increment input buffer address
	lbu $t5, 0($a0) # load 4th pixel
	addiu $a0, $a0, 1 # increment input buffer address
	lbu $t6, 0($a0) # load 5th pixel

	#Shuffle pixel positions: Store the shuffled pixels in the output buffer (`$a1`).
	sb $t5, 0($a1) # store 4th pixel in 1st pixel's location 
	addiu $a1, $a1, 1 # increment output buffer address
	sb $t4, 0($a1) # store 3rd pixel in 2nd pixel's location
	addiu $a1, $a1, 1 # increment output buffer address
	sb $t2, 0($a1) # store 1st pixel in 3rd pixel's location
	addiu $a1, $a1, 1 # increment output buffer address
	sb $t6, 0($a1) # store 5th pixel in 4th pixel's location
	addiu $a1, $a1, 1 # increment output buffer address
	sb $t3, 0($a1) # store 2nd pixel in 5th pixel's location
```
4. Increment the counters and buffer addresses accordingly to continue processing the next set of pixels.
```
Increment_column:
	addiu $t1, $t1, 5 #increment column index (y = y + 1)
	addiu $a0, $a0, 1 #increment input buffer address
	addiu $a1, $a1, 1 # increment output buffer address
	j inner_for_loop
```
9. After completing each row, increment the row index (`x`) and return to the outer loop.
```

Increment_row:
	addiu $t0, $t0, 1 #increment rowindex (x = x + 1)
	j outer_for_loop

finished:
```
- Here's the resulting image after running the program:

![text-crypt.png](https://github.com/ayuyamo/Projects/blob/5321f52cc9af2f61f05c65e0ee9c2e897a55c61e/MIPS/images/text-crypt.png)
