clear all
clc

% 读入图片
im = imread('1.jpg');
 
figure;
imshow(im); 

% 求出旋转矩阵
a = 40 / 180 * pi;
R = [cos(a), -sin(a); sin(a), cos(a)];
 
% 求出图片大小 ch为通道数 h为高度 w为宽度
sz = size(im);
h = sz(1);
w = sz(2);
ch = sz(3);
c = [h; w] / 2;
 
% 初始化结果图像
im2 = uint8(zeros(h, w, 3));
for k = 1:ch
    for i = 1:h
       for j = 1:w
          p = [i; j];
          % round为四舍五入
          pp = round(R*(p-c)+c);
          if (pp(1) >= 1 && pp(1) <= h && pp(2) >= 1 && pp(2) <= w)
              im2(pp(1), pp(2), k) = im(i, j, k); 
          end
       end
    end
end
 
% 显示图像
figure;
imshow(im2);