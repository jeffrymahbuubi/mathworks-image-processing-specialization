function inverted_img = SegmentAndInvert(input_img)
    % Ensure the image is grayscale
    if size(input_img, 3) == 3
        gray_img = rgb2gray(input_img);
    else
        gray_img = input_img;
    end

    % Binarize the image using default settings
    binary_img = imbinarize(gray_img);

    % Invert the binary image
    inverted_img = ~binary_img;
end