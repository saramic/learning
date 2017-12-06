import numpy as np
import argparse
import imutils
import cv2

ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required = True, help = "Path to the image")
ap.add_argument("-i2", "--image2", required = True, help = "Path to the image 2")
ap.add_argument("-i3", "--image3", required = True, help = "Path to the image 3")
args = vars(ap.parse_args())

image = cv2.imread(args["image"])

# NOTE: CHAPTER 6

cv2.imshow("Original", image)

# 6.1 translation Left(-ve)/right(+ve) followed by up(-ve)/down(+ve)
M = np.float32([[1, 0, 25], [0, 1, 50]])
shifted = cv2.warpAffine(image, M, (image.shape[1], image.shape[0]))
cv2.imshow("Shifted Down and Right", shifted)

# 6.1 translation
M = np.float32([[1, 0, -50], [0, 1, -90]])
shifted = cv2.warpAffine(image, M, (image.shape[0], image.shape[0]))
cv2.imshow("Shifted Up and Left", shifted)

# 6.2 in imutils.py
# 6.3 translate using imutils
shifted = imutils.translate(image, 0, 100)
cv2.imshow("Shifted Down", shifted)
cv2.waitKey(0)
cv2.destroyAllWindows()

# 6.4 rotate counter-clockwise by default
(h, w) = image.shape[:2]
center = (w // 2, h // 2)

M = cv2.getRotationMatrix2D(center, 45, 1.0)
rotated = cv2.warpAffine(image, M, (w, h))
cv2.imshow("rotated by 45 degrees", rotated)

# 6.4 rotate -ve to rotate clockwise
M = cv2.getRotationMatrix2D(center, -90, 1.0)
rotated = cv2.warpAffine(image, M, (w, h))
cv2.imshow("rotated by -90 degrees", rotated)

# 6.5 move rotate to imutils.py
# 6.6 rotate using imutils.py
rotated = imutils.rotate(image, 180)
cv2.imshow("Rotated by 180 Degrees", rotated)
cv2.waitKey(0)
cv2.destroyAllWindows()

# 6.7 resize
r = 150.0 / image.shape[1] # ratio - width = 150px
dim = (150, int(image.shape[0] * r))

resized = cv2.resize(image, dim, interpolation = cv2.INTER_AREA) # could also use INTER_LINEAR
                                                                 # INTER_CUBIC or INTER_NEAREST
cv2.imshow("Resized (Width)", resized)

# 6.8 resize
r = 50.0 / image.shape[1] # ratio - height = 50px
dim = (50, int(image.shape[0] * r))

resized = cv2.resize(image, dim, interpolation = cv2.INTER_AREA)
cv2.imshow("Resized (Height)", resized)

# 6.11
# 6.9 resize in imutils.py
resized = imutils.resize(image, width = 66)
print("shape: {} pixels".format(resized.shape)) # NOTE: height width order not width height
cv2.imshow("Resized via Function", resized)

# 6.10 resize height via imutils.py
resized = imutils.resize(image, height = 110)
print("shape: {} pixels".format(resized.shape)) # NOTE: height width order not width height
cv2.imshow("Resized via Function height 50", resized)
cv2.waitKey(0)
cv2.destroyAllWindows()

# 6.12 flipping
flipped = cv2.flip(image, 1)
cv2.imshow("Flipped Horizontally", flipped)

flipped = cv2.flip(image, 0)
cv2.imshow("Flipped Vertically", flipped)

flipped = cv2.flip(image, -1)
cv2.imshow("Flipped Horizontally & Vertically", flipped)
cv2.waitKey(0)

# 6.13 crop [y_start:y_end, x_start:x_end]
cropped = image[30:120, 240:335]
cv2.imshow("T-Rex Face", cropped)
cv2.waitKey(0)
cv2.destroyAllWindows()

# 6.14 arithmetic
                                # cv2 uses max and min
print(" max of 255: {}".format(cv2.add(np.uint8([200]), np.uint8([100]))))
print(" min of   0: {}".format(cv2.add(np.uint8([ 50]), np.uint8([100]))))
                                # np wraps around
print("wrap around: {}".format(np.uint8([200]) + np.uint8([100])))
print("wrap around: {}".format(np.uint8([ 50]) + np.uint8([100])))

# 6.17 arithmetic on images
M = np.ones(image.shape, dtype = "uint8") * 100
added = cv2.add(image, M)
cv2.imshow("Added", added)

M = np.ones(image.shape, dtype = "uint8") *50
subtracted = cv2.subtract(image, M)
cv2.imshow("Subtracted", subtracted)
cv2.waitKey(0)

# 6.18 bitwise operations
rectangle = np.zeros((300, 300), dtype = "uint8")
cv2.rectangle(rectangle, (25, 25), (275, 275), 255, -1)
cv2.imshow("Rectangle", rectangle)

circle = np.zeros((300, 300), dtype = "uint8")
cv2.circle(circle, (150, 150), 150, 255, -1)
cv2.imshow("Circle", circle)
cv2.waitKey(0)

# 6.19 bitwise AND
bitwiseAnd = cv2.bitwise_and(rectangle, circle)
cv2.imshow("AND", bitwiseAnd)
cv2.waitKey(0)

# 6.19 bitwise OR
bitwiseOr = cv2.bitwise_or(rectangle, circle)
cv2.imshow("OR", bitwiseOr)
cv2.waitKey(0)

# 6.19 bitwise XOR
bitwiseXor = cv2.bitwise_xor(rectangle, circle)
cv2.imshow("XOR", bitwiseXor)
cv2.waitKey(0)

# 6.19 bitwise NOT
bitwiseNot = cv2.bitwise_not(circle)
cv2.imshow("NOT", bitwiseNot)
cv2.waitKey(0)
cv2.destroyAllWindows()

# 6.20 masking
image2 = cv2.imread(args["image2"])
cv2.imshow("Original2", image2)

mask = np.zeros(image2.shape[:2], dtype = "uint8")
(cX, cY) = (image2.shape[1] // 2, image2.shape[0] // 2)
cv2.rectangle(mask, (cX - 75, cY -75), (cX + 75, cY +75), 255, -1)
cv2.imshow("Mask", mask)

masked = cv2.bitwise_and(image2, image2, mask = mask)
cv2.imshow("Mask Applied to Image", masked)
cv2.waitKey(0)

# 6.21 masking circle
mask = np.zeros(image2.shape[:2], dtype = "uint8")
cv2.circle(mask, (cX, cY), 100, 255, -1)
masked = cv2.bitwise_and(image2, image2, mask = mask)
cv2.imshow("Mask", mask)
cv2.imshow("Mask Applied to Image", masked)
cv2.waitKey(0)

# 6.22 splitting and merging channels
image3 = cv2.imread(args["image3"])
(B, G, R) = cv2.split(image3)

cv2.imshow("Red", R)
cv2.imshow("Green", G)
cv2.imshow("Blue", B)

merged = cv2.merge([B, G, R])
cv2.imshow("Merged", merged)
cv2.waitKey(0)
cv2.destroyAllWindows()

# 6.23 merge only colour channel
zeros = np.zeros(image3.shape[:2], dtype = "uint8")
cv2.imshow("Red", cv2.merge([zeros, zeros, R]))
cv2.imshow("Green", cv2.merge([zeros, G, zeros]))
cv2.imshow("Blue", cv2.merge([B, zeros, zeros]))
cv2.waitKey(0)
cv2.destroyAllWindows()

# 6.24 colorspaces
cv2.imshow("Original", image2)

gray = cv2.cvtColor(image2, cv2.COLOR_BGR2GRAY)
cv2.imshow("Gray", gray)

hsv = cv2.cvtColor(image2, cv2.COLOR_BGR2HSV)
cv2.imshow("HSV", hsv)

lab = cv2.cvtColor(image2, cv2.COLOR_BGR2LAB)
cv2.imshow("L*a*b*", lab)
cv2.waitKey(0)

