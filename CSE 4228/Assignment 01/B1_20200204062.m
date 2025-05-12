% Read the two input images
img1 = imread('Image_1.jpg'); % Replace with your first image file name
img2 = imread('Image_2.jpg'); % Replace with your second image file name

% Resize both images to the same size
img1 = imresize(img1, [300, 300]); % Resize to 300x300 pixels (or any size)
img2 = imresize(img2, [300, 300]);

% Create a blank image of the same size
[rows, cols, ~] = size(img1);
blank_img = zeros(rows, cols, 3, 'uint8');

% Divide the image into 6 equal rows
row_height = floor(rows / 6);

% Loop through each row and replace alternately
for i = 1:6
    start_row = (i-1) * row_height + 1;
    end_row = start_row + row_height - 1;
    
    % Handle the last row if the division is not exact
    if i == 6
        end_row = rows;
    end
    
    % Replace rows: odd from img1, even from img2
    if mod(i, 2) == 1
        blank_img(start_row:end_row, :, :) = img1(start_row:end_row, :, :);
    else
        blank_img(start_row:end_row, :, :) = img2(start_row:end_row, :, :);
    end
end

% Display and save the output
imshow(blank_img);
imwrite(blank_img, 'output.jpg'); % Save the output image
