# 🎨 Cartoonify Image Editor — Real-Time Image Cartoonification Using MATLAB

> A MATLAB-based Computer Vision project for converting real-world images into cartoon-styled artwork using edge detection, bilateral filtering, and color quantization.

---

## 🧠 Problem Statement

Many users often desire cartoon-style image transformations for artistic, social media, or fun purposes. This project presents a simple yet effective real-time image cartoonification system using MATLAB, enabling users to cartoonify images from their local storage or directly via webcam.

---

## 💡 Features

- 🖼️ Accepts input via **local image file** or **webcam**
- 🧹 Removes noise using **Median Filtering**
- ✨ Smoothens image using **Bilateral Filtering**
- 🖍️ Detects and boldens edges for a sketch-like effect
- 🌈 Performs **Color Quantization** to reduce color palette and create a cartoon effect
- 📷 Displays and allows saving:
  - Original Image
  - Edge-detected Image
  - Cartoonified Output

---

## ⚙️ Technologies Used

- **Language:** MATLAB
- **Concepts:** Computer Vision, Edge Detection, Bilateral Filtering, Color Quantization
- **Libraries:** Built-in MATLAB Image Processing Toolbox (no external dependencies)

---

## 📸 Output

The program displays a GUI with three images side-by-side:
1. **Original Image**
2. **Edge Detection Output**
3. **Final Cartoonified Image**

Users can save the final output from the GUI.

---

## 🧾 Algorithm Overview

1. **Input Image**: Load via local file or webcam
2. **Denoising**: Apply median filter to remove salt-and-pepper noise
3. **Smoothing**: Use bilateral filtering to preserve edges while smoothing regions
4. **Edge Detection**: Generate an edge mask to highlight contours
5. **Edge Overlay**: Combine smoothed image and edge mask
6. **Color Quantization**: Reduce the number of colors for a flat, cartoon-style look
7. **Display Output**: Show all three images and allow saving the cartoonified version

---

## ▶️ How to Run

1. Open the `.m` file in **MATLAB**
2. On **line 4**, enter the name of your image file (e.g., `'image.jpg'`)  
   > Ensure the image is in the same folder as the code.
3. Click **Run** from the **Editor** tab
4. A dialog box will appear:
   - Click **"Local Image"** to use a file from your computer
   - Click **"Webcam"** to capture a live image
5. The program will process and display the outputs
6. Save the result using `File → Save`

---

## 📚 Learning & Experience

This project served as a practical introduction to **Computer Vision** concepts and MATLAB programming. Key learnings include:
- Implementing advanced image filters
- Understanding edge-preserving algorithms
- Exploring color quantization as a clustering problem
- Building an interactive image-processing GUI

---
