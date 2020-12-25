clear;
clc;

I = imread('noisy_fingerprint.tif');
th = graythresh(I);
J = im2bw(I, th);
th = 255 * th;

subplot(1, 2, 1);
imshow(I); title('原始图像');

subplot(1, 2, 2);
imshow(J); title('二值化分割结果');

figure, imhist(I);
title('使用graythresh计算最佳门限');
