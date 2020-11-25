t = imread('lena.bmp');
figure(1);
subplot(131);
imshow(t);
title('ԭͼ');

%��Ӹ�˹����
t1 = imnoise(t, 'gaussian');
%t1=imnoise(t,'gaussian',0,0.01);    ��Ӿ�ֵΪ0������Ϊ0.01�ĸ�˹����
subplot(132);
imshow(t1);
title('��˹����');

% ������˹��ͨ�˲���
f = double(t1);
g = fft2(f); % ����Ҷ�任
g = fftshift(g); % ֱ�������Ƶ�Ƶ������
[M, N] = size(g); % ����ͼ��ĸߺͿ�
d0 = 50;
nn = 2; % ��ֹƵ��Ϊ50�Ķ��װ�����˹��ͨ�˲���
m = round(M / 2);
n = round(N / 2); %����ȡ��

for i = 1:M

    for j = 1:N
        d = sqrt((i - m)^2 + (j - n)^2); %����Ƶ��ƽ��ԭ�㵽����ľ���
        h = 1 / (1 + 0.414 * (d / d0)^(2 * nn)); %���ݹ�ʽ
        result(i, j) = h * g(i, j); %�˲���ʽ
    end

end

result = ifftshift(result); %ֱ�������ƻص����Ͻ�
I2 = ifft2(result); %����Ҷ���任
I3 = uint8(real(I2)); %ȡ��ֵ��ת����8λ�޷�������
subplot(133);
imshow(I3);
title('������˹��ͨ�˲���');

% �����ͨ�˲���

t1 = im2double(t1);
% �������ͼ���С
[M, N] = size(t1);
M2 = 2 * M;
N2 = 2 * N;

% ����Ҷ�任
F = fftshift(fft2(t1, M2, N2));
% figure;imshow(mat2gray(log(1+abs(F))));title('����ҶƵ��');

% ����˲���
% ������������
u = -N:N - 1;
v = -M:M - 1;
[U, V] = meshgrid(u, v);

% ����˲���
D = hypot(U, V);
D0 = 30; % ��ֹƵ��[10 30 60 160 460]

H = mat2gray(D <= D0); % �����ͨ�˲���
% figure;imshow(H);title('�����ͨ�˲���');

% Ƶ���˲�
G = F .* H;
% figure;imshow(mat2gray(log(1+abs(G))));title('Ƶ���˲�');

1 - sum(sum(abs(G).^2)) / sum(sum(abs(F).^2));

g0 = ifft2(fftshift(G));
g = g0(1:M, 1:N);
g = real(g);

figure;
subplot(121);
imshow(t1);
title('��˹����');

subplot(122);
imshow(g);
title('�����ͨ�˲����ͼ��');

%% ��˹��ͨ�˲���

H1 = exp((-D.^2) / (2 * (D0).^2));
% figure;imshow(H1);title('�˲���(D0=100)');

G = F .* H1;
% figure;imshow(mat2gray(log(1+abs(G))));title('Ƶ���˲�');

1 - sum(sum(abs(G).^2)) / sum(sum(abs(F).^2))

g0 = ifft2(fftshift(G));
g = g0(1:M, 1:N);
g = real(g);

figure;
subplot(121);
imshow(t1);
title('��˹����');

subplot(122);
imshow(g);
title('��˹��ͨ�˲����ͼ��');
