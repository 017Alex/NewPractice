clc;
clear;

a1 = imread('square.tif');
subplot(231), imshow(a1);
title('ԭʼͼ��');

% ��ʴ
se = strel('diamond', 3);
a2 = imerode(a1, se);
subplot(232), imshow(a2);
title('��ʴ���ͼ��')

% ����
a3 = imdilate(a1, se);
subplot(233), imshow(a3);
title('���ͺ��ͼ��');

% ������
a4 = imopen(a1, se);
subplot(234), imshow(a4);
title('��������ͼ��');

% ������
a5 = imclose(a1, se);
subplot(235), imshow(a5);
title('��������ͼ��');
