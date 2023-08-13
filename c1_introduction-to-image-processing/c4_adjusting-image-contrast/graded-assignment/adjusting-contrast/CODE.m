%% Graded Assignment: Adjusting Contrast
clc; close all; clear all;

% Load the image
foosball_img = imread('foosball.jpg');

% Show the Original Histogram
imhist(foosball_img)

% Convert the image to double if it's uint8
if isa(foosball_img, 'uint8')
    foosball_img = im2double(foosball_img);
end

% Ensure it's grayscale (if it's not already)
if size(foosball_img, 3) == 3
    foosball_img = rgb2gray(foosball_img);
end

% Adjust the histogram to use the full range of available pixels, 
% and save the result to the variable imgAdj. 
imgAdj = imadjust(foosball_img);
figure
imhist(imgAdj)
imshow(imgAdj)

% Apply histogram equalization to the original image (img),
% and save the result to the variable imgEq.
imgEq = histeq(foosball_img);
figure
imhist(imgEq)
imshow(imgEq)