clear;
clc;

I = imread('coins.png');
I1 = edge(I, 'canny', [0.08 0.16]);
I2 = imfill(I1, 'holes');

figure;
subplot(2,2,1);
imshow(I);
title('Ô­Í¼');
subplot(2,2,2);
imshow(I1);
title('±ßÔµ¼ì²â');
subplot(2,2,3);
imshow(I2);
title('Ìî³ä');

[B, L, N, A1] = bwboundaries(I2);
subplot(2,2,4);imshow(I); hold on;
    for k = 1:length(B)
        boundary = B{k};
        if(k > N)
            plot(boundary(:,2),...
                boundary(:,1),'g','LineWidth',2);
        else
            plot(boundary(:,2),...
                boundary(:,1),'r','LineWidth',2);
        end
    end
hold off