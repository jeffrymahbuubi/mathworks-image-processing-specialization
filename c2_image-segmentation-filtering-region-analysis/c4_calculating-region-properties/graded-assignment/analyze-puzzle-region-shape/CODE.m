%% Graded Assignment: Analyze Puzzle Region Shape
clc;close all;clear all;

% 1. Create a mask which will segment only the regions consisting of 3 joined puzzle pieces 
% (use region filtering to modify the mask created by the provided function). 
% Assign your answer to the variable name threePieceMask.

% 2. Calculate the Area and Eccentricity of each region in threepieceMask. Provide the results 
% in a table variable threePieceProperties.

% 3. Filter the threePiece Mask to include only the regions with three pieces connected in a straight 
% line. Assign the result to threePieceLinearMask. Hint: You can use thresholds for Eccentricity with 
% the bwpropfilt function to isolate the straight-line connected regions in threePieceMask.

% 4. Find the coordinates of a bounding box for each of the regions in threepieceLinearMask. 
% Provide the results in a table variable threePieceLinearBoxes. Hint: Use the regionprops function 
% on threepieceLinearMask with the syntax shown in this example, and the BoundingBox property.

% 5. To apply the bounding boxes to the original image and see the results, uncomment the provided
% template code.

puzzleImage = imread("Puzzle_34.jpg");

% 1. Create a mask consisting only 3 joined puzzle pieces
puzzleMask = segmentPuzzle34(puzzleImage);

% 2. Calculate the Area and Eccentricity of each region
[threePieceMask,threePieceProperties] = filter3PieceRegions(puzzleMask);

% 3. Filter the threePieceMask
threePieceLinearMask = bwpropfilt(threePieceMask, "Eccentricity", [0.8,0.9]);

% 4. Find the coordinates of a bounding box of each regions
threePieceLinearBoxes = regionprops("table",threePieceLinearMask,"BoundingBox");

puzzleImageBoxed = insertShape(puzzleImage,"Rectangle",threePieceLinearBoxes.BoundingBox,"color","red","LineWidth",5); 
figure, imshow(puzzleImageBoxed);

