f = imread('lena.bmp');
f = im2double(f);
% �������ͼ���С
[M, N] = size(f);
M2 = 2 * M;
N2 = 2 * N;

% ����Ҷ�任
F = fftshift(fft2(f, M2, N2));
% figure;imshow(mat2gray(log(1+abs(F))));title('����ҶƵ��');

% ����˲���
% ������������
u = -N:N - 1;
v = -M:M - 1;
[U, V] = meshgrid(u, v);

% ����˲���
D = hypot(U, V);
D0 = 30; % ��ֹƵ��[10 30 60 160 460]

% �����ͨ�˲���
H = mat2gray(D >= D0); % �����ͨ�˲���
% figure;imshow(H);title('�˲���()');

% Ƶ���˲�
G = F .* H;
% figure;imshow(mat2gray(log(1+abs(G))));title('Ƶ���˲�');

1 - sum(sum(abs(G).^2)) / sum(sum(abs(F).^2));

g0 = ifft2(fftshift(G));
g = g0(1:M, 1:N);
g = real(g);
% figure;imshow(g);title('�˲����ͼ��');

figure;
subplot(121);
imshow(f);
title('ԭͼ');

subplot(122);
imshow(g);
title('�����ͨ�˲����ͼ��');

% ������˹��ͨ�˲���
% ����˲���
% ������������
u = -N:N - 1;
v = -M:M - 1;
[U, V] = meshgrid(u, v);

% ����˲���
D = hypot(U, V);
D0 = 30; % ��ֹƵ��[10 30 60 160 460]

H = 1 ./ (1 + ((D0 ./ D).^4)); %������˹��ͨ�˲���
%figure;imshow(H);title('�˲���(n=2)');

% Ƶ���˲�
G = F .* H;
% figure;imshow(mat2gray(log(1+abs(G))));title('Ƶ���˲�');

1 - sum(sum(abs(G).^2)) / sum(sum(abs(F).^2));

g0 = ifft2(fftshift(G));
g = g0(1:M, 1:N);
g = real(g);
% figure;imshow(g);title('�˲����ͼ��');

figure;
subplot(121);
imshow(f);
title('ԭͼ');

subplot(122);
imshow(g);
title('������˹��ͨ�˲����ͼ��');

% ��˹��ͨ�˲���
% ����˲���
% ������������
u = -N:N - 1;
v = -M:M - 1;
[U, V] = meshgrid(u, v);

% ����˲���
D = hypot(U, V);
D0 = 30; % ��ֹƵ��[10 30 60 160 460]

H = 1 - exp((-D.^2) / (2 * (D0).^2)); %��˹��ͨ�˲���
% figure;imshow(H);title('�˲���');

% Ƶ���˲�
G = F .* H;
% figure;imshow(mat2gray(log(1+abs(G))));title('Ƶ���˲�');

1 - sum(sum(abs(G).^2)) / sum(sum(abs(F).^2));

g0 = ifft2(fftshift(G));
g = g0(1:M, 1:N);
g = real(g);
% figure;imshow(g);title('�˲����ͼ��');

figure;
subplot(121);
imshow(f);
title('ԭͼ');

subplot(122);
imshow(g);
title('��˹��ͨ�˲����ͼ��');
