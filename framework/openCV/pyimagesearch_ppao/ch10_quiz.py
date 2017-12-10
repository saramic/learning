import numpy as np
import argparse
import cv2

# assuming
# wget http://ppao.pyimagesearch.com/wp-content/uploads/2016/07/clonazepam_1mg.png

ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required = True, help = "Path to the image")
args = vars(ap.parse_args())

image = cv2.imread(args["image"])
image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
cv2.imshow("Original", image)

blurred = cv2.GaussianBlur(image, (5, 5), 0)
cv2.imshow("Blurred", blurred)

canny = cv2.Canny(image, 240, 250)
cv2.imshow("Canny (240, 250)", canny)
canny = cv2.Canny(image, 10, 200)
cv2.imshow("Canny (10, 200)", canny)
canny = cv2.Canny(image, 200, 250)
cv2.imshow("Canny (200, 250)", canny)
cv2.waitKey(0)
