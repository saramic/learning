import numpy as np
import cv2

canvas = np.zeros((300, 300, 3), dtype = "uint8")

green = (0, 255, 0)
red = (0, 0, 255)

offset = 10
for i in range(1, canvas.shape[0], 10):
    if offset == 10:
        offset = 0
    else:
        offset = 10
    for j in range(1, canvas.shape[1], 20):
        cv2.rectangle(canvas, (i, j+offset), (i+9, j+offset+9), red, -1)

(centerX, centerY) = (canvas.shape[1] // 2, canvas.shape[0] // 2)
cv2.circle(canvas, (centerX, centerY), 50, green, -1)
cv2.imshow("Canvas", canvas)
cv2.waitKey(0)

