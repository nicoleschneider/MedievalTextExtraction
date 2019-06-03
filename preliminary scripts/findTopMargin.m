% Function to find the x-coordinate of the start of the first column of text
% Note: Only works reliably on relatively clean texts (little left side marginalia)

function [img_prime, y_val] = find_top(img)
% Input: image img
% Output: image with line at start of column, x value of start of text
% location x_val

img_flip_ = img';
[m,n] = size(img_flip_);
img_flip = img_flip_(:, 300 : n-300);
BW = im2bw(img_flip); % convert image to black and white

[row_len, col_len] = size(BW);
upper_thresh = 0.93; % based on data from a few representative images
lower_thresh = 0.88; % based on data from a few representative images

mean_vector = mean(BW);
for n = 1 : row_len
    if mean_vector(n) < upper_thresh && mean_vector(n) > lower_thresh
        y_val = n; % left side margin found
        break
    end
end

% Drawing 10 pixel wide vertical black line at beginning of column where
% left marin ends and text begins
for n = 1 : col_len
   for m = 0 : 9 % Add lines of thickness 10
      BW(n,y_val + m) = 0;
   end
end

img_prime = BW';
return