# 🖼️ MATLAB Image Processing Basics

A comprehensive MATLAB project demonstrating fundamental image processing techniques — from grayscale conversion and histogram equalization to edge detection, morphological operations, and filter comparisons.

---

## 📁 Project Structure

```
matlab-image-processing/
├── main_image_processing.m    # Main script — runs all operations
├── filter_comparison_demo.m   # Compares multiple filters with PSNR
├── image_utils.m              # Reusable utility functions
└── README.md
```

---

## 🚀 How to Run

1. Open **MATLAB** (R2018b or later recommended)
2. Set the project folder as your working directory
3. Run the main script:
```matlab
main_image_processing
```
4. Optionally run the filter demo:
```matlab
filter_comparison_demo
```

> **No external images required** — all scripts generate synthetic test images internally.

---

## 🔬 Features Covered

| Operation | Script |
|---|---|
| RGB → Grayscale conversion | `main_image_processing.m` |
| Histogram equalization | `main_image_processing.m` |
| Gaussian blurring | `main_image_processing.m` |
| Canny edge detection | `main_image_processing.m` |
| Image sharpening | `main_image_processing.m` |
| Otsu thresholding (binarization) | `main_image_processing.m` |
| Salt & pepper noise + median filter | `main_image_processing.m` |
| Morphological dilation & erosion | `main_image_processing.m` |
| Pixel intensity histogram | `main_image_processing.m` |
| Filter comparison with PSNR | `filter_comparison_demo.m` |
| Custom kernel application | `image_utils.m` |
| Image statistics (mean, std, entropy) | `image_utils.m` |

---

## 🛠️ Requirements

- MATLAB R2018b or newer
- **Image Processing Toolbox** (required)

---

## 👤 Author

- **Name:** [Your Name]  
- **GitHub:** [Your GitHub Profile URL]  
- **Freelancer:** [Your Freelancer Profile URL]

---

## 📄 License

This project is for educational purposes.
