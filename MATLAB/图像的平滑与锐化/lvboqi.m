t = imread('lena.bmp');
figure(1);
subplot(131);
imshow(t);
title('原图');

%添加高斯噪声
t1 = imnoise(t, 'gaussian');
%t1=imnoise(t,'gaussian',0,0.01);    添加均值为0，方差为0.01的高斯噪声
subplot(132);
imshow(t1);
title('高斯噪声');

% 巴特沃斯低通滤波器
f = double(t1);
g = fft2(f); % 傅里叶变换
g = fftshift(g); % 直流分量移到频谱中心
[M, N] = size(g); % 计算图像的高和宽
d0 = 50;
nn = 2; % 截止频率为50的二阶巴特沃斯低通滤波器
m = round(M / 2);
n = round(N / 2); %数据取整

for i = 1:M

    for j = 1:N
        d = sqrt((i - m)^2 + (j - n)^2); %计算频率平面原点到各点的距离
        h = 1 / (1 + 0.414 * (d / d0)^(2 * nn)); %传递公式
        result(i, j) = h * g(i, j); %滤波公式
    end

end

result = ifftshift(result); %直流分量移回到左上角
I2 = ifft2(result); %傅里叶反变换
I3 = uint8(real(I2)); %取幅值并转换成8位无符号整数
subplot(133);
imshow(I3);
title('巴特沃斯低通滤波器');

% 理想低通滤波器

t1 = im2double(t1);
% 计算填充图像大小
[M, N] = size(t1);
M2 = 2 * M;
N2 = 2 * N;

% 傅里叶变换
F = fftshift(fft2(t1, M2, N2));
% figure;imshow(mat2gray(log(1+abs(F))));title('傅里叶频谱');

% 设计滤波器
% 生成网格坐标
u = -N:N - 1;
v = -M:M - 1;
[U, V] = meshgrid(u, v);

% 设计滤波器
D = hypot(U, V);
D0 = 30; % 截止频率[10 30 60 160 460]

H = mat2gray(D <= D0); % 理想低通滤波器
% figure;imshow(H);title('理想低通滤波器');

% 频域滤波
G = F .* H;
% figure;imshow(mat2gray(log(1+abs(G))));title('频域滤波');

1 - sum(sum(abs(G).^2)) / sum(sum(abs(F).^2));

g0 = ifft2(fftshift(G));
g = g0(1:M, 1:N);
g = real(g);

figure;
subplot(121);
imshow(t1);
title('高斯噪声');

subplot(122);
imshow(g);
title('理想低通滤波后的图像');

%% 高斯低通滤波器

H1 = exp((-D.^2) / (2 * (D0).^2));
% figure;imshow(H1);title('滤波器(D0=100)');

G = F .* H1;
% figure;imshow(mat2gray(log(1+abs(G))));title('频域滤波');

1 - sum(sum(abs(G).^2)) / sum(sum(abs(F).^2))

g0 = ifft2(fftshift(G));
g = g0(1:M, 1:N);
g = real(g);

figure;
subplot(121);
imshow(t1);
title('高斯噪声');

subplot(122);
imshow(g);
title('高斯低通滤波后的图像');
