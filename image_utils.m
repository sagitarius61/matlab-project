%% ============================================================
%  image_utils.m  — Utility Functions for Image Processing
%  Project: MATLAB Image Processing Basics
%% ============================================================

function result = compute_psnr(original, noisy)
%COMPUTE_PSNR  Compute Peak Signal-to-Noise Ratio (PSNR) in dB.
%   PSNR = compute_psnr(ORIGINAL, NOISY)
%   Both inputs must be uint8 arrays of the same size.

    mse = mean((double(original(:)) - double(noisy(:))).^2);
    if mse == 0
        result = Inf;
    else
        result = 10 * log10(255^2 / mse);
    end
end


function result = apply_kernel(img, kernel)
%APPLY_KERNEL  Apply a custom convolution kernel to a grayscale image.
%   RESULT = apply_kernel(IMG, KERNEL)

    result = imfilter(img, kernel, 'replicate');
    result = uint8(min(max(double(result), 0), 255));
end


function stats = image_statistics(img)
%IMAGE_STATISTICS  Compute basic statistics of an image.
%   STATS = image_statistics(IMG)
%   Returns a struct with: mean, std, min, max, entropy.

    data = double(img(:));
    stats.mean    = mean(data);
    stats.std     = std(data);
    stats.min     = min(data);
    stats.max     = max(data);
    stats.entropy = entropy(img);
end


function img_out = normalize_image(img)
%NORMALIZE_IMAGE  Normalize image pixel values to [0, 255].
%   IMG_OUT = normalize_image(IMG)

    d = double(img);
    d = (d - min(d(:))) / (max(d(:)) - min(d(:)) + eps) * 255;
    img_out = uint8(d);
end


function display_comparison(img1, label1, img2, label2, title_str)
%DISPLAY_COMPARISON  Side-by-side display of two images.
%   display_comparison(IMG1, LABEL1, IMG2, LABEL2, TITLE_STR)

    figure('Name', title_str, 'NumberTitle', 'off');
    subplot(1,2,1); imshow(img1); title(label1);
    subplot(1,2,2); imshow(img2); title(label2);
    sgtitle(title_str, 'FontWeight', 'bold');
end
