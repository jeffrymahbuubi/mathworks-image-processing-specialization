%% Question 3 

clc;close all;clear all;

puzzlebad = imread("PuzzleBadLighting.jpg");
puzzlebad(604,411,:)

%% Question 4

clc;close all;clear all;

puzzlebad = imread("PuzzleBadLighting.jpg");
imtool(puzzlebad)

%% Question 1 - Working with Image Data

x = [229 51 222; 21 33 15; 179 41 219];
y = [167 162 17; 202 29 38; 47 51 31];

result = uint8(x - y);

%% Question 2 - Working with Image Data

result_double = double(x - y);

%% Question 3 - Working with Image Data

crack_img = imread('crack_img.jpg');

% imresize(A,[numrows numcols])
imshow(imresize(crack_img, [114 681]))

%% Graded Assignment - Adjusting a Dark and Rotated Image

clc;close all;clear all;

% Read the image
img = imread("boston night.JPG");

% Convert to grayscale
img_gray = im2double(rgb2gray(img));

% Gamma Correction 
gamma = 0.5;
img_gamma_corrected = img_gray .^ (gamma);

% Rotate the image 1 degree clockwise
img_rotated = imrotate(img_gamma_corrected, -1, 'crop');

% Convert and store the final image as uint8
imgAdjusted = uint8(img_rotated * 255);

% Display the image
% montage({img, imgAdjusted});
imtool(imgAdjusted);

imgDifference = abs(img_gray - img_rotated);
imshow(imgDifference);
colorbar;


%% Question 2 Practice Quiz - Working with Image Data
imtool(imread('q2-2.jpg'))

%% Question 5 Practice Quiz - Working with Image Data

half_moon_metadata = imfinfo("half moon.JPG");
half_moon_metadata.DigitalCamera

