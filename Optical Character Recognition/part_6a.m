function r = part_6a(pattern, scene)

pat_mean = mean(mean(pattern));


[eh, ew] = size(pattern);
r = zeros(size(scene));
%%do the correlation
tic
for i=1:1:size(scene,1)-eh
    for j=1:1:size(scene,2)-ew
        sub_sc = scene(i:eh+i-1,j:ew+j-1);
        image_mean = mean(mean(sub_sc));
        r(i,j) = sum(sum((pattern - pat_mean).*(sub_sc - image_mean)));      
    end
end
toc


