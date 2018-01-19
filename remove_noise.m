%load the image
%img=imread('saturn.png');
img=imread('pic/flower.png');
figure(1);
imshow(img);
title('original');

% add some noise
noise_sigma = 40.0;
noise = randn(size(img)) .* noise_sigma;
noise_img = img + uint8(noise);
figure(2);
imshow(noise_img);
title('noised');

% create a gaussian filter
filter_size = 50;
filter_sigma = 2;
filter = fspecial('gaussian', filter_size, filter_sigma);

% apply it to remove noise
smoothed0 = imfilter(noise_img, filter, 0); % clip filter
smoothed1 = imfilter(noise_img, filter, 'symmetric'); % reflect across the edge
smoothed2 = imfilter(noise_img, filter, 'circular'); % wrap around
smoothed3 = imfilter(noise_img, filter, 'replicate'); % copy edge

figure(3);

subplot(2,2,1)
imshow(smoothed0)
title('clip filter')

subplot(2,2,2)
imshow(smoothed1)
title('reflect across the edge')

subplot(2,2,3)
imshow(smoothed2)
title('wrap around')

subplot(2,2,4)
imshow(smoothed3)
title('copy edge')

