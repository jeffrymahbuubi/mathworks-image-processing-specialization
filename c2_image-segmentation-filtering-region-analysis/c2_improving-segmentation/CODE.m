%% Practice Quiz: Using the Image Segmenter App Quiz

%% Question 1
clc;close all;clear all;

textImage = imread("printedtext.png");
[BW, mask] = segmentImageQ1(textImage);

imshow(BW)

%% Question 2
clc;close all;clear all;

crackImage = imread("00162.jpg");
crackImage = im2gray(crackImage); 
[BW, mask]= segmentImageQ2(crackImage);

imshow(BW)

%% Question 3
clc;close all;clear all;

coinImage = imread("coins.png");
[BW, mask] = segmentImageQ3(coinImage);

% 3. Apply Gaussian blur
blurred_image = imgaussfilt(coinImage, 0.5);

% Convert to grayscale for circle detection
gray_image = im2gray(blurred_image);

% 4. Use imfindcircles to detect circles
% Start with a tentative range for Rmin and Rmax. You may need to adjust these.
[Rmin, Rmax] = deal(15, 75); % Example starting values; adjust based on results
[centers, radii] = imfindcircles(gray_image, [Rmin Rmax], 'ObjectPolarity', 'bright', 'Sensitivity', 0.85);

% Display the original image with detected circles
figure;
imshow(coinImage);
hold on;
viscircles(centers, radii);
hold off;

%% Question 4
clc;close all;clear all;

coinImage = imread("coins.png");

[BW, mask] = segmentImageQ4(coinImage);

imshow(BW)

