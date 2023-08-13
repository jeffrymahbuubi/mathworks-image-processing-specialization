%% Practice Quiz: Thresholding Images
% Question 2
clc;clear all; close all;

% Read the image
coin_img = im2gray(imread('pq-coin.jpg'));

% Compute the threshold using Otsu's method
threshold_normalized = graythresh(coin_img);

% Convert the normalized threshold to an integer between 0 and 255
threshold_int = round(threshold_normalized * 255);

disp(['Otsu''s threshold: ', num2str(threshold_int)]);

% Question 3

% Segment the image using the threshold
binary_image = coin_img > threshold_int;

% Count the number of true = 1, pixels
num_true_pixels = sum(binary_image(:));

disp(['Number of true pixels: ', num2str(num_true_pixels)])

% Question 4

[~, effectivenessMetric] = graythresh(coin_img);

% Question 5

BW = imbinarize(coin_img, "adaptive", ...
    "ForegroundPolarity","dark", ...
    "Sensitivity",effectivenessMetric);

montage({coin_img, BW})

% Question 7

flood_img = imread('stlouis_l5tm_19aug93_30m.jpg');
imshow(flood_img);