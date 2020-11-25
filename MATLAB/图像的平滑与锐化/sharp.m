% ��Ӹ�˹�ͽ�������

t = imread('lena.bmp');
figure(1);
subplot(121);
imshow(t);
title('ԭͼ');

% sobel����

Gx = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
Gy = [-1, -2, -1; 0, 0, 0; 1, 2, 1];

t1 = double(t);     % t1ת����double���͵ľ���

[m, n] = size(t);   % ����ͼƬ��С

for i = 2:m - 1     % �������

    for j = 2:n - 1 % �����߶�
        k1 = t1(i - 1:i + 1, j - 1:j + 1);      % ѡȡt1ͼƬ�д�СΪ3*3�ľ���
        r1 = Gx .* k1;                          % Gx��ͼƬ3*3�����������
        r2 = Gy .* k1;                          % Gy��ͼƬ3*3�����������

        C1(i, j) = sum(r1(:));                  % t1ͼƬ���������ĵط����м���
        C2(i, j) = sum(r2(:));

    end

end

gradx = abs(C1);        % ȡ����ֵ
grady = abs(C2);
grad = gradx + grady;   % G= |Gx|+|Gy|

subplot(122), imshow(grad, []), title('sobel������');
