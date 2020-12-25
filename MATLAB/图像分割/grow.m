clc;
clear;
A = imread('coins.png');
B = im2gray(A);
C = medfilt2(B, [3, 3]);
figure(1);
subplot(131); imshow(A); title('原图像');
subplot(132); imshow(C); title('去噪后图像');
I = double(C);
[M, N] = size(I);
J = zeros(M, N);
msgbox('鼠标单击选择一种子点后按回车键', '操作', 'modal');
[y, x] = getpts;
xr = round(x);
yr = round(y);
seed = I(xr, yr);
J(xr, yr) = 1;
graysum = seed;
pointsum = 1;
count = 1;
threshold = 13;
while count > 0
    s = 0;
    count = 0;
    for i = 1:M
        for j = 1:N
            if J(i, j) == 1
                if (i - 1) > 0 && (i + 1) < (M + 1) && (j - 1) > 0 && (j + 1) < (N + 1)
                    for u = -1:1
                        for v = -1:1
                            if J(i + u, j + v) == 0 && abs(I(i + u, j + v) - seed) <= threshold
                                J(i + u, j + v) = 1;
                                count = count + 1;
                                s = s + I(i + u, j + v);
                            end
                        end
                    end
                end
            end
        end
    end
    pointsum = pointsum + count;
    graysum = graysum + s;
    seed = graysum / pointsum;
end
subplot(133), imshow(J);
title('分割后图像');
