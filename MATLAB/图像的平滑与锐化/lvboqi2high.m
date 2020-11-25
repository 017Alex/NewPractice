f = imread('lena.bmp');
f = im2double(f);
% 计算填充图像大小
[M, N] = size(f);
M2 = 2 * M;
N2 = 2 * N;

% 傅里叶变换
F = fftshift(fft2(f, M2, N2));
% figure;imshow(mat2gray(log(1+abs(F))));title('傅里叶频谱');

% 设计滤波器
% 生成网格坐标
u = -N:N - 1;
v = -M:M - 1;
[U, V] = meshgrid(u, v);

% 设计滤波器
D = hypot(U, V);
D0 = 30; % 截止频率[10 30 60 160 460]

% 理想高通滤波器
H = mat2gray(D >= D0); % 理想高通滤波器
% figure;imshow(H);title('滤波器()');

% 频域滤波
G = F .* H;
% figure;imshow(mat2gray(log(1+abs(G))));title('频域滤波');

1 - sum(sum(abs(G).^2)) / sum(sum(abs(F).^2));

g0 = ifft2(fftshift(G));
g = g0(1:M, 1:N);
g = real(g);
% figure;imshow(g);title('滤波后的图像');

figure;
subplot(121);
imshow(f);
title('原图');

subplot(122);
imshow(g);
title('理想高通滤波后的图像');

% 巴特沃斯高通滤波器
% 设计滤波器
% 生成网格坐标
u = -N:N - 1;
v = -M:M - 1;
[U, V] = meshgrid(u, v);

% 设计滤波器
D = hypot(U, V);
D0 = 30; % 截止频率[10 30 60 160 460]

H = 1 ./ (1 + ((D0 ./ D).^4)); %布特沃斯高通滤波器
%figure;imshow(H);title('滤波器(n=2)');

% 频域滤波
G = F .* H;
% figure;imshow(mat2gray(log(1+abs(G))));title('频域滤波');

1 - sum(sum(abs(G).^2)) / sum(sum(abs(F).^2));

g0 = ifft2(fftshift(G));
g = g0(1:M, 1:N);
g = real(g);
% figure;imshow(g);title('滤波后的图像');

figure;
subplot(121);
imshow(f);
title('原图');

subplot(122);
imshow(g);
title('巴特沃斯高通滤波后的图像');

% 高斯高通滤波器
% 设计滤波器
% 生成网格坐标
u = -N:N - 1;
v = -M:M - 1;
[U, V] = meshgrid(u, v);

% 设计滤波器
D = hypot(U, V);
D0 = 30; % 截止频率[10 30 60 160 460]

H = 1 - exp((-D.^2) / (2 * (D0).^2)); %高斯高通滤波器
% figure;imshow(H);title('滤波器');

% 频域滤波
G = F .* H;
% figure;imshow(mat2gray(log(1+abs(G))));title('频域滤波');

1 - sum(sum(abs(G).^2)) / sum(sum(abs(F).^2));

g0 = ifft2(fftshift(G));
g = g0(1:M, 1:N);
g = real(g);
% figure;imshow(g);title('滤波后的图像');

figure;
subplot(121);
imshow(f);
title('原图');

subplot(122);
imshow(g);
title('高斯高通滤波后的图像');
