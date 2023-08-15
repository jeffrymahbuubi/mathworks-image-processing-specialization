function [BW,maskedImage] = segmentImage(X)
%segmentImage Segment image using auto-generated code from Image Segmenter app
%  [BW,MASKEDIMAGE] = segmentImage(X) segments image X using auto-generated
%  code from the Image Segmenter app. The final segmentation is returned in
%  BW, and a masked image is returned in MASKEDIMAGE.

% Auto-generated by imageSegmenter app on 15-Aug-2023
%----------------------------------------------------


% Adjust data to span data range.
X = imadjust(X);

% Threshold image with adaptive threshold
BW = imbinarize(im2gray(X), 'adaptive', 'Sensitivity', 0.500000, 'ForegroundPolarity', 'bright');

% Open mask with default
radius = 3;
decomposition = 8;
se = strel('disk', radius, decomposition);
BW = imopen(BW, se);

% Dilate mask with default
radius = 3;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imdilate(BW, se);

% Create masked image.
maskedImage = X;
maskedImage(~BW) = 0;
end
