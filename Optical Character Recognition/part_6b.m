function part_6b(r,scene,pattern) 
f = figure;
set(f,'Name','Correlation Value 2D','numbertitle','off');
image(r);

f = figure;
set(f,'Name','Correlation Value 3D','numbertitle','off');

[eh, ew] = size(pattern);
h = surf(r');
set(h,'LineStyle','none');




