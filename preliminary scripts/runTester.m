% This is a test script to run find_col on a series of URL images
str = 'http://loris2.scta.info/hopkinsMSB19/Lombard_Manuscript-012.jpg/full/full/0/default.jpg';
base = 'http://loris2.scta.info/hopkinsMSB19/Lombard_Manuscript-0';

for a = 10 : 2 : 24
    url = strcat(base, num2str(a), '.jpg/full/full/0/default.jpg');
    img = imread(url); % read image from URL
    figure;
    [img_prime, val] = findColumns(img);
    [img_prime] = findTopMargin(img_prime);
    imshow(img_prime);
end

[m, n] = size(img_prime);
img_double_prime = img_prime(:, val:n); % crop to eliminate left margin

figure; % show cropped image
imshow(findLines(img_double_prime))
