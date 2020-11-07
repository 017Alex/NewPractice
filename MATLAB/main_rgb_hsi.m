test = imread("test01.jpg");
% t_hsi = RGB_HSI(test);
% t_rgb = HSI_RGB(t_hsi);

t_hsi = rgb2hsv(test);
t_rgb = hsv2rgb(t_hsi);

subplot(2, 2, 1);
imshow(test);
title('ԭʼͼ��');

subplot(2, 2, 2);
imshow(t_hsi);
title('RGBתHSIͼ��');

subplot(2, 2, 3);
imshow(t_rgb);
title('HSIתRGBͼ��');