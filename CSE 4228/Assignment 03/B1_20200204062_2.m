% Read and display the input grayscale image
I = imread('cameraman.png');
figure; imshow(I); 
I = im2double(I);
imageinfo('cameraman.png');

% Convert the image to uint8 for proper bit manipulation
I = uint8(I * 255);  % Scale the image to [0, 255] range

% Create a new figure to display the images
figure;

% Display the original image in the first position of the subplot
subplot(3, 3, 1);
imshow(I); % Display original image
title('Original Image');

% Bit Plane Slicing
[r, c] = size(I);
bitP = cell(1, 8);

% Extract each bit plane using bitget and scale it for visualization
for k = 1:8
    bitP{k} = bitget(I, k);  % Extract the k-th bit plane
    bitP{k} = bitP{k} * 255; % Scale the binary bit plane to 255 for visibility
end

% Display the individual bit planes in the next subplots 
for sp = 1:8
    subplot(3, 3, sp + 1); % Adjust position to display the bit planes
    imshow(bitP{sp}); % Display each individual bit plane
    title(['Bit Plane ' num2str(sp)]);
end

% Combine the 3rd, 4th, 5th, and 6th bit planes
combinedBitPlanes = bitP{3} + bitP{4} + bitP{5} + bitP{6};

% Display the combined bit planes image in the last position of the subplot (position 9)
subplot(3, 3, 9);
imshow(combinedBitPlanes); % Display combined bit planes
title('Combined (3rd, 4th, 5th, 6th) Bit Planes');
