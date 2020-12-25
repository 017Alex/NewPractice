clear;
clc;

I = imread('noisy_fingerprint.tif');
th = graythresh(I);
J = im2bw(I, th);
th = 255 * th;

subplot(1, 2, 1);
imshow(I); title('ԭʼͼ��');

subplot(1, 2, 2);
imshow(J); title('��ֵ���ָ���');

figure, imhist(I);
title('ʹ��graythresh�����������');
