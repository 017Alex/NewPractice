A = imread('bone.tif');
figure('NumberTitle', 'off', 'Name', '骨架提取');
subplot(231), imshow(A), title('原图');

%% 腐蚀膨胀
%腐蚀运算
SE = strel('square', 5); %选取半径为3的菱形（diamond）结构元素
I1 = imerode(A, SE);

%膨胀运算
I2 = imdilate(A, SE);

%% 使用bwmorph()函数进行抽骨架、细化和粗化
% 提取骨架
BW1 = bwmorph(A, 'skel', inf);
subplot(232), imshow(BW1), title('抽骨架');

% 内边沿
B3 = A - I1;
subplot(233), imshow(B3), title('内边沿');

% 外边沿
B4 = I2 - A;
subplot(234), imshow(B4), title('外边沿');

% 细化
BW4 = bwmorph(A, 'thin', inf);
subplot(235), imshow(BW4), title('细化');

% 粗化
BW5 = bwmorph(A, 'thicken', 15);
subplot(236), imshow(BW5), title('粗化');
