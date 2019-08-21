% Function to deskew the image
% Note: working slowy- optimize time in future

%%%%%%%%%%%%function [deskewed_img, angle, z, r] = CC_deskew(img)
% Input: image img to be deskewed
% Output: deskewed image and angle of rotation

BW = im2bw(img); % convert image to black and white

% connected component analysis (rainbow)
L = bwlabel(imcomplement(BW));
RGB = label2rgb(L);
figure; imshow(RGB)

% recompute with newer MATLAB function
conComp = bwconncomp(imcomplement(BW));
properties = regionprops(conComp, 'all');

%find componenet with biggest major axis length
lengths = {properties.MajorAxisLength};
lenVec = cell2mat(lengths)
[maxLen, maxIdx] = max(lenVec);

% num_pixels = cellfun(@numel,con_comp.PixelIdxList);
% [biggest,idx] = max(num_pixels);
% BW(con_comp.PixelIdxList{idx}) = 1;
% figure;
% imshow(BW)


% con_comp.PixelIdxList
% orientation_array = properties.Orientation;
% [m, n] = size(num_pixels);

% for i = 1:n
%     if(num_pixels(1,i) < ___ && orientation_array(i) < ___)
%         eliminate component
%     end
% end

z = properties.MajorAxisLength
r = properties.MinorAxisLength

hist = imhist(properties.PixelIdxList);
figure;
plot(hist)
