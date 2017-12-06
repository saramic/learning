from __future__ import print_function
import argparse
import cv2

ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required = True, help = "Path to the image")
args = vars(ap.parse_args())

# NOTE: CHAPTER 3

# 3.2 load image
image = cv2.imread(args["image"])

# 3.2 info about image
print("width: {} pixels".format(image.shape[1])) # NOTE: height width order not width height
print("height: {} pixels".format(image.shape[0]))
print("channels: {} ".format(image.shape[2]))

# 3.3 show image
cv2.imshow("Image", image)
cv2.waitKey(0)

# 3.3 save image
cv2.imwrite("newimage.jpg", image)

