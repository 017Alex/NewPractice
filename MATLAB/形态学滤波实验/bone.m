A = imread('bone.tif');
figure('NumberTitle', 'off', 'Name', '�Ǽ���ȡ');
subplot(231), imshow(A), title('ԭͼ');

%% ��ʴ����
%��ʴ����
SE = strel('square', 5); %ѡȡ�뾶Ϊ3�����Σ�diamond���ṹԪ��
I1 = imerode(A, SE);

%��������
I2 = imdilate(A, SE);

%% ʹ��bwmorph()�������г�Ǽܡ�ϸ���ʹֻ�
% ��ȡ�Ǽ�
BW1 = bwmorph(A, 'skel', inf);
subplot(232), imshow(BW1), title('��Ǽ�');

% �ڱ���
B3 = A - I1;
subplot(233), imshow(B3), title('�ڱ���');

% �����
B4 = I2 - A;
subplot(234), imshow(B4), title('�����');

% ϸ��
BW4 = bwmorph(A, 'thin', inf);
subplot(235), imshow(BW4), title('ϸ��');

% �ֻ�
BW5 = bwmorph(A, 'thicken', 15);
subplot(236), imshow(BW5), title('�ֻ�');
