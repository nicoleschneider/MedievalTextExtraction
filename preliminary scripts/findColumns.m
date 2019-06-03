% Function to find the x-coordinate of the start of the first column of text
% Note: Only works reliably on relatively clean texts (little left side marginalia)

function [img_prime, x_val] = find_col2(img)
% Input: image img
% Output: image with line at start of column, x value of start of text
% location x_val

BW = im2bw(img); % convert image to black and white

[row_len, col_len] = size(BW);
upper_thresh = 0.93; % based on data from a few representative images
lower_thresh = 0.88; % based on data from a few representative images

mean_vector = mean(BW);
for n = 1 : row_len
    if mean_vector(n) < upper_thresh && mean_vector(n) > lower_thresh
        x_val = n; % left side margin found
        break
    end
end

% Drawing 10 pixel wide vertical black line at beginning of column where
% left marin ends and text begins
for n = 1 : col_len
   for m = 0 : 9 % Add lines of thickness 10
      BW(n,x_val + m) = 0;
   end
end

img_prime = BW;
return