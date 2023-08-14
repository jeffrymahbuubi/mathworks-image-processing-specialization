%% Graded Assignment: Edge Detection: Separating Overlapping Objects

clc;close all;clear all

% 1. Converts the image to grayscale

% 2. Detects the edges of the grayscale image using the sobel method and saves 
% the result as imgEdges. Specify your input options to skip the edge-thinning step to make your later 
% segmentation more effective.

% 3. Segments the grayscale image and saves the result as BW. 
% Your mask should have the shapes in the foreground with a dark background

% 4. Uses logical indexing or to remove the edges from the BW segmentation 
% and saves the result as newBW. 

% Read in the image
img = imread("DetectingEdgesSlide.png");

% 1. Convert from RGB to Grayscale
imgGray = rgb2gray(img);

% 2. Detects the edges
[imgEdges, thresh] = edge(imgGray, 'sobel', 'nothinning');

% 3. Segment the grayscale images
level = graythresh(imgGray);  % Otsu's method
BW = imbinarize(imgGray, level + 0.1);

% To make sure that the shapes are in the foreground with a dark background, invert if necessary
if sum(BW(:)) > numel(BW)/2
    BW = ~BW;
end

% 4. Remove edges from BW segmentation using logical indexing
% Logical indexing is utilized to subtract the edges from the binary segmented image.
newBW = BW & ~imgEdges;

% Uncomment below to Display
imshow(imerode(newBW,strel("disk",3)))