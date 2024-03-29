%% Load and convert image to double type, range [0, 1] for convenience
img = double(imread('pic/octagon.png')) / 255.; 
figure(1);
imshow(img); % assumes [0, 1] range for double images
title('original');

%% Compute x, y gradients
[gx gy] = imgradientxy(img, 'sobel'); % Note: gx, gy are not normalized

%% Obtain gradient magnitude and direction
[gmag gdir] = imgradient(gx, gy);
figure(2);
imshow(gmag / (4 * sqrt(2))); % mag = sqrt(gx^2 + gy^2), so [0, (4 * sqrt(2))]
imshow((gdir + 180.0) / 360.0); % angle in degrees [-180, 180]
title('gradient');

%% Find pixels with desired gradient direction
my_grad = select_gdir(gmag, gdir, 0.4, 100, 120); % 45 +/- 15
figure(3);
imshow(my_grad);  % NOTE: enable after you've implemented select_gdir
title('selected');