I = imread('test.jpg');
[m, n] = size(I);

subplot(1, 3, 1);
imhist(I);
title('原图的直方图');

[count, x] = imhist(I);
subplot(1, 3, 2);
stem(x, count);
title('根据直方图绘制的统计图');

count = count / m / n;
subplot(1, 3, 3);
stem(x, count);
title('直方图归一化');
