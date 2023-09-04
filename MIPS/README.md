# Image Trasnformation

## Original Image
![lenna.png](https://github.com/ayuyamo/Projects/blob/068a73847087c556dbca571a0b74bfda5fd3f3ea/MIPS/images/lenna.png)
### 1. Monochrome to Binary Pixel Mapping
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
6. The program exits after processing all pixels.
```
exit: #program exits
```
<div align="center">
  <img src="https://github.com/ayuyamo/Projects/blob/068a73847087c556dbca571a0b74bfda5fd3f3ea/MIPS/images/lenna.png" width="48%">
  <img src="https://github.com/ayuyamo/Projects/blob/61a3e80eb8b9da2db11573c8ef3ccbe7689bdc71/MIPS/images/lenna-thresh.png" width="48%">
</div>

### 2. Image Pixel Transformation: Rotation, Shearing, and Scaling
- Transforming original image pixels through rotation, shearing, and scaling
<div align="center">
  <img src="https://github.com/ayuyamo/Projects/blob/5321f52cc9af2f61f05c65e0ee9c2e897a55c61e/MIPS/images/lenna-rotation.png" width="30%">
  <img src="https://github.com/ayuyamo/Projects/blob/5321f52cc9af2f61f05c65e0ee9c2e897a55c61e/MIPS/images/lenna-shear.png" width="30%">
  <img src="https://github.com/ayuyamo/Projects/blob/5321f52cc9af2f61f05c65e0ee9c2e897a55c61e/MIPS/images/lenna-scale.png" width="30%">
</div>


### 3. Image Pixel Encryption with Caesar Cipher
- Encrypting image pixels using Caeser cipher cryptography

 ![text-crypt.png](https://github.com/ayuyamo/Projects/blob/5321f52cc9af2f61f05c65e0ee9c2e897a55c61e/MIPS/images/text-crypt.png)
