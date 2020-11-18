% 分别显示R G B分量
clear all
rgb = imread("test_pk.jpg");
% 取R G B
r = rgb(:, :, 1);
g = rgb(:, :, 2);
b = rgb(:, :, 3);

subplot(2, 2, 1);
imshow(rgb);
title('原始图像');

subplot(2, 2, 2);
imshow(r);
title('R分量图像');

subplot(2, 2, 3);
imshow(g);
title('G分量图像');

subplot(2, 2, 4);
imshow(b);
title('B分量图像');
