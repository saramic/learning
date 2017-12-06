import numpy as np
import cv2

# NOTE CHAPTER 5

# 5.1 setup a canvas
canvas = np.zeros((300, 300, 3), dtype = "uint8")

# 5.2 draw a green line
green = (0, 255, 0)
cv2.line(canvas, (0, 0), (300, 300), green) # default thickness
cv2.imshow("Canvas", canvas)
cv2.waitKey(0)

# 5.2 draw a red line
red = (0, 0, 255)
cv2.line(canvas, (300, 0), (0, 300), red, 3) # thickness 3
cv2.imshow("Canvas", canvas)
cv2.waitKey(0)

# 5.3 draw rectangles
cv2.rectangle(canvas, (10, 10), (60, 60), green) # 1px thickness default
cv2.imshow("Canvas", canvas)
cv2.waitKey(0)

cv2.rectangle(canvas, (50, 200), (200, 225), red, 5) # 5px thickness
cv2.imshow("Canvas", canvas)
cv2.waitKey(0)

blue = (255, 0, 0)
cv2.rectangle(canvas, (200, 50), (225, 125), blue, -1) # filled
cv2.imshow("Canvas", canvas)
cv2.waitKey(0)

# 5.4 circles
canvas = np.zeros((300, 300, 3), dtype = "uint8")
(centerX, centerY) = (canvas.shape[1] // 2, canvas.shape[0] // 2) # integer division
white = (255, 255, 255)

for r in range(0, 175, 25):
    cv2.circle(canvas, (centerX, centerY), r, white)

cv2.imshow("Canvas", canvas)
cv2.waitKey(0)

# 5.5 random circles
for i in range(0, 25):
    radius = np.random.randint(5, high = 200)
    color = np.random.randint(0, high = 256, size = (3,)).tolist() # (3,) to generate 3 numbers
    pt = np.random.randint(0, high = 300, size = (2,))

    cv2.circle(canvas, tuple(pt), radius, color, -1)

cv2.imshow("Canvas", canvas)
cv2.waitKey(0)

