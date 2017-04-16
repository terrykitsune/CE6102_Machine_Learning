function part_6c(r,scene,pattern)

[eh, ew] = size(pattern);
%%threshold
threshold = 4e7;

f = figure;
set(f,'Name','Locate the letter e','numbertitle','off');
imshow(scene);
hold on;

[x,y] = find(r > threshold);
for i=1:size(x)
        rectangle('position',[y(i), x(i), 53, 61],'edgecolor','magenta');
end

hold off;