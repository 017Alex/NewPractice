clc;
clear;

a1 = imread('square.tif');
subplot(231), imshow(a1);
title('原始图像');

% 腐蚀
se = strel('diamond', 3);
a2 = imerode(a1, se);
subplot(232), imshow(a2);
title('腐蚀后的图像')

% 膨胀
a3 = imdilate(a1, se);
subplot(233), imshow(a3);
title('膨胀后的图像');

% 开运算
a4 = imopen(a1, se);
subplot(234), imshow(a4);
title('开运算后的图像');

% 闭运算
a5 = imclose(a1, se);
subplot(235), imshow(a5);
title('闭运算后的图像');
