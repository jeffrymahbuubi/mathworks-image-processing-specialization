%% Practice Quiz: Module 1 Quiz

A = ones(16);
B = zeros(16);
C = [A, B; B, A];
C = [C, C; C, C];
img = [C, C; C, C];

%% Question 1
clc;close all; clear all

fAverage = fspecial('average',3);
avgImg = imfilter(img, fAverage);
% montage({img, avgImg})

%% Question 2
clc;close all; clear all

[imgCanny, thershOut] = edge(img, 'canny');
% montage({img, imgCanny})

%% Question 3
clc;close all; clear all

image = imread('coins.png');
gray_image = im2gray(image);

% Get vertical and horizontal gradients
[Gx, Gy] = imgradientxy(gray_image, 'Sobel');

% Display the gradients
figure;
subplot(1, 2, 1);
imshow(Gx, []);
title('Horizontal Gradient (Gx)');

subplot(1, 2, 2);
imshow(Gy, []);
title('Vertical Gradient (Gy)');
%% Question 4
clc; close all; clear all

% 1. Load the image
image = imread('coins.jpg');

% 2. Resize the image
resized_image = imresize(image, [600 800]);

% 3. Apply a Gaussian filter
filtered_image = imgaussfilt(resized_image, 0.5);

% 4. Detect edges using the Canny method
edges_image = edge(im2gray(filtered_image), 'canny');

% Display the edge-detected image
figure;
imshow(edges_image);
title('Edges detected using the Canny method');

%% Question 5

clc; close all; clear all

image = imread('coins3.jpg');

% 2. Rescale the image
rescaled_image = imresize(image, [600 800]);

% 3. Apply Gaussian blur
blurred_image = imgaussfilt(rescaled_image, 1);

% Convert to grayscale for circle detection
gray_image = im2gray(blurred_image);

% 4. Use imfindcircles to detect circles
% Start with a tentative range for Rmin and Rmax. You may need to adjust these.
[Rmin, Rmax] = deal(20, 100); % Example starting values; adjust based on results
[centers, radii] = imfindcircles(gray_image, [Rmin Rmax], 'ObjectPolarity', 'bright', 'Sensitivity', 0.95, 'EdgeThreshold', 0.05);

% To find only the four largest coins
[sortedRadii, sortedIdx] = sort(radii, 'descend');
selectedRadii = sortedRadii(1:4);
selectedCenters = centers(sortedIdx(1:4), :);

% 5. Display the detected circles
figure;
imshow(rescaled_image);
viscircles(selectedCenters, selectedRadii, 'EdgeColor', 'r');

%% Question 6

clc; close all; clear all

image = imread('coins2.jpg');

% 2. Rescale the image
rescaled_image = imresize(image, [900 1200]);
% imtool(rescaled_image)

% 3. Apply Gaussian Blur
blurred_image = imgaussfilt(rescaled_image, 1);

% Convert to grayscale for circle detection
gray_image = im2gray(blurred_image);

% 4. Use imfindcircles to detect circles
[Rmin, Rmax] = deal(80, 100);
[centers, radii] = imfindcircles(gray_image, [Rmin, Rmax], 'ObjectPolarity', 'bright', 'Sensitivity', 0.95, 'EdgeThreshold', 0.05);

% Sort radii in ascending order
[sortedRadii, sortedIdx] = sort(radii, 'ascend');

% Find the last index of a radius below 100
lastIndex = find(sortedRadii < 100, 1, 'last');

% Extract all radii and centers below 100
selectedRadii = sortedRadii(1:lastIndex);
selectedCenters = centers(sortedIdx(1:lastIndex), :);

% Count the number of coins with a radius less than 100
num_coins = numel(selectedRadii);
fprintf('Number of coins with a radius less than 100: %d\n', num_coins);

% 5. Display the detected circles
figure;
imshow(rescaled_image);
viscircles(selectedCenters, selectedRadii, 'EdgeColor', 'r');