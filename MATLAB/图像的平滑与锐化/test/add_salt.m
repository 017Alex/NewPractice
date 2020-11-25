t = imread('lena.bmp');

imshow(t), title('原图');

t1 = imnoise(t, 'gaussian', 0, 0.01);
figure, imshow(t1), title('添加均值为0，方差为0.01的高斯噪声');

t2 = imnoise(t, 'gaussian', 0, 0.02);
figure, imshow(t2), title('添加均值为0，方差为0.02的高斯噪声');

t3 = imnoise(t, 'gaussian', 0.2, 0.01);
figure, imshow(t3), title('添加均值为0.2，方差为0.01的高斯噪声');
