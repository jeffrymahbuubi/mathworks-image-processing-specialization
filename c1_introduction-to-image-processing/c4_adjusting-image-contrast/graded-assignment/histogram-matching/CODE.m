%% Graded Assignment: Histogram Matching
clc; close all;clear all

% Write code that will:
% 1. Determine the reference threshold value from refImg.

% 2. Use this threshold to segment newImg without histogram matching. 
% Save the results as newImgBW. You do not need to invert your mask (the crack should be dark).

% 3. Match newImg's histogram to refImg's histogram. Then use the reference threshold to segment 
% the histogram-matched crack image. Save the results as matchImgBW. You do not need to invert your mask (the crack should be dark).

% Read in cracks and convert to grayscale
refImg = im2gray(imread("00004.jpg"));
newImg = im2gray(imread("00143.jpg"));

% 1. Determine the reference threshold value from refImg
refThresh = graythresh(refImg);

% 2. Segment the newImg using the reference threshold
newImgBW = im2double(newImg) > refThresh;

% Match newImg's histogram to refImg's histogram
matchedImg = imhistmatch(newImg, refImg);

% Use the reference threshold to segment the histogram-matched crack image
matchImgBW = im2double(matchedImg) > refThresh;

% Display Crack 00143 and both segmentations
montage({newImg, newImgBW, matchImgBW})