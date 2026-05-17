%% ============================================================
%  MATLAB Image Processing Basics
%  Project: Fundamental Image Processing Operations
%  Author:  [Your Name]
%  Date:    2025
%% ============================================================

clc; clear; close all;

fprintf('==============================================\n');
fprintf('   MATLAB Image Processing Basics Project    \n');
fprintf('==============================================\n\n');

%% ---- 1. Create a synthetic test image (no file needed) ----
fprintf('[1] Generating synthetic test image...\n');
[X, Y] = meshgrid(1:256, 1:256);
R = uint8(mod(X + Y, 256));
G = uint8(mod(X * 2, 256));
B = uint8(mod(Y * 2, 256));
img_rgb = cat(3, R, G, B);

%% ---- 2. Convert to Grayscale ----
fprintf('[2] Converting to grayscale...\n');
img_gray = rgb2gray(img_rgb);

%% ---- 3. Histogram Equalization ----
fprintf('[3] Applying histogram equalization...\n');
img_eq = histeq(img_gray);

%% ---- 4. Gaussian Blurring ----
fprintf('[4] Applying Gaussian blur (sigma=2)...\n');
h_gauss = fspecial('gaussian', [15 15], 2);
img_blur = imfilter(img_gray, h_gauss, 'replicate');

%% ---- 5. Edge Detection (Canny) ----
fprintf('[5] Detecting edges using Canny method...\n');
img_edges = edge(img_gray, 'Canny');

%% ---- 6. Sharpening ----
fprintf('[6] Sharpening image using unsharp masking...\n');
h_sharp = fspecial('unsharp', 0.5);
img_sharp = imfilter(img_gray, h_sharp, 'replicate');
img_sharp = uint8(min(max(double(img_sharp), 0), 255));

%% ---- 7. Thresholding (Binary) ----
fprintf('[7] Applying binary threshold (Otsu method)...\n');
thresh = graythresh(img_gray);
img_binary = imbinarize(img_gray, thresh);
fprintf('    Otsu threshold level: %.4f\n', thresh);

%% ---- 8. Noise Addition & Median Filtering ----
fprintf('[8] Adding salt-and-pepper noise and denoising...\n');
img_noisy = imnoise(img_gray, 'salt & pepper', 0.05);
img_denoised = medfilt2(img_noisy, [3 3]);

%% ---- 9. Morphological Operations ----
fprintf('[9] Applying morphological dilation and erosion...\n');
se = strel('disk', 5);
img_dilated = imdilate(img_binary, se);
img_eroded  = imerode(img_binary, se);

%% ---- 10. Display Results ----
fprintf('[10] Displaying all results...\n\n');

figure('Name', 'Image Processing - Basic Operations', ...
       'NumberTitle', 'off', 'Position', [50 50 1400 900]);

subplot(3,4,1);  imshow(img_rgb);        title('Original (RGB)');
subplot(3,4,2);  imshow(img_gray);       title('Grayscale');
subplot(3,4,3);  imshow(img_eq);         title('Histogram Equalized');
subplot(3,4,4);  imshow(img_blur);       title('Gaussian Blurred');
subplot(3,4,5);  imshow(img_edges);      title('Edge Detection (Canny)');
subplot(3,4,6);  imshow(img_sharp);      title('Sharpened');
subplot(3,4,7);  imshow(img_binary);     title('Binary Threshold (Otsu)');
subplot(3,4,8);  imshow(img_noisy);      title('Salt & Pepper Noise');
subplot(3,4,9);  imshow(img_denoised);   title('Median Filtered');
subplot(3,4,10); imshow(img_dilated);    title('Morphological Dilation');
subplot(3,4,11); imshow(img_eroded);     title('Morphological Erosion');

%% ---- 11. Histogram Plot ----
subplot(3,4,12);
histogram(double(img_gray(:)), 256, 'FaceColor', [0.2 0.5 0.8], 'EdgeColor', 'none');
title('Pixel Intensity Histogram');
xlabel('Pixel Value'); ylabel('Count');

sgtitle('MATLAB Image Processing Basics — Comprehensive Demo', 'FontSize', 14, 'FontWeight', 'bold');

fprintf('Done! All operations completed successfully.\n');
fprintf('==============================================\n');
