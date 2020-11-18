I = imread('test.jpg');

subplot(2, 2, 1);
imshow(I);
title('原始图像');

hgram=50:2:250;
J=histeq(I,hgram);

subplot(2,2,2);
imshow(J);
title('图像的规定化');

subplot(2,2,3),;
imhist(I,64);
title('原始图像的直方图');

subplot(2,2,4);
imhist(J,64);
title('规定化后的直方图');
