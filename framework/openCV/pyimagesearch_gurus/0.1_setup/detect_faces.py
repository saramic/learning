import argparse
import cv2

# run like so
#   python3 detect_faces.py -i orientation_example.jpg  -d haarcascade_frontalface_default.xml

ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required = True, help = "Path to the image")
ap.add_argument("-d", "--detector", required = True, help = "Name of detector\n/usr/local/Cellar/opencv/3.3.1_1/share/OpenCV/haarcascades/*.xml")
args = vars(ap.parse_args())

image = cv2.imread(args["image"])
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

#detector = cv2.CascadeClassifier("haarcascade_frontalface_default.xml")
detector = cv2.CascadeClassifier("/usr/local/Cellar/opencv/3.3.1_1/share/OpenCV/haarcascades/" + args["detector"])

rects = detector.detectMultiScale(
        gray,
        scaleFactor = 1.05,
        minNeighbors = 7,
        minSize = (30, 30),
        flags = cv2.CASCADE_SCALE_IMAGE)

for (x, y, w, h) in rects:
    cv2.rectangle(
            image,
            (x, y),
            (x + w, y + h),
            (0, 255, 0),
            2)

cv2.imshow("Faces", image)
cv2.waitKey(0)

