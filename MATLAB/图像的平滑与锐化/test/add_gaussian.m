t = imread('lena.bmp');

imshow(t), title('ԭͼ');

t1 = imnoise(t, 'gaussian', 0, 0.01);
figure, imshow(t1), title('��Ӿ�ֵΪ0������Ϊ0.01�ĸ�˹����');

t2 = imnoise(t, 'gaussian', 0, 0.02);
figure, imshow(t2), title('��Ӿ�ֵΪ0������Ϊ0.02�ĸ�˹����');

t3 = imnoise(t, 'gaussian', 0.2, 0.01);
figure, imshow(t3), title('��Ӿ�ֵΪ0.2������Ϊ0.01�ĸ�˹����');
