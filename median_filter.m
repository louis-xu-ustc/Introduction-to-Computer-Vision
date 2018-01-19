% load the image
img = imread('pic/flower.png');
gray_img = rgb2gray(img);
figure(1);
imshow(gray_img);
title('original');

% introduce salt & pepper noise
noise_img = imnoise(gray_img,'salt & pepper', 0.02);
figure(2);
imshow(noise_img);
title('noised');

% apply a median filter
filter_img = medfilt2((noise_img));
figure(3);
imshow(filter_img);
title('filtered');