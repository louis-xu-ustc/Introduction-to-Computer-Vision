% hough tramsform demo

% load pic, convert to gray and apply canny edge detection
img = imread('pic/shapes.png');
gray = rgb2gray(img);
edges = edge(gray, 'canny');

figure(1);
subplot(1,2,1), imshow(img),title('original color pic');
subplot(1,2,2), imshow(gray),title('original gray pic');

% apply hough transform to find candidate lines
[accum theta rho] = hough(edges); % rho = x * cos(theta) + y * sin(theta);

figure(2);
subplot(1,2,1), imshow(edges),title('canny edge pic');
subplot(1,2,2), imshow(imadjust(mat2gray(accum)),'XData',theta,'YData',rho, 'InitialMagnification','fit');
title('Hough transform');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(gca,hot);

% find peaks
peaks = houghpeaks(accum, 100);
hold on; plot(theta(peaks(:, 2)), rho(peaks(:, 1)), 'rs'); hold off; % first row is y value, second row is x value

% find lines in the image
line_peaks = houghlines(edges, theta, rho, peaks);
figure(3);
imshow(img), title('segments');
hold on;
for k = 1: length(line_peaks)
    endpoints = [line_peaks(k).point1; line_peaks(k).point2];
    plot(endpoints(:, 1), endpoints(:, 2),'LineWidth', 1, 'Color', 'green');
end
hold off;

% try more precise lines by using ceils
new_peaks = houghpeaks(accum, 100, 'Threshold', ceil(0.3 * max(accum(:))), 'NHoodSize', [5 5]);
line_peaks = houghlines(edges, theta, rho, new_peaks);
figure(4);
imshow(img), title('new segments');
hold on;
for k = 1: length(line_peaks)
    endpoints = [line_peaks(k).point1; line_peaks(k).point2];
    plot(endpoints(:, 1), endpoints(:, 2),'LineWidth', 1, 'Color', 'green');
end
hold off;
