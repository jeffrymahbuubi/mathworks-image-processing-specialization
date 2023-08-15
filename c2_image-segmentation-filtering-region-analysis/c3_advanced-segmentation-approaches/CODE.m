%% Practice Quiz: Advanced Segmentation
clc;close all;clear all;

% Question 2
RGB = imread('coloredChips.png');

BWDark = segmentChipsDark(RGB);
BWBright = segmentChipsBright(RGB);

% BW = ~(BWBright | BWDark);
BW = ~BWBright & ~BWDark;

montage({RGB, BW})

%% Practice Quiz: Advanced Segmentation Approaches
clc;close all;clear all;

% Question 3
RGB = imread('Puzzle_06.jpg');
HSV = rgb2hsv(RGB);

k = 4;

labels = imsegkmeans(im2single(HSV), k);

montage({HSV, label2rgb(labels)})