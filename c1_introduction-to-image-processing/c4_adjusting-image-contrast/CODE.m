%% Practice Quiz: Image Contrast and Histogram Concept Check
clc;close all;clear all;
% Question 2

question2_img = imread('question2.jpg');
figure
imhist(question2_img)

% Question 3
question3_img = imread('question3.png');
figure
imshow(question3_img)

% Convert the image to double if it's uint8
if isa(question3_img, 'uint8')
    question3_img = im2double(question3_img);
end

% Define the thresholds
thresholds = [98/255, 127/255, 32/255, 165/255];
threshold_names = {'0.3842', '0.5000', '0.1255', '0.6471'};

% Apply the thresholds and display each thresholded image separately
for i = 1:length(thresholds)
    binary_image = question3_img > thresholds(i);
    
    figure; % Open a new figure window
    imshow(binary_image);
    title(['Threshold = ', threshold_names{i}]); % Display the threshold value in the title
end

%% Practice Quiz: Image Adjustment and Enhancement Concept Check
clc;close all;clear all;

% Question 1
coin_img = imread('coin.png');
baby_img = imread('baby.jpg')

% Ensure it's grayscale (if it's not already)
if size(coin_img, 3) == 3
    coin_img = rgb2gray(coin_img);
end

if size(baby_img, 3) == 3
    baby_img = rgb2gray(baby_img);
end

% Define adjustment methods and their names
images = {coin_img, baby_img};
methods = {@imadjust, @histeq, @adapthisteq, @imlocalbrighten};
method_names = {'Histogram Stretching', 'Histogram Equalization', 'Adaptive Histogram Equalization', 'Local Brightness Enhancement'};

% Loop through each adjustment method
for j = 1:length(images)
    current_img = images{j};
    
    for i = 1:length(methods)
        adjusted_img = methods{i}(current_img);

        % Display the adjusted image
        figure;
        subplot(2, 1, 1);
        imshow(adjusted_img);
        title(method_names{i});
    
        % Plot the histogram of the adjusted image
        subplot(2, 1, 2);
        imhist(adjusted_img);
        title(['Histogram of ', method_names{i}]);
        ylim([0 1200])
    end
end

%% Question 1
% Practice Quiz: Adjusting Contrast
clc;close all;clear all;

% Read the image
crack_img = imread('00035.jpg');

% Convert theimage to gray image
if size(crack_img, 3) == 3
    crack_img = rgb2gray(crack_img);
end

% Binarize using imbinarize with default settings
crack_img_BW = imbinarize(crack_img);

% Invert the image
inverted_img = ~crack_img_BW;

% Calculate the number of pixels in the crack using nnz
num_pixels_crack = nnz(inverted_img);
% num_pixels_crack = sum(inverted_img(:));

%% Question 2
clc;close all;clear all;
crack_img_adjust = imadjust(crack_img);
num_pixels_crack_adjust = nnz(SegmentAndInvert(crack_img_adjust));

%% Question 3
clc;close all;clear all;
crack_img_equalize = histeq(crack_img);
num_pixels_crack_equalize = nnz(SegmentAndInvert(crack_img_equalize));

%% Question 4
clc;close all;clear all;
crack_img_adaptive = adapthisteq(crack_img);
num_pixels_crack_adapt = nnz(SegmentAndInvert(crack_img_adaptive));

montage({inverted_img, ...
    SegmentAndInvert(crack_img_adjust), ...
    SegmentAndInvert(crack_img_equalize), ...
    SegmentAndInvert(crack_img_adaptive)})

%% Question 6
clc;close all;clear all;
car_img = imread('car_3.jpg');
car_img_brighten = imlocalbrighten(car_img);
% montage({car_img, car_img_brighten})

% Convert both images to grayscale
car_gray = rgb2gray(car_img);
car_brighten_gray = rgb2gray(car_img_brighten);

% Calculate average luminance for both images
avg_luminance_original = mean(car_gray(:));
avg_luminance_brightened = mean(car_brighten_gray(:));

% Calculate the difference in average luminance
luminance_difference = avg_luminance_brightened - avg_luminance_original;

fprintf('The difference in average luminance is: %f\n', luminance_difference);
montage({car_gray, car_brighten_gray})

%% Question 7
clc;close all;clear all;
car_img_2 = imread('car_2.jpg');

% Step 2: Convert the image to the HSV color space
car_hsv = rgb2hsv(car_img_2);

% Step 3: Perform histogram equalization on the V channel
car_hsv(:,:,3) = histeq(car_hsv(:,:,3));

% Step 4: Convert the modified HSV image back to RGB
car_img_2_equalized = hsv2rgb(car_hsv);

% Step 5: Convert the data type back to uint8
car_img_equalized = im2uint8(car_img_2_equalized);

% Step 6: Calculate the difference between the average luminance
% Convert original and equalized images to grayscale
car_gray = rgb2gray(car_img_2);
car_equalized_gray = rgb2gray(car_img_2_equalized);

% Calculate average luminance for both images
avg_luminance_original = mean(car_gray(:));
avg_luminance_equalized = mean(car_equalized_gray(:));

% Calculate the difference in average luminance
luminance_difference = avg_luminance_equalized - avg_luminance_original;

fprintf('The difference in average luminance is: %f\n', luminance_difference);

%% Question 8
clc; close all; clear all

snow_img = imread('mountain2.jpg');
snow_img_haze = imreducehaze(snow_img);

% Convert both images to grayscale
snow_gray = rgb2gray(snow_img);
snow_haze_gray = rgb2gray(snow_img_haze);

% Calculate average luminance for both images
avg_luminance_original = mean(snow_gray(:));
avg_luminance_haze = mean(snow_haze_gray(:));

% Calculate the difference in average luminance
luminance_difference = avg_luminance_original - avg_luminance_haze;

fprintf('The difference in average luminance is: %f\n', luminance_difference);

%% Question 9

clc;close all; clear all

pick_img = imread('picks.jpg');
pick_img_bright = imlocalbrighten(pick_img);
montage({pick_img, SegmentAndInvert(pick_img_bright)})