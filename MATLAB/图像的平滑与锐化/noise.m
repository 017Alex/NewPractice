% 添加高斯和椒盐噪声

t = imread('lena.bmp');
figure(1);
subplot(131), imshow(t), title('原图');

% 添加高斯噪声
t1 = imnoise(t, 'gaussian');
% t1=imnoise(t,'gaussian',0,0.01);    添加均值为0，方差为0.01的高斯噪声
subplot(132), imshow(t1), title('高斯噪声');

t2 = imnoise(t, 'salt & pepper');
subplot(133), imshow(t2), title('椒盐噪声');

% 使用系统函数conv2()实现平滑滤波
figure(2);
h = 1/9 * [1, 1, 1; 1, 1, 1; 1, 1, 1]; % 产生数组

B1 = conv2(double(t1), double(h)); % 卷积运算(conv2函数)
B2 = conv2(double(t2), double(h)); % 卷积运算(conv2函数)

subplot(221), imshow(B1, []), title('3*3conv2平滑滤波_高斯');
subplot(222), imshow(B2, []), title('3*3conv2平滑滤波_椒盐');

% 自己编写函数mycov2()实现平滑滤波
t3 = double(t1); % t1转换成double类型的矩阵
t4 = double(t2); % t2转换成double类型的矩阵

[m, n] = size(t1); % 遍历图片大小

for i = 2:m - 1     % 遍历宽度

    for j = 2:n - 1     % 遍历高度
        k1 = t3(i - 1:i + 1, j - 1:j + 1); % 选取t1图片中大小为3*3的矩阵
        k2 = t4(i - 1:i + 1, j - 1:j + 1); % 选取t2图片中大小为3*3的矩阵
        r1 = h .* k1;                       % 定义模板和图片3*3矩阵进行相与
        r2 = h .* k2;                       % 定义模板和图片3*3矩阵进行相与
        C1(i, j) = sum(r1(:));      % t1图片将遍历过的地方进行集合
        C2(i, j) = sum(r2(:));      % t2图片将遍历过的地方进行集合
    end

end

subplot(223);
imshow(C1, []);
title('myconv2()_高斯');

subplot(224);
imshow(C2, []);
title('myconv2()_椒盐');

% 使用系统函数medfilt2（）实现中值滤波
figure(3);

g1 = medfilt2(t1, [3, 3]);  % 对高斯躁声中值滤波
imshow(g1);
subplot(221);
imshow(g1, []);
title('medfilter中值滤波_高斯');

g2 = medfilt2(t2);  % 对椒盐躁声中值滤波
subplot(222);
imshow(g2, []);
title('medfilter中值滤波_椒盐');

% 自编函数mymedfilt2()实现中值滤波
h1 = ones(3, 3) / 9;

for i = 2:m - 1     % 遍历宽度

    for j = 2:n - 1 % 遍历高度

        k1 = t3(i - 1:i + 1, j - 1:j + 1); % 选取t1图片中大小为3*3的矩阵
        k2 = t4(i - 1:i + 1, j - 1:j + 1);

        A1 = reshape(k1, 1, 9); % 将3*3矩阵变成一个行向量
        A2 = reshape(k2, 1, 9);

        B1 = sort(A1); % 对A1行向量进行大小排序
        B2 = sort(A2);

        x1 = median(B1); % 取中间值
        x2 = median(B2);

        r3 = h1 .* x1; % 定义模板和图片3*3矩阵进行相与
        r4 = h1 .* x2; % 定义模板和图片3*3矩阵进行相与

        C3(i, j) = sum(r3(:)); % t1图片将遍历过的地方进行集合
        C4(i, j) = sum(r4(:)); % t2图片将遍历过的地方进行集合
    end

end

subplot(223);
imshow(C3, []);
title('mymedfilt2_高斯');

subplot(224);
imshow(C4, []);
title('mymedfilt2_椒盐');
