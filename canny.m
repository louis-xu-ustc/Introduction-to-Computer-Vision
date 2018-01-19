flower = imread('pic/flower.png');
saturn = imread('pic/saturn.png');

imshow(flower);
imshow(saturn);

flower_gray = rgb2gray(flower);
saturn_gray = rgb2gray(saturn);

% detect the edge using canny
flower_edge = edge(flower_gray, 'Canny');
saturn_edge = edge(saturn_gray, 'Canny');

% show the original and edge pic
figure(1);
subplot(1,2,1);
imshow(flower);
subplot(1,2,2);
imshow(flower_edge);

figure(2);
subplot(1,2,1);
imshow(saturn);
subplot(1,2,2);
imshow(saturn_edge);