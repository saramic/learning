from __future__ import print_function
import argparse
import cv2

ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required = True, help = "Path to the image")
args = vars(ap.parse_args())

image = cv2.imread(args["image"])

# NOTE: CHPAPTER 4

# 4.2 getting pixels
(b, g, r) = image[0, 0] # NOTE: BGR not RGB
print("Pixel at (0, 0) - Red: {}, Green: {}, Blue: {}".format(r, g, b))

# 4.2 setting pixels
image[0, 0] = (0, 0, 255) # red
(b, g, r) = image[0, 0] # NOTE: BGR not RGB
print("Pixel at (0, 0) - Red: {}, Green: {}, Blue: {}".format(r, g, b))

# 4.3 getting a section
corner = image[0:100, 0:100]
cv2.imshow("Corner", corner)

# 4.3 setting a section to green
image[0:100, 0:100] = (0, 255, 0) # green
cv2.imshow("Updated", image)
cv2.waitKey(0)


