clear all;
close all;
clc;

f = imread('test.jpg');
[m,n] = size(f);
f1 = im2uint8(ones(m,n));

h = imhist(f);
l = length(h);

PDF = h/numel(f);
CDF = cumsum(PDF);
j = CDF.*256;
J = round(j);

for i=1:l
    nn = find(J==i);
    L = length(nn);
    for k=1:L
    nn1 = find(f==(nn(k)-1));
    f1(nn1)=i;
    end
end

subplot(1, 2, 1);
imshow(f);

subplot(1, 2, 2);
imshow(f1);
