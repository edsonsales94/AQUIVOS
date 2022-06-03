# import cv2
# import mediapipe as mp
# import numpy as np


# # For webcam input:
# class VideoCamera(object):
    # def __init__(self):
    #     self.cap = cv2.VideoCapture(0)
    # def __del__(self):
    #     self.cap.release()
    # def get_frame(self):
        

import cv2
import numpy as np
import mediapipe as mp

mp_drawing = mp.solutions.drawing_utils
mp_drawing_styles = mp.solutions.drawing_styles
mp_hands = mp.solutions.hands

class VideoCamera(object):
    def get_frame(self):
        
        with mp_hands.Hands(
            model_complexity=0,
            min_detection_confidence=0.5,
            min_tracking_confidence=0.5) as hands:
            cap = cv2.VideoCapture(0)
            while cap.isOpened():
                ret, frame = cap.read()
                
                if not ret:
                    print("Ignoring empty camera frame.")
                # If loading a video, use 'break' instead of 'continue'.
                    continue

                # To improve performance, optionally mark the frame as not writeable to
                # pass by reference.
                frame.flags.writeable = False
                frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
                results = hands.process(frame)

                # Draw the hand annotations on the frame.
                frame.flags.writeable = True
                frame = cv2.cvtColor(frame, cv2.COLOR_RGB2BGR)
                if results.multi_hand_landmarks:
                    for hand_landmarks in results.multi_hand_landmarks:
                        mp_drawing.draw_landmarks(
                            frame,
                            hand_landmarks,
                            mp_hands.HAND_CONNECTIONS,
                            mp_drawing_styles.get_default_hand_landmarks_style(),
                            mp_drawing_styles.get_default_hand_connections_style())
                    # Flip the frame horizontally for a selfie-view display.
                    # frame_flip = cv2.imshow('MediaPipe Hands', cv2.flip(frame, 1))
                    cv2.imshow('MediaPipe Hands', cv2.flip(frame, 1))
                    if cv2.waitKey(5) & 0xFF == 27:
                        break
        cap.release()