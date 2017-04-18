function displayEigenface(pid)
%% Do the PCA to show the eigenface of a person(pid)

load_dir = dir(sprintf('face/%d/*.bmp', pid));

for pid = 1 : length(load_dir)
    pathname = strcat(load_dir(1).folder, '/', load_dir(pid).name);
    im_read = imread(pathname);
    im_data(:, pid) = double(im_read(:));
end

[V, m, D] = PCA(im_data);

figure
subplot(4, 7, 1);
imagesc(reshape(m, 100, 100)), colormap gray;
title('mean');

for i = 1 : size(V, 2)
    subplot(4, 7, 7 + i);
    imagesc(reshape(V(:, i), 100, 100)), colormap gray;
    title(sprintf('%.2e', D(i)));
end