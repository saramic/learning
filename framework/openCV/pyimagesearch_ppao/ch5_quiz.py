import numpy as np
import cv2

canvas = np.zeros((300, 300, 3), dtype = "uint8")

green = (0, 255, 0)
red = (0, 0, 255)

for (col, x) in enumerate(range(1, canvas.shape[0], 10)):
    for (row, y) in enumerate(range(1, canvas.shape[1], 20)):
        offset = 0
        if col % 2 == 0:
            offset = 10
        cv2.rectangle(canvas, (x, y+offset), (x+9, y+offset+9), red, -1)

(centerX, centerY) = (canvas.shape[1] // 2, canvas.shape[0] // 2)
cv2.circle(canvas, (centerX, centerY), 50, green, -1)
cv2.imshow("Canvas", canvas)
cv2.waitKey(0)

