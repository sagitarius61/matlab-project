%% ============================================================
%  filter_comparison_demo.m
%  Compares multiple image filters on a noisy image.
%  Project: MATLAB Image Processing Basics
%% ============================================================

clc; clear; close all;

fprintf('Filter Comparison Demo\n');
fprintf('----------------------\n');

%% Create synthetic grayscale image
[X, Y] = meshgrid(linspace(0, 4*pi, 256), linspace(0, 4*pi, 256));
base = uint8(127 + 120 * sin(X) .* cos(Y));

%% Add Gaussian noise
noisy = imnoise(base, 'gaussian', 0, 0.01);

%% Define filters
filters = {
    fspecial('average', [5 5]),       'Average (5x5)';
    fspecial('gaussian', [5 5], 1.5), 'Gaussian (5x5, σ=1.5)';
    fspecial('laplacian', 0.2),       'Laplacian';
    fspecial('sobel'),                'Sobel (Horizontal)';
};

%% Apply and display
figure('Name', 'Filter Comparison', 'NumberTitle', 'off', ...
       'Position', [100 100 1200 700]);

subplot(2,4,1); imshow(base);  title('Original');
subplot(2,4,2); imshow(noisy); title('Noisy (Gaussian)');

% Median filter (special case)
img_median = medfilt2(noisy, [5 5]);
subplot(2,4,3); imshow(img_median); title('Median (5x5)');

% Wiener filter
img_wiener = wiener2(noisy, [5 5]);
subplot(2,4,4); imshow(uint8(img_wiener)); title('Wiener');

for k = 1:4
    filtered = imfilter(noisy, filters{k,1}, 'replicate');
    filtered = uint8(min(max(double(filtered), 0), 255));
    subplot(2, 4, 4 + k);
    imshow(filtered);
    title(filters{k,2});
end

sgtitle('Filter Comparison on Noisy Image', 'FontSize', 13, 'FontWeight', 'bold');

%% PSNR comparison
fprintf('\nPSNR Comparison (vs Original):\n');
labels = {'Noisy', 'Median', 'Wiener'};
imgs   = {noisy, img_median, uint8(img_wiener)};
for i = 1:3
    mse  = mean((double(base(:)) - double(imgs{i}(:))).^2);
    psnr_val = 10 * log10(255^2 / mse);
    fprintf('  %-12s: %.2f dB\n', labels{i}, psnr_val);
end

fprintf('\nFilter comparison complete.\n');
