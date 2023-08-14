%% Graded Assignment: Use a Median Filter to Reduce Noise

clc;close all;clear all;

img = imread('coinsNoisy.jpg');

% Insert code here to filter and display the image
imgMed= medfilt2(img, [3 3]);

% Use Average Filter
avgFilter = fspecial('average',3);
imgAvg = imfilter(img, avgFilter);

% Segmenting using imadjust for median filter image
imgSmoothAdj = imadjust(imgMed);
bwSmoothAdj = imbinarize(imgSmoothAdj);

% Segmenting using imadjust for average filter image
imgSmootAdjAvg = imadjust(imgAvg);
bwSmootAdjAvg = imbinarize(imgSmootAdjAvg);

% Uncomment the line below to display the results
montage({img,imgMed, bwSmoothAdj, bwSmootAdjAvg}) 