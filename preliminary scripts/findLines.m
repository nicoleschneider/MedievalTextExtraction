% Function to plot horizontal lines between lines of text in image img
function [img_prime] = find_lines(img)
% Input: image to be manipulated img
% Output: image with horizontal lines added

img_prime = img;

% Get row means
row_means = mean(img_prime, 2);

% Apply Gaussian smooting
w = gausswin(25);
y = conv(row_means,w);
line_data = diff(y);

% Find peaks through 0 passing
line = [length(line_data)];
for n = 1:length(line_data)
    if line_data(n) > 0 && line_data(n+1) < 0
        line = [line, n];
    end
end

% Add horizontal black lines in new image
for n = 1:length(line) - 5
    for m = 0:5  % Add lines of thickness 5 pixels
        img_prime(line(n+m),:) = 0;
    end
end
return