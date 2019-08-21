% Function to deskew the image
% Note: working slowy- optimize time in future

function [deskewedImg, v, r] = brute_force_deskew(img)
% Input: image img to be deskewed
% Output: deskewed image

% crop to get center 50% of image only
[m, n, p] = size(img);
mMid = [floor(m/8), floor(m-m/8)];
nMid = [floor(n/8), floor(n-n/8)];

imgCrop = img(mMid(1):mMid(2), nMid(1):nMid(2), :);
%figure;
%imshow(img_crop)


bw = rgb2gray(imgCrop);
fvar5 = stdfilt(bw,ones(5));

angles = [-5:0.1:5];

v = [];
r = [];
for angle = -5:0.1:5
    g = imrotate(fvar5,angle);
    %figure;
    %imshow(g,[]);
    row = sum(g');
    r = [r; row(:)];
    v1 = var(row(nMid(1):nMid(2))); % FIX ME should be of variable size
    v = [v v1];
 
end
figure; plot(v)
[m,i] = max(v);
skewAngle = angles(i)

deskewedImg = imrotate(img,skewAngle);
