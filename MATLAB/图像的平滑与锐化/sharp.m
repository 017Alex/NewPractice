% 添加高斯和椒盐噪声

t = imread('lena.bmp');
figure(1);
subplot(121);
imshow(t);
title('原图');

% sobel算子

Gx = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
Gy = [-1, -2, -1; 0, 0, 0; 1, 2, 1];

t1 = double(t);     % t1转换成double类型的矩阵

[m, n] = size(t);   % 遍历图片大小

for i = 2:m - 1     % 遍历宽度

    for j = 2:n - 1 % 遍历高度
        k1 = t1(i - 1:i + 1, j - 1:j + 1);      % 选取t1图片中大小为3*3的矩阵
        r1 = Gx .* k1;                          % Gx和图片3*3矩阵进行相与
        r2 = Gy .* k1;                          % Gy和图片3*3矩阵进行相与

        C1(i, j) = sum(r1(:));                  % t1图片将遍历过的地方进行集合
        C2(i, j) = sum(r2(:));

    end

end

gradx = abs(C1);        % 取绝对值
grady = abs(C2);
grad = gradx + grady;   % G= |Gx|+|Gy|

subplot(122), imshow(grad, []), title('sobel算子锐化');
