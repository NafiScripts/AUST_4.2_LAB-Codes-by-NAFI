% Step a: Read image and convert to grayscale if RGB
I = imread('cameraman.png');
figure; imshow(I);
I = im2double(I);
imageinfo('cameraman.png');

% Step b: Manually compute the histogram of the input image
[r, c] = size(I);
S = r * c;
h = zeros(1, 256);
I_uint8 = uint8(I * 255); % Scale and convert to uint8
for i1 = 1:r
    for j1 = 1:c
        h(I_uint8(i1, j1) + 1) = h(I_uint8(i1, j1) + 1) + 1;
    end
end

%Step c: Manually compute PDF
pdf=zeros(1,256);
for i1 = 1:r
    for j1 = 1:c
        pdf(I_uint8(i1, j1) + 1) = h(I_uint8(i1, j1) + 1) / S;

    end
end

% Step d: Compute CDF
cdf = zeros(1, 256);
cdf(1) = pdf(1);
for k = 2:256
    cdf(k) = cdf(k - 1) + pdf(k);
end

% Step e + f: Compute new gray levels
s = round(cdf * 255);

% Step g: Create equalized image
e_image = uint8(s(I_uint8 + 1)); % Map using uint8 image

% Step h: Compute histogram of the equalized image
H = zeros(1, 256);
for i1 = 1:size(e_image, 1)
    for j1 = 1:size(e_image, 2)
        H(e_image(i1, j1) + 1) = H(e_image(i1, j1) + 1) + 1;
    end
end

% Step i: Display images and histograms
subplot(2, 2, 1); imshow(original_image); title('Original Image');
subplot(2, 2, 2); bar(h); title('Histogram of Original Image');
subplot(2, 2, 3); imshow(e_image); title('Equalized Image');
subplot(2, 2, 4); bar(H); title('Histogram of Equalized Image');



