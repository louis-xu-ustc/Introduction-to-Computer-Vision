% Test code for 1D:
s = [-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];
t = [1 1 0];
disp('Signal:'), disp([1:size(s, 2); s]);
disp('Template:'), disp([1:size(t, 2); t]);

[maxValue index] = find_template_1D(t, s);
disp('Index:'), disp(index);
disp('MaxValue:'), disp(maxValue);

% Test code for 2D:
tablet = rgb2gray(imread('pic/flower.png'));
figure(1);
imshow(tablet);
title('original');

glyph = tablet(75:128, 75:128);
figure(2);
title('glyph');
imshow(glyph);

[y x] = find_template_2D(glyph, tablet);
disp([y x]); % should be the top-left corner of template in tablet

% colormap('gray'), imagesc(tablet);
% hold on;
% plot(x, y, 'r+', 'markersize', 16);


