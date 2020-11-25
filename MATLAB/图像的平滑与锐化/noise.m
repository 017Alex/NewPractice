% ��Ӹ�˹�ͽ�������

t = imread('lena.bmp');
figure(1);
subplot(131), imshow(t), title('ԭͼ');

% ��Ӹ�˹����
t1 = imnoise(t, 'gaussian');
% t1=imnoise(t,'gaussian',0,0.01);    ��Ӿ�ֵΪ0������Ϊ0.01�ĸ�˹����
subplot(132), imshow(t1), title('��˹����');

t2 = imnoise(t, 'salt & pepper');
subplot(133), imshow(t2), title('��������');

% ʹ��ϵͳ����conv2()ʵ��ƽ���˲�
figure(2);
h = 1/9 * [1, 1, 1; 1, 1, 1; 1, 1, 1]; % ��������

B1 = conv2(double(t1), double(h)); % �������(conv2����)
B2 = conv2(double(t2), double(h)); % �������(conv2����)

subplot(221), imshow(B1, []), title('3*3conv2ƽ���˲�_��˹');
subplot(222), imshow(B2, []), title('3*3conv2ƽ���˲�_����');

% �Լ���д����mycov2()ʵ��ƽ���˲�
t3 = double(t1); % t1ת����double���͵ľ���
t4 = double(t2); % t2ת����double���͵ľ���

[m, n] = size(t1); % ����ͼƬ��С

for i = 2:m - 1     % �������

    for j = 2:n - 1     % �����߶�
        k1 = t3(i - 1:i + 1, j - 1:j + 1); % ѡȡt1ͼƬ�д�СΪ3*3�ľ���
        k2 = t4(i - 1:i + 1, j - 1:j + 1); % ѡȡt2ͼƬ�д�СΪ3*3�ľ���
        r1 = h .* k1;                       % ����ģ���ͼƬ3*3�����������
        r2 = h .* k2;                       % ����ģ���ͼƬ3*3�����������
        C1(i, j) = sum(r1(:));      % t1ͼƬ���������ĵط����м���
        C2(i, j) = sum(r2(:));      % t2ͼƬ���������ĵط����м���
    end

end

subplot(223);
imshow(C1, []);
title('myconv2()_��˹');

subplot(224);
imshow(C2, []);
title('myconv2()_����');

% ʹ��ϵͳ����medfilt2����ʵ����ֵ�˲�
figure(3);

g1 = medfilt2(t1, [3, 3]);  % �Ը�˹������ֵ�˲�
imshow(g1);
subplot(221);
imshow(g1, []);
title('medfilter��ֵ�˲�_��˹');

g2 = medfilt2(t2);  % �Խ���������ֵ�˲�
subplot(222);
imshow(g2, []);
title('medfilter��ֵ�˲�_����');

% �Աຯ��mymedfilt2()ʵ����ֵ�˲�
h1 = ones(3, 3) / 9;

for i = 2:m - 1     % �������

    for j = 2:n - 1 % �����߶�

        k1 = t3(i - 1:i + 1, j - 1:j + 1); % ѡȡt1ͼƬ�д�СΪ3*3�ľ���
        k2 = t4(i - 1:i + 1, j - 1:j + 1);

        A1 = reshape(k1, 1, 9); % ��3*3������һ��������
        A2 = reshape(k2, 1, 9);

        B1 = sort(A1); % ��A1���������д�С����
        B2 = sort(A2);

        x1 = median(B1); % ȡ�м�ֵ
        x2 = median(B2);

        r3 = h1 .* x1; % ����ģ���ͼƬ3*3�����������
        r4 = h1 .* x2; % ����ģ���ͼƬ3*3�����������

        C3(i, j) = sum(r3(:)); % t1ͼƬ���������ĵط����м���
        C4(i, j) = sum(r4(:)); % t2ͼƬ���������ĵط����м���
    end

end

subplot(223);
imshow(C3, []);
title('mymedfilt2_��˹');

subplot(224);
imshow(C4, []);
title('mymedfilt2_����');
