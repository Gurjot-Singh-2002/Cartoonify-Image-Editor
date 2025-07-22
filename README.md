# Cartoonify Image Editor (MATLAB Project)

This is a simple MATLAB project that takes an image and converts it into a cartoon-like version using computer vision techniques. It can take images from your computer or directly through a webcam.

---

## Project Overview

The goal of this project is to create a cartoon version of an image. The program performs noise removal, edge detection, color simplification, and finally combines these effects to create a cartoonified image.

---

## Features

- Input image from local files or webcam
- Noise removal using a median filter
- Edge-preserving smoothing using bilateral filter
- Edge detection to highlight boundaries
- Color quantization to simplify colors
- Display of original, edge, and cartoonified images side by side
- Option to save the final output

---

## How It Works (Algorithm Steps)

1. Input image (from file or webcam)
2. Apply median filter to remove salt-and-pepper noise
3. Apply bilateral filter to smooth the image while keeping edges sharp
4. Perform edge detection to create a mask
5. Overlay the edges on the smoothed image
6. Quantize colors to reduce the number of shades
7. Show the original image, edge-detected image, and cartoon image side by side

---

## How to Run the Code

1. Open the project folder in MATLAB.
2. Open the main `.m` file (e.g., `cartoonify_image.m`)
3. On **line 4**, change the file name to your input image (e.g., `'image.jpg'`)
4. Make sure the image is in the same folder as the code.
5. Click the **Run** button.
6. Choose input method:
   - Click **"Local Image"** to select a file
   - Click **"Webcam"** to take a photo
7. The output images will be displayed in a new window.
8. You can save the result from `File → Save`.

---

## Files in the Project

- `cartoonify_image.m`: Main MATLAB code
- `README.md`: Project description

---

## Requirements

- MATLAB (no external libraries required)
- Webcam (optional, for webcam input)

---

