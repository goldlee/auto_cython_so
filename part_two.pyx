import cv2

def to_gray(img):
    if img is None:
        print('img is None')
        return
    return cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
