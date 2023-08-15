%% Graded Assignment: Segment an Image into Multiple Labels
clc;close all;clear all;

% 1. Create a binary mask where the puzzle pieces are foreground and the rest of the image is background. 
% Store this mask in the variable BW.

% 2. Segment the image by creating a labeled matrix with three groups, one for the background and 
% one for each color. Store the result in the variable labels. labels should only contain the values 
% 1, 2, and 3.

img = imread('Puzzle_06.jpg');

% Convert the image to gray to easily segment image
gray_img = im2gray(img);

[BW, maskedImage] = segmentImage(gray_img);

img(repmat(~BW,1,1,3))=0;

k = 3;
labels = imsegkmeans(img,k);
montage({img, label2rgb(labels)});



