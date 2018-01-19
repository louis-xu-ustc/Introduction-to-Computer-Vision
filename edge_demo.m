% read image
lenna = imread('pic/Lenna.png');
figure(1), imshow(lenna), title('original color image');

% convert to gray
lenna_gray = rgb2gray(lenna);
figure(2), imshow(lenna_gray), title('original gray picture');

% make a blur version
filter_size = [11 11];
filter_sigma = 2;
h = fspecial('gaussian', filter_size, filter_sigma);
lenna_smooth = imfilter(lenna_gray, h);
figure(3), imshow(lenna_smooth), title('original smooth picture');

%% method1, shift left and right, then show the diff of images
lennaL = lenna_smooth
lennaL(:, [1:(end - 1)]) = lennaL(:, [2:end]);

lennaR = lenna_smooth
lennaR(:, [2:end]) = lennaR(:, [1:(end-1)]);

lennaDiff = double(lennaL) - double(lennaR);
figure(4), imshow(lennaDiff), title('Diff between left and right images');

%% method2, canny edge detector
canny_edge = edge(lenna_gray, 'Canny');
figure(5), imshow(canny_edge), title('canny on original gray');

canny_smooth_edge = edge(lenna_smooth, 'Canny');
figure(6), imshow(canny_smooth_edge), title('canny on smooth edge');

