% Load image and convert to bitonal
filename = 'http://loris2.scta.info/reims/R2r.jpg/full/full/0/default.jpg';
pic = imread(filename);
bw = im2bw(pic(:,:,1), graythresh(pic));
bw = bw';
% Get row means
mean_rows = mean(bw, 2);

% Apply smooting
w = gausswin(250);
y = conv(mean_rows,w);
linedata = diff(y);

% Find peaks through 0 passing
line = [];
for i = 1:length(linedata)
     if linedata(i) > 0 && linedata(i+1) < 0
         line = [line, i]
     end
 end

%line = [line max(mean_rows)];

% Picture re-render
bw2 = bw;
for i = 1:length(line)
    bw(line(i),:) = 0;
end
imshow(bw')
